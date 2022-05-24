<?php

namespace Customize\Form\Extension;

use Eccube\Common\EccubeConfig;
use Eccube\Entity\Customer;
use Eccube\Form\Type\Admin\CustomerType;
use Eccube\Repository\CustomerRepository;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormError;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Validator\Constraints as Assert;

class AdminCustomerTypeExtension extends AbstractTypeExtension
{
    /**
     * @var EccubeConfig
     */
    protected $eccubeConfig;

    /**
     * @var CustomerRepository
     */
    protected $customerRepository;

    /**
     * AdminCustomerTypeExtension constructor.
     */
    public function __construct(
        EccubeConfig $eccubeConfig,
        CustomerRepository $customerRepository
    ) {
        $this->eccubeConfig = $eccubeConfig;
        $this->customerRepository = $customerRepository;
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('customize_store_name', TextType::class, [
                'required' => false,
                'constraints' => [
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                ],
            ])
            ->add('customize_account_name', TextType::class, [
                'required' => false,
                'constraints' => [
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                ],
            ]);

        $builder->addEventListener(FormEvents::PRE_SET_DATA, function (FormEvent $event) {
            $Customer = $event->getData();

            if ($Customer instanceof Customer && null !== $Customer->getId()) {
                $form = $event->getForm();

                $form->add('customize_relation_invoice_parent_key', TextType::class, [
                    'mapped' => false,
                    'constraints' => [
                        new Assert\Length([
                            'max' => $this->eccubeConfig['eccube_stext_len'],
                        ]),
                    ],
                ]);
            }
        });

        $builder->addEventListener(FormEvents::POST_SET_DATA, function (FormEvent $event) {
            $form = $event->getForm();
            $Customer = $event->getData();

            if ($Customer instanceof Customer && null !== $Customer->getId()) {
                $ParentCustomer = $Customer->getInvoiceParent();
                if (null !== $ParentCustomer) {
                    $form['customize_relation_invoice_parent_key']->setData($ParentCustomer->getCustomizeInvoiceParentKey());
                }
            }
        });

        $builder->addEventListener(FormEvents::POST_SUBMIT, function (FormEvent $event) {
            $form = $event->getForm();
            $Customer = $event->getData();

            if (null !== $form['customize_relation_invoice_parent_key']->getData()) {
                // 親コードが入力されていたらチェック
                if (null !== $Customer->getCustomizeInvoiceParentKey() && $form['customize_relation_invoice_parent_key']->getData() == $Customer->getCustomizeInvoiceParentKey()) {
                    // 自身の親コードは設定できない。
                    $form['customize_relation_invoice_parent_key']->addError(new FormError(trans('customize.common.self_eq_invoice_parent_key')));
                } else {
                    if (true === $Customer->hasInvoiceChildren()) {
                        // 自身が親会員だったら、親コードの設定できない。（親会員の場合子会員になれない）
                        $form['customize_relation_invoice_parent_key']->addError(new FormError(trans('customize.common.not_invoice_children')));
                    }

                    $ParentKeyCustomer = $this->customerRepository->findOneBy(['customize_invoice_parent_key' => $form['customize_relation_invoice_parent_key']->getData()]);
                    if (null === $ParentKeyCustomer) {
                        // 存在しない親コードの設定はできない
                        $form['customize_relation_invoice_parent_key']->addError(new FormError(trans('customize.common.none_invoice_parent_key')));
                    } elseif (null !== $ParentKeyCustomer->getInvoiceParent()) {
                        // 親候補先が子会員だったら、親コードの設定できない。
                        $form['customize_relation_invoice_parent_key']->addError(new FormError(trans('customize.common.invoice_parent_eq_children')));
                    }
                }
            }
        });
    }

    /**
    * {@inheritdoc}
    */
    public function getExtendedType()
    {
        return CustomerType::class;
    }
}
