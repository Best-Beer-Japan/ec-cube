<?php

namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eccube\Annotation\EntityExtension;
use Eccube\Entity\Customer;

/**
 * @EntityExtension("Eccube\Entity\Customer")
 */
trait CustomerTrait
{
    public function hasInvoiceChildren()
    {
        $InvoiceChildren = $this->getInvoiceChildren();

        if (count($InvoiceChildren) === 0) {
            return false;
        }

        return true;
    }

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
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\OneToMany(targetEntity="Eccube\Entity\Customer", mappedBy="InvoiceParent")
     */
    private $InvoiceChildren;

    /**
     * @var \Eccube\Entity\Customer
     *
     * @ORM\ManyToOne(targetEntity="Eccube\Entity\Customer", inversedBy="Children")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="invoice_parent_customer_id", referencedColumnName="id")
     * })
     */
    private $InvoiceParent;

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

    /**
     * Add child.
     *
     * @param Customer $child
     *
     * @return self
     */
    public function addInvoiceChildren(Customer $child): self
    {
        if (null === $this->InvoiceChildren) {
            $this->InvoiceChildren = new \Doctrine\Common\Collections\ArrayCollection();
        }

        $this->InvoiceChildren[] = $child;

        return $this;
    }

    /**
     * Remove child.
     *
     * @param Customer $child
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeInvoiceChildren(Customer $child): bool
    {
        if (null === $this->InvoiceChildren) {
            $this->InvoiceChildren = new \Doctrine\Common\Collections\ArrayCollection();
        }

        return $this->InvoiceChildren->removeElement($child);
    }

    /**
     * Get children.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getInvoiceChildren(): \Doctrine\Common\Collections\Collection
    {
        if (null === $this->InvoiceChildren) {
            $this->InvoiceChildren = new \Doctrine\Common\Collections\ArrayCollection();
        }

        return $this->InvoiceChildren;
    }

    /**
     * Set InvoiceParent.
     *
     * @param Customer|null $parent
     *
     * @return self
     */
    public function setInvoiceParent(?Customer $parent): self
    {
        $this->InvoiceParent = $parent;

        return $this;
    }

    /**
     * Get InvoiceParent.
     *
     * @return Customer|null
     */
    public function getInvoiceParent(): ?Customer
    {
        return $this->InvoiceParent;
    }
}
