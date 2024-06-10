<?php

namespace Customize\Form\Extension;

use Doctrine\ORM\EntityRepository;
use Eccube\Form\Type\Admin\ProductClassEditType;
use Eccube\Form\Type\PriceType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormError;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class AdminProductClassEditTypeExtension extends AbstractTypeExtension
{
    /**
     * @var ValidatorInterface
     */
    protected $validator;

    /**
     * ProductClassEditType constructor.
     *
     * @param ValidatorInterface $validator
     */
    public function __construct(
        ValidatorInterface $validator
    ) {
        $this->validator = $validator;
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('BeerContainerCapacity', EntityType::class, [
            'required' => false,
            'label' => 'admin.product.beer_container_capacity',
            'class' => 'Customize\Entity\BeerContainerCapacity',
            'placeholder' => 'admin.common.select',
            'query_builder' => function (EntityRepository $er) {
                return $er
                    ->createQueryBuilder('dt')
                    ->orderBy('dt.sort_no', 'ASC');
            },
        ])
            ->add('beer_container_capacity_other_ml', NumberType::class, [
                'required' => false,
                'grouping' => true,
            ]);
        /*
            ->add('bbj_price', PriceType::class, [
                'required' => false,
            ]);
        */

        $builder->addEventListener(FormEvents::POST_SUBMIT, function (FormEvent $event) {
            $form = $event->getForm();
            $data = $form->getData();

            if (!$form['checked']->getData()) {
                // チェックがついていない場合はバリデーションしない.
                return;
            }

            // 販売種別
            $errors = $this->validator->validate($data['BeerContainerCapacity'], [
                new Assert\NotBlank(),
            ]);
            if ($errors->count() != 0) {
                $form['BeerContainerCapacity']->addError(new FormError(trans('admin.common.file_select_empty')));
            }

            // その他容量の樽・その他容量の瓶・その他容量の缶 / ID[16・17・18]
            if (null !== $data['BeerContainerCapacity'] && false !== array_search($data['BeerContainerCapacity']->getId(), [16,17,18])) {
                $errors = $this->validator->validate($data['beer_container_capacity_other_ml'], [
                    new Assert\NotBlank(),
                ]);

                if ($errors->count() != 0) {
                    $form['beer_container_capacity_other_ml']->addError(new FormError($errors[0]->getMessage()));
                }
            }
        });
    }

    /**
    * {@inheritdoc}
    */
    public function getExtendedType()
    {
        return ProductClassEditType::class;
    }
}
