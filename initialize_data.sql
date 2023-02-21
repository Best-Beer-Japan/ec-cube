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
INSERT INTO plg_price_rule (id, rule_type, rate, discriminator_type) VALUES (1, 2, 0, 'pricerule');

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

-- mtb_order_status
UPDATE `mtb_order_status` SET `name` = '入金済み(一般顧客)' WHERE `id` = '6';
INSERT IGNORE INTO `mtb_order_status` (`id`, `display_order_count`, `name`, `sort_no`, `discriminator_type`) VALUES
(10, 1, '請求済み', 8, 'orderstatus'),(11, 0, '入金済み(BtoB)', 9, 'orderstatus');
INSERT IGNORE INTO `mtb_order_status_color` (`id`, `name`, `sort_no`, `discriminator_type`) VALUES
(10, '#cd69a7', 8, 'orderstatuscolor'),(11, '#a3a3a3', 9, 'orderstatuscolor');
INSERT IGNORE INTO `mtb_customer_order_status` (`id`, `name`, `sort_no`, `discriminator_type`) VALUES
('10', '請求書処理中', '8', 'customerorderstatus'),('11', '支払済み', '9', 'customerorderstatus');

-- レイアウト修正
TRUNCATE dtb_block_position;
INSERT INTO `dtb_block_position` (`section`, `block_id`, `layout_id`, `block_row`, `discriminator_type`)
VALUES
(3, 3, 2, 3, 'blockposition'),
(3, 7, 1, 0, 'blockposition'),
(3, 7, 2, 1, 'blockposition'),
(3, 10, 1, 1, 'blockposition'),
(3, 10, 2, 2, 'blockposition'),
(7, 2, 1, 2, 'blockposition'),
(7, 3, 1, 1, 'blockposition'),
(7, 12, 1, 0, 'blockposition'),
(10, 6, 1, 0, 'blockposition'),
(10, 6, 2, 1, 'blockposition'),
(11, 4, 1, 1, 'blockposition'),
(11, 4, 2, 2, 'blockposition'),
(11, 9, 1, 2, 'blockposition'),
(11, 9, 2, 3, 'blockposition'),
(11, 13, 1, 0, 'blockposition'),
(11, 13, 2, 1, 'blockposition');

-- 並び順初期化
TRUNCATE mtb_product_list_order_by;
INSERT INTO `mtb_product_list_order_by` (`id`, `name`, `sort_no`, `discriminator_type`)
VALUES
(1, '価格が低い順', 1, 'productlistorderby'),
(2, '新着順', 0, 'productlistorderby'),
(3, '価格が高い順', 2, 'productlistorderby');

-- 権限設定
TRUNCATE dtb_authority_role;
INSERT INTO `dtb_authority_role` (`authority_id`, `creator_id`, `deny_url`, `create_date`, `update_date`, `discriminator_type`)
VALUES
(1, 1, '/content/block', NOW(), NOW(), 'authorityrole'),
(1, 1, '/content/cache', NOW(), NOW(), 'authorityrole'),
(1, 1, '/content/css', NOW(), NOW(), 'authorityrole'),
(1, 1, '/content/js', NOW(), NOW(), 'authorityrole'),
(1, 1, '/content/layout', NOW(), NOW(), 'authorityrole'),
(1, 1, '/content/page', NOW(), NOW(), 'authorityrole'),
(1, 1, '/content/page/19/edit', NOW(), NOW(), 'authorityrole'),
(1, 1, '/content/page/21/edit', NOW(), NOW(), 'authorityrole'),
(1, 1, '/setting/shop/mail', NOW(), NOW(), 'authorityrole'),
(1, 1, '/setting/system/authority', NOW(), NOW(), 'authorityrole'),
(1, 1, '/setting/system/log', NOW(), NOW(), 'authorityrole'),
(1, 1, '/setting/system/masterdata', NOW(), NOW(), 'authorityrole'),
(1, 1, '/setting/system/member', NOW(), NOW(), 'authorityrole'),
(1, 1, '/setting/system/security', NOW(), NOW(), 'authorityrole'),
(1, 1, '/setting/system/system', NOW(), NOW(), 'authorityrole'),
(1, 1, '/store', NOW(), NOW(), 'authorityrole');

-- base_info修正
UPDATE dtb_base_info SET option_point = 0;

-- terada initialize
TRUNCATE customize_dtb_product_beer_container;
INSERT INTO `customize_dtb_product_beer_container` (`product_id`, `beer_container_id`, `discriminator_type`)
VALUES
(1,1,'productbeercontainer'),
(2,2,'productbeercontainer');

