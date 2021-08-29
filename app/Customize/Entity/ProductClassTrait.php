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
     * Set bbj_price.
     *
     * @param string|null $bbj_price
     *
     * @return self
     */
    public function setBbjPrice(?string $bbj_price)
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
}
