<?php

namespace Customize\Controller\Admin\Setting\Invoice;

use Customize\Form\Type\Admin\InvoiceMasterType;
use Customize\Repository\InvoiceRepository;
use Eccube\Controller\AbstractController;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Class ShopController
 */
class InviceController extends AbstractController
{
    /**
     * @var InvoiceRepository
     */
    protected $invoiceRepository;

    /**
     * ShopController constructor.
     *
     * @param InvoiceRepository $invoiceRepository
     */
    public function __construct(InvoiceRepository $invoiceRepository)
    {
        $this->invoiceRepository = $invoiceRepository;
    }

    /**
     * @Route("/%eccube_admin_route%/customize/setting/invoice", name="customize_admin_setting_invoice")
     * @Template("@admin/Setting/Invoice/customize_invoice_master.twig")
     *
     * @param Request $request
     *
     * @return array|\Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function index(Request $request)
    {
        $Invoice = $this->invoiceRepository->get();
        $builder = $this->formFactory
            ->createBuilder(InvoiceMasterType::class, $Invoice);

        $form = $builder->getForm();
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->entityManager->persist($Invoice);
            $this->entityManager->flush();

            $this->addSuccess('admin.common.save_complete', 'admin');

            return $this->redirectToRoute('customize_admin_setting_invoice');
        }

        return [
            'form' => $form->createView(),
        ];
    }
}
