<?php

namespace Customize\Entity;

use DateTime;
use Doctrine\ORM\Mapping as ORM;

if (!class_exists('\Customize\Entity\Brewery')) {
    /**
     * Brewery
     *
     * @ORM\Table(name="customize_dtb_brewery")
     * @ORM\InheritanceType("SINGLE_TABLE")
     * @ORM\DiscriminatorColumn(name="discriminator_type", type="string", length=255)
     * @ORM\HasLifecycleCallbacks()
     * @ORM\Entity(repositoryClass="Customize\Repository\BreweryRepository")
     */
    class Brewery extends \Eccube\Entity\AbstractEntity
    {
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
         * @ORM\Column(name="domain", type="string", length=255)
         */
        private $domain;

        /**
         * @var string
         *
         * @ORM\Column(name="name", type="string", length=255)
         */
        private $name;

        /**
         * @var int
         *
         * @ORM\Column(name="bbj_payment_id", type="integer", options={"unsigned":true})
         * @ORM\Id
         * @ORM\GeneratedValue(strategy="NONE")
         */
        private $bbj_payment_id;

        /**
         * @var int
         *
         * @ORM\Column(name="bbj_customer_id", type="integer", options={"unsigned":true})
         * @ORM\Id
         * @ORM\GeneratedValue(strategy="NONE")
         */
        private $bbj_customer_id;

        /**
         * @var int
         *
         * @ORM\Column(name="bbj_delivery_id", type="integer", options={"unsigned":true})
         * @ORM\Id
         * @ORM\GeneratedValue(strategy="NONE")
         */
        private $bbj_delivery_id;

        /**
         * @var DateTime
         *
         * @ORM\Column(name="create_date", type="datetimetz")
         */
        private $create_date;

        /**
         * @var DateTime
         *
         * @ORM\Column(name="update_date", type="datetimetz")
         */
        private $update_date;

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
         * Set domain.
         *
         * @param string $domain
         *
         * @return Brewery
         */
        public function setDomain(string $domain): Brewery
        {
            $this->domain = $domain;

            return $this;
        }

        /**
         * Get domain.
         *
         * @return string
         */
        public function getDomain(): string
        {
            return $this->domain;
        }

        /**
         * Set name.
         *
         * @param string $name
         *
         * @return Brewery
         */
        public function setName(string $name): Brewery
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
         * Set bbj_payment_id.
         *
         * @param int $bbj_payment_id
         *
         * @return Brewery
         */
        public function setBbjPaymentId(int $bbj_payment_id): Brewery
        {
            $this->bbj_payment_id = $bbj_payment_id;

            return $this;
        }

        /**
         * Get bbj_payment_id.
         *
         * @return int
         */
        public function getBbjPaymentId(): int
        {
            return $this->bbj_payment_id;
        }

        /**
         * Set bbj_customer_id.
         *
         * @param int $bbj_customer_id
         *
         * @return Brewery
         */
        public function setBbjCustomerId(int $bbj_customer_id): Brewery
        {
            $this->bbj_customer_id = $bbj_customer_id;

            return $this;
        }

        /**
         * Get bbj_customer_id.
         *
         * @return int
         */
        public function getBbjCustomerId(): int
        {
            return $this->bbj_customer_id;
        }

        /**
         * Set bbj_delivery_id.
         *
         * @param int $bbj_delivery_id
         *
         * @return Brewery
         */
        public function setBbjDeliveryId(int $bbj_delivery_id): Brewery
        {
            $this->bbj_delivery_id = $bbj_delivery_id;

            return $this;
        }

        /**
         * Get bbj_delivery_id.
         *
         * @return int
         */
        public function getBbjDeliveryId(): int
        {
            return $this->bbj_delivery_id;
        }

        /**
         * Set createDate.
         *
         * @param DateTime $createDate
         *
         * @return Brewery
         */
        public function setCreateDate(DateTime $createDate): Brewery
        {
            $this->create_date = $createDate;

            return $this;
        }

        /**
         * Get createDate.
         *
         * @return DateTime
         */
        public function getCreateDate(): DateTime
        {
            return $this->create_date;
        }

        /**
         * Set updateDate.
         *
         * @param DateTime $updateDate
         *
         * @return Brewery
         */
        public function setUpdateDate(DateTime $updateDate): Brewery
        {
            $this->update_date = $updateDate;

            return $this;
        }

        /**
         * Get updateDate.
         *
         * @return DateTime
         */
        public function getUpdateDate(): DateTime
        {
            return $this->update_date;
        }
    }
}
