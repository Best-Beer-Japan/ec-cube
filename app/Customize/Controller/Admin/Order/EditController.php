<?php

namespace Customize\Controller\Admin\Order;

use Eccube\Controller\AbstractController;
use Eccube\Entity\Order;
use Eccube\Event\EccubeEvents;
use Eccube\Event\EventArgs;
use Eccube\Form\Type\AddCartType;
use Eccube\Repository\CategoryRepository;
use Eccube\Repository\CustomerAddressRepository;
use Eccube\Repository\CustomerRepository;
use Eccube\Repository\ProductRepository;
use Eccube\Repository\TaxRuleRepository;
use Eccube\Service\TaxRuleService;
use Knp\Component\Pager\Paginator;
use Plugin\Mixpack\Repository\CustomerGroupMembershipRepository;
use Plugin\Mixpack\Repository\CustomerGroupProductClassRepository;
use Plugin\Mixpack\Repository\CustomerGroupRepository;
use Plugin\Mixpack\Repository\PriceRuleRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class EditController extends AbstractController
{
    /**
     * @var ProductRepository
     */
    protected $productRepository;

    /**
     * @var CategoryRepository
     */
    protected $categoryRepository;

    /**
     * @var CustomerRepository
     */
    protected $customerRepository;

    /**
     * @var CustomerAddressRepository
     */
    protected $customerAddressRepository;

    /**
     * @var CustomerGroupMembershipRepository
     */
    protected $customerGroupMembershipRepository;

    /**
     * @var CustomerGroupRepository
     */
    protected $customerGroupRepository;

    /**
     * @var PriceRuleRepository
     */
    protected $priceRuleRepository;

    /**
     * @var CustomerGroupProductClassRepository
     */
    protected $customerGroupProductClassRepository;

    /**
     * @var TaxRuleService
     */
    protected $taxRuleService;

    /**
     * @var TaxRuleRepository
     */
    protected $taxRuleRepository;

    /**
     * EditController constructor.
     *
     * @param ProductRepository $productRepository
     * @param CategoryRepository $categoryRepository
     * @param CustomerRepository $customerRepository
     * @param CustomerAddressRepository $customerAddressRepository
     * @param CustomerGroupMembershipRepository $customerGroupMembershipRepository
     * @param CustomerGroupRepository $customerGroupRepository
     * @param PriceRuleRepository $priceRuleRepository
     * @param CustomerGroupProductClassRepository $customerGroupProductClassRepository
     * @param TaxRuleService $taxRuleService
     * @param TaxRuleRepository $taxRuleRepository
     */
    public function __construct(
        ProductRepository $productRepository,
        CategoryRepository $categoryRepository,
        CustomerRepository $customerRepository,
        CustomerAddressRepository $customerAddressRepository,
        CustomerGroupMembershipRepository $customerGroupMembershipRepository,
        CustomerGroupRepository $customerGroupRepository,
        PriceRuleRepository $priceRuleRepository,
        CustomerGroupProductClassRepository $customerGroupProductClassRepository,
        TaxRuleService $taxRuleService,
        TaxRuleRepository $taxRuleRepository
    ) {
        $this->productRepository = $productRepository;
        $this->categoryRepository = $categoryRepository;
        $this->customerRepository = $customerRepository;
        $this->customerAddressRepository = $customerAddressRepository;
        $this->customerGroupMembershipRepository = $customerGroupMembershipRepository;
        $this->customerGroupRepository = $customerGroupRepository;
        $this->priceRuleRepository = $priceRuleRepository;
        $this->customerGroupProductClassRepository = $customerGroupProductClassRepository;
        $this->taxRuleService = $taxRuleService;
        $this->taxRuleRepository = $taxRuleRepository;
    }

    /**
     * @Route("/%eccube_admin_route%/order/search/product", name="admin_order_search_product")
     * @Route("/%eccube_admin_route%/order/search/product/page/{page_no}", requirements={"page_no" = "\d+"}, name="admin_order_search_product_page")
     * @Template("@admin/Order/search_product.twig")
     */
    public function searchProduct(Request $request, $page_no = null, Paginator $paginator)
    {
        if ($request->isXmlHttpRequest() && $this->isTokenValid()) {
            log_debug('search product start.');
            $page_count = $this->eccubeConfig['eccube_default_page_count'];
            $session = $this->session;

            if ('POST' === $request->getMethod()) {
                $page_no = 1;

                $searchData = [
                    'id' => $request->get('id'),
                ];

                if ($categoryId = $request->get('category_id')) {
                    $Category = $this->categoryRepository->find($categoryId);
                    $searchData['category_id'] = $Category;
                }

                $customerId = $request->get('customer_id');

                $session->set('eccube.admin.order.product.search', $searchData);
                $session->set('eccube.admin.order.product.search.page_no', $page_no);
                $session->set('eccube.admin.order.product.search.customer_id', $customerId);
            } else {
                $searchData = (array) $session->get('eccube.admin.order.product.search');
                if (is_null($page_no)) {
                    $page_no = intval($session->get('eccube.admin.order.product.search.page_no'));
                } else {
                    $session->set('eccube.admin.order.product.search.page_no', $page_no);
                }

                $customerId = $session->get('eccube.admin.order.product.search.customer_id');
            }

            // 会員グループID取得
            $groupId = 1; // デフォルトグループ：ゲスト
            if (!empty($customerId)) {
                $Customer = $this->customerRepository->find($customerId);
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

            $qb = $this->productRepository
                ->getQueryBuilderBySearchDataForAdmin($searchData);

            $event = new EventArgs(
                [
                    'qb' => $qb,
                    'searchData' => $searchData,
                ],
                $request
            );
            $this->eventDispatcher->dispatch(EccubeEvents::ADMIN_ORDER_EDIT_SEARCH_PRODUCT_SEARCH, $event);

            /** @var \Knp\Component\Pager\Pagination\SlidingPagination $pagination */
            $pagination = $paginator->paginate(
                $qb,
                $page_no,
                $page_count,
                ['wrap-queries' => true]
            );

            /** @var $Products \Eccube\Entity\Product[] */
            $Products = $pagination->getItems();

            if (empty($Products)) {
                log_debug('search product not found.');
            }

            foreach ($Products as $Product) {
                // 会員グループ別割引適用後の商品価格で書き換え
                $Product->setGroupDiscountPrice($groupId, $discountRate, $PriceRule->getRuleType()->getId(), $this->customerGroupProductClassRepository, $this->taxRuleService, $this->taxRuleRepository);
            }

            $forms = [];
            foreach ($Products as $Product) {
                /* @var $builder \Symfony\Component\Form\FormBuilderInterface */
                $builder = $this->formFactory->createNamedBuilder('', AddCartType::class, null, [
                    'product' => $this->productRepository->findWithSortedClassCategories($Product->getId()),
                ]);
                $addCartForm = $builder->getForm();
                $forms[$Product->getId()] = $addCartForm->createView();
            }

            $event = new EventArgs(
                [
                    'forms' => $forms,
                    'Products' => $Products,
                    'pagination' => $pagination,
                ],
                $request
            );
            $this->eventDispatcher->dispatch(EccubeEvents::ADMIN_ORDER_EDIT_SEARCH_PRODUCT_COMPLETE, $event);

            return [
                'forms' => $forms,
                'Products' => $Products,
                'pagination' => $pagination,
            ];
        }
    }

    /**
     * @Route("/%eccube_admin_route%/customize/order/customer/address", name="customize_admin_order_customer_address")
     * @Route("/%eccube_admin_route%/customize/order/customer/address/page/{page_no}", requirements={"page_no" = "\d+"}, name="customize_admin_order_customer_address_page")
     * @Template("@admin/Order/customer_address.twig")
     */
    public function customerSubAddress(Request $request, $page_no = null, Paginator $paginator)
    {
        if ($request->isXmlHttpRequest() && $this->isTokenValid()) {
            log_debug('customer address start.');
            $page_count = $this->eccubeConfig['eccube_default_page_count'];
            $session = $this->session;

            if ('POST' === $request->getMethod()) {
                $page_no = 1;

                $customerId = $request->get('customer_id');

                $session->set('eccube.customize.admin.order.customer.address.page_no', $page_no);
                $session->set('eccube.customize.admin.order.customer.address.customer_id', $customerId);
            } else {
                if (is_null($page_no)) {
                    $page_no = intval($session->get('eccube.customize.admin.order.customer.address.page_no'));
                } else {
                    $session->set('eccube.customize.admin.order.customer.address.page_no', $page_no);
                }

                $customerId = $session->get('eccube.customize.admin.order.customer.address.customer_id');
            }

            $pagination = null;
            $data = [];
            if (!empty($customerId)) {
                $Customer = $this->customerRepository->find($customerId);

                $qb = $this->customerAddressRepository->createQueryBuilder('ca');
                $qb->andWhere('ca.Customer = :Customer')
                    ->setParameter('Customer', $Customer);

                /** @var \Knp\Component\Pager\Pagination\SlidingPagination $pagination */
                $pagination = $paginator->paginate(
                    $qb,
                    $page_no,
                    $page_count,
                    ['wrap-queries' => true]
                );

                $CustomerAddresses = $pagination->getItems();

                $formatName = '%s%s(%s%s)';
                foreach ($CustomerAddresses as $CustomerAddress) {
                    $data[] = [
                        'id' => $CustomerAddress->getId(),
                        'name' => sprintf($formatName, $CustomerAddress->getName01(), $CustomerAddress->getName02(),
                            $CustomerAddress->getKana01(),
                            $CustomerAddress->getKana02()),
                        'phone_number' => $CustomerAddress->getPhoneNumber(),
                        'address' => $CustomerAddress->getPref()->getName().' '.$CustomerAddress->getAddr01().' '.$CustomerAddress->getAddr02(),
                    ];
                }
            }

            return [
                'data' => $data,
                'pagination' => $pagination,
            ];
        }
    }

    /**
     * 顧客お届け先を検索する.
     *
     * @Route("/%eccube_admin_route%/customize/order/search/customer/address/id", name="customize_admin_order_customer_address_by_id", methods={"POST"})
     *
     * @param Request $request
     *
     * @return \Symfony\Component\HttpFoundation\JsonResponse
     */
    public function searchCustomerById(Request $request)
    {
        if ($request->isXmlHttpRequest() && $this->isTokenValid()) {
            log_debug('customer address by id start.');

            $CustomerAddress = $this->customerAddressRepository
                ->find($request->get('id'));

            if (is_null($CustomerAddress)) {
                log_debug('customer address by id not found.');

                return $this->json([], 404);
            }

            log_debug('customer address by id found.');

            $data = [
                'name01' => $CustomerAddress->getName01(),
                'name02' => $CustomerAddress->getName02(),
                'kana01' => $CustomerAddress->getKana01(),
                'kana02' => $CustomerAddress->getKana02(),
                'postal_code' => $CustomerAddress->getPostalCode(),
                'pref' => is_null($CustomerAddress->getPref()) ? null : $CustomerAddress->getPref()->getId(),
                'addr01' => $CustomerAddress->getAddr01(),
                'addr02' => $CustomerAddress->getAddr02(),
                'phone_number' => $CustomerAddress->getPhoneNumber(),
                'company_name' => $CustomerAddress->getCompanyName(),
                'customize_store_name' => $CustomerAddress->getCustomizeStoreName(),
            ];

            return $this->json($data);
        }
    }

    /**
     * @Route("/%eccube_admin_route%/customize/order/shipping/customer/address/{id}", requirements={"id" = "\d+"}, name="customize_admin_order_shipping_customer_address")
     * @Route("/%eccube_admin_route%/customize/order/shipping/customer/address/page/{page_no}", requirements={"page_no" = "\d+"}, name="customize_admin_order_shipping_customer_address_page")
     * @Template("@admin/Order/shipping_customer_address.twig")
     */
    public function shippingCustomerSubAddress(Request $request, Order $Order, $page_no = null, Paginator $paginator)
    {
        if ($request->isXmlHttpRequest() && $this->isTokenValid()) {
            log_debug('shipping customer address start.');
            $page_count = $this->eccubeConfig['eccube_default_page_count'];
            $session = $this->session;

            if ('POST' === $request->getMethod()) {
                $page_no = 1;

                $itemIndex = $request->get('item_index');
                $customerId = $Order->getCustomer() ? $Order->getCustomer()->getId() : null;

                $session->set('eccube.customize.admin.order.customer.address.page_no', $page_no);
                $session->set('eccube.customize.admin.order.customer.address.item_index', $itemIndex);
                $session->set('eccube.customize.admin.order.customer.address.customer_id', $customerId);
            } else {
                if (is_null($page_no)) {
                    $page_no = intval($session->get('eccube.customize.admin.order.customer.address.page_no'));
                } else {
                    $session->set('eccube.customize.admin.order.customer.address.page_no', $page_no);
                }

                $itemIndex = $session->get('eccube.customize.admin.order.customer.address.item_index');
                $customerId = $session->get('eccube.customize.admin.order.customer.address.customer_id');
            }

            $pagination = null;
            $data = [];
            if (!empty($customerId)) {
                $Customer = $this->customerRepository->find($customerId);

                $qb = $this->customerAddressRepository->createQueryBuilder('ca');
                $qb->andWhere('ca.Customer = :Customer')
                    ->setParameter('Customer', $Customer);

                /** @var \Knp\Component\Pager\Pagination\SlidingPagination $pagination */
                $pagination = $paginator->paginate(
                    $qb,
                    $page_no,
                    $page_count,
                    ['wrap-queries' => true]
                );

                $CustomerAddresses = $pagination->getItems();

                $formatName = '%s%s(%s%s)';
                foreach ($CustomerAddresses as $CustomerAddress) {
                    $data[] = [
                        'id' => $CustomerAddress->getId(),
                        'name' => sprintf($formatName, $CustomerAddress->getName01(), $CustomerAddress->getName02(),
                            $CustomerAddress->getKana01(),
                            $CustomerAddress->getKana02()),
                        'phone_number' => $CustomerAddress->getPhoneNumber(),
                        'address' => $CustomerAddress->getPref()->getName().' '.$CustomerAddress->getAddr01().' '.$CustomerAddress->getAddr02(),
                    ];
                }
            }

            return [
                'item_index' => $itemIndex,
                'data' => $data,
                'pagination' => $pagination,
            ];
        }
    }
}
