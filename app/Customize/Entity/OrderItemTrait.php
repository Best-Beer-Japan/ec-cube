<?php

namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eccube\Annotation\EntityExtension;

/**
 * @EntityExtension("Eccube\Entity\OrderItem")
 */
trait OrderItemTrait
{
    /**
     * @var int
     *
     * @ORM\Column(name="original_id", type="integer", options={"unsigned":true})
     */
    private $original_id;

    /**
     * Set original_id.
     *
     * @param int $original_id
     *
     * @return self
     */
    public function setOriginalId(int $original_id): self
    {
        $this->original_id = $original_id;

        return $this;
    }

    /**
     * Get original_id.
     *
     * @return int
     */
    public function getOriginalId(): int
    {
        return $this->original_id;
    }
}
