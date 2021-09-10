<?php

namespace Customize\Form\Extension;

use Eccube\Common\EccubeConfig;
use Eccube\Entity\Customer;
use Eccube\Form\Type\Front\EntryType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Validator\Constraints as Assert;

class FrontEntityTypeExtension extends AbstractTypeExtension
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
                'required' => false,
                'constraints' => [
                    new Assert\Length([
                        'max' => $this->eccubeConfig['eccube_stext_len'],
                    ]),
                ],
            ]);

        $builder->addEventListener(FormEvents::PRE_SET_DATA, function (FormEvent $event) {
            $Customer = $event->getData();
            if ($Customer instanceof Customer && !$Customer->getId()) {
                $form = $event->getForm();

                $form->add('invoice_shipment_date_base_check', CheckboxType::class, [
                    'required' => true,
                    'label' => null,
                    'mapped' => false,
                    'constraints' => [
                        new Assert\NotBlank(),
                    ],
                ]);
            }
        });
    }

    /**
    * {@inheritdoc}
    */
    public function getExtendedType()
    {
        return EntryType::class;
    }
}
