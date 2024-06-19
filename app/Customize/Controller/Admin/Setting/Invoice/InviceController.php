<?php

namespace Customize\Controller\Admin\Setting\Invoice;

use Carbon\Carbon;
use Customize\Form\Type\Admin\InvoiceBillingType;
use Customize\Form\Type\Admin\InvoiceMasterType;
use Customize\Repository\InvoiceRepository;
use Eccube\Controller\AbstractController;
use Eccube\Entity\Master\OrderStatus;
use Eccube\Repository\OrderRepository;
use Plugin\InvoiceDocurain\Repository\JobRepository;
use Plugin\InvoiceDocurain\Service\ExternalDownLoadService;
use Plugin\InvoiceDocurain\Service\ExternalMailSendService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Class ShopController
 */
class InviceController extends AbstractController
{
    /**
     * @var InvoiceRepository
     */
    protected $invoiceRepository;

    /**
     * @var OrderRepository
     */
    protected $orderRepository;

    /**
     * @var JobRepository
     */
    protected $jobRepository;

    /**
     * @var ExternalMailSendService
     */
    protected $externalMailSendService;

    /**
     * @var ExternalDownLoadService
     */
    protected $externalDownLoadService;

    /**
     * ShopController constructor.
     *
     * @param InvoiceRepository $invoiceRepository
     * @param OrderRepository $orderRepository
     * @param JobRepository $jobRepository
     * @param ExternalMailSendService $externalMailSendService
     * @param ExternalDownLoadService $externalDownLoadService
     */
    public function __construct(
        InvoiceRepository $invoiceRepository,
        OrderRepository $orderRepository,
        JobRepository $jobRepository,
        ExternalMailSendService $externalMailSendService,
        ExternalDownLoadService $externalDownLoadService
    ) {
        $this->invoiceRepository = $invoiceRepository;
        $this->orderRepository = $orderRepository;
        $this->jobRepository = $jobRepository;
        $this->externalMailSendService = $externalMailSendService;
        $this->externalDownLoadService = $externalDownLoadService;
    }