TRUNCATE dtb_category;
INSERT INTO `dtb_category` (`id`, `parent_category_id`, `creator_id`, `category_name`, `hierarchy`, `sort_no`, `create_date`, `update_date`, `discriminator_type`)
VALUES
(1,NULL,2,'樽',1,3,'2022-10-17 05:29:14','2022-11-05 14:12:25','category'),
(2,NULL,2,'瓶・缶',1,2,'2022-10-17 05:29:14','2022-11-05 14:12:34','category'),
(3,NULL,1,'その他',1,1,'2022-10-17 05:29:14','2022-10-17 05:29:14','category');
ALTER TABLE dtb_category AUTO_INCREMENT = 4;

TRUNCATE dtb_class_name;
INSERT INTO `dtb_class_name` (`id`, `creator_id`, `backend_name`, `name`, `sort_no`, `create_date`, `update_date`, `original_id`, `discriminator_type`)
VALUES
(1,2,'keg-10','樽10L',1,'2022-11-18 14:37:56','2022-11-18 14:37:56',NULL,'classname'),
(2,2,'keg-15','樽15L',2,'2022-11-18 14:38:07','2022-11-18 14:38:07',NULL,'classname'),
(3,2,'keg-20','樽20L',3,'2022-11-18 14:38:19','2022-11-18 14:38:19',NULL,'classname'),
(4,2,'bottle-334','瓶334ml',4,'2022-11-18 14:39:29','2022-11-18 14:39:29',NULL,'classname'),
(5,2,'bottle-500','瓶500ml',5,'2022-11-18 14:39:51','2022-11-18 14:39:51',NULL,'classname'),
(6,2,'bottle-633','瓶633ml',6,'2022-11-18 14:40:10','2022-11-18 14:40:10',NULL,'classname'),
(7,2,'can-350','缶350ml',7,'2022-11-18 14:40:23','2022-11-18 14:40:23',NULL,'classname'),
(8,2,'can-500','缶500ml',8,'2022-11-18 14:40:40','2022-11-18 14:40:40',NULL,'classname');
ALTER TABLE dtb_class_name AUTO_INCREMENT = 9;

TRUNCATE dtb_delivery;
INSERT INTO `dtb_delivery` (`id`, `creator_id`, `sale_type_id`, `delivery_type_id`, `name`, `service_name`, `description`, `confirm_url`, `sort_no`, `visible`, `create_date`, `update_date`, `free_area`, `discriminator_type`)
VALUES
(1,2,1,0,'佐川急便','クール便',NULL,'https://www.sagawa-exp.co.jp/send/howto-search.html',1,1,'2022-11-05 13:46:30','2022-11-05 13:50:57',NULL,'delivery'),
(2,2,1,0,'ヤマト運輸','クール宅急便',NULL,'https://www.kuronekoyamato.co.jp/ytc/customer/',2,1,'2022-11-18 14:14:18','2022-11-18 14:14:18',NULL,'delivery'),
(3,2,1,0,'日本郵便','チルドゆうパック',NULL,'https://trackings.post.japanpost.jp/services/srv/search/input',3,1,'2022-11-18 14:20:04','2022-11-18 14:20:04',NULL,'delivery'),
(4,2,1,1,'自社','クール',NULL,NULL,4,1,'2022-11-18 14:29:11','2022-11-18 14:29:11',NULL,'delivery');
ALTER TABLE dtb_delivery AUTO_INCREMENT = 5;

TRUNCATE dtb_delivery_duration;
INSERT INTO `dtb_delivery_duration` (`id`, `name`, `duration`, `sort_no`, `discriminator_type`)
VALUES
(1,'即日',0,0,'deliveryduration'),
(2,'1～2日後',1,1,'deliveryduration'),
(3,'3～4日後',3,2,'deliveryduration'),
(4,'1週間以降',7,3,'deliveryduration'),
(5,'2週間以降',14,4,'deliveryduration'),
(6,'3週間以降',21,5,'deliveryduration'),
(7,'1ヶ月以降',30,6,'deliveryduration'),
(8,'2ヶ月以降',60,7,'deliveryduration'),
(9,'お取り寄せ(商品入荷後)',-1,8,'deliveryduration');
ALTER TABLE dtb_delivery_duration AUTO_INCREMENT = 10;

