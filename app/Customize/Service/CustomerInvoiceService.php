<?php

namespace Customize\Service;

use Doctrine\ORM\EntityManagerInterface;
use Eccube\Common\EccubeConfig;
use Eccube\Entity\Customer;
use Eccube\Repository\CustomerRepository;

class CustomerInvoiceService
{
    /**
     * @var EccubeConfig
     */
    protected $eccubeConfig;

    /**
     * @var EntityManagerInterface
     */
    protected $entityManager;

    /**
     * @var CustomerRepository
     */
    protected $customerRepository;

    /**
     * CorpseTagStyleController constructor.
     *
     * @param EccubeConfig $eccubeConfig
     * @param EntityManagerInterface $entityManager
     * @param CustomerRepository $customerRepository
     */
    public function __construct(
        EccubeConfig $eccubeConfig,
        EntityManagerInterface $entityManager,
        CustomerRepository $customerRepository
    ) {
        $this->eccubeConfig = $eccubeConfig;
        $this->entityManager = $entityManager;
        $this->customerRepository = $customerRepository;
    }

    /**
     * Invoice code issuance
     *
     * @param Customer $Customer
     */
    public function createInvoiceParentCodeKey(Customer $Customer)
    {
        if (null !== $Customer->getCustomizeInvoiceParentKey()) {
            return;
        }

        // 請求書まとめ親コードが設定されていなければ発行
        $key = $this->customerRepository->getUniqueCustomizeInvoiceParentKey();
        $Customer->setCustomizeInvoiceParentKey($key);

        $this->entityManager->persist($Customer);
        $this->entityManager->flush();
    }

    /**
     * Invoice Parent Customer setting
     *
     * @param Customer $Customer
     */
    public function applyInvoiceParent(Customer $Customer, $form)
    {
        // 請求書親設定
        $customize_relation_invoice_parent_key = $form['customize_relation_invoice_parent_key']->getData();
        if (null !== $customize_relation_invoice_parent_key) {
            $ParentKeyCustomer = $this->customerRepository->findOneBy(['customize_invoice_parent_key' => $customize_relation_invoice_parent_key]);
            $Customer->setInvoiceParent($ParentKeyCustomer);
        } else {
            $Customer->setInvoiceParent(null);
        }

        $this->entityManager->persist($Customer);
        $this->entityManager->flush();
    }
}