    /**
     * @Route("/%eccube_admin_route%/customize/setting/invoice", name="customize_admin_setting_invoice")
     * @Template("@admin/Setting/Invoice/customize_invoice_master.twig")
     *
     * @param Request $request
     *
     * @return array|\Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function index(Request $request)
    {
        $Invoice = $this->invoiceRepository->get();
        $builder = $this->formFactory
            ->createBuilder(InvoiceMasterType::class, $Invoice);

        $form = $builder->getForm();
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $logoImageFile = $form['logo_image_file']->getData();
            if (!empty($logoImageFile)) {
                $Invoice->setLogoImage('data:'.$logoImageFile->getMimeType().';base64,'.base64_encode(file_get_contents($logoImageFile->getPathname())));
            } else {
                if ($form['logo_image_delete']->getData()) {
                    $Invoice->setLogoImage(null);
                }
            }

            $imprintImageFile = $form['imprint_image_file']->getData();
            if (!empty($imprintImageFile)) {
                $Invoice->setImprintImage('data:'.$imprintImageFile->getMimeType().';base64,'.base64_encode(file_get_contents($imprintImageFile->getPathname())));
            } else {
                if ($form['imprint_image_delete']->getData()) {
                    $Invoice->setImprintImage(null);
                }
            }

            $this->entityManager->persist($Invoice);
            $this->entityManager->flush();

            $this->addSuccess('admin.common.save_complete', 'admin');

            return $this->redirectToRoute('customize_admin_setting_invoice');
        }

        return [
            'form' => $form->createView(),
            'Invoice' => $Invoice,
        ];
    }

    /**
     * @Route("/%eccube_admin_route%/customize/setting/invoice/billing", name="customize_admin_setting_invoice_billing")
     * @Template("@admin/Setting/Invoice/customize_invoice_billing.twig")
     *
     * @return array
     */
    public function billing(Request $request)
    {
        $builder = $this->formFactory->createBuilder(InvoiceBillingType::class);

        $form = $builder->getForm();

        $year = null;
        $month = null;
        $multi = null;

        if ('POST' === $request->getMethod()) {
            $form->handleRequest($request);
            if ($form->isValid()) {
                if ($form->get('year')->getData() !== null) {
                    $year = $form->get('year')->getData();
                }
                if ($form->get('month')->getData() !== null) {
                    $month = $form->get('month')->getData();
                }
                if ($form->get('multi')->getData() !== null) {
                    $multi = $form->get('multi')->getData();
                }
            }
        } else {
            if ($request->get('resume')) {
                $year = $this->session->get('eccube.admin.setting.invoice.year');
                $month = $this->session->get('eccube.admin.setting.invoice.month');
            } else {
                $dt = Carbon::now();

                $year = $dt->year;
                $month = $dt->month;
            }

            $form->get('year')->setData($year);
            $form->get('month')->setData($month);
        }

        $this->session->set('eccube.admin.setting.invoice.multi', $multi);
        $this->session->set('eccube.admin.setting.invoice.year', $year);
        $this->session->set('eccube.admin.setting.invoice.month', $month);

        //指定の年月
        $searchCustomizeBillingMonthDate = new \DateTime();
        $searchCustomizeBillingMonthDate->setDate($year, $month, 1)->setTime(0, 0);

        $qb = $this->orderRepository
            ->createQueryBuilder('o')
            ->leftJoin('o.Customer', 'c');

        if (null !== $multi) {
            $qb
                ->andWhere('c.id = :multi')
                ->setParameter('multi', $multi);
        }

        // 注文取消し・決済処理中・購入処理中・返品は検索対象から除外
        $qb->andWhere($qb->expr()->notIn('o.OrderStatus', ':status'))
            ->setParameter('status', [OrderStatus::CANCEL, OrderStatus::PROCESSING, OrderStatus::PENDING, OrderStatus::RETURNED]);

        $qb
            ->andWhere('o.customize_billing_month_date = :customize_billing_month_date')
            ->setParameter('customize_billing_month_date', $searchCustomizeBillingMonthDate);

        $qb->orderBy('o.Customer', 'ASC')
            ->addOrderBy('o.order_date', 'ASC');

        // ダウンロード作成JOBリスト取得
        try {
            $jqb = $this->jobRepository->createQueryBuilder('j');

            $jqb
                ->andWhere('j.billing_year = :billing_year')
                ->andWhere('j.billing_month = :billing_month')
                ->andWhere('j.aggregated = :aggregated')
                ->andWhere('j.type = :type')
                ->setParameter('billing_year', $year)
                ->setParameter('billing_month', $month)
                ->setParameter('aggregated', false)
                ->setParameter('type', 'download');

            $jqb->orderBy('j.request_date', 'DESC');

            $Histories = $jqb->getQuery()->getResult();

        } catch (\Exception $e) {
        }

        // ダウンロード回数0のJOBを取得
        $NonDownloads = $this->externalDownLoadService->getCompleteDownLoadNone(false);

        foreach ($NonDownloads as $NonDownload) {
            $this->addSuccess(
                trans(
                    'invoice_docurain.admin.order.summary.invoice_billing.invoice_external_download_complete_non_download',
                    [
                        '%year%' => $NonDownload['billing_year'],
                        '%month%' => $NonDownload['billing_month'],
                    ]
                ),
                'admin'
            );
        }

        // メール送信状況取得API
        $this->externalMailSendService->getEmailSendingStatusApiCall();

        // ダウンロードファイルURL取得API
        $this->externalDownLoadService->getDownLoadStatusApiCall();

        return [
            'form' => $form->createView(),
            'Orders' => $qb->getQuery()->getResult(),
            'year' => $year,
            'month' => $month,
            'Histories' => $Histories,
        ];
    }
}