TRUNCATE dtb_delivery_fee;
INSERT INTO `dtb_delivery_fee` (`id`, `delivery_id`, `pref_id`, `fee`, `discriminator_type`)
VALUES
(1,1,1,0.00,'deliveryfee'),
(2,1,2,0.00,'deliveryfee'),
(3,1,3,0.00,'deliveryfee'),
(4,1,4,0.00,'deliveryfee'),
(5,1,5,0.00,'deliveryfee'),
(6,1,6,0.00,'deliveryfee'),
(7,1,7,0.00,'deliveryfee'),
(8,1,8,0.00,'deliveryfee'),
(9,1,9,0.00,'deliveryfee'),
(10,1,10,0.00,'deliveryfee'),
(11,1,11,0.00,'deliveryfee'),
(12,1,12,0.00,'deliveryfee'),
(13,1,13,0.00,'deliveryfee'),
(14,1,14,0.00,'deliveryfee'),
(15,1,15,0.00,'deliveryfee'),
(16,1,16,0.00,'deliveryfee'),
(17,1,17,0.00,'deliveryfee'),
(18,1,18,0.00,'deliveryfee'),
(19,1,19,0.00,'deliveryfee'),
(20,1,20,0.00,'deliveryfee'),
(21,1,21,0.00,'deliveryfee'),
(22,1,22,0.00,'deliveryfee'),
(23,1,23,0.00,'deliveryfee'),
(24,1,24,0.00,'deliveryfee'),
(25,1,25,0.00,'deliveryfee'),
(26,1,26,0.00,'deliveryfee'),
(27,1,27,0.00,'deliveryfee'),
(28,1,28,0.00,'deliveryfee'),
(29,1,29,0.00,'deliveryfee'),
(30,1,30,0.00,'deliveryfee'),
(31,1,31,0.00,'deliveryfee'),
(32,1,32,0.00,'deliveryfee'),
(33,1,33,0.00,'deliveryfee'),
(34,1,34,0.00,'deliveryfee'),
(35,1,35,0.00,'deliveryfee'),
(36,1,36,0.00,'deliveryfee'),
(37,1,37,0.00,'deliveryfee'),
(38,1,38,0.00,'deliveryfee'),
(39,1,39,0.00,'deliveryfee'),
(40,1,40,0.00,'deliveryfee'),
(41,1,41,0.00,'deliveryfee'),
(42,1,42,0.00,'deliveryfee'),
(43,1,43,0.00,'deliveryfee'),
(44,1,44,0.00,'deliveryfee'),
(45,1,45,0.00,'deliveryfee'),
(46,1,46,0.00,'deliveryfee'),
(47,1,47,0.00,'deliveryfee'),
(48,2,1,0.00,'deliveryfee'),
(49,2,2,0.00,'deliveryfee'),
(50,2,3,0.00,'deliveryfee'),
(51,2,4,0.00,'deliveryfee'),
(52,2,5,0.00,'deliveryfee'),
(53,2,6,0.00,'deliveryfee'),
(54,2,7,0.00,'deliveryfee'),
(55,2,8,0.00,'deliveryfee'),
(56,2,9,0.00,'deliveryfee'),
(57,2,10,0.00,'deliveryfee'),
(58,2,11,0.00,'deliveryfee'),
(59,2,12,0.00,'deliveryfee'),
(60,2,13,0.00,'deliveryfee'),
(61,2,14,0.00,'deliveryfee'),
(62,2,15,0.00,'deliveryfee'),
(63,2,16,0.00,'deliveryfee'),
(64,2,17,0.00,'deliveryfee'),
(65,2,18,0.00,'deliveryfee'),
(66,2,19,0.00,'deliveryfee'),
(67,2,20,0.00,'deliveryfee'),
(68,2,21,0.00,'deliveryfee'),
(69,2,22,0.00,'deliveryfee'),
(70,2,23,0.00,'deliveryfee'),
(71,2,24,0.00,'deliveryfee'),
(72,2,25,0.00,'deliveryfee'),
(73,2,26,0.00,'deliveryfee'),
(74,2,27,0.00,'deliveryfee'),
(75,2,28,0.00,'deliveryfee'),
(76,2,29,0.00,'deliveryfee'),
(77,2,30,0.00,'deliveryfee'),
(78,2,31,0.00,'deliveryfee'),
(79,2,32,0.00,'deliveryfee'),
(80,2,33,0.00,'deliveryfee'),
(81,2,34,0.00,'deliveryfee'),
(82,2,35,0.00,'deliveryfee'),
(83,2,36,0.00,'deliveryfee'),
(84,2,37,0.00,'deliveryfee'),
(85,2,38,0.00,'deliveryfee'),
(86,2,39,0.00,'deliveryfee'),
(87,2,40,0.00,'deliveryfee'),
(88,2,41,0.00,'deliveryfee'),
(89,2,42,0.00,'deliveryfee'),
(90,2,43,0.00,'deliveryfee'),
(91,2,44,0.00,'deliveryfee'),
(92,2,45,0.00,'deliveryfee'),
(93,2,46,0.00,'deliveryfee'),
(94,2,47,0.00,'deliveryfee'),
(95,3,1,0.00,'deliveryfee'),
(96,3,2,0.00,'deliveryfee'),
(97,3,3,0.00,'deliveryfee'),
(98,3,4,0.00,'deliveryfee'),
(99,3,5,0.00,'deliveryfee'),
(100,3,6,0.00,'deliveryfee'),
(101,3,7,0.00,'deliveryfee'),
(102,3,8,0.00,'deliveryfee'),
(103,3,9,0.00,'deliveryfee'),
(104,3,10,0.00,'deliveryfee'),
(105,3,11,0.00,'deliveryfee'),
(106,3,12,0.00,'deliveryfee'),
(107,3,13,0.00,'deliveryfee'),
(108,3,14,0.00,'deliveryfee'),
(109,3,15,0.00,'deliveryfee'),
(110,3,16,0.00,'deliveryfee'),
(111,3,17,0.00,'deliveryfee'),
(112,3,18,0.00,'deliveryfee'),
(113,3,19,0.00,'deliveryfee'),
(114,3,20,0.00,'deliveryfee'),
(115,3,21,0.00,'deliveryfee'),
(116,3,22,0.00,'deliveryfee'),
(117,3,23,0.00,'deliveryfee'),
(118,3,24,0.00,'deliveryfee'),
(119,3,25,0.00,'deliveryfee'),
(120,3,26,0.00,'deliveryfee'),
(121,3,27,0.00,'deliveryfee'),
(122,3,28,0.00,'deliveryfee'),
(123,3,29,0.00,'deliveryfee'),
(124,3,30,0.00,'deliveryfee'),
(125,3,31,0.00,'deliveryfee'),
(126,3,32,0.00,'deliveryfee'),
(127,3,33,0.00,'deliveryfee'),
(128,3,34,0.00,'deliveryfee'),
(129,3,35,0.00,'deliveryfee'),
(130,3,36,0.00,'deliveryfee'),
(131,3,37,0.00,'deliveryfee'),
(132,3,38,0.00,'deliveryfee'),
(133,3,39,0.00,'deliveryfee'),
(134,3,40,0.00,'deliveryfee'),
(135,3,41,0.00,'deliveryfee'),
(136,3,42,0.00,'deliveryfee'),
(137,3,43,0.00,'deliveryfee'),
(138,3,44,0.00,'deliveryfee'),
(139,3,45,0.00,'deliveryfee'),
(140,3,46,0.00,'deliveryfee'),
(141,3,47,0.00,'deliveryfee'),
(142,4,1,0.00,'deliveryfee'),
(143,4,2,0.00,'deliveryfee'),
(144,4,3,0.00,'deliveryfee'),
(145,4,4,0.00,'deliveryfee'),
(146,4,5,0.00,'deliveryfee'),
(147,4,6,0.00,'deliveryfee'),
(148,4,7,0.00,'deliveryfee'),
(149,4,8,0.00,'deliveryfee'),
(150,4,9,0.00,'deliveryfee'),
(151,4,10,0.00,'deliveryfee'),
(152,4,11,0.00,'deliveryfee'),
(153,4,12,0.00,'deliveryfee'),
(154,4,13,0.00,'deliveryfee'),
(155,4,14,0.00,'deliveryfee'),
(156,4,15,0.00,'deliveryfee'),
(157,4,16,0.00,'deliveryfee'),
(158,4,17,0.00,'deliveryfee'),
(159,4,18,0.00,'deliveryfee'),
(160,4,19,0.00,'deliveryfee'),
(161,4,20,0.00,'deliveryfee'),
(162,4,21,0.00,'deliveryfee'),
(163,4,22,0.00,'deliveryfee'),
(164,4,23,0.00,'deliveryfee'),
(165,4,24,0.00,'deliveryfee'),
(166,4,25,0.00,'deliveryfee'),
(167,4,26,0.00,'deliveryfee'),
(168,4,27,0.00,'deliveryfee'),
(169,4,28,0.00,'deliveryfee'),
(170,4,29,0.00,'deliveryfee'),
(171,4,30,0.00,'deliveryfee'),
(172,4,31,0.00,'deliveryfee'),
(173,4,32,0.00,'deliveryfee'),
(174,4,33,0.00,'deliveryfee'),
(175,4,34,0.00,'deliveryfee'),
(176,4,35,0.00,'deliveryfee'),
(177,4,36,0.00,'deliveryfee'),
(178,4,37,0.00,'deliveryfee'),
(179,4,38,0.00,'deliveryfee'),
(180,4,39,0.00,'deliveryfee'),
(181,4,40,0.00,'deliveryfee'),
(182,4,41,0.00,'deliveryfee'),
(183,4,42,0.00,'deliveryfee'),
(184,4,43,0.00,'deliveryfee'),
(185,4,44,0.00,'deliveryfee'),
(186,4,45,0.00,'deliveryfee'),
(187,4,46,0.00,'deliveryfee'),
(188,4,47,0.00,'deliveryfee');
ALTER TABLE dtb_delivery_fee AUTO_INCREMENT = 189;

