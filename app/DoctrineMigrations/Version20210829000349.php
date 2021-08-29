<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210829000349 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql("CREATE TABLE `customize_dtb_temporary_order` (
                `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                `original_id` int(11) DEFAULT NULL,
                `customer_id` int(10) unsigned DEFAULT NULL,
                `country_id` smallint(5) unsigned DEFAULT NULL,
                `pref_id` smallint(5) unsigned DEFAULT NULL,
                `sex_id` smallint(5) unsigned DEFAULT NULL,
                `job_id` smallint(5) unsigned DEFAULT NULL,
                `payment_id` int(10) unsigned DEFAULT NULL,
                `device_type_id` smallint(5) unsigned DEFAULT NULL,
                `pre_order_id` varchar(255) DEFAULT NULL,
                `order_no` varchar(255) DEFAULT NULL,
                `message` varchar(4000) DEFAULT NULL,
                `name01` varchar(255) NOT NULL,
                `name02` varchar(255) NOT NULL,
                `kana01` varchar(255) DEFAULT NULL,
                `kana02` varchar(255) DEFAULT NULL,
                `company_name` varchar(255) DEFAULT NULL,
                `email` varchar(255) DEFAULT NULL,
                `phone_number` varchar(14) DEFAULT NULL,
                `postal_code` varchar(8) DEFAULT NULL,
                `addr01` varchar(255) DEFAULT NULL,
                `addr02` varchar(255) DEFAULT NULL,
                `birth` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
                `subtotal` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
                `discount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
                `delivery_fee_total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
                `charge` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
                `tax` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
                `total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
                `payment_total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
                `payment_method` varchar(255) DEFAULT NULL,
                `note` varchar(4000) DEFAULT NULL,
                `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
                `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
                `order_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
                `payment_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
                `currency_code` varchar(255) DEFAULT NULL,
                `complete_message` longtext,
                `complete_mail_message` longtext,
                `add_point` decimal(12,0) unsigned NOT NULL DEFAULT '0',
                `use_point` decimal(12,0) unsigned NOT NULL DEFAULT '0',
                `order_status_id` smallint(5) unsigned DEFAULT NULL,
                `discriminator_type` varchar(255) NOT NULL,
                `customize_store_name` varchar(255) DEFAULT NULL,
                `active` int(11) NOT NULL DEFAULT '0',
                `expire_date` datetime NOT NULL,
                PRIMARY KEY (`id`),
                UNIQUE KEY `dtb_order_pre_order_id_idx` (`pre_order_id`),
                KEY `IDX_1D66D8079395C3F3` (`customer_id`),
                KEY `IDX_1D66D807F92F3E70` (`country_id`),
                KEY `IDX_1D66D807E171EF5F` (`pref_id`),
                KEY `IDX_1D66D8075A2DB2A0` (`sex_id`),
                KEY `IDX_1D66D807BE04EA9` (`job_id`),
                KEY `IDX_1D66D8074C3A3BB` (`payment_id`),
                KEY `IDX_1D66D8074FFA550E` (`device_type_id`),
                KEY `IDX_1D66D807D7707B45` (`order_status_id`),
                KEY `dtb_order_email_idx` (`email`),
                KEY `dtb_order_order_date_idx` (`order_date`),
                KEY `dtb_order_payment_date_idx` (`payment_date`),
                KEY `dtb_order_update_date_idx` (`update_date`),
                KEY `dtb_order_order_no_idx` (`order_no`),
                CONSTRAINT `customize_dtb_temporary_order_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `dtb_payment` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_ibfk_2` FOREIGN KEY (`device_type_id`) REFERENCES `mtb_device_type` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_ibfk_3` FOREIGN KEY (`sex_id`) REFERENCES `mtb_sex` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_ibfk_4` FOREIGN KEY (`customer_id`) REFERENCES `dtb_customer` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_ibfk_5` FOREIGN KEY (`job_id`) REFERENCES `mtb_job` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_ibfk_6` FOREIGN KEY (`pref_id`) REFERENCES `mtb_pref` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_ibfk_7` FOREIGN KEY (`country_id`) REFERENCES `mtb_country` (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8
        ");

        $this->addSql("CREATE TABLE `customize_dtb_temporary_shipping` (
                `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                `original_id` int(11) DEFAULT NULL,
                `order_id` int(10) unsigned DEFAULT NULL,
                `country_id` smallint(5) unsigned DEFAULT NULL,
                `pref_id` smallint(5) unsigned DEFAULT NULL,
                `delivery_id` int(10) unsigned DEFAULT NULL,
                `creator_id` int(10) unsigned DEFAULT NULL,
                `name01` varchar(255) NOT NULL,
                `name02` varchar(255) NOT NULL,
                `kana01` varchar(255) DEFAULT NULL,
                `kana02` varchar(255) DEFAULT NULL,
                `company_name` varchar(255) DEFAULT NULL,
                `phone_number` varchar(14) DEFAULT NULL,
                `postal_code` varchar(8) DEFAULT NULL,
                `addr01` varchar(255) DEFAULT NULL,
                `addr02` varchar(255) DEFAULT NULL,
                `delivery_name` varchar(255) DEFAULT NULL,
                `time_id` int(10) unsigned DEFAULT NULL,
                `delivery_time` varchar(255) DEFAULT NULL,
                `delivery_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
                `shipping_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
                `tracking_number` varchar(255) DEFAULT NULL,
                `note` varchar(4000) DEFAULT NULL,
                `sort_no` smallint(5) unsigned DEFAULT NULL,
                `create_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
                `update_date` datetime NOT NULL COMMENT '(DC2Type:datetimetz)',
                `mail_send_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetimetz)',
                `discriminator_type` varchar(255) NOT NULL,
                `customize_store_name` varchar(255) DEFAULT NULL,
                PRIMARY KEY (`id`),
                KEY `IDX_2EBD22CE8D9F6D38` (`order_id`),
                KEY `IDX_2EBD22CEF92F3E70` (`country_id`),
                KEY `IDX_2EBD22CEE171EF5F` (`pref_id`),
                KEY `IDX_2EBD22CE12136921` (`delivery_id`),
                KEY `IDX_2EBD22CE61220EA6` (`creator_id`),
                CONSTRAINT `customize_dtb_temporary_shipping_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `dtb_delivery` (`id`),
                CONSTRAINT `customize_dtb_temporary_shipping_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `dtb_member` (`id`),
                CONSTRAINT `customize_dtb_temporary_shipping_ibfk_4` FOREIGN KEY (`pref_id`) REFERENCES `mtb_pref` (`id`),
                CONSTRAINT `customize_dtb_temporary_shipping_ibfk_5` FOREIGN KEY (`country_id`) REFERENCES `mtb_country` (`id`),
                CONSTRAINT `customize_dtb_temporary_shipping_ibfk_6` FOREIGN KEY (`order_id`) REFERENCES `customize_dtb_temporary_order` (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8
        ");

        $this->addSql("CREATE TABLE `customize_dtb_temporary_order_item` (
                `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                `original_id` int(11) DEFAULT NULL,
                `order_id` int(10) unsigned DEFAULT NULL,
                `product_id` int(10) unsigned DEFAULT NULL,
                `product_class_id` int(10) unsigned DEFAULT NULL,
                `shipping_id` int(10) unsigned DEFAULT NULL,
                `rounding_type_id` smallint(5) unsigned DEFAULT NULL,
                `tax_type_id` smallint(5) unsigned DEFAULT NULL,
                `tax_display_type_id` smallint(5) unsigned DEFAULT NULL,
                `order_item_type_id` smallint(5) unsigned DEFAULT NULL,
                `product_name` varchar(255) NOT NULL,
                `product_code` varchar(255) DEFAULT NULL,
                `class_name1` varchar(255) DEFAULT NULL,
                `class_name2` varchar(255) DEFAULT NULL,
                `class_category_name1` varchar(255) DEFAULT NULL,
                `class_category_name2` varchar(255) DEFAULT NULL,
                `price` decimal(12,2) NOT NULL DEFAULT '0.00',
                `quantity` decimal(10,0) NOT NULL DEFAULT '0',
                `tax` decimal(10,0) NOT NULL DEFAULT '0',
                `tax_rate` decimal(10,0) unsigned NOT NULL DEFAULT '0',
                `tax_adjust` decimal(10,0) unsigned NOT NULL DEFAULT '0',
                `tax_rule_id` smallint(5) unsigned DEFAULT NULL,
                `currency_code` varchar(255) DEFAULT NULL,
                `processor_name` varchar(255) DEFAULT NULL,
                `point_rate` decimal(10,0) unsigned DEFAULT NULL,
                `discriminator_type` varchar(255) NOT NULL,
                `parent_order_item_id` int(11) DEFAULT NULL,
                PRIMARY KEY (`id`),
                KEY `IDX_A0C8C3ED8D9F6D38` (`order_id`),
                KEY `IDX_A0C8C3ED4584665A` (`product_id`),
                KEY `IDX_A0C8C3ED21B06187` (`product_class_id`),
                KEY `IDX_A0C8C3ED4887F3F8` (`shipping_id`),
                KEY `IDX_A0C8C3ED1BD5C574` (`rounding_type_id`),
                KEY `IDX_A0C8C3ED84042C99` (`tax_type_id`),
                KEY `IDX_A0C8C3EDA2505856` (`tax_display_type_id`),
                KEY `IDX_A0C8C3EDCAD13EAD` (`order_item_type_id`),
                CONSTRAINT `customize_dtb_temporary_order_item_ibfk_1` FOREIGN KEY (`rounding_type_id`) REFERENCES `mtb_rounding_type` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_item_ibfk_10` FOREIGN KEY (`shipping_id`) REFERENCES `customize_dtb_temporary_shipping` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_item_ibfk_2` FOREIGN KEY (`product_class_id`) REFERENCES `dtb_product_class` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_item_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `dtb_product` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_item_ibfk_5` FOREIGN KEY (`tax_type_id`) REFERENCES `mtb_tax_type` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_item_ibfk_7` FOREIGN KEY (`tax_display_type_id`) REFERENCES `mtb_tax_display_type` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_item_ibfk_8` FOREIGN KEY (`order_item_type_id`) REFERENCES `mtb_order_item_type` (`id`),
                CONSTRAINT `customize_dtb_temporary_order_item_ibfk_9` FOREIGN KEY (`order_id`) REFERENCES `customize_dtb_temporary_order` (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8
        ");
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
