<?php

namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eccube\Annotation\EntityExtension;

/**
 * @EntityExtension("Eccube\Entity\CustomerAddress")
 */
trait CustomerAddressTrait
{
    /**
     * @var string|null
     *
     * @ORM\Column(name="customize_store_name", type="string", length=255, nullable=true)
     */
    private $customize_store_name;

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
}