TRUNCATE dtb_delivery_time;
INSERT INTO `dtb_delivery_time` (`id`, `delivery_id`, `delivery_time`, `sort_no`, `visible`, `create_date`, `update_date`, `discriminator_type`)
VALUES
(3,1,'午前中（8時～12時）',1,1,'2022-11-05 13:46:30','2022-11-12 01:10:06','deliverytime'),
(4,1,'12時～14時',2,1,'2022-11-05 13:46:30','2022-11-12 01:10:06','deliverytime'),
(5,1,'14時～16時',3,1,'2022-11-05 13:46:30','2022-11-12 01:10:06','deliverytime'),
(6,1,'16時～18時',4,1,'2022-11-05 13:46:30','2022-11-12 01:10:06','deliverytime'),
(7,1,'18時～20時',5,1,'2022-11-05 13:46:30','2022-11-12 01:10:06','deliverytime'),
(8,1,'18時～21時',6,1,'2022-11-05 13:46:30','2022-11-12 01:10:06','deliverytime'),
(9,1,'19時～21時',7,1,'2022-11-05 13:46:30','2022-11-12 01:10:06','deliverytime'),
(10,2,'午前中',1,1,'2022-11-18 14:14:18','2022-11-18 14:17:21','deliverytime'),
(11,2,'14:00 ～ 16:00',2,1,'2022-11-18 14:14:18','2022-11-18 14:17:21','deliverytime'),
(12,2,'16:00 ～ 18:00',3,1,'2022-11-18 14:14:18','2022-11-18 14:17:21','deliverytime'),
(13,2,'18:00 ～ 20:00',4,1,'2022-11-18 14:14:18','2022-11-18 14:17:21','deliverytime'),
(14,2,'19:00 ～ 21:00',5,1,'2022-11-18 14:14:18','2022-11-18 14:17:21','deliverytime'),
(15,3,'8:00 ～ 12:00',1,1,'2022-11-18 14:20:04','2022-11-18 14:22:52','deliverytime'),
(16,3,'12:00 ～ 17:00',2,1,'2022-11-18 14:20:04','2022-11-18 14:22:52','deliverytime'),
(17,3,'17:00 ～ 21:00',3,1,'2022-11-18 14:20:04','2022-11-18 14:22:52','deliverytime'),
(18,4,'午前中',1,1,'2022-11-18 14:29:11','2022-11-18 14:29:11','deliverytime'),
(19,4,'午後',2,1,'2022-11-18 14:29:11','2022-11-18 14:29:11','deliverytime');
ALTER TABLE dtb_delivery_time AUTO_INCREMENT = 20;

