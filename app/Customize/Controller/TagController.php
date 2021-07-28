<?php

namespace Customize\Controller;

use Eccube\Repository\TagRepository;
use Symfony\Component\Routing\Annotation\Route;

class TagController extends \Eccube\Controller\AbstractController
{
    /**
     * @var TagRepository
     */
    protected $tagRepository;

    /**
     * TagController constructor.
     *
     * @param TagRepository $tagRepository
     */
    public function __construct(
        TagRepository $tagRepository
    ) {
        $this->tagRepository = $tagRepository;
    }

    /**
     * タグ検索の追加/削除を行う.
     *
     * - 追加
     *      - タグ検索のタグ要素を追加する
     * - 削除
     *      - タグ検索のタグ要素を削除する
     *
     * @Route(
     *     path="/tag/search/{operation}/{tag_id}",
     *     name="customize_tag_search_item",
     *     methods={"PUT"},
     *     requirements={
     *          "operation": "add|remove|clear",
     *          "tag_id": "\d+"
     *     }
     * )
     */
    public function tagSearchItem($operation, $tag_id = null)
    {
        $session = $this->session;

        if ('clear' == $operation || null === $tag_id) {
            $session->set('eccube.front.customize.tag.search', []);

            return $this->redirectToRoute('product_list');
        }

        $Tag = $this->tagRepository->find($tag_id);

        if (null === $Tag) {
            return $this->redirectToRoute('product_list');
        }

        $tag_id_list = $session->get('eccube.front.customize.tag.search');

        if (null === $tag_id_list) {
            $tag_id_list = [];
        }

        // 明細の増減・削除
        switch ($operation) {
            case 'add':
                if (false !== array_search($tag_id, $tag_id_list)) {
                    return $this->redirectToRoute('product_list');
                }

                $tag_id_list[] = $tag_id;

                $session->set('eccube.front.customize.tag.search', $tag_id_list);
                break;
            case 'remove':
                $tag_id_list = array_diff($tag_id_list, [$tag_id]);
                $tag_id_list = array_values($tag_id_list);

                $session->set('eccube.front.customize.tag.search', $tag_id_list);
                break;
        }

        return $this->redirectToRoute('product_list');
    }
}
