<?php

namespace Customize\Controller\Admin\Customer;

use Customize\Form\Type\Admin\AgreementType;
use Eccube\Controller\AbstractController;
use Customize\Repository\AgreementRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Twig_Environment;

/**
 * Class AgreementController
 */
class AgreementController extends AbstractController
{
    /**
     * @var AgreementRepository
     */
    protected $agreementRepository;

    /**
     * AgreementController constructor.
     *
     * @param AgreementRepository $agreementRepository
     */
    public function __construct(AgreementRepository $agreementRepository)
    {
        $this->agreementRepository = $agreementRepository;
    }

    /**
     * @Route("/%eccube_admin_route%/customize/customer/agreement", name="customize_admin_customer_agreement")
     * @Template("@admin/Customer/agreement.twig")
     *
     * @param Request $request
     *
     * @return array|\Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function index(Request $request)
    {
        $BaseInfo = $this->agreementRepository->get();
        $builder = $this->formFactory
            ->createBuilder(AgreementType::class, $BaseInfo);

        $form = $builder->getForm();
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->entityManager->persist($BaseInfo);
            $this->entityManager->flush();

            $this->addSuccess('admin.common.save_complete', 'admin');

            return $this->redirectToRoute('customize_admin_customer_agreement');
        }

        return [
            'form' => $form->createView(),
        ];
    }
}
