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
         * @ORM\Column(name="brewery_name", type="string", length=255, nullable=true)
         */
        private $brewery_name;

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
         * @ORM\Column(name="logo_image", type="text", nullable=true)
         */
        private $logo_image;

        /**
         * @var string|null
         *
         * @ORM\Column(name="imprint_image", type="text", nullable=true)
         */
        private $imprint_image;

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
         * @ORM\Column(name="financial_institution_code", type="string", length=255, nullable=true)
         */
        private $financial_institution_code;

        /**
         * @var string|null
         *
         * @ORM\Column(name="branch_name", type="string", length=255, nullable=true)
         */
        private $branch_name;

        /**
         * @var string|null
         *
         * @ORM\Column(name="branch_code", type="string", length=255, nullable=true)
         */
        private $branch_code;

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
         * @var boolean
         *
         * @ORM\Column(name="business_registration", type="boolean", options={"default":false})
         */
        private $business_registration;

        /**
         * @var string|null
         *
         * @ORM\Column(name="business_registration_date", type="string", length=255, nullable=true)
         */
        private $business_registration_date;

        /**
         * @var int|null
         *
         * @ORM\Column(name="payment_deadline_month", type="integer", nullable=true, options={"unsigned":true})
         */
        private $payment_deadline_month;

        /**
         * @var int|null
         *
         * @ORM\Column(name="payment_deadline_day", type="integer", nullable=true, options={"unsigned":true})
         */
        private $payment_deadline_day;

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
         * Set breweryName.
         *
         * @param string|null $breweryName
         *
         * @return Invoice
         */
        public function setBreweryName(?string $breweryName): Invoice
        {
            $this->brewery_name = $breweryName;

            return $this;
        }

        /**
         * Get breweryName.
         *
         * @return string|null
         */
        public function getBreweryName(): ?string
        {
            return $this->brewery_name;
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
         * Set logoImage.
         *
         * @param string|null $logoImage
         *
         * @return Invoice
         */
        public function setLogoImage(?string $logoImage): Invoice
        {
            $this->logo_image = $logoImage;

            return $this;
        }

        /**
         * Get logoImage.
         *
         * @return string|null
         */
        public function getLogoImage(): ?string
        {
            return $this->logo_image;
        }

        /**
         * Set imprintImage.
         *
         * @param string|null $imprintImage
         *
         * @return Invoice
         */
        public function setImprintImage(?string $imprintImage): Invoice
        {
            $this->imprint_image = $imprintImage;

            return $this;
        }

        /**
         * Get imprintImage.
         *
         * @return string|null
         */
        public function getImprintImage(): ?string
        {
            return $this->imprint_image;
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
         * Set financialInstitutionCode.
         *
         * @param string|null $financialInstitutionCode
         *
         * @return Invoice
         */
        public function setFinancialInstitutionCode(?string $financialInstitutionCode): Invoice
        {
            $this->financial_institution_code = $financialInstitutionCode;

            return $this;
        }

        /**
         * Get financialInstitutionCode.
         *
         * @return string|null
         */
        public function getFinancialInstitutionCode(): ?string
        {
            return $this->financial_institution_code;
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
         * Get branchName.
         *
         * @return string|null
         */
        public function getBranchName(): ?string
        {
            return $this->branch_name;
        }

        /**
         * Set branchCode.
         *
         * @param string|null $branchCode
         *
         * @return Invoice
         */
        public function setBranchCode(?string $branchCode): Invoice
        {
            $this->branch_code = $branchCode;

            return $this;
        }

        /**
         * Get branchCode.
         *
         * @return string|null
         */
        public function getBranchCode(): ?string
        {
            return $this->branch_code;
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
         * Set businessRegistration.
         *
         * @param integer $business_registration
         *
         * @return Invoice
         */
        public function setBusinessRegistration($business_registration)
        {
            $this->business_registration = $business_registration;

            return $this;
        }

        /**
         * Get businessRegistration.
         *
         * @return boolean
         */
        public function isBusinessRegistration()
        {
            return $this->business_registration;
        }

        /**
         * Set businessRegistrationDate.
         *
         * @param string|null $businessRegistrationDate
         *
         * @return Invoice
         */
        public function setBusinessRegistrationDate(?string $businessRegistrationDate): Invoice
        {
            $this->business_registration_date = $businessRegistrationDate;

            return $this;
        }

        /**
         * Get businessRegistrationDate.
         *
         * @return string|null
         */
        public function getBusinessRegistrationDate(): ?string
        {
            return $this->business_registration_date;
        }

        /**
         * Set paymentDeadlineMonth.
         *
         * @param int|null $paymentDeadlineMonth
         *
         * @return Invoice
         */
        public function setPaymentDeadlineMonth(?int $paymentDeadlineMonth): Invoice
        {
            $this->payment_deadline_month = $paymentDeadlineMonth;

            return $this;
        }

        /**
         * Get paymentDeadlineMonth.
         *
         * @return int|null
         */
        public function getPaymentDeadlineMonth(): ?int
        {
            return $this->payment_deadline_month;
        }

        /**
         * Set paymentDeadlineDay.
         *
         * @param int|null $paymentDeadlineDay
         *
         * @return Invoice
         */
        public function setPaymentDeadlineDay(?int $paymentDeadlineDay): Invoice
        {
            $this->payment_deadline_day = $paymentDeadlineDay;

            return $this;
        }

        /**
         * Get paymentDeadlineDay.
         *
         * @return int|null
         */
        public function getPaymentDeadlineDay(): ?int
        {
            return $this->payment_deadline_day;
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
