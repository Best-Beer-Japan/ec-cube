<?php

namespace Customize\Form\Extension;

use Eccube\Form\Type\SearchProductType;
use Eccube\Repository\TagRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\FormBuilderInterface;

class FrontSearchProductTypeExtension extends AbstractTypeExtension
{
    /**
     * @var TagRepository
     */
    protected $tagRepository;

    /**
     * FrontEvent constructor.
     */
    public function __construct(
        TagRepository $tagRepository
    ) {
        $this->tagRepository = $tagRepository;
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $Tags = $this->tagRepository->getList();

        $builder
            ->add('tag_ids', EntityType::class, [
                'class' => 'Eccube\Entity\Tag',
                'choices' => $Tags,
                'required' => false,
                'multiple' => true,
                'expanded' => true,
            ]);
    }

    /**
     * {@inheritdoc}
     */
    public function getExtendedType()
    {
        return SearchProductType::class;
    }
}