TRUNCATE dtb_payment;
INSERT INTO `dtb_payment` (`id`, `creator_id`, `payment_method`, `charge`, `rule_max`, `sort_no`, `fixed`, `payment_image`, `rule_min`, `method_class`, `visible`, `create_date`, `update_date`, `discriminator_typ
e`)
VALUES
(1,2,'郵便振替',0.00,NULL,7,1,NULL,0.00,'Eccube\\Service\\Payment\\Method\\Cash',0,'2017-03-07 10:14:52','2022-11-05 13:54:57','payment'),
(2,2,'現金書留',0.00,NULL,6,1,NULL,0.00,'Eccube\\Service\\Payment\\Method\\Cash',0,'2017-03-07 10:14:52','2022-11-05 13:55:01','payment'),
(3,2,'銀行振込',0.00,NULL,5,1,NULL,0.00,'Eccube\\Service\\Payment\\Method\\Cash',0,'2017-03-07 10:14:52','2022-11-05 13:55:00','payment'),
(4,2,'代金引換（佐川急便・e-コレクト）',0.00,NULL,4,1,NULL,0.00,'Eccube\\Service\\Payment\\Method\\Cash',0,'2017-03-07 10:14:52','2022-11-05 13:55:02','payment'),
(5,2,'請求書払い（月末締め翌月払い）',0.00,NULL,3,1,NULL,NULL,'Eccube\\Service\\Payment\\Method\\Cash',1,'2022-11-05 13:52:23','2022-11-05 13:54:51','payment'),
(6,2,'請求書払い（その他）',0.00,NULL,2,1,NULL,NULL,'Eccube\\Service\\Payment\\Method\\Cash',0,'2022-11-05 13:52:31','2022-11-05 13:55:04','payment'),
(7,2,'代金引換（日本郵便・ゆうパック）',0.00,NULL,1,1,NULL,NULL,'Eccube\\Service\\Payment\\Method\\Cash',0,'2022-11-05 13:54:07','2022-11-05 13:55:06','payment');
ALTER TABLE dtb_payment AUTO_INCREMENT = 8;

TRUNCATE dtb_payment_option;
INSERT INTO `dtb_payment_option` (`delivery_id`, `payment_id`, `discriminator_type`)
VALUES
(1,4,'paymentoption'),
(2,5,'paymentoption'),
(3,5,'paymentoption'),
(4,5,'paymentoption');

TRUNCATE dtb_product;
INSERT INTO `dtb_product` (`id`, `creator_id`, `product_status_id`, `beer_style_id`, `beer_type_id`, `name`, `note`, `description_list`, `description_detail`, `search_word`, `free_area`, `create_date`, `update_date`, `alcohol_percentage`, `publish_date`, `mixpack_flag`, `list_open_flag`, `discriminator_type`)
VALUES
(1,2,1,1,1,'【サンプル】Best Beer-15L',NULL,NULL,'Best Beer Japanの定番ビールです。\r\n麦の旨味がぎゅっと詰まったピルスナーです。',NULL,NULL,'2022-10-20 11:53:38','2022-12-07 10:18:51',5.00,NULL,0,1,'product'),
(2,2,1,4,1,'【サンプル】Best IPA',NULL,NULL,NULL,NULL,NULL,'2022-11-11 13:22:52','2022-11-18 14:29:59',7.00,NULL,0,1,'product');
ALTER TABLE dtb_product AUTO_INCREMENT = 3;

