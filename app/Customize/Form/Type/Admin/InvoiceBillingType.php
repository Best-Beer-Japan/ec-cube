<?php

namespace Customize\Form\Type\Admin;

use Carbon\Carbon;
use Eccube\Common\EccubeConfig;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints as Assert;

class InvoiceBillingType extends AbstractType
{
    /**
     * @var EccubeConfig
     */
    protected $eccubeConfig;

    /**
     * ShopMasterType constructor.
     *
     * @param EccubeConfig $eccubeConfig
     */
    public function __construct(EccubeConfig $eccubeConfig)
    {
        $this->eccubeConfig = $eccubeConfig;
    }

    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $dt = Carbon::now();

        $years = range(2020, $dt->year + 1);
        $months = range(1, 12);

        $builder
            // 会員ID
            ->add('multi', TextType::class, [
                'label' => 'customize.admin.setting.invice.billing.multi_search_label',
                'required' => false,
                'constraints' => [
                    new Assert\Length(['max' => $this->eccubeConfig['eccube_stext_len']]),
                ],
            ])
            ->add('year', ChoiceType::class, [
                'label' => 'admin.customer.birth_month',
                'placeholder' => '--',
                'required' => true,
                'choices' => array_combine($years, $years),
                'mapped' => false,
            ])
            ->add('month', ChoiceType::class, [
                'label' => 'admin.customer.birth_month',
                'placeholder' => '--',
                'required' => true,
                'choices' => array_combine($months, $months),
                'mapped' => false,
            ]);

    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'customize_admin_invoice_billing';
    }
}
