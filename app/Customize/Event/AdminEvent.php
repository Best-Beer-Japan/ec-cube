<?php

namespace Customize\Event;

use Customize\Service\CorpseRequestApiService;
use Eccube\Event\EccubeEvents;
use Eccube\Event\EventArgs;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class AdminEvent implements EventSubscriberInterface
{
    /**
     * @var CorpseRequestApiService
     */
    protected $corpseRequestApiService;

    /**
     * FrontEvent constructor.
     *
     * @param CorpseRequestApiService $corpseRequestApiService
     */
    public function __construct(
        CorpseRequestApiService $corpseRequestApiService
    ) {
        $this->corpseRequestApiService = $corpseRequestApiService;
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

        $this->corpseRequestApiService->requestApi($url);
    }
}