TRUNCATE dtb_product_class;
INSERT INTO `dtb_product_class` (`id`, `product_id`, `sale_type_id`, `class_category_id1`, `class_category_id2`, `delivery_duration_id`, `creator_id`, `product_code`, `stock`, `stock_unlimited`, `sale_limit`, `price01`, `price02`, `delivery_fee`, `visible`, `create_date`, `update_date`, `currency_code`, `point_rate`, `bbj_price`, `discriminator_type`)
VALUES
(1,1,1,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,50000.00,NULL,1,'2022-10-20 11:53:38','2022-12-07 10:18:51','JPY',NULL,NULL,'productclass'),
(2,2,1,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,1000.00,NULL,1,'2022-11-11 13:22:52','2022-11-18 14:29:59','JPY',NULL,NULL,'productclass');
ALTER TABLE dtb_product_class AUTO_INCREMENT = 3;

TRUNCATE dtb_product_stock;
INSERT INTO `dtb_product_stock` (`id`, `product_class_id`, `creator_id`, `stock`, `create_date`, `update_date`, `discriminator_type`)
VALUES
(1,1,2,NULL,'2022-10-20 11:53:38','2022-10-20 11:53:38','productstock'),
(2,2,2,NULL,'2022-11-11 13:22:52','2022-11-11 13:22:52','productstock');
ALTER TABLE dtb_product_stock AUTO_INCREMENT = 3;

TRUNCATE plg_delivery_fee_extension_dtb_delivery_area;
INSERT INTO `plg_delivery_fee_extension_dtb_delivery_area` (`id`, `delivery_id`, `name`, `sort_no`, `discriminator_type`)
VALUES
(1,1,'北海道',1,'deliveryarea'),
(2,1,'北東北',2,'deliveryarea'),
(3,1,'南東北',3,'deliveryarea'),
(4,1,'関東',4,'deliveryarea'),
(5,1,'北陸',5,'deliveryarea'),
(6,1,'信越',6,'deliveryarea'),
(7,1,'東海',7,'deliveryarea'),
(8,1,'関西',8,'deliveryarea'),
(9,1,'中国',9,'deliveryarea'),
(10,1,'四国',10,'deliveryarea'),
(11,1,'北九州',11,'deliveryarea'),
(12,1,'南九州',12,'deliveryarea'),
(13,1,'沖縄',13,'deliveryarea'),
(14,2,'北海道',1,'deliveryarea'),
(15,2,'北東北',2,'deliveryarea'),
(16,2,'南東北',3,'deliveryarea'),
(17,2,'関東',4,'deliveryarea'),
(18,2,'信越',5,'deliveryarea'),
(19,2,'北陸',6,'deliveryarea'),
(20,2,'中部',7,'deliveryarea'),
(21,2,'関西',8,'deliveryarea'),
(22,2,'中国',9,'deliveryarea'),
(23,2,'四国',10,'deliveryarea'),
(24,2,'九州',11,'deliveryarea'),
(25,2,'沖縄',12,'deliveryarea'),
(26,3,'北海道',1,'deliveryarea'),
(27,3,'東北',2,'deliveryarea'),
(28,3,'関東',3,'deliveryarea'),
(29,3,'信越',4,'deliveryarea'),
(30,3,'北陸',5,'deliveryarea'),
(31,3,'東海',6,'deliveryarea'),
(32,3,'近畿',7,'deliveryarea'),
(33,3,'中国',8,'deliveryarea'),
(34,3,'四国',9,'deliveryarea'),
(35,3,'九州',10,'deliveryarea'),
(36,3,'沖縄',11,'deliveryarea');
ALTER TABLE plg_delivery_fee_extension_dtb_delivery_area AUTO_INCREMENT = 37;

