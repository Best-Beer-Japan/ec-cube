<?php

namespace Customize\Event;

use Customize\Entity\ProductBeerContainer;
use Customize\Service\BreweryRequestApiService;
use Customize\Service\CustomerInvoiceService;
use Doctrine\ORM\EntityManagerInterface;
use Eccube\Common\EccubeConfig;
use Eccube\Entity\Master\OrderItemType;
use Eccube\Event\EccubeEvents;
use Eccube\Event\EventArgs;
use Eccube\Repository\CustomerRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class AdminEvent implements EventSubscriberInterface
{
    /**
     * @var EccubeConfig
     */
    protected $eccubeConfig;

    /**
     * @var EntityManagerInterface
     */
    protected $entityManager;

    /**
     * @var CustomerRepository
     */
    protected $customerRepository;

    /**
     * @var BreweryRequestApiService
     */
    protected $breweryRequestApiService;

    /**
     * @var CustomerInvoiceService
     */
    protected $customerInvoiceService;

    /**
     * FrontEvent constructor.
     *
     * @param EccubeConfig $eccubeConfig
     * @param EntityManagerInterface $entityManager
     * @param CustomerRepository $customerRepository
     * @param BreweryRequestApiService $breweryRequestApiService
     * @param CustomerInvoiceService $customerInvoiceService
     */
    public function __construct(
        EccubeConfig $eccubeConfig,
        EntityManagerInterface $entityManager,
        CustomerRepository $customerRepository,
        BreweryRequestApiService $breweryRequestApiService,
        CustomerInvoiceService $customerInvoiceService
    ) {
        $this->eccubeConfig = $eccubeConfig;
        $this->entityManager = $entityManager;
        $this->customerRepository = $customerRepository;
        $this->breweryRequestApiService = $breweryRequestApiService;
        $this->customerInvoiceService = $customerInvoiceService;
    }

    public static function getSubscribedEvents(): array
    {
        return [
            EccubeEvents::ADMIN_CUSTOMER_CSV_EXPORT => ['onAdminCustomerCsvExport', 999999],
            EccubeEvents::ADMIN_CUSTOMER_EDIT_INDEX_COMPLETE => ['onAdminCustomerEditIndexComplete', 999999],
            EccubeEvents::ADMIN_PRODUCT_EDIT_COMPLETE => ['onAdminProductEditComplete', 999999],
            EccubeEvents::ADMIN_ORDER_CSV_EXPORT_ORDER => ['onAdminOrderCsvExportOrder', 999999],
        ];
    }

    public function onAdminCustomerCsvExport(EventArgs $event)
    {
        $Csv = $event->getArgument('Csv');
        $ExportCsvRow = $event->getArgument('ExportCsvRow');
        $Customer = $event->getArgument('Customer');

        if ($Csv->getCsvType()->getId() === 2) {
            // 自社配送
            if ($Csv->getFieldName() === 'plg_delivery_fee_extension_customer_deliverys') {
                $CustomerDeliveries = $Customer->getCustomerDeliveries();

                $isDelivery = 'あり';
                if ($CustomerDeliveries->isEmpty()) {
                    $isDelivery = 'なし';
                }

                $ExportCsvRow->setData($isDelivery);

                return;
            }

            // 自社配送名
            if ($Csv->getFieldName() === 'plg_delivery_fee_extension_customer_delivery_names') {
                $CustomerDeliveries = $Customer->getCustomerDeliveries();

                $DeliveryNames = [];
                if ($CustomerDeliveries->isEmpty()) {
                    return;
                }

                foreach ($CustomerDeliveries as $CustomerDelivery) {
                    $DeliveryNames[] = $CustomerDelivery->getDelivery()->getName();
                }

                $ExportCsvRow->setData(implode($this->eccubeConfig['eccube_csv_export_multidata_separator'], $DeliveryNames));

                return;
            }
        }
    }

    public function onAdminCustomerEditIndexComplete(EventArgs $event)
    {
        $form = $event->getArgument('form');
        $Customer = $event->getArgument('Customer');

        $this->customerInvoiceService->createInvoiceParentCodeKey($Customer);
        $this->customerInvoiceService->applyInvoiceParent($Customer, $form);
    }

    public function onAdminProductEditComplete(EventArgs $event)
    {
        $form = $event->getArgument('form');
        $Product = $event->getArgument('Product');

        $BeerContainers = $form->get('BeerContainer')->getData();

        /*
                if (0 == count($BeerContainers)) {
                    $form['BeerContainer']->addError(new FormError(trans('admin.common.file_select_empty')));

                    return;
                }
        */

        // 容器の情報を一度リセット
        foreach ($Product->getProductBeerContainers() as $ProductBeerContainer) {
            $Product->removeProductBeerContainer($ProductBeerContainer);
            $this->entityManager->remove($ProductBeerContainer);
        }
        $this->entityManager->flush();

        // 容器の情報を登録
        foreach ($BeerContainers as $BeerContainer) {
            $ProductBeerContainer = new ProductBeerContainer();
            $ProductBeerContainer->setProductId($Product->getId())
                ->setBeerContainerId($BeerContainer->getId())
                ->setProduct($Product)
                ->setBeerContainer($BeerContainer);

            $this->entityManager->persist($ProductBeerContainer);
            $Product->addProductBeerContainer($ProductBeerContainer);
        }
        $this->entityManager->flush();

        $url = $event->getRequest()->getUriForPath('/api/post_products/'.$Product->getId());

        $this->breweryRequestApiService->requestApi($url, true);
    }

    public function onAdminOrderCsvExportOrder(EventArgs $event)
    {
        $Csv = $event->getArgument('Csv');
        $ExportCsvRow = $event->getArgument('ExportCsvRow');
        $OrderItem = $event->getArgument('OrderItem');

        if ($Csv->getCsvType()->getId() === 3) {
            //容器
            if ($Csv->getFieldName() === 'ProductBeerContainers' && $OrderItem->getOrderItemType()->getId() === OrderItemType::PRODUCT) {
                $ProductBeerContainers = $OrderItem->getProduct()->getProductBeerContainers()->toArray();

                if (!empty($ProductBeerContainers)) {
                    usort($ProductBeerContainers, function (ProductBeerContainer $BeerContainer1, ProductBeerContainer $BeerContainer2) {
                        // 昇順
                        return $BeerContainer1->getBeerContainer()->getSortNo() < $BeerContainer2->getBeerContainer()->getSortNo();
                    });

                    $BeerContainers = array_map(function ($ProductBeerContainer) use ($Csv) {
                        return $ProductBeerContainer->offsetGet($Csv->getReferenceFieldName());
                    }, $ProductBeerContainers);

                    $ExportCsvRow->setData(implode($this->eccubeConfig['eccube_csv_export_multidata_separator'], $BeerContainers));

                    return;
                }
            }
        }
    }
}
