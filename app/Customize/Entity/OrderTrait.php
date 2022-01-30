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
     * @var string|null
     *
     * @ORM\Column(name="customize_order_no_section", type="string", length=255, nullable=true)
     */
    private $customize_order_no_section;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="customize_billing_month_date", type="datetimetz", nullable=true)
     */
    private $customize_billing_month_date;

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

    /**
     * Set customize_order_no_section.
     *
     * @param string|null $customize_order_no_section
     *
     * @return self
     */
    public function setCustomizeOrderNoSection(?string $customize_order_no_section): self
    {
        $this->customize_order_no_section = $customize_order_no_section;

        return $this;
    }

    /**
     * Get customize_order_no_section.
     *
     * @return string|null
     */
    public function getCustomizeOrderNoSection(): ?string
    {
        return $this->customize_order_no_section;
    }

    /**
     * Set customize_billing_month_date.
     *
     * @param \DateTime|null $customize_billing_month_date
     *
     * @return self
     */
    public function setCustomizeBillingMonthDate(?\DateTime $customize_billing_month_date): self
    {
        $this->customize_billing_month_date = $customize_billing_month_date;

        return $this;
    }

    /**
     * Get customize_billing_month_date.
     *
     * @return \DateTime|null
     */
    public function getCustomizeBillingMonthDate(): ?\DateTime
    {
        return $this->customize_billing_month_date;
    }
}
