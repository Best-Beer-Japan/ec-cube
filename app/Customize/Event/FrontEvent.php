<?php

namespace Customize\Event;

use Customize\Repository\AgreementRepository;
use Customize\Service\CorpseRequestApiService;
use Customize\Service\CustomerInvoiceService;
use Doctrine\ORM\EntityManagerInterface;
use Eccube\Event\EccubeEvents;
use Eccube\Event\EventArgs;
use Eccube\Event\TemplateEvent;
use Eccube\Repository\CustomerRepository;
use Eccube\Repository\TagRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class FrontEvent implements EventSubscriberInterface
{
    /**
     * @var AgreementRepository
     */
    protected $agreementRepository;

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
     * @var CustomerInvoiceService
     */
    protected $customerInvoiceService;

    /**
     * FrontEvent constructor.
     *
     * @param AgreementRepository $agreementRepository
     * @param CorpseRequestApiService $corpseRequestApiService
     * @param SessionInterface $session
     * @param EntityManagerInterface $entityManager
     * @param CustomerRepository $customerRepository
     * @param TagRepository $tagRepository
     * @param CustomerInvoiceService $customerInvoiceService
     */
    public function __construct(
        AgreementRepository $agreementRepository,
        CorpseRequestApiService $corpseRequestApiService,
        SessionInterface $session,
        EntityManagerInterface $entityManager,
        CustomerRepository $customerRepository,
        TagRepository $tagRepository,
        CustomerInvoiceService $customerInvoiceService
    ) {
        $this->agreementRepository = $agreementRepository;
        $this->corpseRequestApiService = $corpseRequestApiService;
        $this->session = $session;
        $this->entityManager = $entityManager;
        $this->customerRepository = $customerRepository;
        $this->tagRepository = $tagRepository;
        $this->customerInvoiceService = $customerInvoiceService;
    }

    public static function getSubscribedEvents(): array
    {
        return [
            EccubeEvents::FRONT_ENTRY_INDEX_COMPLETE => ['onFrontEntryIndexComplete', 999999],
            EccubeEvents::FRONT_MYPAGE_CHANGE_INDEX_COMPLETE => ['onFrontMypageChangeIndexComplete', 999999],
            EccubeEvents::FRONT_SHOPPING_COMPLETE_INITIALIZE => ['onFrontShoppingCompleteInitialize', 999999],
            'Entry/index.twig' => ['onTemplateFrontEntryIndex', 999999],
            'Product/list.twig' => ['onTemplateFrontProductList', 999999],
        ];
    }

    public function onFrontEntryIndexComplete(EventArgs $event)
    {
        $form = $event->getArgument('form');
        $Customer = $event->getArgument('Customer');

        $this->customerInvoiceService->createInvoiceParentCodeKey($Customer);
        $this->customerInvoiceService->applyInvoiceParent($Customer, $form);
    }

    public function onFrontMypageChangeIndexComplete(EventArgs $event)
    {
        $form = $event->getArgument('form');
        $Customer = $event->getArgument('Customer');

        $this->customerInvoiceService->createInvoiceParentCodeKey($Customer);
        $this->customerInvoiceService->applyInvoiceParent($Customer, $form);
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

    public function onTemplateFrontEntryIndex(TemplateEvent $event)
    {
        $Agreement = $this->agreementRepository->get();

        $twig = '/Entry/agreement.twig';

        if (null !== $Agreement->getAgreementDetail()) {
            $event->setParameter('agreementDetail', $Agreement->getAgreementDetail());
            $event->addSnippet($twig);
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
