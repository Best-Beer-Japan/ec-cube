<?php

namespace Customize\Event;

use Customize\Service\CorpseRequestApiService;
use Eccube\Event\EccubeEvents;
use Eccube\Event\EventArgs;
use Eccube\Event\TemplateEvent;
use Eccube\Repository\TagRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class FrontEvent implements EventSubscriberInterface
{
    /**
     * @var CorpseRequestApiService
     */
    protected $corpseRequestApiService;

    /**
     * @var SessionInterface
     */
    protected $session;

    /**
     * @var TagRepository
     */
    protected $tagRepository;

    /**
     * FrontEvent constructor.
     *
     * @param CorpseRequestApiService $corpseRequestApiService
     * @param SessionInterface $session
     * @param TagRepository $tagRepository
     */
    public function __construct(
        CorpseRequestApiService $corpseRequestApiService,
        SessionInterface $session,
        TagRepository $tagRepository
    ) {
        $this->corpseRequestApiService = $corpseRequestApiService;
        $this->session = $session;
        $this->tagRepository = $tagRepository;
    }

    public static function getSubscribedEvents(): array
    {
        return [
            EccubeEvents::FRONT_SHOPPING_COMPLETE_INITIALIZE => ['onFrontShoppingCompleteInitialize', 999999],
            'Product/list.twig' => ['onTemplateFrontProductList', 999999],
        ];
    }

    public function onFrontShoppingCompleteInitialize(EventArgs $event)
    {
        $Order = $event->getArgument('Order');

        foreach ($Order->getShippings() as $Shipping) {
            foreach ($Shipping->getOrderItems() as $item) {
                if ($item->isProduct()) {
                    $url = $event->getRequest()->getUriForPath('/api/post_products/'.$item->getProduct()->getId());

                    $this->corpseRequestApiService->requestApi($url, true);
                }
            }
        }
    }

    public function onTemplateFrontProductList(TemplateEvent $event)
    {
        $tag_id_list = $this->session->get('eccube.front.customize.tag.search');

        if (null === $tag_id_list || empty($tag_id_list)) {
            $event->setParameter('Tags', null);
        } else {
            $Tags = $this->tagRepository->findBy(['id' => $tag_id_list]);
            $event->setParameter('Tags', $Tags);
        }
    }
}
