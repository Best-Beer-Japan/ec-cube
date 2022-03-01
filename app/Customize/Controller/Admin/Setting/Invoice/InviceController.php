<?php

namespace Customize\Controller\Admin\Setting\Invoice;

use Carbon\Carbon;
use Customize\Form\Type\Admin\InvoiceBillingType;
use Customize\Form\Type\Admin\InvoiceMasterType;
use Customize\Repository\InvoiceRepository;
use Eccube\Controller\AbstractController;
use Eccube\Entity\Master\OrderStatus;
use Eccube\Repository\OrderRepository;
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
     * ShopController constructor.
     *
     * @param InvoiceRepository $invoiceRepository
     * @param OrderRepository $orderRepository
     */
    public function __construct(
        InvoiceRepository $invoiceRepository,
        OrderRepository $orderRepository
    ) {
        $this->invoiceRepository = $invoiceRepository;
        $this->orderRepository = $orderRepository;
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

        $dt = Carbon::now();

        $year = $dt->year;
        $month = $dt->month;

        if ('POST' === $request->getMethod()) {
            $form->handleRequest($request);
            if ($form->isValid()) {
                if ($form->get('year')->getData() !== null) {
                    $year = $form->get('year')->getData();
                }
                if ($form->get('month')->getData() !== null) {
                    $month = $form->get('month')->getData();
                }
            }
        }

        //指定の年月
        $searchCustomizeBillingMonthDate = new \DateTime();
        $searchCustomizeBillingMonthDate->setDate($year, $month, 1)->setTime(0, 0, 0);

        $qb = $this->orderRepository->createQueryBuilder('o');

        // 購入処理中, 決済処理中は検索対象から除外
        $qb->andWhere($qb->expr()->notIn('o.OrderStatus', ':status'))
            ->setParameter('status', [OrderStatus::PROCESSING, OrderStatus::PENDING]);

        $qb
            ->andWhere('o.customize_billing_month_date = :customize_billing_month_date')
            ->setParameter('customize_billing_month_date', $searchCustomizeBillingMonthDate);

        $qb->orderBy('o.Customer', 'ASC')
            ->addOrderBy('o.order_date', 'ASC');

        return [
            'form' => $form->createView(),
            'Orders' => $qb->getQuery()->getResult(),
        ];
    }
}
