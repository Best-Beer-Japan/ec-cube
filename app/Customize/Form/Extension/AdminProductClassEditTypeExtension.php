<?php

namespace Customize\Form\Extension;

use Eccube\Form\Type\Admin\ProductClassEditType;
use Eccube\Form\Type\PriceType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints as Assert;

class AdminProductClassEditTypeExtension extends AbstractTypeExtension
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('bbj_price', PriceType::class, [
                'required' => true,
                'constraints' => [
                    new Assert\NotBlank(),
                ],
            ]);
    }

    /**
    * {@inheritdoc}
    */
    public function getExtendedType()
    {
        return ProductClassEditType::class;
    }
}
