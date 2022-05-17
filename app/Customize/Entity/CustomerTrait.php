<?php

namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eccube\Annotation\EntityExtension;

/**
 * @EntityExtension("Eccube\Entity\Customer")
 */
trait CustomerTrait
{
    /**
     * @var string|null
     *
     * @ORM\Column(name="customize_store_name", type="string", length=255, nullable=true)
     */
    private $customize_store_name;

    /**
     * @var string|null
     *
     * @ORM\Column(name="customize_account_name", type="string", length=255, nullable=true)
     */
    private $customize_account_name;

    /**
     * @var string|null
     *
     * @ORM\Column(name="customize_invoice_parent_key", type="string", length=255, nullable=true)
     */
    private $customize_invoice_parent_key;

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
     * Set customize_account_name.
     *
     * @param string|null $customize_account_name
     *
     * @return self
     */
    public function setCustomizeAccountName(?string $customize_account_name): self
    {
        $this->customize_account_name = $customize_account_name;

        return $this;
    }

    /**
     * Get customize_account_name.
     *
     * @return string|null
     */
    public function getCustomizeAccountName(): ?string
    {
        return $this->customize_account_name;
    }

    /**
     * Set customize_invoice_parent_key.
     *
     * @param string|null $customize_invoice_parent_key
     *
     * @return self
     */
    public function setCustomizeInvoiceParentKey(?string $customize_invoice_parent_key): self
    {
        $this->customize_invoice_parent_key = $customize_invoice_parent_key;

        return $this;
    }

    /**
     * Get customize_invoice_parent_key.
     *
     * @return string|null
     */
    public function getCustomizeInvoiceParentKey(): ?string
    {
        return $this->customize_invoice_parent_key;
    }
}
