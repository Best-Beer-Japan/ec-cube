<?php

namespace Customize\Form\Type\Admin;

use Carbon\Carbon;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;

class InvoiceBillingType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $dt = Carbon::now();

        $years = range(2020, $dt->year);
        $months = range(1, 12);

        $builder
            ->add('year', ChoiceType::class, [
                'label' => 'admin.customer.birth_month',
                'placeholder' => '--',
                'required' => false,
                'choices' => array_combine($years, $years),
                'mapped' => false,
            ])
            ->add('month', ChoiceType::class, [
                'label' => 'admin.customer.birth_month',
                'placeholder' => '--',
                'required' => false,
                'choices' => array_combine($months, $months),
                'mapped' => false,
            ]);

    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'admin_aggregate';
    }
}
