<?php

namespace Customize\Form\Extension;

use Customize\Entity\BeerContainer;
use Customize\Entity\ProductBeerContainer;
use Customize\Form\Type\Master\BeerStyleType;
use Customize\Form\Type\Master\BeerTypeType;
use Customize\Repository\BeerContainerRepository;
use Doctrine\ORM\EntityManagerInterface;
use Eccube\Form\Type\Admin\ProductType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormError;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Validator\Constraints as Assert;

class ProductTypePublishDateExtension extends AbstractTypeExtension
{
    /**
     * @var EntityManagerInterface
     */
    protected $entityManager;

    /**
     * @var BeerContainerRepository
     */
    protected $beerContainerRepository;

    public function __construct(
        EntityManagerInterface $entityManager,
        BeerContainerRepository $beerContainerRepository
    ) {
        $this->entityManager = $entityManager;
        $this->beerContainerRepository = $beerContainerRepository;
    }

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
            ->add('BeerContainer', ChoiceType::class, [
                'choice_label' => 'Name',
                'multiple' => true,
                'mapped' => false,
                'expanded' => true,
                'choices' => $this->beerContainerRepository->findAll(),
                'choice_value' => function (?BeerContainer $BeerContainer) {
                    return $BeerContainer ? $BeerContainer->getId() : null;
                },
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

        $builder->addEventListener(FormEvents::POST_SET_DATA, function (FormEvent $event) {
            $form = $event->getForm();
            $Product = $event->getData();

            $BeerContainers = [];
            $ProductBeerContainers = $Product->getProductBeerContainers();
            foreach ($ProductBeerContainers as $ProductBeerContainer) {
                $BeerContainers[] = $ProductBeerContainer->getBeerContainer();
            }
            $form['BeerContainer']->setData($BeerContainers);
        });

        $builder->addEventListener(FormEvents::POST_SUBMIT, function (FormEvent $event) {
            $form = $event->getForm();
            $Product = $event->getData();

            $BeerContainers = $form->get('BeerContainer')->getData();

/*
            if (0 == count($BeerContainers)) {
                $form['BeerContainer']->addError(new FormError(trans('admin.common.file_select_empty')));

                return;
            }
*/

            // 容器の情報を一度リセット
            foreach ($Product->getProductBeerContainers() as $ProductBeerContainer) {
                $Product->removeProductBeerContainer($ProductBeerContainer);
                $this->entityManager->remove($ProductBeerContainer);
            }
            $this->entityManager->flush();

            // 容器の情報を登録
            foreach ($BeerContainers as $BeerContainer) {
                $ProductBeerContainer = new ProductBeerContainer();
                $ProductBeerContainer->setProductId($Product->getId())
                    ->setBeerContainerId($BeerContainer->getId())
                    ->setProduct($Product)
                    ->setBeerContainer($BeerContainer);

                $this->entityManager->persist($ProductBeerContainer);
                $Product->addProductBeerContainer($ProductBeerContainer);
            }
        });
    }

    /**
    * {@inheritdoc}
    */
    public function getExtendedType()
    {
        return ProductType::class;
    }
}
