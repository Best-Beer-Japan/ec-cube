<?php

namespace Customize\Event;

use Customize\Service\CorpseRequestApiService;
use Customize\Service\BreweryRequestApiService;
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
     * @var BreweryRequestApiService
     */
    protected $breweryRequestApiService;

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
     * @param BreweryRequestApiService $breweryRequestApiService
     * @param SessionInterface $session
     * @param TagRepository $tagRepository
     */
    public function __construct(
        CorpseRequestApiService $corpseRequestApiService,
        BreweryRequestApiService $breweryRequestApiService,
        SessionInterface $session,
        TagRepository $tagRepository
    ) {
        $this->corpseRequestApiService = $corpseRequestApiService;
        $this->breweryRequestApiService = $breweryRequestApiService;
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
                    $Brewery = $item->getProduct()->getBrewery();

                    if (null === $Brewery) {
                        continue;
                    }

                    // $breweryDomain 例：https://corpse-matome.bestbeerjapan.com
                    $breweryDomain = $Brewery->getDomain();

                    $url = $event->getRequest()->getUriForPath($breweryDomain.'/api/post_products/'.$item->getProduct()->getOriginalProductId());

                    $this->corpseRequestApiService->requestApi($url);
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
