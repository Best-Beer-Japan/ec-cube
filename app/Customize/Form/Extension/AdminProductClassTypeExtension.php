<?php

namespace Customize\Form\Extension;

use Eccube\Form\Type\Admin\ProductClassType;
use Eccube\Form\Type\PriceType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints as Assert;

class AdminProductClassTypeExtension extends AbstractTypeExtension
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('BeerContainerCapacity', EntityType::class, [
            'required' => true,
            'label' => 'admin.product.beer_container_capacity',
            'class' => 'Customize\Entity\BeerContainerCapacity',
            'placeholder' => 'admin.common.select',
            'constraints' => [
                new Assert\NotBlank(),
            ],
        ]);
        /*
            ->add('bbj_price', PriceType::class, [
                'required' => false,
            ]);
        */
    }

    /**
    * {@inheritdoc}
    */
    public function getExtendedType()
    {
        return ProductClassType::class;
    }
}
