<?php

namespace Customize\Entity;

use Customize\Entity\BeerContainer;
use Doctrine\ORM\Mapping as ORM;
use Eccube\Entity\Product;

if (!class_exists('\Customize\Entity\ProductBeerContainer')) {
    /**
     * ProductBeerContainer
     *
     * @ORM\Table(name="customize_dtb_product_beer_container")
     * @ORM\InheritanceType("SINGLE_TABLE")
     * @ORM\DiscriminatorColumn(name="discriminator_type", type="string", length=255)
     * @ORM\HasLifecycleCallbacks()
     * @ORM\Entity(repositoryClass="Customize\Repository\ProductBeerContainerRepository")
     */
    class ProductBeerContainer extends \Eccube\Entity\AbstractEntity
    {
        /**
         * @var int
         *
         * @ORM\Column(name="product_id", type="integer", options={"unsigned":true})
         * @ORM\Id
         * @ORM\GeneratedValue(strategy="NONE")
         */
        private $product_id;

        /**
         * @var int
         *
         * @ORM\Column(name="beer_container_id", type="integer", options={"unsigned":true})
         * @ORM\Id
         * @ORM\GeneratedValue(strategy="NONE")
         */
        private $beer_container_id;

        /**
         * @var \Eccube\Entity\Product
         *
         * @ORM\ManyToOne(targetEntity="Eccube\Entity\Product", inversedBy="ProductBeerContainers")
         * @ORM\JoinColumns({
         *   @ORM\JoinColumn(name="product_id", referencedColumnName="id")
         * })
         */
        private $Product;

        /**
         * @var BeerContainer
         *
         * @ORM\ManyToOne(targetEntity="Customize\Entity\BeerContainer")
         * @ORM\JoinColumns({
         *   @ORM\JoinColumn(name="beer_container_id", referencedColumnName="id")
         * })
         */
        private $BeerContainer;

        /**
         * Set productId.
         *
         * @param int $productId
         *
         * @return ProductBeerContainer
         */
        public function setProductId(int $productId): ProductBeerContainer
        {
            $this->product_id = $productId;

            return $this;
        }

        /**
         * Get productId.
         *
         * @return int
         */
        public function getProductId(): int
        {
            return $this->product_id;
        }

        /**
         * Set beerContainerId.
         *
         * @param int $beerContainerId
         *
         * @return ProductBeerContainer
         */
        public function setBeerContainerId(int $beerContainerId): ProductBeerContainer
        {
            $this->beer_container_id = $beerContainerId;

            return $this;
        }

        /**
         * Get beerContainerId.
         *
         * @return int
         */
        public function getBeerContainerId(): int
        {
            return $this->beer_container_id;
        }

        /**
         * Set product.
         *
         * @param Product|null $product
         *
         * @return ProductBeerContainer
         */
        public function setProduct(?Product $product): ProductBeerContainer
        {
            $this->Product = $product;

            return $this;
        }

        /**
         * Get product.
         *
         * @return Product|null
         */
        public function getProduct(): ?Product
        {
            return $this->Product;
        }

        /**
         * Set BeerContainer.
         *
         * @param BeerContainer|null $BeerContainer
         *
         * @return ProductBeerContainer
         */
        public function setBeerContainer(?BeerContainer $BeerContainer): ProductBeerContainer
        {
            $this->BeerContainer = $BeerContainer;

            return $this;
        }

        /**
         * Get BeerContainer.
         *
         * @return BeerContainer|null
         */
        public function getBeerContainer(): ?BeerContainer
        {
            return $this->BeerContainer;
        }
    }
}
