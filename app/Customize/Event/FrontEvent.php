<?php

namespace Customize\Event;

use Customize\Service\CorpseRequestApiService;
use Doctrine\ORM\EntityManagerInterface;
use Eccube\Event\EccubeEvents;
use Eccube\Event\EventArgs;
use Eccube\Event\TemplateEvent;
use Eccube\Repository\CustomerRepository;
use Eccube\Repository\TagRepository;
use Eccube\Util\StringUtil;
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
     * @var EntityManagerInterface
     */
    protected $entityManager;

    /**
     * @var CustomerRepository
     */
    protected $customerRepository;

    /**
     * @var TagRepository
     */
    protected $tagRepository;

    /**
     * FrontEvent constructor.
     *
     * @param CorpseRequestApiService $corpseRequestApiService
     * @param SessionInterface $session
     * @param EntityManagerInterface $entityManager
     * @param CustomerRepository $customerRepository
     * @param TagRepository $tagRepository
     */
    public function __construct(
        CorpseRequestApiService $corpseRequestApiService,
        SessionInterface $session,
        EntityManagerInterface $entityManager,
        CustomerRepository $customerRepository,
        TagRepository $tagRepository
    ) {
        $this->corpseRequestApiService = $corpseRequestApiService;
        $this->session = $session;
        $this->entityManager = $entityManager;
        $this->customerRepository = $customerRepository;
        $this->tagRepository = $tagRepository;
    }

    public static function getSubscribedEvents(): array
    {
        return [
            EccubeEvents::FRONT_ENTRY_INDEX_COMPLETE => ['onFrontEntryIndexComplete', 999999],
            EccubeEvents::FRONT_MYPAGE_CHANGE_INDEX_COMPLETE => ['onFrontMypageChangeIndexComplete', 999999],
            EccubeEvents::FRONT_SHOPPING_COMPLETE_INITIALIZE => ['onFrontShoppingCompleteInitialize', 999999],
            'Product/list.twig' => ['onTemplateFrontProductList', 999999],
        ];
    }

    public function onFrontEntryIndexComplete(EventArgs $event)
    {
        $Customer = $event->getArgument('Customer');

        if (null === $Customer->getCustomizeInvoiceParentKey()) {
            // 請求書まとめ親コードが設定されていなければ発行
            $key = $this->customerRepository->getUniqueCustomizeInvoiceParentKey();
            $Customer->setCustomizeInvoiceParentKey($key);

            $this->entityManager->persist($Customer);
            $this->entityManager->flush();
        }
    }

    public function onFrontMypageChangeIndexComplete(EventArgs $event)
    {
        $form = $event->getArgument('form');
        $Customer = $event->getArgument('Customer');

        if (null === $Customer->getCustomizeInvoiceParentKey()) {
            // 請求書まとめ親コードが設定されていなければ発行
            $key = $this->customerRepository->getUniqueCustomizeInvoiceParentKey();
            $Customer->setCustomizeInvoiceParentKey($key);

            $this->entityManager->persist($Customer);
            $this->entityManager->flush();
        }

        // 請求書親設定
        $customize_relation_invoice_parent_key = $form['customize_relation_invoice_parent_key']->getData();
        if (null !== $customize_relation_invoice_parent_key) {
            $ParentKeyCustomer = $this->customerRepository->findOneBy(['customize_invoice_parent_key' => $form['customize_relation_invoice_parent_key']->getData()]);
            $Customer->setInvoiceParent($ParentKeyCustomer);
        } else {
            $Customer->setInvoiceParent(null);
        }

        $this->entityManager->persist($Customer);
        $this->entityManager->flush();
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
