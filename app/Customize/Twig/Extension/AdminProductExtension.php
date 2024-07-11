<?php

namespace Customize\Twig\Extension;

use Customize\Repository\BeerContainerCapacityRepository;
use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

class AdminProductExtension extends AbstractExtension
{
    /**
     * @var BeerContainerCapacityRepository
     */
    protected $beerContainerCapacityRepository;

    /**
     * AdminProductExtension constructor.
     *
     * @param BeerContainerCapacityRepository $beerContainerCapacityRepository
     */
    public function __construct(
        BeerContainerCapacityRepository $beerContainerCapacityRepository
    ) {
        $this->beerContainerCapacityRepository = $beerContainerCapacityRepository;
    }

    public function getFunctions()
    {
        return [
            new TwigFunction('beer_container_capacity_as_json', [$this, 'getBeerContainerCapacity']),
        ];
    }

    public function getBeerContainerCapacity()
    {
        $BeerContainerCapacitys = $this->beerContainerCapacityRepository->findAll();

        $returnData = [];
        foreach ($BeerContainerCapacitys as $BeerContainerCapacity) {
            $returnData[$BeerContainerCapacity->getId()] = $BeerContainerCapacity->getCapacityMl();
        }

        return json_encode($returnData);
    }
}
