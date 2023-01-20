<?php

namespace Customize\Entity;

use Customize\Entity\BeerContainer;
use Doctrine\ORM\Mapping as ORM;

if (!class_exists('\Customize\Entity\BeerContainerCapacity')) {
    /**
     * BeerContainerCapacity
     *
     * @ORM\Table(name="customize_dtb_beer_container_capacity")
     * @ORM\InheritanceType("SINGLE_TABLE")
     * @ORM\DiscriminatorColumn(name="discriminator_type", type="string", length=255)
     * @ORM\HasLifecycleCallbacks()
     * @ORM\Entity(repositoryClass="Customize\Repository\BeerContainerCapacityRepository")
     */
    class BeerContainerCapacity extends \Eccube\Entity\AbstractEntity
    {
        /**
         * @return string
         */
        public function __toString()
        {
            return (string) $this->getName();
        }

        /**
         * @var int
         *
         * @ORM\Column(name="id", type="integer", options={"unsigned":true})
         * @ORM\Id
         * @ORM\GeneratedValue(strategy="IDENTITY")
         */
        private $id;

        /**
         * @var string
         *
         * @ORM\Column(name="name", type="string", length=255)
         */
        protected $name;


        /**
         * @var int
         *
         * @ORM\Column(name="sort_no", type="smallint", options={"unsigned":true})
         */
        protected $sort_no;

        /**
         * @var \Customize\Entity\BeerContainer
         *
         * @ORM\ManyToOne(targetEntity="Customize\Entity\BeerContainer")
         * @ORM\JoinColumns({
         *   @ORM\JoinColumn(name="beer_container_id", referencedColumnName="id")
         * })
         */
        private $BeerContainer;

        /**
         * Get id.
         *
         * @return int
         */
        public function getId(): int
        {
            return $this->id;
        }

        /**
         * Set name.
         *
         * @param string $name
         *
         * @return BeerContainerCapacity
         */
        public function setName(string $name): BeerContainerCapacity
        {
            $this->name = $name;

            return $this;
        }

        /**
         * Get name.
         *
         * @return string
         */
        public function getName(): string
        {
            return $this->name;
        }

        /**
         * Set sortNo.
         *
         * @param int $sortNo
         *
         * @return BeerContainerCapacity
         */
        public function setSortNo(int $sortNo): BeerContainerCapacity
        {
            $this->sort_no = $sortNo;

            return $this;
        }

        /**
         * Get sortNo.
         *
         * @return int
         */
        public function getSortNo(): int
        {
            return $this->sort_no;
        }

        /**
         * Set status.
         *
         * @param BeerContainer|null $BeerContainer
         *
         * @return BeerContainerCapacity|null
         */
        public function setBeerContainer(?BeerContainer $BeerContainer): BeerContainerCapacity
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
