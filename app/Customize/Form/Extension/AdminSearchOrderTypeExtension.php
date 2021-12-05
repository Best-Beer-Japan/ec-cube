<?php

namespace Customize\Form\Extension;

use Eccube\Common\EccubeConfig;
use Eccube\Form\Type\Admin\SearchOrderType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
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
            ])
            ->add('customize_billing_date', ChoiceType::class, [
                'label' => 'admin.order.customize_billing_date',
                'placeholder' => 'admin.common.select__unspecified',
                'choices' => [
                    '未設定' => 1,
                ],
                'required' => false,
                'expanded' => false,
                'multiple' => false,
            ])
            ->add('order_customize_billing_date_start', DateType::class, [
                'label' => 'admin.order.order_customize_billing_date__start',
                'required' => false,
                'input' => 'datetime',
                'widget' => 'single_text',
                'format' => 'yyyy-MM-dd',
                'placeholder' => ['year' => '----', 'month' => '--', 'day' => '--'],
                'attr' => [
                    'class' => 'datetimepicker-input',
                    'data-target' => '#'.$this->getBlockPrefix().'_order_customize_billing_date_start',
                    'data-toggle' => 'datetimepicker',
                ],
            ])
            ->add('order_customize_billing_datetime_start', DateTimeType::class, [
                'label' => 'admin.order.order_customize_billing_date__start',
                'required' => false,
                'input' => 'datetime',
                'widget' => 'single_text',
                'format' => 'yyyy-MM',
                'attr' => [
                    'class' => 'datetimepicker-input-month',
                    'data-target' => '#'.$this->getBlockPrefix().'_order_customize_billing_datetime_start',
                    'data-toggle' => 'datetimepicker',
                ],
            ])
            ->add('order_customize_billing_date_end', DateType::class, [
                'label' => 'admin.order.order_customize_billing_date__start',
                'required' => false,
                'input' => 'datetime',
                'widget' => 'single_text',
                'format' => 'yyyy-MM-dd',
                'placeholder' => ['year' => '----', 'month' => '--', 'day' => '--'],
                'attr' => [
                    'class' => 'datetimepicker-input',
                    'data-target' => '#'.$this->getBlockPrefix().'_order_customize_billing_date_end',
                    'data-toggle' => 'datetimepicker',
                ],
            ])
            ->add('order_customize_billing_datetime_end', DateTimeType::class, [
                'label' => 'admin.order.order_customize_billing_date__start',
                'required' => false,
                'input' => 'datetime',
                'widget' => 'single_text',
                'format' => 'yyyy-MM',
                'attr' => [
                    'class' => 'datetimepicker-input-month',
                    'data-target' => '#'.$this->getBlockPrefix().'_order_customize_billing_datetime_end',
                    'data-toggle' => 'datetimepicker',
                ],
            ]);
    }

    /**
    * {@inheritdoc}
    */
    public function getExtendedType()
    {
        return SearchOrderType::class;
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'admin_search_order';
    }
}
