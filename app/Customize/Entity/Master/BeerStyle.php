<?php

namespace Customize\Entity\Master;

use Eccube\Entity\Master\AbstractMasterEntity;
use Doctrine\ORM\Mapping as ORM;

if (!class_exists('\Customize\Entity\Mater\BeerStyle')) {
    /**
     * InvoiceDelivery
     *
     * @ORM\Table(name="customize_mtb_beer_style")
     * @ORM\InheritanceType("SINGLE_TABLE")
     * @ORM\DiscriminatorColumn(name="discriminator_type", type="string", length=255)
     * @ORM\HasLifecycleCallbacks()
     * @ORM\Entity(repositoryClass="Customize\Repository\Master\BeerStyleRepository")
     * @ORM\Cache(usage="NONSTRICT_READ_WRITE")
     */
    class BeerStyle extends AbstractMasterEntity
    {
        /**
         * Lager / Pilsner
         */
        const LAGER_PILSNER = 1;

        /**
         * White Ale/Weizen
         */
        const WHITE_ALE_WEIZEN = 2;

        /**
         * Ale Beer
         */
        const ALE_BEER = 3;

        /**
         * IPA
         */
        const IPA = 4;

        /**
         * Black Beer
         */
        const BLACK_BEER = 5;

        /**
         * Fruit & Herb/Flavor Beer
         */
        const FRUIT_HERB_FLAVOR_BEER = 6;

        /**
         * Sour / Gose
         */
        const SOUR_GOSE = 7;

        /**
         * Special Beer
         */
        const SPECIAL_BEER = 8;

        /**
         * その他
         */
        const OTHER = 9;
    }
}
