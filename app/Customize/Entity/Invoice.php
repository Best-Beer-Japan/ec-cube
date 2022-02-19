<?php

namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eccube\Entity\AbstractEntity;
use Eccube\Entity\Master\Pref;

if (!class_exists('\Customize\Entity\Invoice')) {
    /**
     * Invoice
     *
     * @ORM\Table(name="customize_dtb_invoice")
     * @ORM\InheritanceType("SINGLE_TABLE")
     * @ORM\DiscriminatorColumn(name="discriminator_type", type="string", length=255)
     * @ORM\HasLifecycleCallbacks()
     * @ORM\Entity(repositoryClass="Customize\Repository\InvoiceRepository")
     */
    class Invoice extends AbstractEntity
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
         * @var string|null
         *
         * @ORM\Column(name="company_name", type="string", length=255, nullable=true)
         */
        private $company_name;

        /**
         * @var string|null
         *
         * @ORM\Column(name="shop_name", type="string", length=255, nullable=true)
         */
        private $shop_name;

        /**
         * @var string|null
         *
         * @ORM\Column(name="postal_code", type="string", length=8, nullable=true)
         */
        private $postal_code;

        /**
         * @var string|null
         *
         * @ORM\Column(name="addr01", type="string", length=255, nullable=true)
         */
        private $addr01;

        /**
         * @var string|null
         *
         * @ORM\Column(name="addr02", type="string", length=255, nullable=true)
         */
        private $addr02;

        /**
         * @var string|null
         *
         * @ORM\Column(name="phone_number", type="string", length=14, nullable=true)
         */
        private $phone_number;

        /**
         * @var string|null
         *
         * @ORM\Column(name="email", type="string", length=255, nullable=true)
         */
        private $email;

        /**
         * @var string|null
         *
         * @ORM\Column(name="person_in_charge_name", type="string", length=255, nullable=true)
         */
        private $person_in_charge_name;

        /**
         * @var string|null
         *
         * @ORM\Column(name="financial_institution_name", type="string", length=255, nullable=true)
         */
        private $financial_institution_name;

        /**
         * @var string|null
         *
         * @ORM\Column(name="branch_name", type="string", length=255, nullable=true)
         */
        private $branch_name;

        /**
         * @var string
         *
         * @ORM\Column(name="account_type", type="decimal", precision=10, scale=0, options={"unsigned":true, "default":1})
         */
        private $account_type = '1';

        /**
         * @var string|null
         *
         * @ORM\Column(name="account_number", type="string", length=255, nullable=true)
         */
        private $account_number;

        /**
         * @var string|null
         *
         * @ORM\Column(name="account_holder_name", type="string", length=255, nullable=true)
         */
        private $account_holder_name;

        /**
         * @var string|null
         *
         * @ORM\Column(name="registration_number", type="string", length=255, nullable=true)
         */
        private $registration_number;

        /**
         * @var Pref
         *
         * @ORM\ManyToOne(targetEntity="Eccube\Entity\Master\Pref")
         * @ORM\JoinColumns({
         *   @ORM\JoinColumn(name="pref_id", referencedColumnName="id")
         * })
         * @ORM\Cache(usage="NONSTRICT_READ_WRITE")
         */
        private $Pref;

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
         * Set companyName.
         *
         * @param string|null $companyName
         *
         * @return Invoice
         */
        public function setCompanyName(?string $companyName): Invoice
        {
            $this->company_name = $companyName;

            return $this;
        }

        /**
         * Get companyName.
         *
         * @return string|null
         */
        public function getCompanyName(): ?string
        {
            return $this->company_name;
        }

        /**
         * Set shopName.
         *
         * @param string|null $shopName
         *
         * @return Invoice
         */
        public function setShopName(?string $shopName): Invoice
        {
            $this->shop_name = $shopName;

            return $this;
        }

        /**
         * Get shopName.
         *
         * @return string|null
         */
        public function getShopName(): ?string
        {
            return $this->shop_name;
        }

        /**
         * Set PostalCode.
         *
         * @param string|null $postalCode
         *
         * @return Invoice
         */
        public function setPostalCode(?string $postalCode): Invoice
        {
            $this->postal_code = $postalCode;

            return $this;
        }

        /**
         * Get PostalCode.
         *
         * @return string|null
         */
        public function getPostalCode(): ?string
        {
            return $this->postal_code;
        }

        /**
         * Set addr01.
         *
         * @param string|null $addr01
         *
         * @return Invoice
         */
        public function setAddr01(?string $addr01): Invoice
        {
            $this->addr01 = $addr01;

            return $this;
        }

        /**
         * Get addr01.
         *
         * @return string|null
         */
        public function getAddr01(): ?string
        {
            return $this->addr01;
        }

        /**
         * Set addr02.
         *
         * @param string|null $addr02
         *
         * @return Invoice
         */
        public function setAddr02(?string $addr02): Invoice
        {
            $this->addr02 = $addr02;

            return $this;
        }

        /**
         * Get addr02.
         *
         * @return string|null
         */
        public function getAddr02(): ?string
        {
            return $this->addr02;
        }

        /**
         * Set PhoneNumber.
         *
         * @param string|null $phoneNumber
         *
         * @return Invoice
         */
        public function setPhoneNumber(?string $phoneNumber): Invoice
        {
            $this->phone_number = $phoneNumber;

            return $this;
        }

        /**
         * Get phone_number.
         *
         * @return string|null
         */
        public function getPhoneNumber(): ?string
        {
            return $this->phone_number;
        }

        /**
         * Set email.
         *
         * @param string|null $email
         *
         * @return Invoice
         */
        public function setEmail(?string $email): Invoice
        {
            $this->email = $email;

            return $this;
        }

        /**
         * Get email.
         *
         * @return string|null
         */
        public function getEmail(): ?string
        {
            return $this->email;
        }

        /**
         * Set personInChargeName.
         *
         * @param string|null $personInChargeName
         *
         * @return Invoice
         */
        public function setPersonInChargeName(?string $personInChargeName): Invoice
        {
            $this->person_in_charge_name = $personInChargeName;

            return $this;
        }

        /**
         * Get personInChargeName.
         *
         * @return string|null
         */
        public function getPersonInChargeName(): ?string
        {
            return $this->person_in_charge_name;
        }

        /**
         * Set financialInstitutionName.
         *
         * @param string|null $financialInstitutionName
         *
         * @return Invoice
         */
        public function setFinancialInstitutionName(?string $financialInstitutionName): Invoice
        {
            $this->financial_institution_name = $financialInstitutionName;

            return $this;
        }

        /**
         * Get financialInstitutionName.
         *
         * @return string|null
         */
        public function getFinancialInstitutionName(): ?string
        {
            return $this->financial_institution_name;
        }

        /**
         * Set branchName.
         *
         * @param string|null $branchName
         *
         * @return Invoice
         */
        public function setBranchName(?string $branchName): Invoice
        {
            $this->branch_name = $branchName;

            return $this;
        }

        /**
         * Get financialInstitutionName.
         *
         * @return string|null
         */
        public function getBranchName(): ?string
        {
            return $this->branch_name;
        }

        /**
         * Set accountType.
         *
         * @param int|null $accountType
         *
         * @return Invoice
         */
        public function setAccountType(?int $accountType): Invoice
        {
            $this->account_type = $accountType;

            return $this;
        }

        /**
         * Get deliveryFreeQuantity.
         *
         * @return int|null
         */
        public function getAccountType()
        {
            return $this->account_type;
        }

        /**
         * Set accountNumber.
         *
         * @param string|null $accountNumber
         *
         * @return Invoice
         */
        public function setAccountNumber(?string $accountNumber): Invoice
        {
            $this->account_number = $accountNumber;

            return $this;
        }

        /**
         * Get accountNumber.
         *
         * @return string|null
         */
        public function getAccountNumber(): ?string
        {
            return $this->account_number;
        }

        /**
         * Set accountHolderName.
         *
         * @param string|null $accountHolderName
         *
         * @return Invoice
         */
        public function setAccountHolderName(?string $accountHolderName): Invoice
        {
            $this->account_holder_name = $accountHolderName;

            return $this;
        }

        /**
         * Get accountNumber.
         *
         * @return string|null
         */
        public function getAccountHolderName(): ?string
        {
            return $this->account_holder_name;
        }

        /**
         * Set registrationNumber.
         *
         * @param string|null $registrationNumber
         *
         * @return Invoice
         */
        public function setRegistrationNumber(?string $registrationNumber): Invoice
        {
            $this->registration_number = $registrationNumber;

            return $this;
        }

        /**
         * Get registrationNumber.
         *
         * @return string|null
         */
        public function getRegistrationNumber(): ?string
        {
            return $this->registration_number;
        }

        /**
         * Set pref.
         *
         * @param Pref|null $pref
         *
         * @return Invoice
         */
        public function setPref(?Pref $pref): Invoice
        {
            $this->Pref = $pref;

            return $this;
        }

        /**
         * Get pref.
         *
         * @return Pref|null
         */
        public function getPref(): ?Pref
        {
            return $this->Pref;
        }
    }
}
