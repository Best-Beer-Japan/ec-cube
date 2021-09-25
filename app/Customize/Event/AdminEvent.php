<?php

namespace Customize\Event;

use Customize\Service\BreweryRequestApiService;
use Eccube\Event\EccubeEvents;
use Eccube\Event\EventArgs;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class AdminEvent implements EventSubscriberInterface
{
    /**
     * @var BreweryRequestApiService
     */
    protected $breweryRequestApiService;

    /**
     * FrontEvent constructor.
     *
     * @param BreweryRequestApiService $breweryRequestApiService
     */
    public function __construct(
        BreweryRequestApiService $breweryRequestApiService
    ) {
        $this->breweryRequestApiService = $breweryRequestApiService;
    }

    public static function getSubscribedEvents(): array
    {
        return [
            EccubeEvents::ADMIN_PRODUCT_EDIT_COMPLETE => ['onAdminProductEditComplete', 999999],
        ];
    }

    public function onAdminProductEditComplete(EventArgs $event)
    {
        $Product = $event->getArgument('Product');

        $url = $event->getRequest()->getUriForPath('/api/post_products/'.$Product->getId());

        $this->breweryRequestApiService->requestApi($url);
    }
}
