<?php

namespace Customize\Event;

use Customize\Service\CorpseRequestApi;
use Eccube\Event\EccubeEvents;
use Eccube\Event\EventArgs;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class AdminEvent implements EventSubscriberInterface
{
    /**
     * @var CorpseRequestApi
     */
    protected $corpseRequestApi;

    /**
     * FrontEvent constructor.
     *
     * @param CorpseRequestApi $corpseRequestApi
     */
    public function __construct(
        CorpseRequestApi $corpseRequestApi
    ) {
        $this->corpseRequestApi = $corpseRequestApi;
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

        $this->corpseRequestApi->requestApi($url);
    }
}
