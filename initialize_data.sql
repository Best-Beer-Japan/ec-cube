CHARSET utf8;
use eccubedb;

set foreign_key_checks = 0;
-- 受注データの初期化
TRUNCATE TABLE dtb_order_item;
TRUNCATE TABLE dtb_mail_history;
TRUNCATE TABLE dtb_shipping;
TRUNCATE TABLE dtb_order;
ALTER TABLE dtb_order_item AUTO_INCREMENT = 1;
ALTER TABLE dtb_mail_history AUTO_INCREMENT = 1;
ALTER TABLE dtb_shipping AUTO_INCREMENT = 1;
ALTER TABLE dtb_order AUTO_INCREMENT = 1;

-- プラグインデータ（送料）
TRUNCATE TABLE plg_delivery_fee_extension_dtb_customer_delivery;
TRUNCATE TABLE plg_delivery_fee_extension_dtb_delivery_area;
TRUNCATE TABLE plg_delivery_fee_extension_dtb_delivery_pref_area;
TRUNCATE TABLE plg_delivery_fee_extension_dtb_delivery_size;
TRUNCATE TABLE plg_delivery_fee_extension_dtb_delivery_size_area_fee;
TRUNCATE TABLE plg_delivery_fee_extension_dtb_product_delivery_product_size;
TRUNCATE TABLE plg_delivery_fee_extension_dtb_product_size;
ALTER TABLE plg_delivery_fee_extension_dtb_customer_delivery AUTO_INCREMENT = 1;
ALTER TABLE plg_delivery_fee_extension_dtb_delivery_area AUTO_INCREMENT = 1;
ALTER TABLE plg_delivery_fee_extension_dtb_delivery_pref_area AUTO_INCREMENT = 1;
ALTER TABLE plg_delivery_fee_extension_dtb_delivery_size AUTO_INCREMENT = 1;
ALTER TABLE plg_delivery_fee_extension_dtb_delivery_size_area_fee AUTO_INCREMENT = 1;
ALTER TABLE plg_delivery_fee_extension_dtb_product_delivery_product_size AUTO_INCREMENT = 1;
ALTER TABLE plg_delivery_fee_extension_dtb_product_size AUTO_INCREMENT = 1;

-- プラグインデータ（B2Bカート）
TRUNCATE TABLE plg_customer_group_product_class;
TRUNCATE TABLE plg_customer_group_membership;
TRUNCATE TABLE plg_customer_group;
TRUNCATE TABLE plg_price_rule;
ALTER TABLE plg_customer_group_product_class AUTO_INCREMENT = 1;
ALTER TABLE plg_customer_group_membership AUTO_INCREMENT = 1;
ALTER TABLE plg_customer_group AUTO_INCREMENT = 1;
ALTER TABLE plg_price_rule AUTO_INCREMENT = 1;
INSERT INTO plg_customer_group (id, price_rule_id, name, is_guest_group, discriminator_type) VALUES (1, 1, 'ゲスト', 1, 'customergroup');

-- プラグインデータ（Mixpack）
TRUNCATE TABLE plg_mixpack_product_class;
TRUNCATE TABLE plg_mixpack;
ALTER TABLE plg_mixpack_product_class AUTO_INCREMENT = 1;
ALTER TABLE plg_mixpack AUTO_INCREMENT = 1;

-- 商品データの初期化
TRUNCATE TABLE dtb_cart_item;
TRUNCATE TABLE dtb_cart;
TRUNCATE TABLE dtb_customer_favorite_product;
TRUNCATE TABLE dtb_product_tag;
TRUNCATE TABLE dtb_product_stock;
TRUNCATE TABLE dtb_product_image;
TRUNCATE TABLE dtb_product_class;
TRUNCATE TABLE dtb_product_category;
TRUNCATE TABLE dtb_product;
ALTER TABLE dtb_cart_item AUTO_INCREMENT = 1;
ALTER TABLE dtb_cart AUTO_INCREMENT = 1;
ALTER TABLE dtb_customer_favorite_product AUTO_INCREMENT = 1;
ALTER TABLE dtb_product_tag AUTO_INCREMENT = 1;
ALTER TABLE dtb_product_stock AUTO_INCREMENT = 1;
ALTER TABLE dtb_product_image AUTO_INCREMENT = 1;
ALTER TABLE dtb_product_class AUTO_INCREMENT = 1;
ALTER TABLE dtb_product_category AUTO_INCREMENT = 1;
ALTER TABLE dtb_product AUTO_INCREMENT = 1;

-- 顧客データの初期化
TRUNCATE TABLE dtb_customer;
TRUNCATE TABLE dtb_customer_address;
TRUNCATE TABLE dtb_customer_favorite_product;
ALTER TABLE dtb_customer AUTO_INCREMENT = 1;
ALTER TABLE dtb_customer_address AUTO_INCREMENT = 1;
ALTER TABLE dtb_customer_favorite_product AUTO_INCREMENT = 1;

-- 配送データの初期化
TRUNCATE TABLE dtb_delivery;
TRUNCATE TABLE dtb_delivery_fee;
TRUNCATE TABLE dtb_payment_option;
ALTER TABLE dtb_delivery AUTO_INCREMENT = 1;
ALTER TABLE dtb_delivery_fee AUTO_INCREMENT = 1;
ALTER TABLE dtb_payment_option AUTO_INCREMENT = 1;

-- 税率ルール
TRUNCATE TABLE dtb_tax_rule;
ALTER TABLE dtb_tax_rule AUTO_INCREMENT = 1;
INSERT INTO dtb_tax_rule (id, product_class_id, creator_id, country_id, pref_id, product_id, rounding_type_id, tax_rate, tax_adjust, apply_date, create_date, update_date, discriminator_type)
VALUES
(1, NULL, 2, NULL, NULL, NULL, 3, 10, 0, '2017-03-07 10:14:52', '2017-03-07 10:14:52', '2021-07-30 10:12:15', 'taxrule');

-- 規格やカテゴリの初期化
TRUNCATE TABLE dtb_category;
TRUNCATE TABLE dtb_class_category;
TRUNCATE TABLE dtb_class_name;
TRUNCATE TABLE dtb_tag;
ALTER TABLE dtb_category AUTO_INCREMENT = 1;
ALTER TABLE dtb_class_category AUTO_INCREMENT = 1;
ALTER TABLE dtb_class_name AUTO_INCREMENT = 1;
ALTER TABLE dtb_tag AUTO_INCREMENT = 1;

set foreign_key_checks = 1;
