<?php

namespace Customize\Form\Type\Admin;

use Eccube\Common\EccubeConfig;
use Eccube\Form\Type\AddressType;
use Eccube\Form\Type\PhoneNumberType;
use Eccube\Form\Type\PostalType;
use Eccube\Form\Validator\Email;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Class InvoiceMasterType
 */
class InvoiceMasterType extends AbstractType
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
        $builder
            ->add('logo_image_delete', CheckboxType::class, [
                'label' => 'common.delete',
                'required' => false,
                'mapped' => false,
            ])
            ->add('imprint_image_delete', CheckboxType::class, [
                'label' => 'common.delete',
                'required' => false,
                'mapped' => false,
            ])
            ->add('logo_image_file', FileType::class, [
                'label' => false,
                'mapped' => false,
                'required' => false,
                'constraints' => [
                    new Assert\File([
                        'maxSize' => $this->eccubeConfig['invoice_image_max_size'].'k',
                    ]),
                    new Assert\File([
                        'mimeTypes' => ['image/gif', 'image/png', 'image/jpeg'],
                        'mimeTypesMessage' => trans('admin.store.template.invalid_upload_file'),
                    ]),
                ],
            ])
            ->add('imprint_image_file', FileType::class, [
                'label' => false,
                'mapped' => false,
                'required' => false,
                'constraints' => [
                    new Assert\File([
                        'maxSize' => $this->eccubeConfig['invoice_image_max_size'].'k',
                    ]),
                    new Assert\File([
                        'mimeTypes' => ['image/gif', 'image/png', 'image/jpeg'],
                        'mimeTypesMessage' => trans('admin.store.template.invalid_upload_file'),
                    ]),
                ],
            ])
            ->add('company_name', TextType::class, [
                'required' => true,
                'constraints' => [
                    new Assert\NotBlank(),
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                ],
            ])
            ->add('brewery_name', TextType::class, [
                'required' => false,
                'constraints' => [
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                ],
            ])
            ->add('postal_code', PostalType::class, [
                'required' => true,
            ])
            ->add('address', AddressType::class, [
                'required' => true,
            ])
            ->add('phone_number', PhoneNumberType::class, [
                'required' => true,
            ])
            ->add('email', EmailType::class, [
                'required' => true,
                'constraints' => [
                    new Assert\NotBlank(),
                    new Email(['strict' => $this->eccubeConfig['eccube_rfc_email_check']]),
                ],
            ])
            ->add('person_in_charge_name', TextType::class, [
                'required' => true,
                'constraints' => [
                    new Assert\NotBlank(),
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                ],
            ])
            ->add('financial_institution_name', TextType::class, [
                'required' => true,
                'constraints' => [
                    new Assert\NotBlank(),
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                ],
            ])
            ->add('financial_institution_code', TextType::class, [
                'required' => false,
                'constraints' => [
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                    new Assert\Regex([
                        'pattern' => "/^\d{4}$/u",
                        'message' => 'customize.form_error.invoice.financial_institution_code.invalid',
                    ]),
                ],
            ])
            ->add('branch_name', TextType::class, [
                'required' => true,
                'constraints' => [
                    new Assert\NotBlank(),
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                ],
            ])
            ->add('branch_code', TextType::class, [
                'required' => false,
                'constraints' => [
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                    new Assert\Regex([
                        'pattern' => "/^\d{3}$/u",
                        'message' => 'customize.form_error.invoice.branch_code.invalid',
                    ]),
                ],
            ])
            ->add('account_type', ChoiceType::class, [
                'choices' => [
                    'customize.admin.setting.invice.invoice.account_type.001' => 1,
                    'customize.admin.setting.invice.invoice.account_type.002' => 2,
                ],
                'expanded' => true,
                'multiple' => false,
                'constraints' => [
                    new Assert\NotBlank(),
                ],
            ])
            ->add('account_number', TextType::class, [
                'required' => true,
                'constraints' => [
                    new Assert\NotBlank(),
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                    new Assert\Regex([
                        'pattern' => "/^\d+$/u",
                        'message' => 'form_error.numeric_only',
                    ]),
                ],
            ])
            ->add('account_holder_name', TextType::class, [
                'required' => true,
                'constraints' => [
                    new Assert\NotBlank(),
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                ],
            ])
            ->add('registration_number', TextType::class, [
                'required' => false,
                'constraints' => [
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                ],
            ])
            ->add('business_registration', ChoiceType::class, [
                'label' => false,
                'choices' => [
                    'customize.admin.setting.invice.invoice.business_registration.001' => false,
                    'customize.admin.setting.invice.invoice.business_registration.002' => true,
                ],
                'expanded' => true,
                'multiple' => false,
                'empty_data' => false,
            ])
            ->add('business_registration_date', TextType::class, [
                'required' => false,
                'constraints' => [
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                ],
            ])
            ->add('payment_deadline_month', ChoiceType::class, [
                'placeholder' => 'admin.common.select',
                'choices' => [
                    'customize.admin.setting.invice.invoice.payment_deadline_month.001' => 1,
                    'customize.admin.setting.invice.invoice.payment_deadline_month.002' => 2,
                    'customize.admin.setting.invice.invoice.payment_deadline_month.003' => 3,
                ],
                'expanded' => false,
                'multiple' => false,
                'constraints' => [
                    new Assert\NotBlank(),
                ],
            ])
        ;

        for ($i = 1; $i < 32; $i++) {
            $days[sprintf('%02d', $i).'日'] = $i;
        }
        $days[trans('customize.admin.setting.invice.invoice.payment_deadline_day.032')] = $this->eccubeConfig['invoice_payment_deadline_day_032'];

        $builder
            ->add('payment_deadline_day', ChoiceType::class, [
                'placeholder' => 'admin.common.select',
                'choices' => $days,
                'expanded' => false,
                'multiple' => false,
                'constraints' => [
                    new Assert\NotBlank(),
                ],
            ]);
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => \Customize\Entity\Invoice::class,
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'invoice_master';
    }
}
