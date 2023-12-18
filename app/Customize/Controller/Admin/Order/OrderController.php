<?php

namespace Customize\Controller\Admin\Order;

use Eccube\Controller\AbstractController;
use Eccube\Entity\ExportCsvRow;
use Eccube\Entity\Order;
use Eccube\Event\EccubeEvents;
use Eccube\Event\EventArgs;
use Eccube\Repository\Master\CsvTypeRepository;
use Eccube\Service\CsvExportService;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Symfony\Component\Routing\Annotation\Route;

class OrderController extends AbstractController
{
    /**
     * @var CsvExportService
     */
    protected $csvExportService;

    /**
     * @var CsvTypeRepository
     */
    protected $csvTypeRepository;

    /**
     * OrderController constructor.
     *
     * @param CsvExportService $csvExportService
     * @param CsvTypeRepository $csvTypeRepository
     */
    public function __construct(
        CsvExportService $csvExportService,
        CsvTypeRepository $csvTypeRepository
    ) {
        $this->csvExportService = $csvExportService;
        $this->csvTypeRepository = $csvTypeRepository;
    }

    /**
     * Update to order status
     *
     * @Route("/%eccube_admin_route%/order/{id}/billing_date", requirements={"id" = "\d+"}, name="admin_order_update_billing_date", methods={"PUT"})
     *
     * @param Request $request
     * @param Order $Order
     *
     * @return \Symfony\Component\HttpFoundation\JsonResponse
     */
    public function updateOrderBilling(Request $request, Order $Order)
    {
        if (!($request->isXmlHttpRequest() && $this->isTokenValid())) {
            return $this->json(['status' => 'NG'], 400);
        }

        if (null === $Order->getCustomer()) {
            return $this->json(['status' => 'NG', 'message' => '[受注番号：'.$Order->getId().'] 非会員の注文は請求月を指定できません。']);
        }

        $year = $request->get('billing_year');
        $month = $request->get('billing_month');

        $NowDateTime = new \DateTime('NOW');
        $startYear = $NowDateTime->format('Y') - 1;
        $endYear = $startYear + 2;

        if (($year < $startYear || $endYear < $year) || ($month < 1 || 12 < $month)) {
            return $this->json(['status' => 'NG'], 400);
        }

        $result = [];
        try {
            $setDate = new \DateTime();
            $setDate->setDate($year, $month, 1)->setTime(0, 0, 0);

            $Order->setCustomizeBillingMonthDate($setDate);
            $this->entityManager->persist($Order);
            $this->entityManager->flush();

            log_info('請求月一括変更処理完了', [$Order->getId()]);
        } catch (\Exception $e) {
            log_error('予期しないエラーです', [$e->getMessage()]);

            return $this->json(['status' => 'NG'], 500);
        }

        return $this->json(array_merge(['status' => 'OK'], $result));
    }

    /**
     * Update to order status
     *
     * @Route("/%eccube_admin_route%/order/{id}/billing_date/lift", requirements={"id" = "\d+"}, name="admin_order_lift_billing_date", methods={"PUT"})
     *
     * @param Request $request
     * @param Order $Order
     *
     * @return \Symfony\Component\HttpFoundation\JsonResponse
     */
    public function liftOrderBilling(Request $request, Order $Order)
    {
        if (!($request->isXmlHttpRequest() && $this->isTokenValid())) {
            return $this->json(['status' => 'NG'], 400);
        }

        try {
            $Order->setCustomizeBillingMonthDate(null);
            $this->entityManager->persist($Order);
            $this->entityManager->flush();

            log_info('請求月一括変更処理完了', [$Order->getId()]);
        } catch (\Exception $e) {
            log_error('予期しないエラーです', [$e->getMessage()]);

            return $this->json(['status' => 'NG'], 500);
        }

        return $this->json(array_merge(['status' => 'OK']));
    }

    /**
     * 請求CSVの出力.
     *
     * @Route("/%eccube_admin_route%/customize/order/export/billing_date", name="admin_customize_order_export_billing_date")
     *
     * @param Request $request
     *
     * @return StreamedResponse
     */
    public function exportShipping(Request $request)
    {
        $filename = 'billing_date_'.(new \DateTime())->format('YmdHis').'.csv';
        $CsvType = $this->csvTypeRepository->findOneBy(['name' => '請求CSV']);
        $response = $this->exportCsv($request, $CsvType->getId(), $filename);
        log_info('請求CSV出力ファイル名', [$filename]);

        return $response;
    }

    /**
     * @param Request $request
     * @param $csvTypeId
     * @param string $fileName
     *
     * @return StreamedResponse
     */
    protected function exportCsv(Request $request, $csvTypeId, $fileName)
    {
        // タイムアウトを無効にする.
        set_time_limit(0);

        // sql loggerを無効にする.
        $em = $this->entityManager;
        $em->getConfiguration()->setSQLLogger(null);

        $response = new StreamedResponse();
        $response->setCallback(function () use ($request, $csvTypeId) {
            // CSV種別を元に初期化.
            $this->csvExportService->initCsvType($csvTypeId);

            // ヘッダ行の出力.
            $this->csvExportService->exportHeader();

            // 受注データ検索用のクエリビルダを取得.
            $qb = $this->csvExportService
                ->getOrderQueryBuilder($request);

            $qb->leftJoin('o.Customer', 'c');
            $qb->orderBy('c.id', 'ASC');
            $qb->addorderBy('o.id', 'ASC');

            // データ行の出力.
            $this->csvExportService->setExportQueryBuilder($qb);
            $this->csvExportService->exportData(function ($entity, $csvService) use ($request) {
                $Csvs = $csvService->getCsvs();

                $Order = $entity;
                $OrderItems = $Order->getOrderItems();

                foreach ($OrderItems as $OrderItem) {
                    $ExportCsvRow = new ExportCsvRow();

                    // CSV出力項目と合致するデータを取得.
                    foreach ($Csvs as $Csv) {
                        // 受注データを検索.
                        $ExportCsvRow->setData($csvService->getData($Csv, $Order));
                        if ($ExportCsvRow->isDataNull()) {
                            // 受注データにない場合は, 受注明細を検索.
                            $ExportCsvRow->setData($csvService->getData($Csv, $OrderItem));
                        }
                        if ($ExportCsvRow->isDataNull() && $Shipping = $OrderItem->getShipping()) {
                            // 受注明細データにない場合は, 出荷を検索.
                            $ExportCsvRow->setData($csvService->getData($Csv, $Shipping));
                        }
                        if ($ExportCsvRow->isDataNull() && $Product = $OrderItem->getProduct()) {
                            // 受注明細データにない場合は, 商品を検索.
                            $ExportCsvRow->setData($csvService->getData($Csv, $Product));
                        }

                        $event = new EventArgs(
                            [
                                'csvService' => $csvService,
                                'Csv' => $Csv,
                                'OrderItem' => $OrderItem,
                                'ExportCsvRow' => $ExportCsvRow,
                            ],
                            $request
                        );
                        $this->eventDispatcher->dispatch(EccubeEvents::ADMIN_ORDER_CSV_EXPORT_ORDER, $event);

                        $ExportCsvRow->pushData();
                    }

                    //$row[] = number_format(memory_get_usage(true));
                    // 出力.
                    $csvService->fputcsv($ExportCsvRow->getRow());
                }
            });
        });

        $response->headers->set('Content-Type', 'application/octet-stream');
        $response->headers->set('Content-Disposition', 'attachment; filename='.$fileName);
        $response->send();

        return $response;
    }
}
