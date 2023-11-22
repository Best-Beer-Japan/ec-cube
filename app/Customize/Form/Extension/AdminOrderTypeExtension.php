<?php

namespace Customize\Form\Extension;

use Doctrine\ORM\EntityManagerInterface;
use Eccube\Common\EccubeConfig;
use Eccube\Entity\Customer;
use Eccube\Form\DataTransformer\EntityToIdTransformer;
use Eccube\Form\Type\Admin\OrderType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints as Assert;

class AdminOrderTypeExtension extends AbstractTypeExtension
{
    /**
     * @var EntityManagerInterface
     */
    protected $entityManager;

    /**
     * @var EccubeConfig
     */
    protected $eccubeConfig;

    /**
     * AdminCustomerTypeExtension constructor.
     */
    public function __construct(
        EntityManagerInterface $entityManager,
        EccubeConfig $eccubeConfig
    ) {
        $this->entityManager = $entityManager;
        $this->eccubeConfig = $eccubeConfig;
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
            ->add($builder->create('Customer', HiddenType::class, [
                'error_bubbling'=>false,
                'constraints' => [
                    new Assert\NotBlank(['message' => trans('customize.admin.order.deny_customer_is_invalid')]),
                ],
            ])->addModelTransformer(new EntityToIdTransformer($this->entityManager, Customer::class)));
    }

    /**
    * {@inheritdoc}
    */
    public function getExtendedType()
    {
        return OrderType::class;
    }
}
