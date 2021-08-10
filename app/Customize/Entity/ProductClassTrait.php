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
     * @var int
     *
     * @ORM\Column(name="brewery_id", type="integer", nullable=true, options={"unsigned":true})
     */
    private $brewery_id;

    /**
     * @var int
     *
     * @ORM\Column(name="original_product_class_id", type="integer", nullable=true, options={"unsigned":true})
     */
    private $original_product_class_id;

    /**
     * Set brewery_id.
     *
     * @param int|null $brewery_id
     *
     * @return self
     */
    public function setBreweryId(?int $brewery_id): self
    {
        $this->brewery_id = $brewery_id;

        return $this;
    }

    /**
     * Get bbj_payment_id.
     *
     * @return int|null
     */
    public function getBreweryId(): ?int
    {
        return $this->brewery_id;
    }

    /**
     * Set original_product_class_id.
     *
     * @param int|null $original_product_class_id
     *
     * @return self
     */
    public function setOriginalProductClassId(?int $original_product_class_id): self
    {
        $this->original_product_class_id = $original_product_class_id;

        return $this;
    }

    /**
     * Get original_product_class_id.
     *
     * @return int|null
     */
    public function getOriginalProductClassId(): ?int
    {
        return $this->original_product_class_id;
    }
}
