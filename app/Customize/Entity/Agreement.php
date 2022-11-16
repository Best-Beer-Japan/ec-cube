<?php


namespace Customize\Entity;

use Doctrine\ORM\Mapping as ORM;
use Eccube\Entity\AbstractEntity;

if (!class_exists('\Customize\Entity\Agreement')) {
    /**
     * Agreement
     *
     * @ORM\Table(name="customize_dtb_agreement")
     * @ORM\InheritanceType("SINGLE_TABLE")
     * @ORM\DiscriminatorColumn(name="discriminator_type", type="string", length=255)
     * @ORM\HasLifecycleCallbacks()
     * @ORM\Entity(repositoryClass="Customize\Repository\AgreementRepository")
     */
    class Agreement extends AbstractEntity
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
         * @ORM\Column(name="agreement_detail", type="text", nullable=true)
         */
        private $agreement_detail;

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
         * Set agreement_detail.
         *
         * @param string|null $agreement_detail
         *
         * @return Agreement
         */
        public function setAgreementDetail(?string $agreement_detail): Agreement
        {
            $this->agreement_detail = $agreement_detail;

            return $this;
        }

        /**
         * Get freeArea.
         *
         * @return string|null
         */
        public function getAgreementDetail(): ?string
        {
            return $this->agreement_detail;
        }
    }
}
