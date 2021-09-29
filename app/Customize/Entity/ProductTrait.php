<?php

namespace Customize\Entity;

use Customize\Entity\Master\BeerStyle;
use Customize\Entity\Master\BeerType;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Eccube\Annotation\EntityExtension;
use Eccube\Entity\Tag;

/**
 * @EntityExtension("Eccube\Entity\Product")
 */
trait ProductTrait
{
    /**
     * Get Tag
     * フロント側タグsort_no順の配列を作成する
     * @param array $groups 表示するグループナンバー
     *
     * @return array
     */
    public function getCorpseTags(array $groups = []): array
    {
        $tags = [];

        foreach ($this->getProductTag() as $productTag) {
            $Tag = $productTag->getTag();

            if (in_array($Tag->getGroupNo(), $groups)) {
                $tags[] = $Tag;
            }
        }

        usort($tags, function (Tag $tag1, Tag $tag2) {
            return $tag1->getSortNo() < $tag2->getSortNo();
        });

        return $tags;
    }

    /**
     * @var int
     *
     * @ORM\Column(name="original_product_id", type="integer", nullable=true, options={"unsigned":true})
     */
    private $original_product_id;

    /**
     * @var string|null
     *
     * @ORM\Column(name="alcohol_percentage ", type="decimal", precision=5, scale=2, nullable=true)
     */
    private $alcohol_percentage;

    /**
     * @ORM\Column(type="datetimetz", nullable=true)
     */
    private $publish_date;

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
     * @var BeerType
     *
     * @ORM\ManyToOne(targetEntity="Customize\Entity\Master\BeerType")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="beer_type_id", referencedColumnName="id")
     * })
     */
    private $BeerType;

    /**
     * @var BeerType
     *
     * @ORM\ManyToOne(targetEntity="Customize\Entity\Brewery")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="brewery_id", referencedColumnName="id")
     * })
     */
    private $Brewery;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\OneToMany(targetEntity="Customize\Entity\ProductBeerContainer", mappedBy="Product", cascade={"persist","remove"})
     */
    private $ProductBeerContainers;

    /**
     * Set original_product_id.
     *
     * @param int|null $original_product_id
     *
     * @return self
     */
    public function setOriginalProductId(?int $original_product_id): self
    {
        $this->original_product_id = $original_product_id;

        return $this;
    }

    /**
     * Get original_product_id.
     *
     * @return int|null
     */
    public function getOriginalProductId(): ?int
    {
        return $this->original_product_id;
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
     * Get publish_date.
     *
     * @return \DateTimeInterface|null
     */
    public function getPublishDate(): ?\DateTimeInterface
    {
        return $this->publish_date;
    }

    /**
     * Set publish_date.
     *
     * @param \DateTimeInterface|null $publish_date
     *
     * @return self
     */
    public function setPublishDate(?\DateTimeInterface $publish_date): self
    {
        $this->publish_date = $publish_date;

        return $this;
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
     * Set Brewery.
     *
     * @param Brewery|null $Brewery
     *
     * @return self
     */
    public function setBrewery(?Brewery $Brewery): self
    {
        $this->Brewery = $Brewery;

        return $this;
    }

    /**
     * Get Brewery.
     *
     * @return Brewery|null
     */
    public function getBrewery(): ?Brewery
    {
        return $this->Brewery;
    }

    /**
     * Add ProductBeerContainer.
     *
     * @param ProductBeerContainer $ProductBeerContainer
     *
     * @return self
     */
    public function addProductBeerContainer(ProductBeerContainer $ProductBeerContainer): self
    {
        if (is_null($this->ProductBeerContainers)) {
            $this->ProductBeerContainers = new \Doctrine\Common\Collections\ArrayCollection();
        }

        $this->ProductBeerContainers[] = $ProductBeerContainer;

        return $this;
    }

    /**
     * Remove ProductBeerContainer.
     *
     * @param ProductBeerContainer $ProductBeerContainer
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeProductBeerContainer(ProductBeerContainer $ProductBeerContainer): bool
    {
        if (is_null($this->ProductBeerContainers)) {
            $this->ProductBeerContainers = new \Doctrine\Common\Collections\ArrayCollection();
        }

        return $this->ProductBeerContainers->removeElement($ProductBeerContainer);
    }

    /**
     * Get ProductBeerContainers.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProductBeerContainers(): Collection
    {
        if (is_null($this->ProductBeerContainers)) {
            $this->ProductBeerContainers = new \Doctrine\Common\Collections\ArrayCollection();
        }

        return $this->ProductBeerContainers;
    }
}