TRUNCATE plg_delivery_fee_extension_dtb_delivery_pref_area;
INSERT INTO `plg_delivery_fee_extension_dtb_delivery_pref_area` (`pref_id`, `delivery_area_id`, `delivery_id`, `discriminator_type`)
VALUES
(1,1,1,'deliveryprefarea'),
(1,14,2,'deliveryprefarea'),
(1,26,3,'deliveryprefarea'),
(2,2,1,'deliveryprefarea'),
(2,15,2,'deliveryprefarea'),
(2,27,3,'deliveryprefarea'),
(3,2,1,'deliveryprefarea'),
(3,15,2,'deliveryprefarea'),
(3,27,3,'deliveryprefarea'),
(4,3,1,'deliveryprefarea'),
(4,16,2,'deliveryprefarea'),
(4,27,3,'deliveryprefarea'),
(5,2,1,'deliveryprefarea'),
(5,15,2,'deliveryprefarea'),
(5,27,3,'deliveryprefarea'),
(6,3,1,'deliveryprefarea'),
(6,16,2,'deliveryprefarea'),
(6,27,3,'deliveryprefarea'),
(7,3,1,'deliveryprefarea'),
(7,16,2,'deliveryprefarea'),
(7,27,3,'deliveryprefarea'),
(8,4,1,'deliveryprefarea'),
(8,17,2,'deliveryprefarea'),
(8,28,3,'deliveryprefarea'),
(9,4,1,'deliveryprefarea'),
(9,17,2,'deliveryprefarea'),
(9,28,3,'deliveryprefarea'),
(10,4,1,'deliveryprefarea'),
(10,17,2,'deliveryprefarea'),
(10,28,3,'deliveryprefarea'),
(11,4,1,'deliveryprefarea'),
(11,17,2,'deliveryprefarea'),
(11,28,3,'deliveryprefarea'),
(12,4,1,'deliveryprefarea'),
(12,17,2,'deliveryprefarea'),
(12,28,3,'deliveryprefarea'),
(13,4,1,'deliveryprefarea'),
(13,17,2,'deliveryprefarea'),
(13,28,3,'deliveryprefarea'),
(14,4,1,'deliveryprefarea'),
(14,17,2,'deliveryprefarea'),
(14,28,3,'deliveryprefarea'),
(15,6,1,'deliveryprefarea'),
(15,18,2,'deliveryprefarea'),
(15,29,3,'deliveryprefarea'),
(16,5,1,'deliveryprefarea'),
(16,19,2,'deliveryprefarea'),
(16,30,3,'deliveryprefarea'),
(17,5,1,'deliveryprefarea'),
(17,19,2,'deliveryprefarea'),
(17,30,3,'deliveryprefarea'),
(18,5,1,'deliveryprefarea'),
(18,19,2,'deliveryprefarea'),
(18,30,3,'deliveryprefarea'),
(19,4,1,'deliveryprefarea'),
(19,17,2,'deliveryprefarea'),
(19,28,3,'deliveryprefarea'),
(20,6,1,'deliveryprefarea'),
(20,18,2,'deliveryprefarea'),
(20,29,3,'deliveryprefarea'),
(21,7,1,'deliveryprefarea'),
(21,20,2,'deliveryprefarea'),
(21,31,3,'deliveryprefarea'),
(22,7,1,'deliveryprefarea'),
(22,20,2,'deliveryprefarea'),
(22,31,3,'deliveryprefarea'),
(23,7,1,'deliveryprefarea'),
(23,20,2,'deliveryprefarea'),
(23,31,3,'deliveryprefarea'),
(24,7,1,'deliveryprefarea'),
(24,20,2,'deliveryprefarea'),
(24,31,3,'deliveryprefarea'),
(25,8,1,'deliveryprefarea'),
(25,21,2,'deliveryprefarea'),
(25,32,3,'deliveryprefarea'),
(26,8,1,'deliveryprefarea'),
(26,21,2,'deliveryprefarea'),
(26,32,3,'deliveryprefarea'),
(27,8,1,'deliveryprefarea'),
(27,21,2,'deliveryprefarea'),
(27,32,3,'deliveryprefarea'),
(28,8,1,'deliveryprefarea'),
(28,21,2,'deliveryprefarea'),
(28,32,3,'deliveryprefarea'),
(29,8,1,'deliveryprefarea'),
(29,21,2,'deliveryprefarea'),
(29,32,3,'deliveryprefarea'),
(30,8,1,'deliveryprefarea'),
(30,21,2,'deliveryprefarea'),
(30,32,3,'deliveryprefarea'),
(31,9,1,'deliveryprefarea'),
(31,22,2,'deliveryprefarea'),
(31,33,3,'deliveryprefarea'),
(32,9,1,'deliveryprefarea'),
(32,22,2,'deliveryprefarea'),
(32,33,3,'deliveryprefarea'),
(33,9,1,'deliveryprefarea'),
(33,22,2,'deliveryprefarea'),
(33,33,3,'deliveryprefarea'),
(34,9,1,'deliveryprefarea'),
(34,22,2,'deliveryprefarea'),
(34,33,3,'deliveryprefarea'),
(35,9,1,'deliveryprefarea'),
(35,22,2,'deliveryprefarea'),
(35,33,3,'deliveryprefarea'),
(36,10,1,'deliveryprefarea'),
(36,23,2,'deliveryprefarea'),
(36,33,3,'deliveryprefarea'),
(37,10,1,'deliveryprefarea'),
(37,23,2,'deliveryprefarea'),
(37,34,3,'deliveryprefarea'),
(38,10,1,'deliveryprefarea'),
(38,23,2,'deliveryprefarea'),
(38,34,3,'deliveryprefarea'),
(39,10,1,'deliveryprefarea'),
(39,23,2,'deliveryprefarea'),
(39,34,3,'deliveryprefarea'),
(40,11,1,'deliveryprefarea'),
(40,24,2,'deliveryprefarea'),
(40,35,3,'deliveryprefarea'),
(41,11,1,'deliveryprefarea'),
(41,24,2,'deliveryprefarea'),
(41,35,3,'deliveryprefarea'),
(42,11,1,'deliveryprefarea'),
(42,24,2,'deliveryprefarea'),
(42,35,3,'deliveryprefarea'),
(43,12,1,'deliveryprefarea'),
(43,24,2,'deliveryprefarea'),
(43,35,3,'deliveryprefarea'),
(44,11,1,'deliveryprefarea'),
(44,24,2,'deliveryprefarea'),
(44,35,3,'deliveryprefarea'),
(45,12,1,'deliveryprefarea'),
(45,24,2,'deliveryprefarea'),
(45,35,3,'deliveryprefarea'),
(46,12,1,'deliveryprefarea'),
(46,24,2,'deliveryprefarea'),
(46,35,3,'deliveryprefarea'),
(47,13,1,'deliveryprefarea'),
(47,25,2,'deliveryprefarea'),
(47,36,3,'deliveryprefarea');

