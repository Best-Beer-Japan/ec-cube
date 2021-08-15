<?php

namespace Customize\Controller\Block;

use Eccube\Common\EccubeConfig;
use Eccube\Controller\AbstractController;
use Eccube\Repository\TagRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Routing\Annotation\Route;

class CorpseTagBreweryController extends AbstractController
{
    /**
     * @var EccubeConfig
     */
    protected $eccubeConfig;

    /**
     * @var TagRepository
     */
    protected $tagRepository;

    /**
     * CorpseTagStyleController constructor.
     *
     * @param EccubeConfig $eccubeConfig
     * @param TagRepository $tagRepository
     */
    public function __construct(
        EccubeConfig $eccubeConfig,
        TagRepository $tagRepository
    ) {
        $this->eccubeConfig = $eccubeConfig;
        $this->tagRepository = $tagRepository;
    }

    /**
     * @Route("/block/corpse_tag_brewery", name="block_corpse_tag_brewery")
     * @Template("Block/corpse_tag_brewery.twig")
     */
    public function index()
    {
        $qb = $this->tagRepository
            ->createQueryBuilder('t')
            ->where('t.group_no = :group_no')
            ->orderBy('t.sort_no', 'DESC')
            ->setParameter('group_no', $this->eccubeConfig['corpse_tag_brewery_group_no']);

        $Tags = $qb
            ->getQuery()
            ->getResult();

        return [
            'Tags' => $Tags,
        ];
    }
}
