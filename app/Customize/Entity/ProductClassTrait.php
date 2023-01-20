<?php

namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eccube\Annotation\EntityExtension;

/**
 * @EntityExtension("Eccube\Entity\ProductClass")
 */
trait ProductClassTrait
{
    /**
     * @var string|null
     *
     * @ORM\Column(name="bbj_price", type="decimal", precision=12, scale=2, nullable=true)
     */
    private $bbj_price;

    /**
     * @var BeerContainerCapacity
     *
     * @ORM\ManyToOne(targetEntity="Customize\Entity\BeerContainerCapacity")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="beer_container_capacity_id", referencedColumnName="id")
     * })
     */
    private $BeerContainerCapacity;

    /**
     * Set bbj_price.
     *
     * @param string|null $bbj_price
     *
     * @return self
     */
    public function setBbjPrice(?string $bbj_price): self
    {
        $this->bbj_price = $bbj_price;

        return $this;
    }

    /**
     * Get bbj_price.
     *
     * @return string|null
     */
    public function getBbjPrice(): ?string
    {
        return $this->bbj_price;
    }

    /**
     * Set BeerContainerCapacity.
     *
     * @param BeerContainerCapacity|null $BeerContainerCapacity
     *
     * @return self
     */
    public function setBeerContainerCapacity(?BeerContainerCapacity $BeerContainerCapacity): self
    {
        $this->BeerContainerCapacity = $BeerContainerCapacity;

        return $this;
    }

    /**
     * Get BeerContainerCapacity.
     *
     * @return BeerContainerCapacity|null
     */
    public function getBeerContainerCapacity(): ?BeerContainerCapacity
    {
        return $this->BeerContainerCapacity;
    }
}
