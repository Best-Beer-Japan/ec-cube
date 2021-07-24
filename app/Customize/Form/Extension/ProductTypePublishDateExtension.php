<?php

namespace Customize\Form\Extension;

use Customize\Form\Type\Master\BeerStyleType;
use Customize\Form\Type\Master\BeerTypeType;
use Eccube\Form\Type\Admin\ProductType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints as Assert;

class ProductTypePublishDateExtension extends AbstractTypeExtension
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('publish_date', DateTimeType::class, [
                'label' => '公開予定日時',
                'required' => false,
                'years' => range(date('Y'), date('Y') + 10),
                'placeholder' => [
                    'year' => '----',
                    'month' => '--',
                    'day' => '--',
                    'hour' => '--',
                    'minute' => '--',
                ],
                'eccube_form_options' => [
                    'auto_render' => true,
                ],
            ])
            // 右ブロック
            ->add('beer_type', BeerTypeType::class, [
                'constraints' => [
                    // new Assert\NotBlank(),
                ],
            ])
            ->add('beer_style', BeerStyleType::class, [
                'constraints' => [
                    // new Assert\NotBlank(),
                ],
            ])
            ->add('alcohol_percentage', NumberType::class, [
                'attr' => [
                    'min' => 0,
                    'max' => 999.99,
                    'step' => '.2',
                ],
                'constraints' => [
                    new Assert\Range([
                        'min' => 0,
                        'max' => 999.99,
                    ]),
                    new Assert\Regex([
                        'pattern' => "/^\d+(\.\d{1,2})?$/u",
                        //'pattern' => "/^[0-9]{1,3}(\.[0-9]{1,2})?$/u",
                        'message' => 'customize.form_error.float_scale2',
                    ]),
                ],
            ]);
    }

    /**
    * {@inheritdoc}
    */
    public function getExtendedType()
    {
        return ProductType::class;
    }
}
