<?php

namespace Customize\Controller\Block;

use Eccube\Common\EccubeConfig;
use Eccube\Controller\AbstractController;
use Eccube\Entity\BaseInfo;
use Eccube\Form\Type\AddCartType;
use Eccube\Repository\BaseInfoRepository;
use Eccube\Repository\ProductRepository;
use Eccube\Repository\TaxRuleRepository;
use Eccube\Service\TaxRuleService;
use Plugin\Mixpack\Repository\CustomerGroupMembershipRepository;
use Plugin\Mixpack\Repository\CustomerGroupProductClassRepository;
use Plugin\Mixpack\Repository\CustomerGroupRepository;
use Plugin\Mixpack\Repository\PriceRuleRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Routing\Annotation\Route;

class CorpseNewReleaseController extends AbstractController
{
    /**
     * @var BaseInfo
     */
    protected $BaseInfo;

    /**
     * @var EccubeConfig
     */
    protected $eccubeConfig;

    /**
     * @var CustomerGroupMembershipRepository
     */
    protected $customerGroupMembershipRepository;

    /**
     * @var CustomerGroupProductClassRepository
     */
    protected $customerGroupProductClassRepository;

    /**
     * @var CustomerGroupRepository
     */
    protected $customerGroupRepository;

    /**
     * @var PriceRuleRepository
     */
    protected $priceRuleRepository;

    /**
     * @var ProductRepository
     */
    protected $productRepository;

    /**
     * @var TaxRuleRepository
     */
    protected $taxRuleRepository;
    /**
     * @var TaxRuleService
     */
    protected $taxRuleService;

    /**
     * CorpseTagStyleController constructor.
     *
     * @param EccubeConfig $eccubeConfig
     * @param ProductRepository $productRepository
     */
    public function __construct(
        BaseInfoRepository $baseInfoRepository,
        EccubeConfig $eccubeConfig,
        CustomerGroupMembershipRepository $customerGroupMembershipRepository,
        CustomerGroupProductClassRepository $customerGroupProductClassRepository,
        CustomerGroupRepository $customerGroupRepository,
        PriceRuleRepository $priceRuleRepository,
        ProductRepository $productRepository,
        TaxRuleRepository $taxRuleRepository,
        TaxRuleService $taxRuleService

    ) {
        $this->BaseInfo = $baseInfoRepository->get();
        $this->eccubeConfig = $eccubeConfig;
        $this->customerGroupMembershipRepository = $customerGroupMembershipRepository;
        $this->customerGroupProductClassRepository = $customerGroupProductClassRepository;
        $this->customerGroupRepository = $customerGroupRepository;
        $this->priceRuleRepository = $priceRuleRepository;
        $this->productRepository = $productRepository;
        $this->taxRuleRepository = $taxRuleRepository;
        $this->taxRuleService = $taxRuleService;

    }

    /**
     * @Route("/block/corpse_new_release", name="block_corpse_new_release")
     * @Template("Block/corpse_new_release.twig")
     */
    public function index()
    {
        // 会員グループID取得
        $groupId = 1; // デフォルトグループ：ゲスト
        if ($this->isGranted('ROLE_USER')) {
            $Customer = $this->getUser();
            // 会員グループID取得
            $CustomerGroupMemberShip = $this->customerGroupMembershipRepository->findCustomerGroupMembership($Customer->getId());
            if(!empty($CustomerGroupMemberShip)){
                $groupId = $CustomerGroupMemberShip->getGroupId();
            }
        }

        // 会員グループ別割引情報取得
        $discountRate = 0;
        $CustomerGroup = $this->customerGroupRepository->find($groupId);
        if(!empty($CustomerGroup)){
            $priceRuleId = $CustomerGroup->getPriceRuleId();
            $PriceRule = $this->priceRuleRepository->find($priceRuleId);
            if(!empty($PriceRule)){
                $discountRate = $PriceRule->getRate();
            }
        }

        // Doctrine SQLFilter
        if ($this->BaseInfo->isOptionNostockHidden()) {
            $this->entityManager->getFilters()->enable('option_nostock_hidden');
        }

        $qb = $this->productRepository
            ->createQueryBuilder('p')
            ->where('p.update_date > :update_date')
            ->andWhere('p.list_open_flag = 1')
            //->orderBy('p.update_date', 'DESC')
            ->setMaxResults(4)
            ->setParameter('update_date', (new \DateTime())->modify('-1 day'));

        $Products = $qb
            ->getQuery()
            ->useResultCache(true, $this->eccubeConfig['eccube_result_cache_lifetime_short'])
            ->getResult();

        shuffle($Products);

        $ids = [];
        foreach ($Products as $Product) {
            // 会員グループ別割引適用後の商品価格で書き換え
            $Product->setGroupDiscountPrice($groupId, $discountRate, $PriceRule->getRuleType()->getId(), $this->customerGroupProductClassRepository, $this->taxRuleService, $this->taxRuleRepository);

            $ids[] = $Product->getId();
        }
        $ProductsAndClassCategories = $this->productRepository->findProductsWithSortedClassCategories($ids, 'p.id');

        // addCart form
        $forms = [];
        foreach ($Products as $Product) {
            /* @var $builder \Symfony\Component\Form\FormBuilderInterface */
            $builder = $this->formFactory->createNamedBuilder(
                '',
                AddCartType::class,
                null,
                [
                    'product' => $ProductsAndClassCategories[$Product->getId()],
                    'allow_extra_fields' => true,
                ]
            );
            $addCartForm = $builder->getForm();

            $forms[$Product->getId()] = $addCartForm->createView();
        }

        return [
            'Products' => $Products,
            'forms' => $forms,
        ];
    }
}
