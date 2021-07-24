<?php

namespace Customize\Entity;

use Customize\Entity\Master\BeerStyle;
use Customize\Entity\Master\BeerType;
use Doctrine\ORM\Mapping as ORM;
use Eccube\Annotation\EntityExtension;

/**
 * @EntityExtension("Eccube\Entity\Product")
 */
trait ProductTrait
{
    /**
     * @ORM\Column(type="datetimetz", nullable=true)
     */
    private $publish_date;

    /**
     * @var BeerType
     *
     * @ORM\ManyToOne(targetEntity="Customize\Entity\Master\BeerType")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="beer_type_id", referencedColumnName="id")
     * })
     */
    private $BeerType;

    /**
     * @var BeerStyle
     *
     * @ORM\ManyToOne(targetEntity="Customize\Entity\Master\BeerStyle")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="beer_style_id", referencedColumnName="id")
     * })
     */
    private $BeerStyle;

    /**
     * @var string|null
     *
     * @ORM\Column(name="alcohol_percentage ", type="decimal", precision=5, scale=2, nullable=true)
     */
    private $alcohol_percentage;

    public function getPublishDate(): ?\DateTimeInterface
    {
        return $this->publish_date;
    }

    public function setPublishDate(?\DateTimeInterface $publish_date): self
    {
        $this->publish_date = $publish_date;

        return $this;
    }

    /**
     * Set alcohol_percentage.
     *
     * @param string|null $alcohol_percentage
     *
     * @return self
     */
    public function setAlcoholPercentage(?string $alcohol_percentage): self
    {
        $this->alcohol_percentage = $alcohol_percentage;

        return $this;
    }

    /**
     * Get alcohol_percentage.
     *
     * @return string|null
     */
    public function getAlcoholPercentage(): ?string
    {
        return $this->alcohol_percentage;
    }

    /**
     * Set BeerType.
     *
     * @param BeerType|null $BeerType
     *
     * @return self
     */
    public function setBeerType(?BeerType $BeerType): self
    {
        $this->BeerType = $BeerType;

        return $this;
    }

    /**
     * Get BeerType.
     *
     * @return BeerType|null
     */
    public function getBeerType(): ?BeerType
    {
        return $this->BeerType;
    }

    /**
     * Set BeerStyle.
     *
     * @param BeerStyle|null $BeerStyle
     *
     * @return self
     */
    public function setBeerStyle(?BeerStyle $BeerStyle): self
    {
        $this->BeerStyle = $BeerStyle;

        return $this;
    }

    /**
     * Get BeerType.
     *
     * @return BeerStyle|null
     */
    public function getBeerStyle(): ?BeerStyle
    {
        return $this->BeerStyle;
    }
}
