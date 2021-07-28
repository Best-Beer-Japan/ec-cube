<?php

namespace Customize\Event;

use Eccube\Event\TemplateEvent;
use Eccube\Repository\TagRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class FrontEvent implements EventSubscriberInterface
{
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
     * @param SessionInterface $session
     * @param TagRepository $tagRepository
     */
    public function __construct(
        SessionInterface $session,
        TagRepository $tagRepository
    ) {
        $this->session = $session;
        $this->tagRepository = $tagRepository;
    }

    public static function getSubscribedEvents(): array
    {
        return [
            'Product/list.twig' => ['onTemplateFrontProductList', 999999],
        ];
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