TRUNCATE plg_delivery_fee_extension_dtb_delivery_size;
INSERT INTO `plg_delivery_fee_extension_dtb_delivery_size` (`id`, `product_size_id`, `delivery_size_condition_id`, `name`, `quantity`, `sort_no`, `create_date`, `update_date`, `discriminator_type`)
VALUES
(1,1,1,'樽10L1本',1,1,'2022-11-18 14:25:38','2022-11-18 14:25:38','deliverysize'),
(2,2,1,'樽15L1本',1,2,'2022-11-18 14:25:51','2022-11-18 14:25:51','deliverysize'),
(3,4,1,'瓶6本',1,5,'2022-11-18 14:26:18','2022-11-18 14:27:06','deliverysize'),
(4,5,1,'瓶24本',1,4,'2022-11-18 14:26:30','2022-11-18 14:27:12','deliverysize'),
(5,3,1,'樽20L1本',1,3,'2022-11-18 14:26:46','2022-11-18 14:27:12','deliverysize'),
(6,6,1,'缶6本',1,6,'2022-11-18 14:27:03','2022-11-18 14:27:03','deliverysize'),
(7,7,1,'グッズ',1,7,'2022-11-18 14:27:37','2022-11-18 14:27:37','deliverysize');
ALTER TABLE plg_delivery_fee_extension_dtb_delivery_size AUTO_INCREMENT = 8;

TRUNCATE plg_delivery_fee_extension_dtb_delivery_size_area_fee;
ALTER TABLE plg_delivery_fee_extension_dtb_delivery_size_area AUTO_INCREMENT = 1;

TRUNCATE plg_delivery_fee_extension_dtb_product_delivery_product_size;
INSERT INTO `plg_delivery_fee_extension_dtb_product_delivery_product_size` (`product_class_id`, `delivery_id`, `product_size_id`, `visible`, `discriminator_type`)
VALUES
(1,1,NULL,1,'productdeliveryproductsize'),
(1,2,NULL,1,'productdeliveryproductsize'),
(1,3,NULL,1,'productdeliveryproductsize'),
(1,4,NULL,1,'productdeliveryproductsize'),
(2,1,NULL,1,'productdeliveryproductsize'),
(2,2,NULL,1,'productdeliveryproductsize'),
(2,3,NULL,1,'productdeliveryproductsize'),
(2,4,NULL,1,'productdeliveryproductsize');

TRUNCATE plg_delivery_fee_extension_dtb_product_size;
INSERT INTO `plg_delivery_fee_extension_dtb_product_size` (`id`, `name`, `sort_no`, `create_date`, `update_date`, `discriminator_type`)
VALUES
(1,'樽10L',1,'2022-11-18 14:24:13','2022-11-18 14:24:13','productsize'),
(2,'樽15L',2,'2022-11-18 14:24:19','2022-11-18 14:24:19','productsize'),
(3,'樽20L',3,'2022-11-18 14:24:26','2022-11-18 14:24:26','productsize'),
(4,'瓶6本',4,'2022-11-18 14:24:42','2022-11-18 14:24:42','productsize'),
(5,'瓶24本',5,'2022-11-18 14:24:50','2022-11-18 14:24:50','productsize'),
(6,'缶6本',6,'2022-11-18 14:24:56','2022-11-18 14:24:56','productsize'),
(7,'グッズ',7,'2022-11-18 14:27:29','2022-11-18 14:27:29','productsize');
ALTER TABLE plg_delivery_fee_extension_dtb_product_size AUTO_INCREMENT = 8;

set foreign_key_checks = 1;
