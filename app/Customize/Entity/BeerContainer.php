<?php

namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;

if (!class_exists('\Customize\Entity\BeerContainer')) {
    /**
     * BeerContainer
     *
     * @ORM\Table(name="customize_dtb_beer_container")
     * @ORM\InheritanceType("SINGLE_TABLE")
     * @ORM\DiscriminatorColumn(name="discriminator_type", type="string", length=255)
     * @ORM\HasLifecycleCallbacks()
     * @ORM\Entity(repositoryClass="Customize\Repository\BeerContainerRepository")
     */
    class BeerContainer extends \Eccube\Entity\AbstractEntity
    {
        /**
         * 樽
         */
        const BARREL = 1;

        /**
         * ビン
         */
        const BOTTLE = 2;

        /**
         * 缶
         */
        const CAN = 3;
        /**
         * その他
         */
        const OTHER = 4;

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
         * @return BeerContainer
         */
        public function setName(string $name): BeerContainer
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
         * @return $this
         */
        public function setSortNo(int $sortNo): BeerContainer
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
    }
}
