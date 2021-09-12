<?php

namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eccube\Annotation\EntityExtension;

/**
 * @EntityExtension("Eccube\Entity\Order")
 */
trait OrderTrait
{
    /**
     * @var string|null
     *
     * @ORM\Column(name="customize_store_name", type="string", length=255, nullable=true)
     */
    private $customize_store_name;

    /**
     * @var int
     *
     * @ORM\Column(name="original_id", type="integer", nullable=true, options={"unsigned":true})
     */
    private $original_id;

    /**
     * Set customize_store_name.
     *
     * @param string|null $customize_store_name
     *
     * @return self
     */
    public function setCustomizeStoreName(?string $customize_store_name): self
    {
        $this->customize_store_name = $customize_store_name;

        return $this;
    }

    /**
     * Get customize_store_name.
     *
     * @return string|null
     */
    public function getCustomizeStoreName(): ?string
    {
        return $this->customize_store_name;
    }

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
