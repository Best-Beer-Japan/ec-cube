<?php

namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eccube\Annotation\EntityExtension;

/**
 * @EntityExtension("Eccube\Entity\ClassName")
 */
trait ClassNameTrait
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
     * @ORM\Column(name="original_id", type="integer", nullable=true, options={"unsigned":true})
     */
    private $original_id;

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
     * Set original_id.
     *
     * @param int|null $original_id
     *
     * @return self
     */
    public function setOriginalId(?int $original_id): self
    {
        $this->original_id = $original_id;

        return $this;
    }

    /**
     * Get original_id.
     *
     * @return int|null
     */
    public function getOriginalId(): ?int
    {
        return $this->original_id;
    }
}
