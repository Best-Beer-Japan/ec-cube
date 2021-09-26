<?php

namespace Customize\Event;

use Customize\Entity\ProductBeerContainer;
use Customize\Service\BreweryRequestApiService;
use Eccube\Common\EccubeConfig;
use Eccube\Entity\Master\OrderItemType;
use Eccube\Event\EccubeEvents;
use Eccube\Event\EventArgs;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class AdminEvent implements EventSubscriberInterface
{
    /**
     * @var EccubeConfig
     */
    protected $eccubeConfig;

    /**
     * @var BreweryRequestApiService
     */
    protected $breweryRequestApiService;

    /**
     * FrontEvent constructor.
     *
     * @param EccubeConfig $eccubeConfig
     * @param BreweryRequestApiService $breweryRequestApiService
     */
    public function __construct(
        EccubeConfig $eccubeConfig,
        BreweryRequestApiService $breweryRequestApiService
    ) {
        $this->eccubeConfig = $eccubeConfig;
        $this->breweryRequestApiService = $breweryRequestApiService;
    }

    public static function getSubscribedEvents(): array
    {
        return [
            EccubeEvents::ADMIN_PRODUCT_EDIT_COMPLETE => ['onAdminProductEditComplete', 999999],
            EccubeEvents::ADMIN_ORDER_CSV_EXPORT_ORDER => ['onAdminOrderCsvExportOrder', 999999],
        ];
    }

    public function onAdminProductEditComplete(EventArgs $event)
    {
        $Product = $event->getArgument('Product');

        $url = $event->getRequest()->getUriForPath('/api/post_products/'.$Product->getId());

        $this->breweryRequestApiService->requestApi($url);
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
