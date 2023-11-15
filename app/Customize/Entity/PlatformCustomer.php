<?php

namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eccube\Entity\Customer;

if (!class_exists('\Customize\Entity\PlatformCustomer')) {
    /**
     * PlatformCustomer
     *
     * @ORM\Table(name="customize_dtb_platform_customer")
     * @ORM\InheritanceType("SINGLE_TABLE")
     * @ORM\DiscriminatorColumn(name="discriminator_type", type="string", length=255)
     * @ORM\HasLifecycleCallbacks()
     * @ORM\Entity(repositoryClass="Customize\Repository\PlatformCustomerRepository")
     */
    class PlatformCustomer extends \Eccube\Entity\AbstractEntity
    {
        /**
         * @var int
         *
         * @ORM\Column(name="customer_id", type="integer", options={"unsigned":true})
         * @ORM\Id
         * @ORM\GeneratedValue(strategy="NONE")
         */
        private $customer_id;

        /**
         * @var Customer
         *
         * @ORM\OneToOne(targetEntity="Eccube\Entity\Customer", inversedBy="PlatformCustomer")
         * @ORM\JoinColumns({
         *   @ORM\JoinColumn(name="customer_id", referencedColumnName="id")
         * })
         */
        private $Customer;

        /**
         * Set Customer.
         *
         * @param Customer $Customer
         *
         * @return PlatformCustomer
         */
        public function setCustomer(Customer $Customer): PlatformCustomer
        {
            $this->Customer = $Customer;

            return $this;
        }

        /**
         * Get Customer.
         *
         * @return Customer
         */
        public function getCustomer(): Customer
        {
            return $this->Customer;
        }
    }
}
