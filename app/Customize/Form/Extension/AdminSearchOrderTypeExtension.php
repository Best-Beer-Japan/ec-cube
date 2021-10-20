<?php

namespace Customize\Form\Extension;

use Eccube\Common\EccubeConfig;
use Eccube\Form\Type\Admin\SearchOrderType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;

class AdminSearchOrderTypeExtension extends AbstractTypeExtension
{
    /**
     * @var EccubeConfig
     */
    protected $eccubeConfig;

    /**
     * AdminCustomerTypeExtension constructor.
     */
    public function __construct(EccubeConfig $eccubeConfig)
    {
        $this->eccubeConfig = $eccubeConfig;
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('customize_store_name', TextType::class, [
                'label' => 'admin.order.orderer_customize_store_name',
                'required' => false,
            ])
            ->add('Delivery', EntityType::class, [
                'required' => false,
                'label' => 'admin.order.delivery_provider',
                'class' => 'Eccube\Entity\Delivery',
                'choice_label' => 'name',
                'placeholder' => 'admin.common.select',
            ]);
    }

    /**
    * {@inheritdoc}
    */
    public function getExtendedType()
    {
        return SearchOrderType::class;
    }
}
