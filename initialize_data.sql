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
UPDATE dtb_base_info SET option_point = 0, delivery_fee_extension_enabled = 1;

TRUNCATE dtb_category;
INSERT INTO `dtb_category` (`id`, `parent_category_id`, `creator_id`, `category_name`, `hierarchy`, `sort_no`, `create_date`, `update_date`, `discriminator_type`)
VALUES
(1,NULL,2,'樽',1,3,now(),now(),'category'),
(2,NULL,2,'瓶・缶',1,2,now(),now(),'category'),
(3,NULL,1,'その他',1,1,now(),now(),'category');
ALTER TABLE dtb_category AUTO_INCREMENT = 4;

TRUNCATE dtb_class_name;
INSERT INTO `dtb_class_name` (`id`, `creator_id`, `backend_name`, `name`, `sort_no`, `create_date`, `update_date`, `discriminator_type`, `original_id`)
VALUES
	(1, 1, '樽', '樽', 1, now(), now(), 'classname', NULL),
	(2, 1, '瓶', '瓶', 2, now(), now(), 'classname', NULL),
	(3, 1, '缶', '缶', 3, now(), now(), 'classname', NULL);
ALTER TABLE dtb_class_name AUTO_INCREMENT = 4;

TRUNCATE dtb_class_category;
INSERT INTO `dtb_class_category` (`id`, `class_name_id`, `creator_id`, `backend_name`, `name`, `sort_no`, `visible`, `create_date`, `update_date`, `discriminator_type`)
VALUES
	(1, 1, 1, '10L', '10L', 1, 1, now(), now(), 'classcategory'),
	(2, 1, 1, '15L', '15L', 2, 1, now(), now(), 'classcategory'),
	(3, 1, 1, '20L', '20L', 3, 1, now(), now(), 'classcategory'),
	(4, 2, 1, '330ml', '330ml', 1, 1, now(), now(), 'classcategory'),
	(5, 2, 1, '700ml', '700ml', 2, 1, now(), now(), 'classcategory'),
	(6, 3, 1, '350ml', '350ml', 1, 1, now(), now(), 'classcategory'),
	(7, 3, 1, '500ml', '500ml', 2, 1, now(), now(), 'classcategory');
ALTER TABLE dtb_class_category AUTO_INCREMENT = 4;

TRUNCATE dtb_delivery;
INSERT INTO `dtb_delivery` (`id`, `creator_id`, `sale_type_id`, `name`, `service_name`, `description`, `confirm_url`, `sort_no`, `visible`, `create_date`, `update_date`, `discriminator_type`, `delivery_type_id`, `free_area`)
VALUES
	(1, 1, 1, '佐川急便', '佐川クール便  (社内の名前、注文詳細に表示)', 'こちらのページはすでに佐川急便のエリアに設定しております。\r\n時間帯も佐川の時間になっております。\r\n時間帯を変更すると時間が送り状に表示されなくなるのでご注意ください。\r\n\r\n配送方法設定マニュアル\r\nhttps://bestbeerjapan.notion.site/5aa2279b54f940128dcc2b48c49b2854\r\n\r\n運送会社の送り状ソフトと連携について\r\nhttps://bestbeerjapan.notion.site/e632abfd416a4111a74bff8e96235143', 'https://www.sagawa-exp.co.jp/send/howto-search.html', 1, 1, now(), now(), 'delivery', 0, '13:00以降のご注文は翌日発送になります。\r\n土日は発送しません。\r\n初めてのお客様は必ず代引きにしてください。\r\n（初めてではないお客様も代引きが可能です。)'),
	(2, 1, 1, 'ヤマト運輸', 'ヤマトクール宅急便  (社内の名前、注文詳細に表示)', 'こちらのページはすでにヤマト運輸のエリアに設定しております。\r\n時間帯もヤマト宅急便の時間になっております。\r\n時間帯を変更すると時間が送り状に表示されなくなるのでご注意ください。\r\n\r\n配送方法設定マニュアル\r\nhttps://bestbeerjapan.notion.site/5aa2279b54f940128dcc2b48c49b2854\r\n\r\n運送会社の送り状ソフトと連携について\r\nhttps://bestbeerjapan.notion.site/e632abfd416a4111a74bff8e96235143', 'https://www.kuronekoyamato.co.jp/ytc/customer/', 2, 1, now(), now(), 'delivery', 0, '13:00以降のご注文は翌日発送になります。\r\n土日は発送しません。\r\n初めてのお客様は必ず代引きにしてください。\r\n（初めてではないお客様も代引きが可能です。)'),
	(3, 1, 1, '日本郵便', 'チルドゆうパック  (社内の名前、注文詳細に表示)', 'こちらのページはすでに日本郵便のエリアに設定しております。\r\n時間帯もゆうパックの時間になっております。\r\n時間帯を変更すると時間が送り状に表示されなくなるのでご注意ください。\r\n\r\n配送方法設定マニュアル\r\nhttps://bestbeerjapan.notion.site/5aa2279b54f940128dcc2b48c49b2854\r\n\r\n運送会社の送り状ソフトと連携について\r\nhttps://bestbeerjapan.notion.site/e632abfd416a4111a74bff8e96235143', 'https://trackings.post.japanpost.jp/services/srv/search/input', 3, 1, now(), now(), 'delivery', 0, '13:00以降のご注文は翌日発送になります。\r\n土日は発送しません。\r\n初めてのお客様は必ず代引きにしてください。\r\n（初めてではないお客様も代引きが可能です。)'),
	(4, 1, 1, '自社配送【〇〇市限定】', '自社配送 (社内の名前、注文詳細に表示)', '指定した会員しか自社配送を使えません。\r\n\r\n会員管理 > 会員一覧 > 詳細ページ > 下にある「自社配送設定」で会員に紐付けてください。\r\n\r\n自社で配送することに関わらず、特定した会員に別の送料を紐付けたい場合に自社配送設定が便利です。\r\n（自社配送が一番よく使われる使用方法なので機能の名前は自社配送にしているだけです。）\r\n\r\n他社の運送会社と違って、自社配送の場合は樽やケースを一緒に送ることができるでしょう。\r\n（運送会社だと樽とケースを結束して送れないので別々2口として送ることになります。)\r\n\r\n店舗がもっと買ってもらうインセンティブを作るために下記のような設定も可能です。\r\n\r\n1樽 = 1000円\r\n1ケース = 1000円\r\n2個以上 (1ケース、1樽を含む) = 0円\r\nのような設定をしたい場合は自社配送専用の商品サイズと配送サイズを作ってください。\r\n上記の例だと\r\n商品サイズ：「樽・ケース自社配送用」\r\n上記の商品サイズを下記の配送サイズに紐付けます：\r\n配送サイズ：「樽・ケース自社配送」1個毎\r\n配送サイズ：「樽・ケース自社配送2個以上」2個以上\r\n\r\n自社配送設定マニュアル\r\nhttps://bestbeerjapan.notion.site/15caa7ff42074d8d96709713a3c63afe\r\n\r\n設定が分からない場合はBest Beer Japanにお問い合わせください。', NULL, 6, 1, now(), now(), 'delivery', 1, '自社配送は〇〇市限定になります。\r\n自社配送の配送日は毎週月曜日に配達いたします。\r\n急ぎで納品をご希望の場合、自社配送ではなく、他社配送をご利用ください。'),
	(5, 1, 1, '弊社指定配送業者', '弊社指定配送業者  (社内の名前、注文詳細に表示)', '弊社指定配送業者のご利用方法\r\n商品毎に配送業者が異なる場合は、「弊社指定配送業者」を選択します。\r\n例、樽10Lは佐川・樽15Lはゆうパック、瓶はヤマト、沖縄県はゆうパックなどの際。\r\n理由としては、お客様が購入画面より配送方法を指定する際に、「佐川」「ヤマト」「ゆうパック」の表示が複数ある場合は、どの配送業者を指定すればいいのかわかりません。\r\nその為にお客様の購入画面には、「弊社指定配送業者」のみ表示させることでお客様は指定先がわかります。\r\n注意書きに、樽10Lは佐川・樽15Lはゆうパック、瓶はヤマトなどの記載をしましょう。\r\n\r\nエリア名も自由に設定ができます。例えば送料設定をシンプルにしたい場合は本州・本州以外の2つのエリアだけ作ることができます。\r\n\r\n配送方法設定マニュアル\r\nhttps://bestbeerjapan.notion.site/5aa2279b54f940128dcc2b48c49b2854', NULL, 4, 1, now(), now(), 'delivery', 0, '樽10Lは佐川、樽15Lはゆうパック\r\n瓶1ケースはヤマト\r\n沖縄県は全てゆうパックでお送りいたします。'),
	(6, 1, 1, '直接受取', '直接受取 (社内の名前、注文詳細に表示)', '指定した会員しか自社配送を使えません。\r\n\r\n会員管理 > 会員一覧 > 詳細ページ > 下にある「自社配送設定」で会員に紐付けてください。\r\n\r\n自社で配送することに関わらず、特定した会員に別の送料を紐付けたい場合に自社配送設定が便利です。\r\n（自社配送が一番よく使われる使用方法なので機能の名前は自社配送にしているだけです。）\r\n\r\n他社の運送会社と違って、自社配送の場合は樽やケースを一緒に送ることができるでしょう。\r\n（運送会社だと樽とケースを結束して送れないので別々2口として送ることになります。)\r\n\r\n店舗がもっと買ってもらうインセンティブを作るために下記のような設定も可能です。\r\n\r\n1樽 = 1000円\r\n1ケース = 1000円\r\n2個以上 (1ケース、1樽を含む) = 0円\r\nのような設定をしたい場合は自社配送専用の商品サイズと配送サイズを作ってください。\r\n上記の例だと\r\n商品サイズ：「樽・ケース自社配送用」\r\n上記の商品サイズを下記の配送サイズに紐付けます：\r\n配送サイズ：「樽・ケース自社配送」1個毎\r\n配送サイズ：「樽・ケース自社配送2個以上」2個以上\r\n\r\n自社配送設定マニュアル\r\nhttps://bestbeerjapan.notion.site/15caa7ff42074d8d96709713a3c63afe\r\n\r\n設定が分からない場合はBest Beer Japanにお問い合わせください。', NULL, 5, 1, now(), now(), 'delivery', 1, '火曜日は定休日ですのでご注意ください。\r\n午後からは店の準備をしているので9:00 ~ 12:00に取りに来てください。');
ALTER TABLE dtb_delivery AUTO_INCREMENT = 7;

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
(188,4,47,0.00,'deliveryfee'),
(189,5,1,0.00,'deliveryfee'),
(190,5,2,0.00,'deliveryfee'),
(191,5,3,0.00,'deliveryfee'),
(192,5,4,0.00,'deliveryfee'),
(193,5,5,0.00,'deliveryfee'),
(194,5,6,0.00,'deliveryfee'),
(195,5,7,0.00,'deliveryfee'),
(196,5,8,0.00,'deliveryfee'),
(197,5,9,0.00,'deliveryfee'),
(198,5,10,0.00,'deliveryfee'),
(199,5,11,0.00,'deliveryfee'),
(200,5,12,0.00,'deliveryfee'),
(201,5,13,0.00,'deliveryfee'),
(202,5,14,0.00,'deliveryfee'),
(203,5,15,0.00,'deliveryfee'),
(204,5,16,0.00,'deliveryfee'),
(205,5,17,0.00,'deliveryfee'),
(206,5,18,0.00,'deliveryfee'),
(207,5,19,0.00,'deliveryfee'),
(208,5,20,0.00,'deliveryfee'),
(209,5,21,0.00,'deliveryfee'),
(210,5,22,0.00,'deliveryfee'),
(211,5,23,0.00,'deliveryfee'),
(212,5,24,0.00,'deliveryfee'),
(213,5,25,0.00,'deliveryfee'),
(214,5,26,0.00,'deliveryfee'),
(215,5,27,0.00,'deliveryfee'),
(216,5,28,0.00,'deliveryfee'),
(217,5,29,0.00,'deliveryfee'),
(218,5,30,0.00,'deliveryfee'),
(219,5,31,0.00,'deliveryfee'),
(220,5,32,0.00,'deliveryfee'),
(221,5,33,0.00,'deliveryfee'),
(222,5,34,0.00,'deliveryfee'),
(223,5,35,0.00,'deliveryfee'),
(224,5,36,0.00,'deliveryfee'),
(225,5,37,0.00,'deliveryfee'),
(226,5,38,0.00,'deliveryfee'),
(227,5,39,0.00,'deliveryfee'),
(228,5,40,0.00,'deliveryfee'),
(229,5,41,0.00,'deliveryfee'),
(230,5,42,0.00,'deliveryfee'),
(231,5,43,0.00,'deliveryfee'),
(232,5,44,0.00,'deliveryfee'),
(233,5,45,0.00,'deliveryfee'),
(234,5,46,0.00,'deliveryfee'),
(235,5,47,0.00,'deliveryfee'),
(236,6,1,0.00,'deliveryfee'),
(237,6,2,0.00,'deliveryfee'),
(238,6,3,0.00,'deliveryfee'),
(239,6,4,0.00,'deliveryfee'),
(240,6,5,0.00,'deliveryfee'),
(241,6,6,0.00,'deliveryfee'),
(242,6,7,0.00,'deliveryfee'),
(243,6,8,0.00,'deliveryfee'),
(244,6,9,0.00,'deliveryfee'),
(245,6,10,0.00,'deliveryfee'),
(246,6,11,0.00,'deliveryfee'),
(247,6,12,0.00,'deliveryfee'),
(248,6,13,0.00,'deliveryfee'),
(249,6,14,0.00,'deliveryfee'),
(250,6,15,0.00,'deliveryfee'),
(251,6,16,0.00,'deliveryfee'),
(252,6,17,0.00,'deliveryfee'),
(253,6,18,0.00,'deliveryfee'),
(254,6,19,0.00,'deliveryfee'),
(255,6,20,0.00,'deliveryfee'),
(256,6,21,0.00,'deliveryfee'),
(257,6,22,0.00,'deliveryfee'),
(258,6,23,0.00,'deliveryfee'),
(259,6,24,0.00,'deliveryfee'),
(260,6,25,0.00,'deliveryfee'),
(261,6,26,0.00,'deliveryfee'),
(262,6,27,0.00,'deliveryfee'),
(263,6,28,0.00,'deliveryfee'),
(264,6,29,0.00,'deliveryfee'),
(265,6,30,0.00,'deliveryfee'),
(266,6,31,0.00,'deliveryfee'),
(267,6,32,0.00,'deliveryfee'),
(268,6,33,0.00,'deliveryfee'),
(269,6,34,0.00,'deliveryfee'),
(270,6,35,0.00,'deliveryfee'),
(271,6,36,0.00,'deliveryfee'),
(272,6,37,0.00,'deliveryfee'),
(273,6,38,0.00,'deliveryfee'),
(274,6,39,0.00,'deliveryfee'),
(275,6,40,0.00,'deliveryfee'),
(276,6,41,0.00,'deliveryfee'),
(277,6,42,0.00,'deliveryfee'),
(278,6,43,0.00,'deliveryfee'),
(279,6,44,0.00,'deliveryfee'),
(280,6,45,0.00,'deliveryfee'),
(281,6,46,0.00,'deliveryfee'),
(282,6,47,0.00,'deliveryfee');
ALTER TABLE dtb_delivery_fee AUTO_INCREMENT = 283;

TRUNCATE dtb_delivery_time;
INSERT INTO `dtb_delivery_time` (`id`, `delivery_id`, `delivery_time`, `sort_no`, `visible`, `create_date`, `update_date`, `discriminator_type`)
VALUES
	(1, 1, '午前中', 1, 1, now(), now(), 'deliverytime'),
	(2, 1, '12～14時', 2, 1, now(), now(), 'deliverytime'),
	(3, 1, '14～16時', 3, 1, now(), now(), 'deliverytime'),
	(4, 1, '16～18時', 4, 1, now(), now(), 'deliverytime'),
	(5, 1, '18～20時', 5, 1, now(), now(), 'deliverytime'),
	(6, 1, '19～21時', 6, 1, now(), now(), 'deliverytime'),
	(7, 1, '18～21時', 7, 1, now(), now(), 'deliverytime'),
	(8, 2, '午前中', 1, 1, now(), now(), 'deliverytime'),
	(9, 2, '14～16時', 2, 1, now(), now(), 'deliverytime'),
	(10, 2, '16～18時', 3, 1, now(), now(), 'deliverytime'),
	(11, 2, '18～20時', 4, 1, now(), now(), 'deliverytime'),
	(12, 2, '19～21時', 5, 1, now(), now(), 'deliverytime'),
	(13, 3, '午前中', 1, 1, now(), now(), 'deliverytime'),
	(14, 3, '12～14時', 2, 1, now(), now(), 'deliverytime'),
	(15, 3, '14～16時', 4, 1, now(), now(), 'deliverytime'),
	(16, 3, '16～18時', 5, 1, now(), now(), 'deliverytime'),
	(17, 3, '18～20時', 3, 1, now(), now(), 'deliverytime'),
	(18, 3, '20～21時', 7, 1, now(), now(), 'deliverytime'),
	(19, 3, '19～21時', 6, 1, now(), now(), 'deliverytime'),
	(20, 4, '午前中', 1, 1, now(), now(), 'deliverytime'),
	(21, 4, '午後', 2, 1, now(), now(), 'deliverytime'),
	(22, 6, '午前中', 1, 1, now(), now(), 'deliverytime'),
	(24, 5, '午前中', 1, 1, now(), now(), 'deliverytime'),
	(25, 5, '14〜16時', 2, 1, now(), now(), 'deliverytime'),
	(26, 5, '16〜18時', 3, 1, now(), now(), 'deliverytime'),
	(27, 5, '18〜20時', 4, 1, now(), now(), 'deliverytime'),
	(28, 5, '19〜21時', 5, 1, now(), now(), 'deliverytime');
ALTER TABLE dtb_delivery_time AUTO_INCREMENT = 29;

TRUNCATE dtb_payment;
INSERT INTO `dtb_payment` (`id`, `creator_id`, `payment_method`, `charge`, `rule_max`, `sort_no`, `fixed`, `payment_image`, `rule_min`, `method_class`, `visible`, `create_date`, `update_date`, `discriminator_type`)
VALUES
	(1, 1, '請求書払い BBJプラットフォーム専用 【削除不可能】', 0.00, NULL, 1, 1, NULL, NULL, 'Eccube\\Service\\Payment\\Method\\Cash', 0, now(), now(), 'payment'),
	(2, 1, '請求書払い（月末締め翌月払い）', 0.00, NULL, 2, 1, NULL, NULL, 'Eccube\\Service\\Payment\\Method\\Cash', 1, now(), now(), 'payment'),
	(3, 1, '代金引換 (初めてのお客様)', 0.00, NULL, 3, 1, NULL, 0.00, 'Eccube\\Service\\Payment\\Method\\Cash', 1, now(), now(), 'payment');
ALTER TABLE dtb_payment AUTO_INCREMENT = 4;

TRUNCATE dtb_payment_option;
INSERT INTO `dtb_payment_option` (`delivery_id`, `payment_id`, `discriminator_type`)
VALUES
	(1, 2, 'paymentoption'),
	(1, 3, 'paymentoption'),
	(2, 2, 'paymentoption'),
	(2, 3, 'paymentoption'),
	(3, 2, 'paymentoption'),
	(3, 3, 'paymentoption'),
	(4, 2, 'paymentoption'),
	(5, 2, 'paymentoption'),
	(6, 2, 'paymentoption');

TRUNCATE dtb_product;
INSERT INTO `dtb_product` (`id`, `creator_id`, `product_status_id`, `name`, `note`, `description_list`, `description_detail`, `search_word`, `free_area`, `create_date`, `update_date`, `discriminator_type`, `beer_style_id`, `beer_type_id`, `alcohol_percentage`, `publish_date`, `terms_and_conditions`, `mixpack_flag`, `list_open_flag`)
VALUES
	(1, 2, 1, '【樽10L・15L・20L規格選択サンプル】Best Beer Pilsner', '規格がある場合は配送関連とグループ価格の設定は「この商品の規格を確認」ページで設定してください。\r\n\r\n商品登録のマニュアルページ\r\nhttps://bestbeerjapan.notion.site/713f7353730e47dfaaf7b64224b93a4f', NULL, 'Best Beer Japanの定番ビールです。\r\n麦の旨味がぎゅっと詰まったピルスナーです。\r\n\r\n商品説明にHTMLタグが使えます。※絵文字はNG\r\nHTMLが分からない方は下記のツールを使ってみてください。\r\nhttps://onlinehtmleditor.dev/\r\n\r\n下記はHTML\r\n<p>HTMLを使いますと<span style=\"color:#e74c3c\">説明文の色</span>や<span style=\"font-size:40px\">文字のサイズ</span>など変えられます。</p>\r\n<p>&nbsp;</p>\r\n上記はHTML\r\n\r\n右上の商品の確認ブタンを押すと商品はECのフロント(表)にどのように表示されているか確認ができます。', 'サイト内検索はフリーワードになっているので説明文に入っているなら別で設定する必要がないです。', 'フリーエリアの文字はここで表示されます。', now(), now(), 'product', 1, 1, 5.00, NULL, '取引条件は商品の詳細ページで登録ができます。\r\nこちらの条件はBest Beer Japanプラットフォームにも連携されます。\r\n例：\r\n・1事業者様1樽まで\r\n・先週購入の方は購入できません', 0, 1),
	(2, 2, 1, '【瓶・缶 24本単一銘柄セットver.】Best IPA 24本パック', '同じ銘柄でもミックスパック機能でセット商品を作るのはおすすめします。\r\n単一銘柄セットのマニュアルは下記です：\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6#89f5c40b3f6f4a53a7994f67a83a4dca\r\n\r\nミックスパック機能を使いますと下記のメリットがあります：\r\n\r\n● 注文単位を固定できる (例：最低ロット24本)\r\n● 一本単位で在庫管理ができる\r\n● Best Beer Japanの樽・瓶・缶管理アプリとの連携がよりスムーズになる\r\n\r\nECと瓶・缶の管理アプリの連携の詳しくは下記です：\r\nhttps://bestbeerjapan.notion.site/EC-559f23d1ba1d49069c09118ce8f6948c\r\n\r\n※ ミックスパック機能を使わず、商品名●本セットを作るとセットの在庫が減るけどシステムは中の商品の一本単位レベルまで在庫管理ができなくなります。\r\n\r\n例：\r\nIPA 24本セット (ミックスパック機能使わず)が販売された\r\nセットの在庫は1個減るけど、ミックスパック機能を使わないと中にIPA 1本単位の商品 x 24本がセットに入っているかシステムが判断できません。中身の在庫まで管理したい場合はミックスパック機能を使ってください。\r\n\r\n他のミックスパックと同じように販売価格が0円の場合は価格が中身の合計になります。\r\n\r\n※ ECサイトのフロント(表)に表示される価格は一本単位の税込価格です。\r\n商品 (税込) x 本数で一銘柄セットの希望価格が作れない場合は販売価格を直接単一銘柄セット商品にご記入ください。\r\n\r\n貴社の会計ソフトを内税に設定しないと納品書・請求書・商品金額のズレが出る可能性があります。詳しくは下記でご確認ください。\r\nhttps://bestbeerjapan.notion.site/58dd3d2bcfa7405f9b6b00418abc69e6', '単一銘柄セットでもミックスパック機能で作ってください。(この文字は商品説明の下にある商品説明(一覧)で変更できます。商品説明の下にある➕ボタンを押してください。 )', '同じ銘柄でもミックスパック機能でセット商品を作るのはおすすめします。\r\n単一銘柄セットのマニュアルは下記です：\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6#89f5c40b3f6f4a53a7994f67a83a4dca\r\n\r\nミックスパック機能を使いますと下記のメリットがあります：\r\n\r\n● 注文単位を固定できる (例：最低ロット24本)\r\n● 一本単位で在庫管理ができる\r\n● Best Beer Japanの樽・瓶・缶管理アプリとの連携がよりスムーズになる\r\n\r\nECと瓶・缶の管理アプリの連携の詳しくは下記です：\r\nhttps://bestbeerjapan.notion.site/EC-559f23d1ba1d49069c09118ce8f6948c\r\n\r\n※ ミックスパック機能を使わず、商品名●本セットを作るとセットの在庫が減るけどシステムは中の商品の一本単位レベルまで在庫管理ができなくなります。\r\n\r\n例：\r\nIPA 24本セット (ミックスパック機能使わず)が販売された\r\nセットの在庫は1個減るけど、ミックスパック機能を使わないと中にIPA 1本単位の商品 x 24本がセットに入っているかシステムが判断できません。中身の在庫まで管理したい場合はミックスパック機能を使ってください。\r\n\r\n他のミックスパックと同じように販売価格が0円の場合は価格が中身の合計になります。\r\n\r\n※ ECサイトのフロント(表)に表示される価格は一本単位の税込価格です。\r\n商品 (税込) x 本数で単一銘柄セットの希望価格が作れない場合は販売価格を直接単一銘柄セット商品にご記入ください。\r\n\r\n貴社の会計ソフトを内税に設定しないと納品書・請求書・商品金額のズレが出る可能性があります。詳しくは下記でご確認ください。\r\nhttps://bestbeerjapan.notion.site/58dd3d2bcfa7405f9b6b00418abc69e6', NULL, NULL, now(), now(), 'product', 4, 7, NULL, NULL, NULL, 1, 1),
	(3, 1, 1, '【樽15Lサンプル】Best Beer Pilsner-15L', '商品登録のマニュアルページ\r\nhttps://bestbeerjapan.notion.site/713f7353730e47dfaaf7b64224b93a4f', NULL, 'Best Beer Japanの定番ビールです。\r\n麦の旨味がぎゅっと詰まったピルスナーです。\r\n\r\n商品説明にHTMLタグが使えます。※絵文字はNG\r\nHTMLが分からない方は下記のツールを使ってみてください。\r\nhttps://onlinehtmleditor.dev/\r\n\r\n下記はHTML\r\n<p>HTMLを使いますと<span style=\"color:#e74c3c\">説明文の色</span>や<span style=\"font-size:40px\">文字のサイズ</span>など変えられます。</p>\r\n<p>&nbsp;</p>\r\n上記はHTML\r\n\r\n右上の商品の確認ブタンを押すと商品はECのフロント(表)にどのように表示されているか確認ができます。', 'サイト内検索はフリーワードになっているので説明文に入っているなら別で設定する必要がないです。', 'フリーエリアの文字はここで表示されます。', now(), now(), 'product', 1, 1, 5.00, NULL, '取引条件は商品の詳細ページで登録ができます。\r\nこちらの条件はBest Beer Japanプラットフォームにも連携されます。\r\n例：\r\n・1事業者様1樽まで\r\n・先週購入の方は購入できません', 0, 1),
	(4, 2, 1, '【樽10Lサンプル】Best Beer Pilsner-10L', '商品登録のマニュアルページ\r\nhttps://bestbeerjapan.notion.site/713f7353730e47dfaaf7b64224b93a4f', 'ここの文字は商品の詳細ページ「商品説明」の下にある➕ボタンを押すと編集ができます。商品の魅力を一言で伝えられます。', 'Best Beer Japanの定番ビールです。\r\n麦の旨味がぎゅっと詰まったピルスナーです。\r\n\r\n商品説明にHTMLタグが使えます。※絵文字はNG\r\nHTMLが分からない方は下記のツールを使ってみてください。\r\nhttps://onlinehtmleditor.dev/\r\n\r\n下記はHTML\r\n<p>HTMLを使いますと<span style=\"color:#e74c3c\">説明文の色</span>や<span style=\"font-size:40px\">文字のサイズ</span>など変えられます。</p>\r\n<p>&nbsp;</p>\r\n上記はHTML\r\n\r\n右上の商品の確認ブタンを押すと商品はECのフロント(表)にどのように表示されているか確認ができます。', 'サイト内検索はフリーワードになっているので説明文に入っているなら別で設定する必要がないです。', 'フリーエリアの文字はここで表示されます。', now(), now(), 'product', 1, 1, 5.00, NULL, '取引条件は商品の詳細ページで登録ができます。\r\nこちらの条件はBest Beer Japanプラットフォームにも連携されます。\r\n例：\r\n・1事業者様1樽まで\r\n・先週購入の方は購入できません', 0, 1),
	(5, 2, 1, '【缶350mlサンプル 1本単位】Best IPA (ミックスパック専用、一覧非表示)', 'この商品はミックスパック専用として使われてので「商品一覧表示」を無効にしています。\r\nECのフロント側(表)の「缶・瓶」のカテゴリに行っても表示されません。ご確認ください。\r\n\r\n瓶・缶は1本単位で販売する予定がなければ「商品一覧表示」を無効にしてミックスパック商品を別で作って、そのミックスパック商品の中身の商品に追加してください。\r\n\r\n※ 一覧非表示にしても直接商品のリンクを知っている方は購入が可能です。\r\nお得意様限定の秘密の商品として使えます。\r\n詳しくはマニュアルでご確認ください。\r\nhttps://bestbeerjapan.notion.site/985c88780b3f4aff9d29b4cc62678c92', NULL, 'この商品はミックスパック専用として使われてので「商品一覧表示」を無効にしています。\r\nECのフロント側(表)の「缶・瓶」のカテゴリに行っても表示されません。ご確認ください。\r\n\r\n瓶・缶は1本単位で販売する予定がなければ「商品一覧表示」を無効にしてミックスパック商品を別で作って、そのミックスパック商品の中身の商品に追加してください。\r\n\r\n※ 一覧非表示にしても直接商品のリンクを知っている方は購入が可能です。\r\nお得意様限定の秘密の商品として使えます。\r\n詳しくはマニュアルでご確認ください。\r\nhttps://bestbeerjapan.notion.site/985c88780b3f4aff9d29b4cc62678c92', NULL, NULL, now(), now(), 'product', 4, 1, 5.00, NULL, NULL, 0, 0),
	(6, 2, 1, '【混載（ミックスパック）サンプル】貴社が中身を決めるver　24本パック (Best IPA 12本、Best Weizen 12本)', 'ミックスパックの販売価格を0円として設定する場合は中の商品の合計金額になります。\r\nミックスパックに追加した中の商品の説明がミックスパックの詳細ページに自動で表示されます。\r\n\r\n中の商品の金額を無視してミックスパックの専用価格を固定したい場合は販売価格を直接ミックスパック商品にご記入ください。\r\n\r\n混載（ミックスパック）のマニュアル\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6', NULL, 'ミックスパックの販売価格を0円として設定する場合は中の商品の合計金額になります。\r\nミックスパックに追加した中の商品の説明がミックスパックの詳細ページに自動で表示されます。\r\n\r\n中の商品の金額を無視してミックスパックの専用価格を固定したい場合は販売価格を直接ミックスパック商品にご記入ください。\r\n\r\n混載（ミックスパック）のマニュアル\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6', NULL, NULL, now(), now(), 'product', 8, 7, NULL, NULL, NULL, 1, 1),
	(7, 2, 1, '【混載（ミックスパック）サンプル】お客様が中身を自由にチョイスver.　24本パック', 'ミックスパックの販売価格を0円として設定する場合は中の商品の合計金額になります。\r\nミックスパックに追加した中の商品の説明がミックスパックの詳細ページに自動で表示されます。\r\n\r\n中の商品の金額を無視してミックスパックの専用価格を固定したい場合は販売価格を直接ミックスパック商品にご記入ください。\r\n\r\n混載（ミックスパックのマニュアル\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6', NULL, 'ミックスパックの販売価格を0円として設定する場合は中の商品の合計金額になります。\r\nミックスパックに追加した中の商品の説明がミックスパックの詳細ページに自動で表示されます。\r\n\r\n中の商品の金額を無視してミックスパックの専用価格を固定したい場合は販売価格を直接ミックスパック商品にご記入ください。\r\n\r\n混載（ミックスパック）のマニュアル\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6', NULL, NULL, now(), now(), 'product', 8, 7, NULL, NULL, NULL, 1, 1),
	(8, 2, 1, '【混載（ミックスパック）サンプル】ハイブリッドver.（お客様が中身を自由にチョイス＋貴社が中身を決める）　24本パック', 'ミックスパックの販売価格を0円として設定する場合は中の商品の合計金額になります。\r\nミックスパックに追加した中の商品の説明がミックスパックの詳細ページに自動で表示されます。\r\n\r\n中の商品の金額を無視してミックスパックの専用価格を固定したい場合は販売価格を直接ミックスパック商品にご記入ください。\r\n\r\n混載（ミックスパック）のマニュアル\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6', NULL, 'ミックスパックの販売価格を0円として設定する場合は中の商品の合計金額になります。\r\nミックスパックに追加した中の商品の説明がミックスパックの詳細ページに自動で表示されます。\r\n\r\n中の商品の金額を無視してミックスパックの専用価格を固定したい場合は販売価格を直接ミックスパック商品にご記入ください。\r\n\r\n混載（ミックスパック）のマニュアル\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6', NULL, NULL, now(), now(), 'product', 8, 7, NULL, NULL, NULL, 1, 1),
	(9, 2, 1, '【缶350mlサンプル 1本単位】Best Weizen', 'この商品は一覧に表示されているので誰で見れて、購入ができます。\r\n業務用取引はあまり1本単位で瓶・缶を販売しません。システムの配送設定が複雑になるのでBest Beer Japanは瓶・缶の1本単位の販売をおすすめしません。\r\n\r\n缶・瓶の注文単位を固定したい場合（例：最低ロット24本）はミックスパック機能を使ってください。\r\n単一銘柄セットも作れますのでミックスパックのマニュアルでご確認ください。\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6#89f5c40b3f6f4a53a7994f67a83a4dca', '1本単位で瓶・缶を販売することはおすすめしません。ミックスパック機能で「単一銘柄セット」を作ることをご検討ください。', 'この商品は一覧に表示されているので誰で見れて、購入ができます。\r\n業務用取引はあまり1本単位で瓶・缶を販売しません。システムの配送設定が複雑になるのでBest Beer Japanは瓶・缶の1本単位の販売をおすすめしません。\r\n\r\n缶・瓶の注文単位を固定したい場合（例：最低ロット24本）はミックスパック機能を使ってください。\r\n単一銘柄セットも作れますのでミックスパックのマニュアルでご確認ください。\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6#89f5c40b3f6f4a53a7994f67a83a4dca', NULL, NULL, now(), now(), 'product', 2, 1, 5.00, NULL, NULL, 0, 1),
	(10, 2, 1, '【缶350mlサンプル 1本単位】Best Hazy', 'この商品は一覧に表示されているので誰で見れて、購入ができます。\r\n業務用取引はあまり1本単位で瓶・缶を販売しません。システムの配送設定が複雑になるのでBest Beer Japanは瓶・缶の1本単位の販売をおすすめしません。\r\n\r\n缶・瓶の注文単位を固定したい場合（例：最低ロット24本）はミックスパック機能を使ってください。\r\n単一銘柄セットも作れますのでミックスパックのマニュアルでご確認ください。\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6#89f5c40b3f6f4a53a7994f67a83a4dca', '1本単位で瓶・缶を販売することはおすすめしません。ミックスパック機能で「単一銘柄セット」を作ることをご検討ください。', 'この商品は一覧に表示されているので誰で見れて、購入ができます。\r\n業務用取引はあまり1本単位で瓶・缶を販売しません。システムの配送設定が複雑になるのでBest Beer Japanは瓶・缶の1本単位の販売をおすすめしません。\r\n\r\n缶・瓶の注文単位を固定したい場合（例：最低ロット24本）はミックスパック機能を使ってください。\r\n単一銘柄セットも作れますのでミックスパックのマニュアルでご確認ください。\r\nhttps://bestbeerjapan.notion.site/8db4043550c64285a57fd5cee4fc83b6#89f5c40b3f6f4a53a7994f67a83a4dca', NULL, NULL, now(), now(), 'product', 10, 1, 5.00, NULL, NULL, 0, 1),
	(11, 2, 1, '【樽10Lサンプル】Best Beer Pilsner-10L (問屋グループ価格適用)', 'グループ別価格表示ルール設定の詳しくは下記から\r\nhttps://bestbeerjapan.notion.site/bcf19c0b1edd4f14b9850592f60ba381\r\n\r\n問屋の会員としてログインしてみてください。\r\n他の商品が問屋の割引率によって価格が表示されます。\r\nこちらの商品は下にある「グループ関連設定」に直接問屋の価格が入力されているので割引率より優先されます。\r\n\r\n例：\r\n問屋はいつも15%OFFにしているけど今回の商品にたくさんのホップを入れて原価が高いので15%OFFではなく12%OFF, 8,800 (税抜)にしたいです。\r\n(割引率より高い格の設定も可能です。)', NULL, 'グループ別価格表示ルール設定の詳しくは下記から\r\nhttps://bestbeerjapan.notion.site/bcf19c0b1edd4f14b9850592f60ba381\r\n\r\n問屋の会員としてログインしてみてください。\r\n他の商品が問屋の割引率によって価格が表示されます。\r\nこちらの商品は下にある「グループ関連設定」に直接問屋の価格が入力されているので割引率より優先されます。\r\n\r\n例：\r\n問屋はいつも15%OFFにしているけど今回の商品にたくさんのホップを入れて原価が高いので15%OFFではなく12%OFF, 8,800 (税抜)にしたいです。\r\n(割引率より高い価格の設定も可能です。)', 'サイト内検索はフリーワードになっているので説明文に入っているなら別で設定する必要がないです。', 'フリーエリアの文字はここで表示されます。', now(), now(), 'product', 1, 1, 5.00, NULL, NULL, 0, 1);
ALTER TABLE dtb_product AUTO_INCREMENT = 12;

TRUNCATE dtb_product_image;
INSERT INTO `dtb_product_image` (`id`, `product_id`, `creator_id`, `file_name`, `sort_no`, `create_date`, `discriminator_type`)
VALUES
	(1, 5, 2, '0311003708_640b4ea4dbab6.png', 1, now(), 'productimage'),
	(2, 10, 2, '0311005343_640b5287c6488.png', 1, now(), 'productimage'),
	(3, 9, 2, '0311005355_640b5293e7254.png', 1, now(), 'productimage'),
	(4, 11, 2, '0311015301_640b606d3e0d4.png', 1, now(), 'productimage'),
	(5, 1, 2, '0311015315_640b607b24b02.png', 1, now(), 'productimage'),
	(6, 3, 1, '0311015326_640b60861a1fb.png', 1, now(), 'productimage'),
	(7, 4, 2, '0311015335_640b608fa7c78.png', 1, now(), 'productimage'),
	(8, 2, 2, '0311015348_640b609c0b37c.png', 1, now(), 'productimage'),
	(9, 6, 2, '0311015408_640b60b09dc97.png', 1, now(), 'productimage'),
	(10, 7, 2, '0311015423_640b60bf3d5b8.png', 1, now(), 'productimage'),
	(11, 8, 2, '0311015435_640b60cb09db5.png', 1, now(), 'productimage');
ALTER TABLE dtb_product_image AUTO_INCREMENT = 12;

TRUNCATE dtb_product_class;
INSERT INTO `dtb_product_class` (`id`, `product_id`, `sale_type_id`, `class_category_id1`, `class_category_id2`, `delivery_duration_id`, `creator_id`, `product_code`, `stock`, `stock_unlimited`, `sale_limit`, `price01`, `price02`, `delivery_fee`, `visible`, `create_date`, `update_date`, `currency_code`, `point_rate`, `discriminator_type`, `beer_container_capacity_id`)
VALUES
	(1, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, 50000.00, NULL, 0, now(), now(), 'JPY', NULL, 'productclass', 3),
	(2, 2, 1, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 10000.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 3),
	(3, 2, 1, 5, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 15000.00, NULL, 0, now(), now(), 'JPY', NULL, 'productclass', 8),
	(4, 2, 1, 4, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 10000.00, NULL, 0, now(), now(), 'JPY', NULL, 'productclass', 1),
	(5, 3, 1, NULL, NULL, NULL, 1, NULL, 0, 0, NULL, NULL, 15000.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 14),
	(6, 1, 1, 3, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 20000.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 15),
	(7, 1, 1, 2, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 15000.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 14),
	(8, 1, 1, 1, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 10000.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 12),
	(9, 4, 1, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 10000.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 12),
	(10, 5, 1, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 500.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 3),
	(11, 6, 1, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 3),
	(12, 6, 1, 5, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 15000.00, NULL, 0, now(), now(), 'JPY', NULL, 'productclass', 8),
	(13, 6, 1, 4, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 10000.00, NULL, 0, now(), now(), 'JPY', NULL, 'productclass', 1),
	(14, 7, 1, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 3),
	(15, 7, 1, 5, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 15000.00, NULL, 0, now(), now(), 'JPY', NULL, 'productclass', 8),
	(16, 7, 1, 4, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 10000.00, NULL, 0, now(), now(), 'JPY', NULL, 'productclass', 1),
	(17, 8, 1, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 0.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 3),
	(18, 8, 1, 5, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 15000.00, NULL, 0, now(), now(), 'JPY', NULL, 'productclass', 8),
	(19, 8, 1, 4, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 10000.00, NULL, 0, now(), now(), 'JPY', NULL, 'productclass', 1),
	(20, 9, 1, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 450.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 3),
	(21, 10, 1, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 380.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 3),
	(22, 11, 1, NULL, NULL, NULL, 2, NULL, NULL, 1, NULL, NULL, 10000.00, NULL, 1, now(), now(), 'JPY', NULL, 'productclass', 12);
ALTER TABLE dtb_product_class AUTO_INCREMENT = 23;

TRUNCATE dtb_product_category;
INSERT INTO `dtb_product_category` (`product_id`, `category_id`, `discriminator_type`)
VALUES
	(1, 1, 'productcategory'),
	(2, 2, 'productcategory'),
	(3, 1, 'productcategory'),
	(4, 1, 'productcategory'),
	(5, 2, 'productcategory'),
	(6, 2, 'productcategory'),
	(7, 2, 'productcategory'),
	(8, 2, 'productcategory'),
	(9, 2, 'productcategory'),
	(10, 2, 'productcategory'),
	(11, 1, 'productcategory');

TRUNCATE dtb_product_stock;
INSERT INTO `dtb_product_stock` (`id`, `product_class_id`, `creator_id`, `stock`, `create_date`, `update_date`, `discriminator_type`)
VALUES
	(1, 1, 2, NULL, now(), now(), 'productstock'),
	(2, 2, 2, NULL, now(), now(), 'productstock'),
	(3, 3, 1, NULL, now(), now(), 'productstock'),
	(4, 4, 1, NULL, now(), now(), 'productstock'),
	(5, 5, 1, 0, now(), now(), 'productstock'),
	(6, 6, 1, NULL, now(), now(), 'productstock'),
	(7, 7, 1, NULL, now(), now(), 'productstock'),
	(8, 8, 1, NULL, now(), now(), 'productstock'),
	(9, 9, 1, NULL, now(), now(), 'productstock'),
	(10, 10, 1, NULL, now(), now(), 'productstock'),
	(11, 11, 1, NULL, now(), now(), 'productstock'),
	(12, 12, 1, NULL, now(), now(), 'productstock'),
	(13, 13, 1, NULL, now(), now(), 'productstock'),
	(14, 14, 1, NULL, now(), now(), 'productstock'),
	(15, 15, 1, NULL, now(), now(), 'productstock'),
	(16, 16, 1, NULL, now(), now(), 'productstock'),
	(17, 17, 1, NULL, now(), now(), 'productstock'),
	(18, 18, 1, NULL, now(), now(), 'productstock'),
	(19, 19, 1, NULL, now(), now(), 'productstock'),
	(20, 20, 2, NULL, now(), now(), 'productstock'),
	(21, 21, 2, NULL, now(), now(), 'productstock'),
	(22, 22, 2, NULL, now(), now(), 'productstock');
ALTER TABLE dtb_product_stock AUTO_INCREMENT = 23;

TRUNCATE customize_dtb_product_beer_container;
INSERT INTO `customize_dtb_product_beer_container` (`product_id`, `beer_container_id`, `discriminator_type`)
VALUES
	(1, 1, 'productbeercontainer'),
	(2, 3, 'productbeercontainer'),
	(3, 1, 'productbeercontainer'),
	(4, 1, 'productbeercontainer'),
	(5, 3, 'productbeercontainer'),
	(6, 3, 'productbeercontainer'),
	(7, 3, 'productbeercontainer'),
	(8, 3, 'productbeercontainer'),
	(9, 3, 'productbeercontainer'),
	(10, 3, 'productbeercontainer'),
	(11, 1, 'productbeercontainer');

TRUNCATE plg_mixpack;
INSERT INTO `plg_mixpack` (`id`, `product_id`, `creator_id`, `original_id`, `total_quantity`, `sort_no`, `discriminator_type`)
VALUES
	(1, 2, 2, NULL, 24, 1, 'mixpack'),
	(2, 6, 2, NULL, 12, 1, 'mixpack'),
	(3, 6, 2, NULL, 12, 2, 'mixpack'),
	(4, 7, 2, NULL, 24, 1, 'mixpack'),
	(5, 8, 2, NULL, 12, 1, 'mixpack'),
	(6, 8, 2, NULL, 12, 2, 'mixpack');
ALTER TABLE plg_mixpack AUTO_INCREMENT = 7;

TRUNCATE plg_mixpack_product_class;
INSERT INTO `plg_mixpack_product_class` (`id`, `product_class_id`, `creator_id`, `original_id`, `mixpack_id`, `unit_quantity`, `sort_no`, `discriminator_type`)
VALUES
	(1, 10, 2, NULL, 1, 24, 1, 'mixpackproductclass'),
	(2, 10, 2, NULL, 2, 12, 1, 'mixpackproductclass'),
	(3, 20, 2, NULL, 3, 0, 1, 'mixpackproductclass'),
	(4, 10, 2, NULL, 4, 1, 1, 'mixpackproductclass'),
	(5, 20, 2, NULL, 4, 6, 2, 'mixpackproductclass'),
	(6, 21, 2, NULL, 4, 12, 3, 'mixpackproductclass'),
	(7, 10, 2, NULL, 5, 1, 1, 'mixpackproductclass'),
	(8, 20, 2, NULL, 5, 1, 2, 'mixpackproductclass'),
	(9, 21, 2, NULL, 5, 1, 3, 'mixpackproductclass'),
	(10, 10, 2, NULL, 6, 12, 1, 'mixpackproductclass');
ALTER TABLE plg_mixpack_product_class AUTO_INCREMENT = 11;

TRUNCATE dtb_order;
INSERT INTO `dtb_order` (`id`, `customer_id`, `country_id`, `pref_id`, `sex_id`, `job_id`, `payment_id`, `device_type_id`, `pre_order_id`, `order_no`, `message`, `name01`, `name02`, `kana01`, `kana02`, `company_name`, `email`, `phone_number`, `postal_code`, `addr01`, `addr02`, `birth`, `subtotal`, `discount`, `delivery_fee_total`, `charge`, `tax`, `total`, `payment_total`, `payment_method`, `note`, `create_date`, `update_date`, `order_date`, `payment_date`, `currency_code`, `complete_message`, `complete_mail_message`, `add_point`, `use_point`, `order_status_id`, `discriminator_type`, `customize_store_name`, `original_id`, `customize_order_no_section`, `customize_billing_month_date`)
VALUES
	(1, 2, NULL, 11, NULL, NULL, 2, 10, 'd7970ebced7dccdf9e97a03f6b6149e7a4c9ade9', '3', NULL, 'テスト購入', '専用会員', 'テスト', 'テスト', '貴社用のテスト会社', 'support+testkaiin@bestbeerjapan.com', '0123456789', '3510011', '朝霞市本町', '1-1-1', NULL, 16500.00, 0.00, 0.00, 0.00, 1500.00, 16500.00, 16500.00, '請求書払い（月末締め翌月払い）', '請求書を発行したい時は受注に☑を入れて、「請求月を決定」を押してください。\r\n会員一覧にいないお客様の請求書は発行ができませんのでご注意ください。\r\nこのお客様は問屋ですので問屋のグループ価格が反映されます。（会員のグループ変更は会員管理 > 会員一覧 > 詳細 > グループ設定）\r\n注文詳細ページの下にある「ショップ用メモ欄」でこのメモを編集できます。', now(), now(), now(), NULL, 'JPY', NULL, NULL, 0, 0, 1, 'order', 'テスト購入専用会員', NULL, NULL, DATE_SUB(DATE_FORMAT(now(), '%Y-%m-01 15:00:00'), INTERVAL 1 DAY));
ALTER TABLE dtb_order AUTO_INCREMENT = 2;

TRUNCATE dtb_order_item;
INSERT INTO `dtb_order_item` (`id`, `order_id`, `product_id`, `product_class_id`, `shipping_id`, `rounding_type_id`, `tax_type_id`, `tax_display_type_id`, `order_item_type_id`, `product_name`, `product_code`, `class_name1`, `class_name2`, `class_category_name1`, `class_category_name2`, `price`, `quantity`, `tax`, `tax_rate`, `tax_adjust`, `tax_rule_id`, `currency_code`, `processor_name`, `point_rate`, `discriminator_type`, `original_id`, `parent_order_item_id`)
VALUES
	(1, 1, 3, 5, 1, 3, 1, 1, 1, '【樽15Lサンプル】Best Beer Pilsner-15L', NULL, NULL, NULL, NULL, NULL, 15000.00, 1, 1500, 10, 0, NULL, 'JPY', NULL, NULL, 'orderitem', NULL, NULL),
	(2, 1, NULL, NULL, NULL, 3, 1, 2, 3, '手数料', NULL, NULL, NULL, NULL, NULL, 0.00, 1, 0, 10, 0, NULL, 'JPY', 'Eccube\\Service\\PurchaseFlow\\Processor\\PaymentChargePreprocessor', NULL, 'orderitem', NULL, NULL),
	(3, 1, NULL, NULL, 1, 3, 1, 2, 2, '送料', NULL, NULL, NULL, NULL, NULL, 0.00, 1, 0, 10, 0, NULL, 'JPY', 'Eccube\\Service\\PurchaseFlow\\Processor\\DeliveryFeePreprocessor', NULL, 'orderitem', NULL, NULL);
ALTER TABLE dtb_order_item AUTO_INCREMENT = 4;

TRUNCATE dtb_shipping;
INSERT INTO `dtb_shipping` (`id`, `order_id`, `country_id`, `pref_id`, `delivery_id`, `creator_id`, `name01`, `name02`, `kana01`, `kana02`, `company_name`, `phone_number`, `postal_code`, `addr01`, `addr02`, `delivery_name`, `time_id`, `delivery_time`, `delivery_date`, `shipping_date`, `tracking_number`, `note`, `sort_no`, `create_date`, `update_date`, `mail_send_date`, `discriminator_type`, `customize_store_name`)
VALUES
	(1, 1, NULL, 11, 6, NULL, 'テスト購入', '専用会員', 'テスト', 'テスト', '貴社用のテスト会社', '0123456789', '3510011', '朝霞市本町', '1-1-1', '直接受取', NULL, NULL, NULL, NULL, NULL, NULL, NULL, now(), now(), NULL, 'shipping', 'テスト購入専用会員');
ALTER TABLE dtb_shipping AUTO_INCREMENT = 2;

TRUNCATE plg_delivery_fee_extension_dtb_delivery_area;
INSERT INTO `plg_delivery_fee_extension_dtb_delivery_area` (`id`, `delivery_id`, `name`, `sort_no`, `discriminator_type`)
VALUES
	(1, 1, '北海道', 1, 'deliveryarea'),
	(2, 1, '北東北', 2, 'deliveryarea'),
	(3, 1, '南東北', 3, 'deliveryarea'),
	(4, 1, '関東', 4, 'deliveryarea'),
	(5, 1, '北陸', 5, 'deliveryarea'),
	(6, 1, '信越', 6, 'deliveryarea'),
	(7, 1, '東海', 7, 'deliveryarea'),
	(8, 1, '関西', 8, 'deliveryarea'),
	(9, 1, '中国', 9, 'deliveryarea'),
	(10, 1, '四国', 10, 'deliveryarea'),
	(11, 1, '北九州', 11, 'deliveryarea'),
	(12, 1, '南九州', 12, 'deliveryarea'),
	(13, 1, '沖縄', 13, 'deliveryarea'),
	(14, 2, '北海道', 1, 'deliveryarea'),
	(15, 2, '北東北', 2, 'deliveryarea'),
	(16, 2, '南東北', 3, 'deliveryarea'),
	(17, 2, '関東', 4, 'deliveryarea'),
	(18, 2, '信越', 5, 'deliveryarea'),
	(19, 2, '北陸', 6, 'deliveryarea'),
	(20, 2, '中部', 7, 'deliveryarea'),
	(21, 2, '関西', 8, 'deliveryarea'),
	(22, 2, '中国', 9, 'deliveryarea'),
	(23, 2, '四国', 10, 'deliveryarea'),
	(24, 2, '九州', 11, 'deliveryarea'),
	(25, 2, '沖縄', 12, 'deliveryarea'),
	(26, 3, '北海道', 1, 'deliveryarea'),
	(27, 3, '東北', 2, 'deliveryarea'),
	(28, 3, '関東', 3, 'deliveryarea'),
	(29, 3, '信越', 4, 'deliveryarea'),
	(30, 3, '北陸', 5, 'deliveryarea'),
	(31, 3, '東海', 6, 'deliveryarea'),
	(32, 3, '近畿', 7, 'deliveryarea'),
	(33, 3, '中国', 8, 'deliveryarea'),
	(34, 3, '四国', 9, 'deliveryarea'),
	(35, 3, '九州', 10, 'deliveryarea'),
	(36, 3, '沖縄', 11, 'deliveryarea'),
	(37, 6, 'エリア内', 1, 'deliveryarea'),
	(38, 6, 'エリア外', 2, 'deliveryarea'),
	(39, 4, '対応可', 1, 'deliveryarea'),
	(40, 4, '対応不可', 2, 'deliveryarea'),
	(41, 5, '北海道 (エリアは自由に追加、編集、削除ができる)', 1, 'deliveryarea'),
	(42, 5, '北東北', 2, 'deliveryarea'),
	(43, 5, '南東北', 3, 'deliveryarea'),
	(44, 5, '関東', 4, 'deliveryarea'),
	(45, 5, '信越', 5, 'deliveryarea'),
	(46, 5, '北陸', 6, 'deliveryarea'),
	(47, 5, '中部', 7, 'deliveryarea'),
	(48, 5, '関西', 8, 'deliveryarea'),
	(49, 5, '中国', 9, 'deliveryarea'),
	(50, 5, '四国', 10, 'deliveryarea'),
	(51, 5, '九州', 11, 'deliveryarea'),
	(52, 5, '沖縄', 12, 'deliveryarea');
ALTER TABLE plg_delivery_fee_extension_dtb_delivery_area AUTO_INCREMENT = 53;

TRUNCATE plg_delivery_fee_extension_dtb_delivery_pref_area;
INSERT INTO `plg_delivery_fee_extension_dtb_delivery_pref_area` (`pref_id`, `delivery_area_id`, `delivery_id`, `discriminator_type`)
VALUES
	(1, 1, 1, 'deliveryprefarea'),
	(1, 14, 2, 'deliveryprefarea'),
	(1, 26, 3, 'deliveryprefarea'),
	(1, 37, 6, 'deliveryprefarea'),
	(1, 40, 4, 'deliveryprefarea'),
	(1, 41, 5, 'deliveryprefarea'),
	(2, 2, 1, 'deliveryprefarea'),
	(2, 15, 2, 'deliveryprefarea'),
	(2, 27, 3, 'deliveryprefarea'),
	(2, 37, 6, 'deliveryprefarea'),
	(2, 40, 4, 'deliveryprefarea'),
	(2, 41, 5, 'deliveryprefarea'),
	(3, 2, 1, 'deliveryprefarea'),
	(3, 15, 2, 'deliveryprefarea'),
	(3, 27, 3, 'deliveryprefarea'),
	(3, 37, 6, 'deliveryprefarea'),
	(3, 40, 4, 'deliveryprefarea'),
	(3, 41, 5, 'deliveryprefarea'),
	(4, 3, 1, 'deliveryprefarea'),
	(4, 16, 2, 'deliveryprefarea'),
	(4, 27, 3, 'deliveryprefarea'),
	(4, 37, 6, 'deliveryprefarea'),
	(4, 40, 4, 'deliveryprefarea'),
	(4, 41, 5, 'deliveryprefarea'),
	(5, 2, 1, 'deliveryprefarea'),
	(5, 15, 2, 'deliveryprefarea'),
	(5, 27, 3, 'deliveryprefarea'),
	(5, 37, 6, 'deliveryprefarea'),
	(5, 40, 4, 'deliveryprefarea'),
	(5, 41, 5, 'deliveryprefarea'),
	(6, 3, 1, 'deliveryprefarea'),
	(6, 16, 2, 'deliveryprefarea'),
	(6, 27, 3, 'deliveryprefarea'),
	(6, 37, 6, 'deliveryprefarea'),
	(6, 40, 4, 'deliveryprefarea'),
	(6, 41, 5, 'deliveryprefarea'),
	(7, 3, 1, 'deliveryprefarea'),
	(7, 16, 2, 'deliveryprefarea'),
	(7, 27, 3, 'deliveryprefarea'),
	(7, 37, 6, 'deliveryprefarea'),
	(7, 40, 4, 'deliveryprefarea'),
	(7, 41, 5, 'deliveryprefarea'),
	(8, 4, 1, 'deliveryprefarea'),
	(8, 17, 2, 'deliveryprefarea'),
	(8, 28, 3, 'deliveryprefarea'),
	(8, 37, 6, 'deliveryprefarea'),
	(8, 40, 4, 'deliveryprefarea'),
	(8, 41, 5, 'deliveryprefarea'),
	(9, 4, 1, 'deliveryprefarea'),
	(9, 17, 2, 'deliveryprefarea'),
	(9, 28, 3, 'deliveryprefarea'),
	(9, 37, 6, 'deliveryprefarea'),
	(9, 40, 4, 'deliveryprefarea'),
	(9, 41, 5, 'deliveryprefarea'),
	(10, 4, 1, 'deliveryprefarea'),
	(10, 17, 2, 'deliveryprefarea'),
	(10, 28, 3, 'deliveryprefarea'),
	(10, 37, 6, 'deliveryprefarea'),
	(10, 40, 4, 'deliveryprefarea'),
	(10, 41, 5, 'deliveryprefarea'),
	(11, 4, 1, 'deliveryprefarea'),
	(11, 17, 2, 'deliveryprefarea'),
	(11, 28, 3, 'deliveryprefarea'),
	(11, 37, 6, 'deliveryprefarea'),
	(11, 40, 4, 'deliveryprefarea'),
	(11, 41, 5, 'deliveryprefarea'),
	(12, 4, 1, 'deliveryprefarea'),
	(12, 17, 2, 'deliveryprefarea'),
	(12, 28, 3, 'deliveryprefarea'),
	(12, 37, 6, 'deliveryprefarea'),
	(12, 40, 4, 'deliveryprefarea'),
	(12, 41, 5, 'deliveryprefarea'),
	(13, 4, 1, 'deliveryprefarea'),
	(13, 17, 2, 'deliveryprefarea'),
	(13, 28, 3, 'deliveryprefarea'),
	(13, 37, 6, 'deliveryprefarea'),
	(13, 40, 4, 'deliveryprefarea'),
	(13, 41, 5, 'deliveryprefarea'),
	(14, 4, 1, 'deliveryprefarea'),
	(14, 17, 2, 'deliveryprefarea'),
	(14, 28, 3, 'deliveryprefarea'),
	(14, 37, 6, 'deliveryprefarea'),
	(14, 40, 4, 'deliveryprefarea'),
	(14, 41, 5, 'deliveryprefarea'),
	(15, 6, 1, 'deliveryprefarea'),
	(15, 18, 2, 'deliveryprefarea'),
	(15, 29, 3, 'deliveryprefarea'),
	(15, 37, 6, 'deliveryprefarea'),
	(15, 40, 4, 'deliveryprefarea'),
	(15, 41, 5, 'deliveryprefarea'),
	(16, 5, 1, 'deliveryprefarea'),
	(16, 19, 2, 'deliveryprefarea'),
	(16, 30, 3, 'deliveryprefarea'),
	(16, 37, 6, 'deliveryprefarea'),
	(16, 40, 4, 'deliveryprefarea'),
	(16, 41, 5, 'deliveryprefarea'),
	(17, 5, 1, 'deliveryprefarea'),
	(17, 19, 2, 'deliveryprefarea'),
	(17, 30, 3, 'deliveryprefarea'),
	(17, 37, 6, 'deliveryprefarea'),
	(17, 40, 4, 'deliveryprefarea'),
	(17, 41, 5, 'deliveryprefarea'),
	(18, 5, 1, 'deliveryprefarea'),
	(18, 19, 2, 'deliveryprefarea'),
	(18, 30, 3, 'deliveryprefarea'),
	(18, 37, 6, 'deliveryprefarea'),
	(18, 40, 4, 'deliveryprefarea'),
	(18, 41, 5, 'deliveryprefarea'),
	(19, 4, 1, 'deliveryprefarea'),
	(19, 17, 2, 'deliveryprefarea'),
	(19, 28, 3, 'deliveryprefarea'),
	(19, 37, 6, 'deliveryprefarea'),
	(19, 40, 4, 'deliveryprefarea'),
	(19, 41, 5, 'deliveryprefarea'),
	(20, 6, 1, 'deliveryprefarea'),
	(20, 18, 2, 'deliveryprefarea'),
	(20, 29, 3, 'deliveryprefarea'),
	(20, 37, 6, 'deliveryprefarea'),
	(20, 40, 4, 'deliveryprefarea'),
	(20, 41, 5, 'deliveryprefarea'),
	(21, 7, 1, 'deliveryprefarea'),
	(21, 20, 2, 'deliveryprefarea'),
	(21, 31, 3, 'deliveryprefarea'),
	(21, 37, 6, 'deliveryprefarea'),
	(21, 40, 4, 'deliveryprefarea'),
	(21, 41, 5, 'deliveryprefarea'),
	(22, 7, 1, 'deliveryprefarea'),
	(22, 20, 2, 'deliveryprefarea'),
	(22, 31, 3, 'deliveryprefarea'),
	(22, 37, 6, 'deliveryprefarea'),
	(22, 40, 4, 'deliveryprefarea'),
	(22, 41, 5, 'deliveryprefarea'),
	(23, 7, 1, 'deliveryprefarea'),
	(23, 20, 2, 'deliveryprefarea'),
	(23, 31, 3, 'deliveryprefarea'),
	(23, 37, 6, 'deliveryprefarea'),
	(23, 40, 4, 'deliveryprefarea'),
	(23, 41, 5, 'deliveryprefarea'),
	(24, 7, 1, 'deliveryprefarea'),
	(24, 20, 2, 'deliveryprefarea'),
	(24, 31, 3, 'deliveryprefarea'),
	(24, 37, 6, 'deliveryprefarea'),
	(24, 40, 4, 'deliveryprefarea'),
	(24, 41, 5, 'deliveryprefarea'),
	(25, 8, 1, 'deliveryprefarea'),
	(25, 21, 2, 'deliveryprefarea'),
	(25, 32, 3, 'deliveryprefarea'),
	(25, 37, 6, 'deliveryprefarea'),
	(25, 40, 4, 'deliveryprefarea'),
	(25, 41, 5, 'deliveryprefarea'),
	(26, 8, 1, 'deliveryprefarea'),
	(26, 21, 2, 'deliveryprefarea'),
	(26, 32, 3, 'deliveryprefarea'),
	(26, 37, 6, 'deliveryprefarea'),
	(26, 40, 4, 'deliveryprefarea'),
	(26, 41, 5, 'deliveryprefarea'),
	(27, 8, 1, 'deliveryprefarea'),
	(27, 21, 2, 'deliveryprefarea'),
	(27, 32, 3, 'deliveryprefarea'),
	(27, 37, 6, 'deliveryprefarea'),
	(27, 40, 4, 'deliveryprefarea'),
	(27, 41, 5, 'deliveryprefarea'),
	(28, 8, 1, 'deliveryprefarea'),
	(28, 21, 2, 'deliveryprefarea'),
	(28, 32, 3, 'deliveryprefarea'),
	(28, 37, 6, 'deliveryprefarea'),
	(28, 40, 4, 'deliveryprefarea'),
	(28, 41, 5, 'deliveryprefarea'),
	(29, 8, 1, 'deliveryprefarea'),
	(29, 21, 2, 'deliveryprefarea'),
	(29, 32, 3, 'deliveryprefarea'),
	(29, 37, 6, 'deliveryprefarea'),
	(29, 40, 4, 'deliveryprefarea'),
	(29, 41, 5, 'deliveryprefarea'),
	(30, 8, 1, 'deliveryprefarea'),
	(30, 21, 2, 'deliveryprefarea'),
	(30, 32, 3, 'deliveryprefarea'),
	(30, 37, 6, 'deliveryprefarea'),
	(30, 40, 4, 'deliveryprefarea'),
	(30, 41, 5, 'deliveryprefarea'),
	(31, 9, 1, 'deliveryprefarea'),
	(31, 22, 2, 'deliveryprefarea'),
	(31, 33, 3, 'deliveryprefarea'),
	(31, 37, 6, 'deliveryprefarea'),
	(31, 40, 4, 'deliveryprefarea'),
	(31, 41, 5, 'deliveryprefarea'),
	(32, 9, 1, 'deliveryprefarea'),
	(32, 22, 2, 'deliveryprefarea'),
	(32, 33, 3, 'deliveryprefarea'),
	(32, 37, 6, 'deliveryprefarea'),
	(32, 40, 4, 'deliveryprefarea'),
	(32, 41, 5, 'deliveryprefarea'),
	(33, 9, 1, 'deliveryprefarea'),
	(33, 22, 2, 'deliveryprefarea'),
	(33, 33, 3, 'deliveryprefarea'),
	(33, 37, 6, 'deliveryprefarea'),
	(33, 40, 4, 'deliveryprefarea'),
	(33, 41, 5, 'deliveryprefarea'),
	(34, 9, 1, 'deliveryprefarea'),
	(34, 22, 2, 'deliveryprefarea'),
	(34, 33, 3, 'deliveryprefarea'),
	(34, 37, 6, 'deliveryprefarea'),
	(34, 40, 4, 'deliveryprefarea'),
	(34, 41, 5, 'deliveryprefarea'),
	(35, 9, 1, 'deliveryprefarea'),
	(35, 22, 2, 'deliveryprefarea'),
	(35, 33, 3, 'deliveryprefarea'),
	(35, 37, 6, 'deliveryprefarea'),
	(35, 40, 4, 'deliveryprefarea'),
	(35, 41, 5, 'deliveryprefarea'),
	(36, 10, 1, 'deliveryprefarea'),
	(36, 23, 2, 'deliveryprefarea'),
	(36, 33, 3, 'deliveryprefarea'),
	(36, 37, 6, 'deliveryprefarea'),
	(36, 40, 4, 'deliveryprefarea'),
	(36, 41, 5, 'deliveryprefarea'),
	(37, 10, 1, 'deliveryprefarea'),
	(37, 23, 2, 'deliveryprefarea'),
	(37, 34, 3, 'deliveryprefarea'),
	(37, 37, 6, 'deliveryprefarea'),
	(37, 40, 4, 'deliveryprefarea'),
	(37, 41, 5, 'deliveryprefarea'),
	(38, 10, 1, 'deliveryprefarea'),
	(38, 23, 2, 'deliveryprefarea'),
	(38, 34, 3, 'deliveryprefarea'),
	(38, 37, 6, 'deliveryprefarea'),
	(38, 40, 4, 'deliveryprefarea'),
	(38, 41, 5, 'deliveryprefarea'),
	(39, 10, 1, 'deliveryprefarea'),
	(39, 23, 2, 'deliveryprefarea'),
	(39, 34, 3, 'deliveryprefarea'),
	(39, 37, 6, 'deliveryprefarea'),
	(39, 40, 4, 'deliveryprefarea'),
	(39, 41, 5, 'deliveryprefarea'),
	(40, 11, 1, 'deliveryprefarea'),
	(40, 24, 2, 'deliveryprefarea'),
	(40, 35, 3, 'deliveryprefarea'),
	(40, 37, 6, 'deliveryprefarea'),
	(40, 40, 4, 'deliveryprefarea'),
	(40, 41, 5, 'deliveryprefarea'),
	(41, 11, 1, 'deliveryprefarea'),
	(41, 24, 2, 'deliveryprefarea'),
	(41, 35, 3, 'deliveryprefarea'),
	(41, 37, 6, 'deliveryprefarea'),
	(41, 40, 4, 'deliveryprefarea'),
	(41, 41, 5, 'deliveryprefarea'),
	(42, 11, 1, 'deliveryprefarea'),
	(42, 24, 2, 'deliveryprefarea'),
	(42, 35, 3, 'deliveryprefarea'),
	(42, 37, 6, 'deliveryprefarea'),
	(42, 40, 4, 'deliveryprefarea'),
	(42, 41, 5, 'deliveryprefarea'),
	(43, 12, 1, 'deliveryprefarea'),
	(43, 24, 2, 'deliveryprefarea'),
	(43, 35, 3, 'deliveryprefarea'),
	(43, 37, 6, 'deliveryprefarea'),
	(43, 40, 4, 'deliveryprefarea'),
	(43, 41, 5, 'deliveryprefarea'),
	(44, 11, 1, 'deliveryprefarea'),
	(44, 24, 2, 'deliveryprefarea'),
	(44, 35, 3, 'deliveryprefarea'),
	(44, 37, 6, 'deliveryprefarea'),
	(44, 40, 4, 'deliveryprefarea'),
	(44, 41, 5, 'deliveryprefarea'),
	(45, 12, 1, 'deliveryprefarea'),
	(45, 24, 2, 'deliveryprefarea'),
	(45, 35, 3, 'deliveryprefarea'),
	(45, 37, 6, 'deliveryprefarea'),
	(45, 40, 4, 'deliveryprefarea'),
	(45, 41, 5, 'deliveryprefarea'),
	(46, 12, 1, 'deliveryprefarea'),
	(46, 24, 2, 'deliveryprefarea'),
	(46, 35, 3, 'deliveryprefarea'),
	(46, 37, 6, 'deliveryprefarea'),
	(46, 40, 4, 'deliveryprefarea'),
	(46, 41, 5, 'deliveryprefarea'),
	(47, 13, 1, 'deliveryprefarea'),
	(47, 25, 2, 'deliveryprefarea'),
	(47, 36, 3, 'deliveryprefarea'),
	(47, 37, 6, 'deliveryprefarea'),
	(47, 40, 4, 'deliveryprefarea'),
	(47, 41, 5, 'deliveryprefarea');

TRUNCATE plg_delivery_fee_extension_dtb_delivery_size;
INSERT INTO `plg_delivery_fee_extension_dtb_delivery_size` (`id`, `product_size_id`, `delivery_size_condition_id`, `name`, `quantity`, `sort_no`, `create_date`, `update_date`, `discriminator_type`)
VALUES
	(1, 1, 1, '樽10L1本', 1, 1, now(), now(), 'deliverysize'),
	(2, 2, 1, '樽15L1本', 1, 3, now(), now(), 'deliverysize'),
	(5, 3, 1, '樽20L1本', 1, 5, now(), now(), 'deliverysize'),
	(8, 4, 1, '瓶・缶1ケース (24本)', 1, 9, now(), now(), 'deliverysize'),
	(9, 1, 1, '樽10L結束', 2, 2, now(), now(), 'deliverysize'),
	(10, 2, 1, '樽15L結束', 2, 4, now(), now(), 'deliverysize'),
	(11, 4, 1, '瓶・缶結束 (48本)', 2, 10, now(), now(), 'deliverysize');
ALTER TABLE plg_delivery_fee_extension_dtb_delivery_size AUTO_INCREMENT = 12;

TRUNCATE plg_delivery_fee_extension_dtb_delivery_size_area_fee;
INSERT INTO `plg_delivery_fee_extension_dtb_delivery_size_area_fee` (`id`, `delivery_area_id`, `delivery_size_id`, `delivery_id`, `fee`, `discriminator_type`)
VALUES
	(1, 1, 1, 1, 0.00, 'deliverysizeareafee'),
	(2, 2, 1, 1, 0.00, 'deliverysizeareafee'),
	(3, 3, 1, 1, 0.00, 'deliverysizeareafee'),
	(4, 4, 1, 1, 0.00, 'deliverysizeareafee'),
	(5, 5, 1, 1, 0.00, 'deliverysizeareafee'),
	(6, 6, 1, 1, 0.00, 'deliverysizeareafee'),
	(7, 7, 1, 1, 0.00, 'deliverysizeareafee'),
	(8, 8, 1, 1, 0.00, 'deliverysizeareafee'),
	(9, 9, 1, 1, 0.00, 'deliverysizeareafee'),
	(10, 10, 1, 1, 0.00, 'deliverysizeareafee'),
	(11, 11, 1, 1, 0.00, 'deliverysizeareafee'),
	(12, 12, 1, 1, 0.00, 'deliverysizeareafee'),
	(13, 13, 1, 1, 0.00, 'deliverysizeareafee'),
	(14, 1, 9, 1, 0.00, 'deliverysizeareafee'),
	(15, 2, 9, 1, 0.00, 'deliverysizeareafee'),
	(16, 3, 9, 1, 0.00, 'deliverysizeareafee'),
	(17, 4, 9, 1, 0.00, 'deliverysizeareafee'),
	(18, 5, 9, 1, 0.00, 'deliverysizeareafee'),
	(19, 6, 9, 1, 0.00, 'deliverysizeareafee'),
	(20, 7, 9, 1, 0.00, 'deliverysizeareafee'),
	(21, 8, 9, 1, 0.00, 'deliverysizeareafee'),
	(22, 9, 9, 1, 0.00, 'deliverysizeareafee'),
	(23, 10, 9, 1, 0.00, 'deliverysizeareafee'),
	(24, 11, 9, 1, 0.00, 'deliverysizeareafee'),
	(25, 12, 9, 1, 0.00, 'deliverysizeareafee'),
	(26, 13, 9, 1, 0.00, 'deliverysizeareafee'),
	(27, 1, 2, 1, 0.00, 'deliverysizeareafee'),
	(28, 2, 2, 1, 0.00, 'deliverysizeareafee'),
	(29, 3, 2, 1, 0.00, 'deliverysizeareafee'),
	(30, 4, 2, 1, 0.00, 'deliverysizeareafee'),
	(31, 5, 2, 1, 0.00, 'deliverysizeareafee'),
	(32, 6, 2, 1, 0.00, 'deliverysizeareafee'),
	(33, 7, 2, 1, 0.00, 'deliverysizeareafee'),
	(34, 8, 2, 1, 0.00, 'deliverysizeareafee'),
	(35, 9, 2, 1, 0.00, 'deliverysizeareafee'),
	(36, 10, 2, 1, 0.00, 'deliverysizeareafee'),
	(37, 11, 2, 1, 0.00, 'deliverysizeareafee'),
	(38, 12, 2, 1, 0.00, 'deliverysizeareafee'),
	(39, 13, 2, 1, 0.00, 'deliverysizeareafee'),
	(40, 1, 10, 1, 0.00, 'deliverysizeareafee'),
	(41, 2, 10, 1, 0.00, 'deliverysizeareafee'),
	(42, 3, 10, 1, 0.00, 'deliverysizeareafee'),
	(43, 4, 10, 1, 0.00, 'deliverysizeareafee'),
	(44, 5, 10, 1, 0.00, 'deliverysizeareafee'),
	(45, 6, 10, 1, 0.00, 'deliverysizeareafee'),
	(46, 7, 10, 1, 0.00, 'deliverysizeareafee'),
	(47, 8, 10, 1, 0.00, 'deliverysizeareafee'),
	(48, 9, 10, 1, 0.00, 'deliverysizeareafee'),
	(49, 10, 10, 1, 0.00, 'deliverysizeareafee'),
	(50, 11, 10, 1, 0.00, 'deliverysizeareafee'),
	(51, 12, 10, 1, 0.00, 'deliverysizeareafee'),
	(52, 13, 10, 1, 0.00, 'deliverysizeareafee'),
	(53, 1, 5, 1, 0.00, 'deliverysizeareafee'),
	(54, 2, 5, 1, 0.00, 'deliverysizeareafee'),
	(55, 3, 5, 1, 0.00, 'deliverysizeareafee'),
	(56, 4, 5, 1, 0.00, 'deliverysizeareafee'),
	(57, 5, 5, 1, 0.00, 'deliverysizeareafee'),
	(58, 6, 5, 1, 0.00, 'deliverysizeareafee'),
	(59, 7, 5, 1, 0.00, 'deliverysizeareafee'),
	(60, 8, 5, 1, 0.00, 'deliverysizeareafee'),
	(61, 9, 5, 1, 0.00, 'deliverysizeareafee'),
	(62, 10, 5, 1, 0.00, 'deliverysizeareafee'),
	(63, 11, 5, 1, 0.00, 'deliverysizeareafee'),
	(64, 12, 5, 1, 0.00, 'deliverysizeareafee'),
	(65, 13, 5, 1, 0.00, 'deliverysizeareafee'),
	(105, 1, 8, 1, 0.00, 'deliverysizeareafee'),
	(106, 2, 8, 1, 0.00, 'deliverysizeareafee'),
	(107, 3, 8, 1, 0.00, 'deliverysizeareafee'),
	(108, 4, 8, 1, 0.00, 'deliverysizeareafee'),
	(109, 5, 8, 1, 0.00, 'deliverysizeareafee'),
	(110, 6, 8, 1, 0.00, 'deliverysizeareafee'),
	(111, 7, 8, 1, 0.00, 'deliverysizeareafee'),
	(112, 8, 8, 1, 0.00, 'deliverysizeareafee'),
	(113, 9, 8, 1, 0.00, 'deliverysizeareafee'),
	(114, 10, 8, 1, 0.00, 'deliverysizeareafee'),
	(115, 11, 8, 1, 0.00, 'deliverysizeareafee'),
	(116, 12, 8, 1, 0.00, 'deliverysizeareafee'),
	(117, 13, 8, 1, 0.00, 'deliverysizeareafee'),
	(118, 39, 1, 4, 0.00, 'deliverysizeareafee'),
	(119, 40, 1, 4, 0.00, 'deliverysizeareafee'),
	(120, 39, 9, 4, 0.00, 'deliverysizeareafee'),
	(121, 40, 9, 4, 0.00, 'deliverysizeareafee'),
	(122, 39, 2, 4, 0.00, 'deliverysizeareafee'),
	(123, 40, 2, 4, 0.00, 'deliverysizeareafee'),
	(124, 39, 10, 4, 0.00, 'deliverysizeareafee'),
	(125, 40, 10, 4, 0.00, 'deliverysizeareafee'),
	(126, 39, 5, 4, 0.00, 'deliverysizeareafee'),
	(127, 40, 5, 4, 0.00, 'deliverysizeareafee'),
	(134, 39, 8, 4, 0.00, 'deliverysizeareafee'),
	(135, 40, 8, 4, 0.00, 'deliverysizeareafee'),
	(136, 26, 1, 3, 0.00, 'deliverysizeareafee'),
	(137, 27, 1, 3, 0.00, 'deliverysizeareafee'),
	(138, 28, 1, 3, 0.00, 'deliverysizeareafee'),
	(139, 29, 1, 3, 0.00, 'deliverysizeareafee'),
	(140, 30, 1, 3, 0.00, 'deliverysizeareafee'),
	(141, 31, 1, 3, 0.00, 'deliverysizeareafee'),
	(142, 32, 1, 3, 0.00, 'deliverysizeareafee'),
	(143, 33, 1, 3, 0.00, 'deliverysizeareafee'),
	(144, 34, 1, 3, 0.00, 'deliverysizeareafee'),
	(145, 35, 1, 3, 0.00, 'deliverysizeareafee'),
	(146, 36, 1, 3, 0.00, 'deliverysizeareafee'),
	(147, 26, 9, 3, 0.00, 'deliverysizeareafee'),
	(148, 27, 9, 3, 0.00, 'deliverysizeareafee'),
	(149, 28, 9, 3, 0.00, 'deliverysizeareafee'),
	(150, 29, 9, 3, 0.00, 'deliverysizeareafee'),
	(151, 30, 9, 3, 0.00, 'deliverysizeareafee'),
	(152, 31, 9, 3, 0.00, 'deliverysizeareafee'),
	(153, 32, 9, 3, 0.00, 'deliverysizeareafee'),
	(154, 33, 9, 3, 0.00, 'deliverysizeareafee'),
	(155, 34, 9, 3, 0.00, 'deliverysizeareafee'),
	(156, 35, 9, 3, 0.00, 'deliverysizeareafee'),
	(157, 36, 9, 3, 0.00, 'deliverysizeareafee'),
	(158, 26, 2, 3, 0.00, 'deliverysizeareafee'),
	(159, 27, 2, 3, 0.00, 'deliverysizeareafee'),
	(160, 28, 2, 3, 0.00, 'deliverysizeareafee'),
	(161, 29, 2, 3, 0.00, 'deliverysizeareafee'),
	(162, 30, 2, 3, 0.00, 'deliverysizeareafee'),
	(163, 31, 2, 3, 0.00, 'deliverysizeareafee'),
	(164, 32, 2, 3, 0.00, 'deliverysizeareafee'),
	(165, 33, 2, 3, 0.00, 'deliverysizeareafee'),
	(166, 34, 2, 3, 0.00, 'deliverysizeareafee'),
	(167, 35, 2, 3, 0.00, 'deliverysizeareafee'),
	(168, 36, 2, 3, 0.00, 'deliverysizeareafee'),
	(169, 26, 10, 3, 0.00, 'deliverysizeareafee'),
	(170, 27, 10, 3, 0.00, 'deliverysizeareafee'),
	(171, 28, 10, 3, 0.00, 'deliverysizeareafee'),
	(172, 29, 10, 3, 0.00, 'deliverysizeareafee'),
	(173, 30, 10, 3, 0.00, 'deliverysizeareafee'),
	(174, 31, 10, 3, 0.00, 'deliverysizeareafee'),
	(175, 32, 10, 3, 0.00, 'deliverysizeareafee'),
	(176, 33, 10, 3, 0.00, 'deliverysizeareafee'),
	(177, 34, 10, 3, 0.00, 'deliverysizeareafee'),
	(178, 35, 10, 3, 0.00, 'deliverysizeareafee'),
	(179, 36, 10, 3, 0.00, 'deliverysizeareafee'),
	(180, 26, 5, 3, 0.00, 'deliverysizeareafee'),
	(181, 27, 5, 3, 0.00, 'deliverysizeareafee'),
	(182, 28, 5, 3, 0.00, 'deliverysizeareafee'),
	(183, 29, 5, 3, 0.00, 'deliverysizeareafee'),
	(184, 30, 5, 3, 0.00, 'deliverysizeareafee'),
	(185, 31, 5, 3, 0.00, 'deliverysizeareafee'),
	(186, 32, 5, 3, 0.00, 'deliverysizeareafee'),
	(187, 33, 5, 3, 0.00, 'deliverysizeareafee'),
	(188, 34, 5, 3, 0.00, 'deliverysizeareafee'),
	(189, 35, 5, 3, 0.00, 'deliverysizeareafee'),
	(190, 36, 5, 3, 0.00, 'deliverysizeareafee'),
	(224, 26, 8, 3, 0.00, 'deliverysizeareafee'),
	(225, 27, 8, 3, 0.00, 'deliverysizeareafee'),
	(226, 28, 8, 3, 0.00, 'deliverysizeareafee'),
	(227, 29, 8, 3, 0.00, 'deliverysizeareafee'),
	(228, 30, 8, 3, 0.00, 'deliverysizeareafee'),
	(229, 31, 8, 3, 0.00, 'deliverysizeareafee'),
	(230, 32, 8, 3, 0.00, 'deliverysizeareafee'),
	(231, 33, 8, 3, 0.00, 'deliverysizeareafee'),
	(232, 34, 8, 3, 0.00, 'deliverysizeareafee'),
	(233, 35, 8, 3, 0.00, 'deliverysizeareafee'),
	(234, 36, 8, 3, 0.00, 'deliverysizeareafee'),
	(235, 37, 1, 6, 0.00, 'deliverysizeareafee'),
	(236, 38, 1, 6, 0.00, 'deliverysizeareafee'),
	(237, 37, 9, 6, 0.00, 'deliverysizeareafee'),
	(238, 38, 9, 6, 0.00, 'deliverysizeareafee'),
	(239, 37, 2, 6, 0.00, 'deliverysizeareafee'),
	(240, 38, 2, 6, 0.00, 'deliverysizeareafee'),
	(241, 37, 10, 6, 0.00, 'deliverysizeareafee'),
	(242, 38, 10, 6, 0.00, 'deliverysizeareafee'),
	(243, 37, 5, 6, 0.00, 'deliverysizeareafee'),
	(244, 38, 5, 6, 0.00, 'deliverysizeareafee'),
	(251, 37, 8, 6, 0.00, 'deliverysizeareafee'),
	(252, 38, 8, 6, 0.00, 'deliverysizeareafee'),
	(253, 41, 1, 5, 0.00, 'deliverysizeareafee'),
	(254, 42, 1, 5, 0.00, 'deliverysizeareafee'),
	(255, 43, 1, 5, 0.00, 'deliverysizeareafee'),
	(256, 44, 1, 5, 0.00, 'deliverysizeareafee'),
	(257, 45, 1, 5, 0.00, 'deliverysizeareafee'),
	(258, 46, 1, 5, 0.00, 'deliverysizeareafee'),
	(259, 47, 1, 5, 0.00, 'deliverysizeareafee'),
	(260, 48, 1, 5, 0.00, 'deliverysizeareafee'),
	(261, 49, 1, 5, 0.00, 'deliverysizeareafee'),
	(262, 50, 1, 5, 0.00, 'deliverysizeareafee'),
	(263, 51, 1, 5, 0.00, 'deliverysizeareafee'),
	(264, 52, 1, 5, 0.00, 'deliverysizeareafee'),
	(265, 41, 9, 5, 0.00, 'deliverysizeareafee'),
	(266, 42, 9, 5, 0.00, 'deliverysizeareafee'),
	(267, 43, 9, 5, 0.00, 'deliverysizeareafee'),
	(268, 44, 9, 5, 0.00, 'deliverysizeareafee'),
	(269, 45, 9, 5, 0.00, 'deliverysizeareafee'),
	(270, 46, 9, 5, 0.00, 'deliverysizeareafee'),
	(271, 47, 9, 5, 0.00, 'deliverysizeareafee'),
	(272, 48, 9, 5, 0.00, 'deliverysizeareafee'),
	(273, 49, 9, 5, 0.00, 'deliverysizeareafee'),
	(274, 50, 9, 5, 0.00, 'deliverysizeareafee'),
	(275, 51, 9, 5, 0.00, 'deliverysizeareafee'),
	(276, 52, 9, 5, 0.00, 'deliverysizeareafee'),
	(277, 41, 2, 5, 0.00, 'deliverysizeareafee'),
	(278, 42, 2, 5, 0.00, 'deliverysizeareafee'),
	(279, 43, 2, 5, 0.00, 'deliverysizeareafee'),
	(280, 44, 2, 5, 0.00, 'deliverysizeareafee'),
	(281, 45, 2, 5, 0.00, 'deliverysizeareafee'),
	(282, 46, 2, 5, 0.00, 'deliverysizeareafee'),
	(283, 47, 2, 5, 0.00, 'deliverysizeareafee'),
	(284, 48, 2, 5, 0.00, 'deliverysizeareafee'),
	(285, 49, 2, 5, 0.00, 'deliverysizeareafee'),
	(286, 50, 2, 5, 0.00, 'deliverysizeareafee'),
	(287, 51, 2, 5, 0.00, 'deliverysizeareafee'),
	(288, 52, 2, 5, 0.00, 'deliverysizeareafee'),
	(289, 41, 10, 5, 0.00, 'deliverysizeareafee'),
	(290, 42, 10, 5, 0.00, 'deliverysizeareafee'),
	(291, 43, 10, 5, 0.00, 'deliverysizeareafee'),
	(292, 44, 10, 5, 0.00, 'deliverysizeareafee'),
	(293, 45, 10, 5, 0.00, 'deliverysizeareafee'),
	(294, 46, 10, 5, 0.00, 'deliverysizeareafee'),
	(295, 47, 10, 5, 0.00, 'deliverysizeareafee'),
	(296, 48, 10, 5, 0.00, 'deliverysizeareafee'),
	(297, 49, 10, 5, 0.00, 'deliverysizeareafee'),
	(298, 50, 10, 5, 0.00, 'deliverysizeareafee'),
	(299, 51, 10, 5, 0.00, 'deliverysizeareafee'),
	(300, 52, 10, 5, 0.00, 'deliverysizeareafee'),
	(301, 41, 5, 5, 0.00, 'deliverysizeareafee'),
	(302, 42, 5, 5, 0.00, 'deliverysizeareafee'),
	(303, 43, 5, 5, 0.00, 'deliverysizeareafee'),
	(304, 44, 5, 5, 0.00, 'deliverysizeareafee'),
	(305, 45, 5, 5, 0.00, 'deliverysizeareafee'),
	(306, 46, 5, 5, 0.00, 'deliverysizeareafee'),
	(307, 47, 5, 5, 0.00, 'deliverysizeareafee'),
	(308, 48, 5, 5, 0.00, 'deliverysizeareafee'),
	(309, 49, 5, 5, 0.00, 'deliverysizeareafee'),
	(310, 50, 5, 5, 0.00, 'deliverysizeareafee'),
	(311, 51, 5, 5, 0.00, 'deliverysizeareafee'),
	(312, 52, 5, 5, 0.00, 'deliverysizeareafee'),
	(349, 41, 8, 5, 0.00, 'deliverysizeareafee'),
	(350, 42, 8, 5, 0.00, 'deliverysizeareafee'),
	(351, 43, 8, 5, 0.00, 'deliverysizeareafee'),
	(352, 44, 8, 5, 0.00, 'deliverysizeareafee'),
	(353, 45, 8, 5, 0.00, 'deliverysizeareafee'),
	(354, 46, 8, 5, 0.00, 'deliverysizeareafee'),
	(355, 47, 8, 5, 0.00, 'deliverysizeareafee'),
	(356, 48, 8, 5, 0.00, 'deliverysizeareafee'),
	(357, 49, 8, 5, 0.00, 'deliverysizeareafee'),
	(358, 50, 8, 5, 0.00, 'deliverysizeareafee'),
	(359, 51, 8, 5, 0.00, 'deliverysizeareafee'),
	(360, 52, 8, 5, 0.00, 'deliverysizeareafee'),
	(361, 41, 11, 5, 0.00, 'deliverysizeareafee'),
	(362, 42, 11, 5, 0.00, 'deliverysizeareafee'),
	(363, 43, 11, 5, 0.00, 'deliverysizeareafee'),
	(364, 44, 11, 5, 0.00, 'deliverysizeareafee'),
	(365, 45, 11, 5, 0.00, 'deliverysizeareafee'),
	(366, 46, 11, 5, 0.00, 'deliverysizeareafee'),
	(367, 47, 11, 5, 0.00, 'deliverysizeareafee'),
	(368, 48, 11, 5, 0.00, 'deliverysizeareafee'),
	(369, 49, 11, 5, 0.00, 'deliverysizeareafee'),
	(370, 50, 11, 5, 0.00, 'deliverysizeareafee'),
	(371, 51, 11, 5, 0.00, 'deliverysizeareafee'),
	(372, 52, 11, 5, 0.00, 'deliverysizeareafee'),
	(373, 39, 11, 4, 0.00, 'deliverysizeareafee'),
	(374, 40, 11, 4, 0.00, 'deliverysizeareafee'),
	(375, 37, 11, 6, 0.00, 'deliverysizeareafee'),
	(376, 38, 11, 6, 0.00, 'deliverysizeareafee'),
	(377, 26, 11, 3, 0.00, 'deliverysizeareafee'),
	(378, 27, 11, 3, 0.00, 'deliverysizeareafee'),
	(379, 28, 11, 3, 0.00, 'deliverysizeareafee'),
	(380, 29, 11, 3, 0.00, 'deliverysizeareafee'),
	(381, 30, 11, 3, 0.00, 'deliverysizeareafee'),
	(382, 31, 11, 3, 0.00, 'deliverysizeareafee'),
	(383, 32, 11, 3, 0.00, 'deliverysizeareafee'),
	(384, 33, 11, 3, 0.00, 'deliverysizeareafee'),
	(385, 34, 11, 3, 0.00, 'deliverysizeareafee'),
	(386, 35, 11, 3, 0.00, 'deliverysizeareafee'),
	(387, 36, 11, 3, 0.00, 'deliverysizeareafee'),
	(388, 14, 1, 2, 0.00, 'deliverysizeareafee'),
	(389, 15, 1, 2, 0.00, 'deliverysizeareafee'),
	(390, 16, 1, 2, 0.00, 'deliverysizeareafee'),
	(391, 17, 1, 2, 0.00, 'deliverysizeareafee'),
	(392, 18, 1, 2, 0.00, 'deliverysizeareafee'),
	(393, 19, 1, 2, 0.00, 'deliverysizeareafee'),
	(394, 20, 1, 2, 0.00, 'deliverysizeareafee'),
	(395, 21, 1, 2, 0.00, 'deliverysizeareafee'),
	(396, 22, 1, 2, 0.00, 'deliverysizeareafee'),
	(397, 23, 1, 2, 0.00, 'deliverysizeareafee'),
	(398, 24, 1, 2, 0.00, 'deliverysizeareafee'),
	(399, 25, 1, 2, 0.00, 'deliverysizeareafee'),
	(400, 14, 9, 2, 0.00, 'deliverysizeareafee'),
	(401, 15, 9, 2, 0.00, 'deliverysizeareafee'),
	(402, 16, 9, 2, 0.00, 'deliverysizeareafee'),
	(403, 17, 9, 2, 0.00, 'deliverysizeareafee'),
	(404, 18, 9, 2, 0.00, 'deliverysizeareafee'),
	(405, 19, 9, 2, 0.00, 'deliverysizeareafee'),
	(406, 20, 9, 2, 0.00, 'deliverysizeareafee'),
	(407, 21, 9, 2, 0.00, 'deliverysizeareafee'),
	(408, 22, 9, 2, 0.00, 'deliverysizeareafee'),
	(409, 23, 9, 2, 0.00, 'deliverysizeareafee'),
	(410, 24, 9, 2, 0.00, 'deliverysizeareafee'),
	(411, 25, 9, 2, 0.00, 'deliverysizeareafee'),
	(412, 14, 2, 2, 0.00, 'deliverysizeareafee'),
	(413, 15, 2, 2, 0.00, 'deliverysizeareafee'),
	(414, 16, 2, 2, 0.00, 'deliverysizeareafee'),
	(415, 17, 2, 2, 0.00, 'deliverysizeareafee'),
	(416, 18, 2, 2, 0.00, 'deliverysizeareafee'),
	(417, 19, 2, 2, 0.00, 'deliverysizeareafee'),
	(418, 20, 2, 2, 0.00, 'deliverysizeareafee'),
	(419, 21, 2, 2, 0.00, 'deliverysizeareafee'),
	(420, 22, 2, 2, 0.00, 'deliverysizeareafee'),
	(421, 23, 2, 2, 0.00, 'deliverysizeareafee'),
	(422, 24, 2, 2, 0.00, 'deliverysizeareafee'),
	(423, 25, 2, 2, 0.00, 'deliverysizeareafee'),
	(424, 14, 10, 2, 0.00, 'deliverysizeareafee'),
	(425, 15, 10, 2, 0.00, 'deliverysizeareafee'),
	(426, 16, 10, 2, 0.00, 'deliverysizeareafee'),
	(427, 17, 10, 2, 0.00, 'deliverysizeareafee'),
	(428, 18, 10, 2, 0.00, 'deliverysizeareafee'),
	(429, 19, 10, 2, 0.00, 'deliverysizeareafee'),
	(430, 20, 10, 2, 0.00, 'deliverysizeareafee'),
	(431, 21, 10, 2, 0.00, 'deliverysizeareafee'),
	(432, 22, 10, 2, 0.00, 'deliverysizeareafee'),
	(433, 23, 10, 2, 0.00, 'deliverysizeareafee'),
	(434, 24, 10, 2, 0.00, 'deliverysizeareafee'),
	(435, 25, 10, 2, 0.00, 'deliverysizeareafee'),
	(436, 14, 5, 2, 0.00, 'deliverysizeareafee'),
	(437, 15, 5, 2, 0.00, 'deliverysizeareafee'),
	(438, 16, 5, 2, 0.00, 'deliverysizeareafee'),
	(439, 17, 5, 2, 0.00, 'deliverysizeareafee'),
	(440, 18, 5, 2, 0.00, 'deliverysizeareafee'),
	(441, 19, 5, 2, 0.00, 'deliverysizeareafee'),
	(442, 20, 5, 2, 0.00, 'deliverysizeareafee'),
	(443, 21, 5, 2, 0.00, 'deliverysizeareafee'),
	(444, 22, 5, 2, 0.00, 'deliverysizeareafee'),
	(445, 23, 5, 2, 0.00, 'deliverysizeareafee'),
	(446, 24, 5, 2, 0.00, 'deliverysizeareafee'),
	(447, 25, 5, 2, 0.00, 'deliverysizeareafee'),
	(484, 14, 8, 2, 0.00, 'deliverysizeareafee'),
	(485, 15, 8, 2, 0.00, 'deliverysizeareafee'),
	(486, 16, 8, 2, 0.00, 'deliverysizeareafee'),
	(487, 17, 8, 2, 0.00, 'deliverysizeareafee'),
	(488, 18, 8, 2, 0.00, 'deliverysizeareafee'),
	(489, 19, 8, 2, 0.00, 'deliverysizeareafee'),
	(490, 20, 8, 2, 0.00, 'deliverysizeareafee'),
	(491, 21, 8, 2, 0.00, 'deliverysizeareafee'),
	(492, 22, 8, 2, 0.00, 'deliverysizeareafee'),
	(493, 23, 8, 2, 0.00, 'deliverysizeareafee'),
	(494, 24, 8, 2, 0.00, 'deliverysizeareafee'),
	(495, 25, 8, 2, 0.00, 'deliverysizeareafee'),
	(496, 14, 11, 2, 0.00, 'deliverysizeareafee'),
	(497, 15, 11, 2, 0.00, 'deliverysizeareafee'),
	(498, 16, 11, 2, 0.00, 'deliverysizeareafee'),
	(499, 17, 11, 2, 0.00, 'deliverysizeareafee'),
	(500, 18, 11, 2, 0.00, 'deliverysizeareafee'),
	(501, 19, 11, 2, 0.00, 'deliverysizeareafee'),
	(502, 20, 11, 2, 0.00, 'deliverysizeareafee'),
	(503, 21, 11, 2, 0.00, 'deliverysizeareafee'),
	(504, 22, 11, 2, 0.00, 'deliverysizeareafee'),
	(505, 23, 11, 2, 0.00, 'deliverysizeareafee'),
	(506, 24, 11, 2, 0.00, 'deliverysizeareafee'),
	(507, 25, 11, 2, 0.00, 'deliverysizeareafee'),
	(508, 1, 11, 1, 0.00, 'deliverysizeareafee'),
	(509, 2, 11, 1, 0.00, 'deliverysizeareafee'),
	(510, 3, 11, 1, 0.00, 'deliverysizeareafee'),
	(511, 4, 11, 1, 0.00, 'deliverysizeareafee'),
	(512, 5, 11, 1, 0.00, 'deliverysizeareafee'),
	(513, 6, 11, 1, 0.00, 'deliverysizeareafee'),
	(514, 7, 11, 1, 0.00, 'deliverysizeareafee'),
	(515, 8, 11, 1, 0.00, 'deliverysizeareafee'),
	(516, 9, 11, 1, 0.00, 'deliverysizeareafee'),
	(517, 10, 11, 1, 0.00, 'deliverysizeareafee'),
	(518, 11, 11, 1, 0.00, 'deliverysizeareafee'),
	(519, 12, 11, 1, 0.00, 'deliverysizeareafee'),
	(520, 13, 11, 1, 0.00, 'deliverysizeareafee');
ALTER TABLE plg_delivery_fee_extension_dtb_delivery_size_area_fee AUTO_INCREMENT = 521;

TRUNCATE plg_delivery_fee_extension_dtb_product_delivery_product_size;
INSERT INTO `plg_delivery_fee_extension_dtb_product_delivery_product_size` (`product_class_id`, `delivery_id`, `product_size_id`, `visible`, `discriminator_type`)
VALUES
	(1, 1, NULL, 1, 'productdeliveryproductsize'),
	(1, 2, NULL, 1, 'productdeliveryproductsize'),
	(1, 3, NULL, 1, 'productdeliveryproductsize'),
	(1, 4, NULL, 1, 'productdeliveryproductsize'),
	(1, 5, NULL, 1, 'productdeliveryproductsize'),
	(2, 1, 8, 1, 'productdeliveryproductsize'),
	(2, 2, 8, 1, 'productdeliveryproductsize'),
	(2, 3, 8, 1, 'productdeliveryproductsize'),
	(2, 4, 8, 1, 'productdeliveryproductsize'),
	(2, 5, 8, 1, 'productdeliveryproductsize'),
	(2, 6, 8, 1, 'productdeliveryproductsize'),
	(5, 1, 2, 1, 'productdeliveryproductsize'),
	(5, 2, 2, 1, 'productdeliveryproductsize'),
	(5, 3, 2, 1, 'productdeliveryproductsize'),
	(5, 4, 2, 1, 'productdeliveryproductsize'),
	(5, 5, 2, 1, 'productdeliveryproductsize'),
	(5, 6, 2, 1, 'productdeliveryproductsize'),
	(6, 1, 3, 1, 'productdeliveryproductsize'),
	(6, 2, 3, 1, 'productdeliveryproductsize'),
	(6, 3, 3, 1, 'productdeliveryproductsize'),
	(6, 4, 3, 1, 'productdeliveryproductsize'),
	(6, 5, 3, 1, 'productdeliveryproductsize'),
	(6, 6, 3, 1, 'productdeliveryproductsize'),
	(7, 1, 2, 1, 'productdeliveryproductsize'),
	(7, 2, 2, 1, 'productdeliveryproductsize'),
	(7, 3, 2, 1, 'productdeliveryproductsize'),
	(7, 4, 2, 1, 'productdeliveryproductsize'),
	(7, 5, 2, 1, 'productdeliveryproductsize'),
	(7, 6, 2, 1, 'productdeliveryproductsize'),
	(8, 1, 1, 1, 'productdeliveryproductsize'),
	(8, 2, 1, 1, 'productdeliveryproductsize'),
	(8, 3, 1, 1, 'productdeliveryproductsize'),
	(8, 4, 1, 1, 'productdeliveryproductsize'),
	(8, 5, 1, 1, 'productdeliveryproductsize'),
	(8, 6, 1, 1, 'productdeliveryproductsize'),
	(9, 1, 1, 1, 'productdeliveryproductsize'),
	(9, 2, 1, 1, 'productdeliveryproductsize'),
	(9, 3, 1, 1, 'productdeliveryproductsize'),
	(9, 4, 1, 1, 'productdeliveryproductsize'),
	(9, 5, 1, 1, 'productdeliveryproductsize'),
	(9, 6, 1, 1, 'productdeliveryproductsize'),
	(10, 1, NULL, 1, 'productdeliveryproductsize'),
	(10, 2, NULL, 1, 'productdeliveryproductsize'),
	(10, 3, NULL, 1, 'productdeliveryproductsize'),
	(10, 4, NULL, 1, 'productdeliveryproductsize'),
	(10, 5, NULL, 1, 'productdeliveryproductsize'),
	(10, 6, NULL, 1, 'productdeliveryproductsize'),
	(11, 1, 8, 1, 'productdeliveryproductsize'),
	(11, 2, 8, 1, 'productdeliveryproductsize'),
	(11, 3, 8, 1, 'productdeliveryproductsize'),
	(11, 4, 8, 1, 'productdeliveryproductsize'),
	(11, 5, 8, 1, 'productdeliveryproductsize'),
	(11, 6, 8, 1, 'productdeliveryproductsize'),
	(14, 1, 8, 1, 'productdeliveryproductsize'),
	(14, 2, 8, 1, 'productdeliveryproductsize'),
	(14, 3, 8, 1, 'productdeliveryproductsize'),
	(14, 4, 8, 1, 'productdeliveryproductsize'),
	(14, 5, 8, 1, 'productdeliveryproductsize'),
	(14, 6, 8, 1, 'productdeliveryproductsize'),
	(17, 1, 8, 1, 'productdeliveryproductsize'),
	(17, 2, 8, 1, 'productdeliveryproductsize'),
	(17, 3, 8, 1, 'productdeliveryproductsize'),
	(17, 4, 8, 1, 'productdeliveryproductsize'),
	(17, 5, 8, 1, 'productdeliveryproductsize'),
	(17, 6, 8, 1, 'productdeliveryproductsize'),
	(20, 1, NULL, 1, 'productdeliveryproductsize'),
	(20, 2, NULL, 1, 'productdeliveryproductsize'),
	(20, 3, NULL, 1, 'productdeliveryproductsize'),
	(20, 4, NULL, 1, 'productdeliveryproductsize'),
	(20, 5, NULL, 1, 'productdeliveryproductsize'),
	(20, 6, NULL, 1, 'productdeliveryproductsize'),
	(21, 1, NULL, 1, 'productdeliveryproductsize'),
	(21, 2, NULL, 1, 'productdeliveryproductsize'),
	(21, 3, NULL, 1, 'productdeliveryproductsize'),
	(21, 4, NULL, 1, 'productdeliveryproductsize'),
	(21, 5, NULL, 1, 'productdeliveryproductsize'),
	(21, 6, NULL, 1, 'productdeliveryproductsize'),
	(22, 1, 1, 1, 'productdeliveryproductsize'),
	(22, 2, 1, 1, 'productdeliveryproductsize'),
	(22, 3, 1, 1, 'productdeliveryproductsize'),
	(22, 4, 1, 1, 'productdeliveryproductsize'),
	(22, 5, 1, 1, 'productdeliveryproductsize'),
	(22, 6, 1, 1, 'productdeliveryproductsize');

TRUNCATE plg_delivery_fee_extension_dtb_product_size;
INSERT INTO `plg_delivery_fee_extension_dtb_product_size` (`id`, `name`, `sort_no`, `create_date`, `update_date`, `discriminator_type`)
VALUES
	(1, '樽10L', 1, now(), now(), 'productsize'),
	(2, '樽15L', 2, now(), now(), 'productsize'),
	(3, '樽20L', 3, now(), now(), 'productsize'),
	(4, '瓶・缶1ケース (24本)', 4, now(), now(), 'productsize');
ALTER TABLE plg_delivery_fee_extension_dtb_product_size AUTO_INCREMENT = 4;

-- customers
TRUNCATE dtb_customer;
INSERT INTO `dtb_customer` (`id`, `customer_status_id`, `sex_id`, `job_id`, `country_id`, `pref_id`, `name01`, `name02`, `kana01`, `kana02`, `company_name`, `postal_code`, `addr01`, `addr02`, `email`, `phone_number`, `birth`, `password`, `salt`, `secret_key`, `first_buy_date`, `last_buy_date`, `buy_times`, `buy_total`, `note`, `reset_key`, `reset_expire`, `point`, `create_date`, `update_date`, `discriminator_type`, `invoice_parent_customer_id`, `customize_store_name`, `customize_account_name`, `customize_invoice_parent_key`, `plg_invoice_docurain_invoice_memo`)
VALUES
	(1, 2, NULL, NULL, NULL, 11, 'BestBeerJapan', 'プラットフォーム', 'ベストビアジャパン', 'プラットフォーム', 'Best Beer Japan株式会社', '3510011', '朝霞市本町', '1-8-7', 'support@bestbeerjapan.com', '05055392017', NULL, '', NULL, '94Mx3l4en20NIBIzNO5rwUZ2yHafMaQk', NULL, NULL, 0, 0.00, 'プラットフォーム経由の注文です。直接店舗へ商品をお送りください。', NULL, NULL, 0, NOW(), NOW(), 'customer', NULL, '【BBJプラットフォーム経由】', 'ﾍﾞｽﾄﾋﾞｱｰｼﾞｬﾊﾟﾝ', NULL, NULL),
	(2, 2, NULL, NULL, NULL, 11, 'テスト購入', '専用会員', 'テスト', 'テスト', '貴社用のテスト会社', '3510011', '朝霞市本町', '1-1-1', '', '0123456789', NULL, '', NULL, 'BDlTV7LcY6jD6da2kd4os053w5emMWEJ', NULL, NULL, 0, 0.00, NULL, NULL, NULL, 0, NOW(), NOW(), 'customer', NULL, 'テスト購入専用会員', NULL, NULL, '【→の鉛筆ボタンでメモ拡大】請求書を発行したい時は受注一覧で受注に☑を入れて、「請求月を決定」を押してください。\n\n会員一覧にいないお客様の請求書は発行ができませんのでご注意ください。\n\n入金消込みをしたい場合は対象になる請求書に☑を入れてください。\n\nこのお客様は問屋ですので問屋のグループ価格が反映されます。（会員のグループ変更は会員管理 > 会員一覧 > 詳細 > グループ設定）\n\nメモ欄は削除されるまで残ります。（例：索条しない限り、翌日以降も残ります。)\n'),
	(3, 2, NULL, NULL, NULL, 11, '岡山', '源輝', 'オカヤマ', 'ゲンキ', 'BestBeerJapan', '3510011', '朝霞市本町', '1-1-1', 'okayama@bestbeerjapan.com', '08022108912', NULL, '', NULL, 'AdFcf80ZrfJHsgDD02ptLZExXPbjmx14', NULL, NULL, 0, 0.00, NULL, NULL, NULL, 0, NOW(), NOW(), 'customer', NULL, NULL, NULL, NULL, NULL);
ALTER TABLE dtb_customer AUTO_INCREMENT = 4;

TRUNCATE TABLE plg_customer_group_product_class;
INSERT INTO `plg_customer_group_product_class` (`id`, `group_id`, `product_class_id`, `price`, `show_product`, `discriminator_type`)
VALUES
	(1, 1, 22, NULL, 1, 'customergroupproductclass'),
	(2, 2, 22, NULL, 1, 'customergroupproductclass'),
	(3, 3, 22, NULL, 1, 'customergroupproductclass'),
	(4, 4, 22, 8800, 1, 'customergroupproductclass'),
	(5, 5, 22, NULL, 1, 'customergroupproductclass'),
	(6, 6, 22, NULL, 1, 'customergroupproductclass');
ALTER TABLE plg_customer_group_product_class AUTO_INCREMENT = 7;

TRUNCATE TABLE plg_price_rule;
INSERT INTO `plg_price_rule` (`id`, `rule_type`, `rate`, `discriminator_type`)
VALUES
	(1, 2, 0, 'pricerule'),
	(2, 1, 5, 'pricerule'),
	(3, 1, 10, 'pricerule'),
	(4, 1, 15, 'pricerule'),
	(5, 1, 20, 'pricerule');
ALTER TABLE plg_price_rule AUTO_INCREMENT = 6;

TRUNCATE TABLE plg_customer_group;
INSERT INTO `plg_customer_group` (`id`, `name`, `price_rule_id`, `is_guest_group`, `discriminator_type`)
VALUES
	(1, 'ゲスト', 1, 1, 'customergroup'),
	(2, 'お得意様', 2, 0, 'customergroup'),
	(3, '酒屋', 3, 0, 'customergroup'),
	(4, '問屋', 4, 0, 'customergroup'),
	(5, '直営店', 5, 0, 'customergroup'),
	(6, '会員管理でグループ追加', 1, 0, 'customergroup');
ALTER TABLE plg_customer_group AUTO_INCREMENT = 7;

TRUNCATE TABLE plg_customer_group_membership;
INSERT INTO `plg_customer_group_membership` (`id`, `group_id`, `customer_id`, `discriminator_type`)
VALUES
	(1, 1, 1, 'customergroupmembership'),
	(2, 4, 2, 'customergroupmembership'),
	(3, 1, 3, 'customergroupmembership');
ALTER TABLE plg_customer_group_membership AUTO_INCREMENT = 4;

INSERT INTO `plg_delivery_fee_extension_dtb_customer_delivery` (`customer_id`, `delivery_id`, `discriminator_type`)
VALUES
	(2, 4, 'customerdelivery'),
	(2, 6, 'customerdelivery'),
	(3, 4, 'customerdelivery'),
	(3, 6, 'customerdelivery');

-- dtb_afreement
TRUNCATE customize_dtb_agreement;
INSERT INTO `customize_dtb_agreement` (`id`, `agreement_detail`, `discriminator_type`)
VALUES
	(1, '会員登録同意事項の記載方法は、管理画面→会員一覧→会員登録 同意事項より変更が可能です。\r\n以下、同意事項の例です。\r\n\r\n- 冷蔵設備があること\r\n- 樽（高さ50cm × 直径20cm）を保管できる冷蔵設備があること\r\n- ビールを受け取り次第、必ず冷蔵設備にて保管すること\r\n- 樽を丁寧/清潔に取り扱うこと\r\n- 樽が空になり次第速やか（1週間以内）に返却すること', 'agreement');
ALTER TABLE dtb_customer AUTO_INCREMENT = 2;

-- dtb_news
TRUNCATE dtb_news;
INSERT INTO `dtb_news` (`id`, `creator_id`, `publish_date`, `title`, `description`, `url`, `link_method`, `create_date`, `update_date`, `visible`, `discriminator_type`)
VALUES
	(1, 1, now(), '新着情報の更新方法→管理画面コンテンツ管理→新着情報管理', '更新してください。\r\n※絵文字不可能\r\nURL欄に商品リンクをコピーして貼ることで、TOP画面から直接商品ページへの遷移が可能です。', NULL, 0, now(), now(), 1, 'news');
ALTER TABLE dtb_news AUTO_INCREMENT = 2;

-- invoice
TRUNCATE customize_dtb_invoice;
INSERT INTO `customize_dtb_invoice` (`id`, `pref_id`, `company_name`, `brewery_name`, `postal_code`, `addr01`, `addr02`, `phone_number`, `email`, `logo_image`, `imprint_image`, `person_in_charge_name`, `financial_institution_name`, `branch_name`, `account_type`, `account_number`, `account_holder_name`, `registration_number`, `payment_deadline_month`, `payment_deadline_day`, `discriminator_type`)
VALUES
	(1, 11, '請求書の会社情報と口座情報は設定→請求書→基本設定', '会社のロゴと印鑑も追加ができます。', '3510011', '朝霞市本町', '1-1-1', '08022108912', 'okayama@bestbeerjapan.com', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4QD6RXhpZgAASUkqAAgAAAAGABIBAwABAAAAAQAAABoBBQABAAAAsAAAABsBBQABAAAAuAAAACgBAwABAAAAAgAAABMCAwABAAAAAQAAAGmHBAABAAAAVgAAAAAAAAAHAACQBwAEAAAAMDIzMQGRBwAEAAAAAQIDAACgBwAEAAAAMDEwMAGgAwABAAAA//8AAAKgAwABAAAAOAQAAAOgAwABAAAAOAQAAIaSBwAyAAAAwAAAAAAAAABgAAAAAQAAAGAAAAABAAAAQVNDSUkAAAB4cjpkOkRBRmN6M0p3VXdrOjU0LGo6NTc3NzYxOTc4LHQ6MjMwMzEwMTf/4QT4aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8eDp4bXBtZXRhIHhtbG5zOng9J2Fkb2JlOm5zOm1ldGEvJz4KICAgICAgICA8cmRmOlJERiB4bWxuczpyZGY9J2h0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMnPgoKICAgICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0nJwogICAgICAgIHhtbG5zOmRjPSdodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyc+CiAgICAgICAgPGRjOnRpdGxlPgogICAgICAgIDxyZGY6QWx0PgogICAgICAgIDxyZGY6bGkgeG1sOmxhbmc9J3gtZGVmYXVsdCc+VGVtcGxhdGUgQnJld2luZyAtIDExPC9yZGY6bGk+CiAgICAgICAgPC9yZGY6QWx0PgogICAgICAgIDwvZGM6dGl0bGU+CiAgICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CgogICAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PScnCiAgICAgICAgeG1sbnM6QXR0cmliPSdodHRwOi8vbnMuYXR0cmlidXRpb24uY29tL2Fkcy8xLjAvJz4KICAgICAgICA8QXR0cmliOkFkcz4KICAgICAgICA8cmRmOlNlcT4KICAgICAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz4KICAgICAgICA8QXR0cmliOkNyZWF0ZWQ+MjAyMy0wMy0xMDwvQXR0cmliOkNyZWF0ZWQ+CiAgICAgICAgPEF0dHJpYjpFeHRJZD5iODMyNWFkNC1lZTIxLTRhYjAtYTM3OC0xNjM0NGI0ZGNkOWQ8L0F0dHJpYjpFeHRJZD4KICAgICAgICA8QXR0cmliOkZiSWQ+NTI1MjY1OTE0MTc5NTgwPC9BdHRyaWI6RmJJZD4KICAgICAgICA8QXR0cmliOlRvdWNoVHlwZT4yPC9BdHRyaWI6VG91Y2hUeXBlPgogICAgICAgIDwvcmRmOmxpPgogICAgICAgIDwvcmRmOlNlcT4KICAgICAgICA8L0F0dHJpYjpBZHM+CiAgICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CgogICAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PScnCiAgICAgICAgeG1sbnM6cGRmPSdodHRwOi8vbnMuYWRvYmUuY29tL3BkZi8xLjMvJz4KICAgICAgICA8cGRmOkF1dGhvcj5CZXN0IEJlZXIgSmFwYW7jg6zjg7PmqL08L3BkZjpBdXRob3I+CiAgICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CgogICAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PScnCiAgICAgICAgeG1sbnM6eG1wPSdodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvJz4KICAgICAgICA8eG1wOkNyZWF0b3JUb29sPkNhbnZhPC94bXA6Q3JlYXRvclRvb2w+CiAgICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgICAgICAgPC9yZGY6UkRGPgogICAgICAgIDwveDp4bXBtZXRhPv/bAEMABgQFBgUEBgYFBgcHBggKEAoKCQkKFA4PDBAXFBgYFxQWFhodJR8aGyMcFhYgLCAjJicpKikZHy0wLSgwJSgpKP/bAEMBBwcHCggKEwoKEygaFhooKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKP/AABEIBDgEOAMBIgACEQEDEQH/xAAfAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEBAQEBAAAAAAAAAQIDBAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APqmiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiigkAZJwKACis7UNZsrAZnlH/AcGsdvHWiqcF5/+/dZSrU4u0pGM8RSg7SkkdTRWXpOvWOqf8eshz6OMVqVcZKSvFmkZxmrxdwoooqigooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooACQBk8CuG8beJntMQWbYYjBPWug8Tah9isiAfmcYFeSa67SSq7HLHrXmY7FuD9lHc8rMMW6a9nDco3FzLcSF5XJJ96ipKkjikk+4pb6V5W54OrL2g3ctrqUBjYgFgCK9xtpfOhV8YzXkvhTw7dXd9HLLG0cSENkjrXryIEUKowBXr5fGSi29j3srhOMG5bC0UUV6J6oUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAcJ42nL3QjJ4U1wmsfej+ldl4w/5Ccn1rjdY+9H9K+XxDviJHy+Md6sg0DTm1PUo7dc88169p3h+wtYEU28bOAMnFec/Dr/kYIvoa9er1sBSi4OTWp6OV0YODm1qMhiSFAsShVHYU+iivSPX2CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooJx1qrcX0UA5YE+gNROpGCvJ2JlJRV2y1SFlHVgPxrAutaY5EOR9azpr2eb77flXmVs3ow0hqcdTH046R1OolvYY+rA/Q1Vk1iBeBuJ+lc2oeQ9TVuOEKMnk151TOar+FJGMcXVqfCrGr/axb7g/MU06lPngL+VUcUtc0syxEvtGqnPqynqNjHfztLNnceeKyNR8P2khTcX4966Oql71WuR1Zt8zepyYilDlcramVo2nQ6VdrcW5YuvHzV0Da3dfwhPyrLorWGMrU1aMmctOrOmrQdkaZ1+aJcyqCPYVLD4qsyAJBIG/3axqr3FokwJxhuxrrp5rXju7myxtaOzOytdYtbkgI4H1OKvLLG33XU/Q15PPFLA2CT9QaltdTubZgYpOffmu+lmz+2jWGaNaTierUVxGneK5EIF3lx7CumsNYtbtQVcKT2Jr0qOMpVdnqehSxdKrszRooBBGQciiuo6QooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqK4uI4Fy7Ae1VtQvktkIyC/pXNXNzJcOS7HHpXmY3MY4f3Y6yOPEYuNLRasv3uryOSsRKist3Z2yxyabRXzVbEVK7vNnj1KsqjvJhSopZgBSVbtY8DcawCnDnlYlijCL71JRRQemkoqyCiiigYVUveq1bqpe9VoMcR/DZWooooPNCiiigCG5gWdCp69jWDPE0UhVh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ooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigDnvEbZkjHpWNWnrrbrgD0rMr4zMJc2Ikz5/FO9VsKKKK4znCiiigAooooABwav27box61QqSCYRuAx60G1CfJLU0KKQHIpaD0gooooAKqXvVat1Uveq0GOI/hsrUUUUHmhRRRQAVXvpfKt2YHmrFYupz+ZLtU8DgirgrsUnZFEnJJ9aKKK6TAKKKKACiiigAooooA67wHJtMyf3iK7SvP8AwY+2/C+rV6BX0eWyvRt2Poculeil2CiiivQO8KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA5XWT/pTfWs+r+sZ+1N9aoV8Ri/40vU+cr/xGFFFFc5kFFFMeRVHLD86AH0hIAyTVGfUEXhOtZ093JKeTj6VoqbZLmkaVzfomQhyazJLqR33ZIqAnPWitYwSM3Js6vSLtZ4AufmUYNaNcXZXBtplcHgV11rOs8QZTWM42Z6eFrc65XuTUUUVB1hVS96rVuql71WgxxH8Nlaiiig80KKKr3lwttA0jkDAzTSvoBS1++W1tSobEjD5cVyMV7IkhYndk96NRu2u7hnJO3PFVK9ClSUY2ZzSldm9Bdxy8A/NViuaBIPBIq3BfyRgKcFfeiVPsCZtUVWgvIpTgHB96sAg9CD9Kyaa3GLRRRQAUUUUAbvhA41SIf7Vei15x4SB/teHA43V6PX0GVfwn6nv5Z/CfqFFFFemeiFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAZeraf9oG+PAYViHT5gSNp/KuvpG+6fpXm4jLKVeXPszjq4OFSXNscDdzLaybJOtVH1JAOFOaj8Rvv1FjWXXztSjGE3FHg1HyyaRdl1CRvunAqq8rucsaZRSUUtjJtsKKKKoQUUUUAFXtNvntZACcoeoqjRSavoxxk4u6O3gmWaMMhzUtcjpt+9q4HJQ9q6i2uEnQMhBrnlFxPWoYhVFZ7k1VL3qtW6qXvVagvEfw2VqKKgurmO2jLSsFx600rnmjrmdLeIvIQAP1ridZ1N76bAJEQPyijWNUkvpCASIh0Wsyu6jR5dXuYTnfRBRRRXQZhRRRQAoJHSpYbmSL7jfnUNFJq4GlDqOP8AWgn6VYS/ic4AI+tYtFS6aY7nUWq/an2wnc3oKurpN2zBfKce+KzvAr7NX+uBXsldmGy+NaPM2eng8HHEQ5mznvDOi/Yl82bBc8jHauhoor2qNGNGPJE9ulSjSjyxCiiitTQKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKR/uN9KWkf7jfShgeW62c37/U1Qq/rYxfv9TVCvkKvxs+Tq/GwooorMzCiiigAooooAKKKAMnAoAVFLMAK6DTkNvGOeaqadabRvcc+laVYVJX0RrTTjqXopg/XrUV71WqwJHSs/V7h02AE8is0rux1TxF4WkT3V0kCnkFuwrndXZ7xDycDnFSOzOcsSTSV0Qjy6nFKVzmmUqSD1pK1b+03ZdOtZZGOtdkZcyMmrCUUUVQBRRRQAUUUUAFFFFAG74PONXj+or2uvFPBy7tXT6iva69jL/gZ7+Vfw2FFFFegeoFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSN90/SlooA8y8Sps1FgfrWVXQ+NYtmqAjptFc9XyeJjy1ZLzPlsTHlqyQUUUVgYBRRRQAUUVNb20k7AIp570thpX0RCAScCtWwssYeQVNbWAhOZOWFXOlYzqX0RpGFtwAwOKWiisiwrK1r70f0rVrK1r70f0q6fxEz2MyiiiukxEIyOaz76zzl0/GtGimm0BzTAqcEUlb0un/amxHwx71lXdpLbOVkU8d8VvGaehLTK1FFFWIKKKKACiiigDpfAcfmav9ADXsdeWfDGDfqkzHoE4r1OvbwCtSufRZZG1G4UUUV2nohRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAcf45g+UTY9BXG16prFit/aGJvqK4K60C+ilIWFmXsa8DMcNP2nPFXTPCx+Hn7TnirpmRRWmmg6gx4t2qUaFOpxKGQ15s6coLmkrI4fYVP5WY9SRQySn5FLfSugttFjjOXbd7EVpQ20UQ+RAPpWDqrobQwc38WhhWWjs+GlOB6Gty3to7dcRrip6Kycm9zvpUIU9ipdpggiq1aMq70IrPZdrEGpOXEQ5ZXEooooOcKyta+9H9K1ayta+9H9Kun8RM9jMooorpMQooqSCMySBR3pAaGkw9XI+lXLu0iulxKoNSQRiONVHapK5nJ3ujZLSxyWpaAyEvByP7oFYc0EsJxIhX616TVa4s4JwfMjUn1NbwxLWkiHTT2POqK6668OxyEmN9vsBVAeGbuR9sCM5rqhUjN2W5Hs5N2SMCituTwvqyHm0erGneE9SuJ1EsDomeTXQqM27WKWHqt25WdX8NLTZbG4x94EZruqoaJp6aZYJbp25q/XvUKfs4KJ9PhqXsqaiwooorY3CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKQqD1GaWigBAoHQVh3/wDr2+tbtYWoDE7fWvHzlfuV6mNb4StRRRXzByhRRRQAVVuo/wCIVapCMjBoIqQU1ZmZRUs8exuOlRUHmSi4uzCsrWvvR/StWsrWvvR/Srp/EZz2MyiiiukxAcmtfTLfau9hyaqafbGVwxHArbAAGBWNSXRGkI9RaKKKxNAooooAK0dDP+mJ9azq0tDGbtT711YP+PH1NsP/ABInTlVPUA0Kqr90AUtFfan0QUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABWPqq4kB9a2KztXTIVvQV52aQ5sO/Izqq8TKooor5E4wooooAKKKKAGSIHXBqjIhR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fDrxoNdn1+G/QW8kHkpbGM/NjnJY+le9UUUAFFFFABRRRQAUUUUAefR/Bn4fJqt1qL+GbOa6uZWmkM5aRNzHJwhJUDPYCu303TrLS7RbXTLO2s7ZPuw28SxoPoqgCrVFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFVrzULOxkt0vbu3t3uJBFCssgUyueiqD1PsKALNFYlj4p0e+8TX/h+2uw2r2Mayz27IykK3QgkYbqOmfvCtugAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAOL+J3xD034eWFld6taXlzHdSmJRbBSVIGedxFeef8ADTXhT/oEa5/37i/+OVU/bG/5FXQP+v1//RZr3kWNpgf6LB/37FPSwzxH/hprwp/0CNc/79xf/HKP+GmvCn/QI1z/AL9xf/HK9v8AsNp/z6wf9+xWP4xsrVfCOuFbaAEWM5BEY/55tRoBU+G3jex8f6BLq2l211b28dw1vtuQoYlVUk/KSMfMPyrq68U/ZI/5Jfc/9hOX/wBAjr2uh7iMrxP4i0rwvpbalrt2LSyV1jMpRmAZugwoJrlB8Zfh+f8AmZbX/v3J/wDE11niTw/pfibS207XbRbyyZlcxMzAEjoeCDXKD4OfD/8A6Fm0/wC+5P8A4qjQBP8Ahcvw/wD+hltf+/cn/wATXFfFvxj8PvGvhKWzt/E9nDq1swudPuNkqmKZeRyFyAeh/A9hXbf8Kc8Af9Czaf8Afcn/AMVXL/FD4W+CtJ+HniG/07QLaC8t7OSSKVXclGA4PLU1YZo+H/D8PjS78H+ObPW4Rq1hEbe9uLGJjFfAfKyfOFIGd3OO/sCPVq8r/Zj/AOSO6T/11uP/AEa1eqUmIKKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB8+/tjf8AIq6B/wBfr/8Aos19BDoK+ff2xv8AkVfD/wD1+v8A+gGpR+0lp+P+RV1f/vpaq10M99rH8Z/8ifrv/XhP/wCi2rxr/hpPT/8AoVdX/wC+lqjr37Q9hqGh6jZL4Z1WNrm2khDsy4XcpGT+dKzCx0H7JH/JL7n/ALCcv/oEde114p+yR/yS+5/7Ccv/AKLjr2uh7iYUVz3jfxjo/gnS4dQ8QTyQWs04t1ZI2kO8qzDgc9FNcb/wvz4e/wDQYm/8Apv/AImiwHqdcb8Zv+SVeKf+vCX+Vc9/wvv4e/8AQZm/8Apv/ia5r4lfGfwRrngHXtM03VJZby6tHiiQ2sqhmI4GSuBQkxnSfsx/8kd0n/rrcf8Ao1q9Uryv9mP/AJI7pP8A11uP/RrV6pQ9xBRRRSAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAOa8ceCND8b2ttb+IraS4itnMkYSVo8MRg/dIzXSgYAA7UUUAFQX9pDf2FzZ3KloLiNopADjKsCCM/Q1PRQBg+C/CWkeDNJfTfD8DwWjzGco8jSHeQATliT0UVvUUUAZniHQNJ8R2cdrrthb39tHIJVjnXcocAgHHrhj+dYX/AArHwR/0Kuj/APgMtdhRQBx//CsfBH/Qq6P/AOAy1n6/8I/B2p6LeWVpoem6fPPGUS6htV3xE/xL716BRTuBy/w28Ix+B/CdvocF295HC7uJXQITuYtjAJ9a6iiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFcl8QfiBoXgK1tJtfmlBunKRRQpvdsDJOMjgZHPuKAOtoqppF8mp6XaX0UU0MdzEsqpMu11DDI3Dscdq4/4lfFHQPh7NYwayl5NcXYLLFaxqxVAcFm3MBjP48UAd3RVTSNRttX0qz1Gwk820u4lmifGNysMjjt1q3QAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFZGoeJ9A027e11HXNLtLlMboZ7uON1yMjKk5HBBqt/wmvhX/oZtE/8D4v/AIqgDoKKztK13SdYaRdJ1SwvmjALi2uElKg9M7ScVo0AFFIzBVLMQFAySe1YbeMPDK3HkN4i0YT5x5Zvot2fpuzQBu0U2N0kRXjZXRhkMpyCKdQAUVzHxA8b6T4E0q31DXftH2eeYQJ5Ee87ipbkZHGFNaXhXXrPxP4fs9Z0zzfsd2paPzV2tgMV5H1BoA1aKKKACiuP+InxE0PwAlg2v/asXpcReRFv+5tznkY+8K6TRdRg1jRrDU7Pf9mvbeO5i3jDbHUMMjscEUAXKKKKACiivO7P4gXM/wAaL7wS1jCttb2ouFuQ53sSiNjHT+I/lQB6JRVK71bT7O9tbO7vraC7u2KwQySqrykAn5VJyelXaACivOPij8Rp/BniDwvpdpp0d9LrMxiYNKUMfzRqpGAc5Ln8q9HoAKKKKACiqOuyPDoeoyxMUkS3kZWHUEKcGvOP2a9b1PX/AIctea1fXF9dfbZU82dyzbQFwM+nJosB6rRRRQAUUVw+sfE7w/o3ja38Laobu11CdkWKSSICFt/3SHz0J4zjrQB3FFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABXyl4iJ+Jn7TUGlzfvdK0yfyCh5Xy4MtID/ALzhh9CK+ra+Uf2V/wDiZfFXxFqcvzSG0lfJ/vPMhJ/Q/nVLuNH1dXlXxs0n4eajPpTfEC+NjcKH+zSI7KzoCNynCnIyR788d69Vr5h/bM/4/fCn/XO5/nFSW4kfSGgQ2FvoenxaOqrpqW8a2wTOBFtG3GeemOtLrWqWWiaXcajqlwttZW67pZWBIUZxnjnqRVLwT/yJmgf9g+3/APRa1zfx6/5JD4m/69x/6GtAG1pXjrwxqujXWr2WtWjaZav5c1y7eWiNgHBLY55H51kW3xe8BXN0LePxNYiQnGZNyJ/30wC/rXzP8Cvh7c/EQ3NrqN9cW/hnT5hPLFCQDLO64AGeM7V5JzgcD72a9j8Ufs5+FrzR5U8PtdafqSqTFI8xkjduwcHPB9RjHv0p2SGe3QyxzRJLC6yRuAyuhyGB6EHvTq+X/wBlzxbqWm+J73wPq7uYQJGgjc5ME0Z+dB7EBjj1X3NfTGo3kWn6fdXty22C2iaaQ+iqCT+gpNWEVde17SvD9n9r1vUbWwt84D3EgTcfQZ6n2FcvZfFzwFe3Igh8TWIkJwDLuiX/AL6YAfrXzv4K0e/+O/xE1LU/El5NDpNmAzRxt/q0Yny4Y88DgEk47Huc1654g/Z78E3ukyw6RHPpt8EPlXAuXkG7tuViQR64xTsluM9kjdJY1eNldGAZWU5BB7g06vnX9lTxHqEV7rngvVZGc6dumgVmz5W19kiA/wB3cVIHufWvZ/iN4hPhTwPrOtooaW0gLRBuhkJCpn23MKTWthB4o8b+GvCzrHr+s2llKwyInbdIR67Fy2PfFM8N+PPC/iXzRoet2d3JGpd41YrIFHU7GAbHvivmr4I/DIfE661LxP4xvLqe1+0FCFfD3MuAWLN1CgEdPXtivQfiB8DNI0vRJ9a8Bvd6XrWnI1xEonZ1l2jJX5iSCRnHOOxHPDsthnq3hbxz4b8V3M1v4e1aG+mhTzJFjVhtXOM8gd66SvlH9jn/AJGvX/8AryX/ANGCvq6k1ZiCiiikB8d/GTRk8RftJSaPLM0CX01pbmVVyUDRRjIHeu6/4Ze03/oZrz/wFX/4qub+MfhjxnJ8bbzX/C2i6hMYGtpbe6jt96b1iTkEjacEfpUOo/EX40+GIhfa7ZzizUjc1zpqCIezMijH5ir16DPavhH8KLX4cXepT2uqTXxvURCJIgm3aSexPrXpVea/Bj4p2nxF0+eOSBbPWbQAz24bKsp43oTzjPBHbjrkGvQNVna20y8nj+/FC7r9QpNS/MR8q/E7xTrvxV+JX/CF+GrlotJjna3CqxCSlM75ZCOqjBwPQDua7WL9mLw+NOCS67qpvtvMqrGI8+uzbnHturhf2Q4En+IWq3Uvzyxac20nk5aRMn69fzr65pt20Qz5C8I6/r3wS+JX/CNa5dtPoMkiiRST5fluflnjB+6R3HfBHOAa+vRyMjpXyv8AtkW0a+IfDlyAPNktZY2PfCuCP/QzX0d4JuHu/BmgXMxJkm0+3kYnqSY1J/nQ+4M8i/bB/wCRA0j/ALCa/wDoqSu2/Z//AOSPeGv+uL/+jXrif2wf+RA0j/sJr/6KkrE0v4rWfgD4F+G7WyMdz4huLaQwQHkQgyv+8f29B3+mTRugPavE3j/wt4Yv1std1q2s7tkEgibczbT0JCg4/GuktZ47q2inhLGKVQ6llKnBGRkHBH4186/Af4ZXGt3qePvHDm9urpvtFnFMd28npM//ALKvbg+lfR1J6CPmz9s3/j38Jf791/KKvUfC/i3QPC3wv8HyeINWtbASaRabFlf53/cp0Ucn8BXl37Zv/Hv4S/37r+UVR/CP4M23i3w9Y+IvHV1d3RngSOztEk2BLdFCR7iOeijAGOOTknh9Bntfhz4j+EPEd2tro+v2VxdNwsJYxu/+6rgE/hXWV8t/Gz4H6f4a8PS+I/CEtzElmQ9xaySb8JnG9G6ggkZBzxzxjn1H9nTxrdeMfAY/tSUy6lp0v2WWVjlpVwCjn3wcE9ypPek11QHqdeDQfu/2urn/AKa6aP8A0Uv+Fe814Pd/u/2ubL/prph/9FP/AIUIR1Hx48AHxb4eXUtIVo/EmlDz7OWLh5AvzGPI7919G9Mmr3wP8eDx34NjuLoqNXsyLe9QDGWxw+PRhz9QR2r0KsDRPDPh/wAJnVL7TLK3sWu3a5vJ+7cliST0UZPAwBRfQDxzx/8A8VD+1B4Q0tPmj0uFLiT/AGWXfN/JY/zr6Cr58+AKP4u+JnjLx5MjG3eQ2tmzjsSOPqsaxj/gVfQdDAK+TPg94E1T4iaPqWoz+MtasDbXjW4jjkdwRtVs5Lj+9X1nXhX7I3/Im69/2FW/9FpQthmf4i+Cd3pfh/U9Ql8f65JHaWss7I27DBELEH5/auW+DPwnvPFXgeHVo/FeqaTHLNIq29tnYdpxu+8OSQfyr1L9pLxWukeCG0KyJk1jXSLWGBOW8skBzj3+6PUt7GuP8C+I9a+DF9Y+E/HsSHw9cjdZajCMpAzHc6k9wGY57jOeQRVXdgJPFPwX1DRPDOr6qnj3XZmsbOa6EZLAOUQtjO/jOK739nK6uL34RaNPeTy3E7PPuklcuxxM4GSea6T4iyxz/DPxPLC6yRPpF0yOhyGBhYgg9xXK/sz/APJGtE/37j/0e9LdAeo14D+114dW58L6Z4igXF1p84gkccHyn6c+zgY/3jXv1cD8erVbv4Q+Jo3GQtuJR9UdWH/oNJbiL/wj8Rt4r+HWiarM+65kh8uc9zIhKMT9Sufxrr68P/ZEumm+G1/A5yINSkC+wMcZ/mTXuFD3AKKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFfKP7LZ/sv4s+ItLm+WQWs0YB/vRzKCPyz+VfV1fKXi9T8Mv2lbXW5QY9J1Kb7Qz/w7JQUlz/usWb8qpdho+ra+Yf2zP+P3wp/1zuf5xV9PAggEEEHoRXy/+2WynUPCqAjcIrkkegJjx/I0R3BH0N4J/wCRM0D/ALB9v/6LWub+PX/JIfE3/XuP/Q1rpfBalPB2hKwwwsIAR/2zWua+PX/JIfE3/XuP/Q1pdRHk37H/AIjsYYdZ8PXEqRXs0q3cCsceaNu1gPUjAOPQn0NfRuqahaaVp9xfajcR21nboZJZZDhVUd6+Rfg58Lbbx/4Dv7u2vX03XLLUCLe6UEgr5aHawBB68gjkZPWt68+BHxG1mRLbXfFltdWKNwZr64nx7qjLjP4im0rjMb4EtJ4m/aGu9dtY2W2829v3GPurJvVQffMg/KvqjxhYS6r4S1vT7f8A113Yz26f7zxso/U1gfCz4daV8PNHktdPZrm8nIa5vJFAaUjoAP4VGTge/U121JvUR8JfB7wTpHjXxFdaLrmqT6XehN1sqov71gTvT5v4hwQPY+lezn9mDRwMnxFf4/64pWv8U/gNaeJtYk1vw1fLpOqyt5kqMp8qR/74I5Rs8kgHJ5xnJrlT8G/inqcP2DWvG6HTSNrqb+4mDL/uFQG+hNVe/UZ3Xwb+FWh+EtZl8QaF4gfV45YJLPKhCmd67vmU9QUxXVfGjRrjX/hd4h0+zQyXD24ljRerGN1k2j3OzFP+FvgCw+Hugvp9hc3F1JM/mzzSnAd8Y+VOij9fUniuyqW9RHzl+yf400yHQbrwxf3MVtfrctcW4lYKJlYAFVz1YEHjrg+xr1n4r+NdL8HeEdQnvrmL7ZLA8drbbhvlkIIGF64yck9AK4jxn8CfCnjHUrrUtF1BtNuWlZbgWm2WHzQfmymRtbPUAjntWRB8FvCfw70q+8SeIdRl1NrGFpIlnVY4hJj5fkySzZwAM4yelPRjOT/Y5/5GvX/+vJf/AEYK+rq+W/2N7GZtX8R3+0iBIIoN3YszFsfkv6ivqSiW4MKKKKkRjaN4o0TWdRv7DTNSt7i+sJWhuIFb542HB4PJGeMjjPFT+JLrTbLQNQuNdeFdMSFvtHm42lMYIPrnpjvmvC/GH7OSzanJqXg/XZbGd3MgiuyzbWPORKPmH4gn3rnJPgD8QNXljh1/xRaS2iHrJdz3BX3VWUD9RVWQzE/ZOgnl+KNxNbBxbRWEplPbaWQKD+OPyr7CmjWaJ4pBlHUqw9Qa474X/DzSfh7oz2emF57qchrm7kADykdOOyjJwPc9etdnSbuxM+OPgpfL8OPjdd6Rrji3jk83TJJJDhQdwaNifQlVwfRs19j15d8Xfg9pXxAdb6Oc6drSLsFyqbllUdBIvGcdiDke/ArzRfgx8U4bb+zoPG0S6XjaIxqNyqhfTZtx+GcU3ZjOc/aR1ceM/inp2g6ERdSWirZDYchrh3+YAj0+UH3B9K+tNIsk03SbKxiOY7WBIFPsqgD+VeX/AAj+CumeBLsare3P9p62FKpKU2xwA8HYvJyRxuPboBzXrdJvoB4R+2D/AMiBpH/YTX/0VJXl3w4+B9/4u8C32vT3PkTTRN/ZUII/esp5LnspwVH1z0HPvvx58B6p8QfDFjpujT2UE8F4Lhmu3ZVKhHXA2qxzlh2rovhf4eu/CngLSNE1GSCS7s42SR4GJQkuzcEgHoR2p3sgPDv2XvHsthfTeBdeZomDubHzeDHICd8Jz05yQPXcO4r6arwb4t/BLUvEPjSHxJ4MvbHT7xyJbgTu8eJlI2yIUVuTjnpyM85Ne1aCNSGjWa679lOqCMC4NqxaJnHUrkA4PXGOM496T7gfPf7Zv/Hv4S/37r+UVeo/AbxHY+IPhloi2cqG40+2jsriIH5o2jUKMj3ABB9/rWL+0B8NdY+IsWhrolzp8BsWmMn2uR1zv2Y27Ub+6euO1cfqX7P+r2Ntp174M8QDSdZWziivESaSON5lQB3SRRuAZgTgr37dKelgPQ/2g/EdjoPwx1eG6lQXWowtaW0OfmkZuCQPRQSSfp6iuJ/Y906eDwlrd/IpWG6u1jjz/FsXkj2y+PwNc9p37O/ifWdWS68ceJYpYxgO0U0lzOy+m6QAD68/SvpDw/o1j4f0a00rSYFt7K1QJHGOw9Se5JySe5ND0VgLlzPDawPPcyxwwoMvJIwVVHqSelfK3j74haZp/wC0FY+I9A267FbWX2fy7R+JJSsihQ2Dn7ynIzX0N8RfBlh478O/2Pqks0MInScSQkB1KntkEcgsOneovCPgLw14KtWOgaRGlwqHM5HmTycdN7c8+gIFJWQjgPCcvxY8XeItO1XVxb+G/D0E6ytYlSJZ0B5UjluRkfMVHfFVPj946mv5I/h74OP2vXNScQXflHPlIeseegJH3vRQc9eM3XfiT458f6hdaB8O9AvNLjjkMFzf3Q2SREHBBP3Yz7As3pzXoHwk+FWn+A4ZLy4l/tHxBcA+ffOPu55KpnkDPU9T39A9hnn3wS8VS/D7WJPhx40torCcTF7O8XiOYueAW7hv4W/4CcEV9E1wPxh+HNl8QfDzQkJDrFsC1ldEfdb+43+ye/p1+uT+z9r3iXUvD97pfi2wuo7vR5vsi3kwx52OCpP8TLjlhwQRznqnrqB6pXy78EvE2peFfhR4hv8ARtDudZu21gxJFDyELRoAzAfMRnAwB37da+oq8K/ZG/5E3Xv+wq3/AKLShbAXvhd8OdXuPEjeOPiPKLjxDJza2nBS0XHGQOARngDgdeSePTvF3hrTPFmhXGk61bia1mHXo0bdnU9mHr/StmmTyGKCSRY3lKKWCJjc2B0GSBk/Wi4j560XSvGfg3w1488JatA9/wCF7fR7uWy1JjgIDE+EXPJzzlf4SPQjPb/sz/8AJGtE/wB+4/8AR71xfjH9oHwrrPhLWtKsrDW/tl9ZzWsQkgjADuhUZxITjJ9DXf8A7PWnXel/CPQrfUIJLe4IlkMcilWCtK7LkH1BB/Gm9hno1cB8fLtbP4Q+JZHON8CxD3Luqj+dd/Xz9+114iEOgaV4ZtiXu76cXMiLyfLTIUY/2mPH+4aS3EjS/ZGtGg+Gt7O4x9o1KRl91Eca/wAwa9vrlPhV4bPhP4faLo8qhbiGDfOP+mrku4/AsR+FdXQ9wCiiikAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABXM+OfA+g+N7S2t/EVmbhbZzJEySMjKSMEZBzg8cew9K6aigDz34leDta1P4e22geDNT+wTWzxbZJ5nDtHH91fMGWByFOefu15LoHwH8Va/4kg1D4j6yLm2hKhlNy9xNKoOdm48Kv455PHevpyinewCIqoioihVUYAAwAK5f4o6Fd+JvAOs6NppiF3dxBIzK21c7geTg+ldTRSA8u/Z+8C6t4C8NajYa41qZ7i789Ps8hcbdirySBzkGvUaKKHqAUUUUAFFFFABTZFLxsoZkJBG5eo9xTqKAPmzVPgT4v0LVbi+8BeLpUEzF3E88kErZP8AEyAh/qQPpVKT4I/ETxXdQjxp4pja0jOcPcyXLL7qhAXPvkV9QUU+Zjuc/wCBfCOl+CvD0OkaLGywoS8kjnLyuerse54H0AAroKKKQgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooARVC52gDJzxS0UUAFFFFABUdvbw26lbeGOJSckIoUE/hUlFABRRRQBHHbwxtujijVvVVANSUUUAFcfqPw48N6n4yh8UahaS3OrQsjRtJMxRCg+XCZxx16dea7CigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA/9k=', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/4QD6RXhpZgAASUkqAAgAAAAGABIBAwABAAAAAQAAABoBBQABAAAAsAAAABsBBQABAAAAuAAAACgBAwABAAAAAgAAABMCAwABAAAAAQAAAGmHBAABAAAAVgAAAAAAAAAHAACQBwAEAAAAMDIzMQGRBwAEAAAAAQIDAACgBwAEAAAAMDEwMAGgAwABAAAA//8AAAKgAwABAAAAOAQAAAOgAwABAAAAOAQAAIaSBwAyAAAAwAAAAAAAAABgAAAAAQAAAGAAAAABAAAAQVNDSUkAAAB4cjpkOkRBRmN6M0p3VXdrOjU0LGo6NTc3NzYxOTc4LHQ6MjMwMzEwMTf/4QT4aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8eDp4bXBtZXRhIHhtbG5zOng9J2Fkb2JlOm5zOm1ldGEvJz4KICAgICAgICA8cmRmOlJERiB4bWxuczpyZGY9J2h0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMnPgoKICAgICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0nJwogICAgICAgIHhtbG5zOmRjPSdodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyc+CiAgICAgICAgPGRjOnRpdGxlPgogICAgICAgIDxyZGY6QWx0PgogICAgICAgIDxyZGY6bGkgeG1sOmxhbmc9J3gtZGVmYXVsdCc+VGVtcGxhdGUgQnJld2luZyAtIDEyPC9yZGY6bGk+CiAgICAgICAgPC9yZGY6QWx0PgogICAgICAgIDwvZGM6dGl0bGU+CiAgICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CgogICAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PScnCiAgICAgICAgeG1sbnM6QXR0cmliPSdodHRwOi8vbnMuYXR0cmlidXRpb24uY29tL2Fkcy8xLjAvJz4KICAgICAgICA8QXR0cmliOkFkcz4KICAgICAgICA8cmRmOlNlcT4KICAgICAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz4KICAgICAgICA8QXR0cmliOkNyZWF0ZWQ+MjAyMy0wMy0xMDwvQXR0cmliOkNyZWF0ZWQ+CiAgICAgICAgPEF0dHJpYjpFeHRJZD44ZmYzYTNlZS01NDQyLTQxY2QtYjA0Ni1jNDVhNTU1MDgzYjE8L0F0dHJpYjpFeHRJZD4KICAgICAgICA8QXR0cmliOkZiSWQ+NTI1MjY1OTE0MTc5NTgwPC9BdHRyaWI6RmJJZD4KICAgICAgICA8QXR0cmliOlRvdWNoVHlwZT4yPC9BdHRyaWI6VG91Y2hUeXBlPgogICAgICAgIDwvcmRmOmxpPgogICAgICAgIDwvcmRmOlNlcT4KICAgICAgICA8L0F0dHJpYjpBZHM+CiAgICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CgogICAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PScnCiAgICAgICAgeG1sbnM6cGRmPSdodHRwOi8vbnMuYWRvYmUuY29tL3BkZi8xLjMvJz4KICAgICAgICA8cGRmOkF1dGhvcj5CZXN0IEJlZXIgSmFwYW7jg6zjg7PmqL08L3BkZjpBdXRob3I+CiAgICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CgogICAgICAgIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PScnCiAgICAgICAgeG1sbnM6eG1wPSdodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvJz4KICAgICAgICA8eG1wOkNyZWF0b3JUb29sPkNhbnZhPC94bXA6Q3JlYXRvclRvb2w+CiAgICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgICAgICAgPC9yZGY6UkRGPgogICAgICAgIDwveDp4bXBtZXRhPv/bAEMAKBweIx4ZKCMhIy0rKDA8ZEE8Nzc8e1hdSWSRgJmWj4CMiqC05sOgqtqtiozI/8va7vX///+bwf////r/5v3/+P/bAEMBKy0tPDU8dkFBdviljKX4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+P/AABEIBDgEOAMBIgACEQEDEQH/xAAaAAEAAwEBAQAAAAAAAAAAAAAAAwQFBgIB/8QAQxAAAgIBAQQECgkDAgcBAQEAAAECAwQRBRIhMRNBUXEUFSIyUlNhkZKxMzRCVHKBocHRBiM1YuEkQ2NzgvDxk0Ql/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAIBAwT/xAAoEQEBAAICAgIDAQACAwEBAAAAAQIRAzESIUFREyIyYUJxBCNSM0P/2gAMAwEAAhEDEQA/ANkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKtmbXCTjo5Ndhm2zG3paBQvzW4roZaduqK/hV/rH7jPKOuPDlY129Dzvx3d7XRe3gZank28nY+49xwrp8ZaLvY8vo/FJ3V2WVTHnYvy4kTz6lyUn+QrwYRjJTe9r+WhJ4JU4qLT0XJase2f+uPHh0d3e6OenboefGFfoSJPAqV1Pu1PccamPKuP5rUezfH9IPGFfoSHjCv0JFtRiuUUvyPuiN1U7w+lTw+Hq5+4eHR9XP3FsD2bx+lbwz/o2/CefGFa5wmn3Fs+OMZc4p96Hslx+lZZ9T6pL8iRZdLXnr8z7LGplzrX5cCGWBU/Nco/mZ7V/wCuplkUv/mR957VkJebJPuZT8AnF6wsTftieY4VkrNbZLT2dY3Txw+K0AZUqboTbhXKH4XqI5V9b0cn3SQ8m/h31WqCpHMlGMZW1tRf2k9Sx0sOHlx48uJu3O42PYANSAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD42optvRIqWZ8U2q473tZlulY4XLpcIfCalKUZS0a7ShPLtmtN7dXsIYpzlpo5N9nMm5fTtjwet5NCefWvNTl+hXeRbKLlG3R6+bp8iXFxrItOxJR7NOLLcaa4PWMIp+xG+6y3DD1JtnKnJt5qWn+pkkNnyfnzS7jQA8Ym82XwrQwaY805d7Jo1Vw82EV+R7BukXLK90B8clFatpd5DPLph9vXu4m7ZJb0nBVWapeZVOT7j70mVPzaowX+pmbb4X5WQQQhfvJztWnYo8yScHP7cl7EzWaeweYQUFonJ971PPRPXXpJ/oBIAuQDAHmKko6OWr7dCOSvXmyrfemg3SYFdzyV/yoy7pHuuyyT0nS4+3VNGbbcalBHO6Ffntr/xYjfVLlZH3ms1Uh8lGMlpJJr2o+pp8mAxXsxK5rRLd7ipbhWw4x8tezmaYMuMrpjy5YseF1tL0jJr2Ms17QfKyOvtRcsqhYtJxTKk8BLjW9f8ATInVnTp58eX9RarvrtXkyT9hIYs4TrlpKLiyejMsg1GWs12dYmX2ZcPreLTBHTdC6OsX3rsJC3ns12AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEF+VCpc96XYmGyW+omlJRWsmkl1sqW58I8K1vPt6irZbZkaycdYLs5I8qKse7VW2+0i5fT0Y8Un9Ft9lz8qXDs6j5VGzpP7cW2uziW6cDrtf5IuRhGEdIpJewTG3tuXLjj6xUKsCT42PdXYuZerqhUtIR0PYKkkcMuTLLsBDPJqr5zWvYuJD4VbbwoqenaxtkwtXDxO6uteVNIrLHyLX/AHbWl2Imhi0w5QTfa+I9t1jO6jeY5cKapT9vUN3Ls5yjWvZxZaSS5AaPKTqKyw63xscpvtbJY49UeVcfcJ3V1+fNIglnRb0rhKbHqNnnktpJdQKe9mWcoxrXtPSxrJfSXyfsjwG2eOu6tao8O2C5zivzIlh0/aTk/ayRY9UeVcfcPbP1fHk0r/mR/Jnh5tC+033ImUIrlFL8j1oPZ+qt4dX6M/cPDq/Rn7iyB7bvH6VlnU9r9x9WbR6f6MsHxxi+aXuHs3j9I45NMuVkfz4Eiaa1T1PLpqfOuPuPkaK4y3ox3X7HoGXXwkPEqq5+dCL/ACPT104PQj/vx5OE17jWR4eHU3rFOL7Uzz4PdHzMiXdLiWgZpvnVVWZNT/uVqce2JLXkV2cFLR9j4MlPE6q7PPimDcvcewV/B5Q+itlH2PigrL4fSV7y7YP9ga+k0oRmtJJNe0qWYEXxqk4vsZbjJTjqtdPatD0NSkyyx6Y8oW489XrF9qLWNmuTULeb5SLsoqS0kk17SndhcG6XprziydWdO3njnNZLikpa6NPTmfTI3b8eW9pKPtLdOdGXC1br7eo2ZfaMuKz3j7XAfE01qnqj6U5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB4sshXHWckkeL8iFK4vWXYjMutldPel+S7Cblp14+K5d9JsrK6V7sNVFfqVknJ6LiyejEnbxfkx7X1mhVRXSvJXHtfMnVvbtc8eOaitRgrTet5+ii5CEYLSKSXsPR8bUVq3oi5NPNlnll2+nxtJatpIrTypTbjjwcn6XUfI4k7HvZFjl7FyG2+Ov6fZ5sE92uLnL2HjosnI+kluR7EWoVQrXkRSPTaitW9ENfbfKT+YhqxKq/s7z7WT6aFaebWnpBSm/Yj5v5NvmwVa7ZcWPXwXHK+8lpvQgnl1Q4b28+yPE8rF3nrdZKz2ckTQqhX5kEvyHtP6xB099n0dOi7ZDoMiz6S7dXZEtAab5fUV4YdMeLTk/ayeMYxWkUkvYj6DdJuVvYAAwAAAAAAAAAAAAAAAAAAHianzhJJ9jRH004PSyppdseKJwGyvELq7PNkn7D2R2U12efFN9pC6bquNNrkvRkY3Uq0QS6eEm46Tj2Pg0eY5ej3bouuX6FiMoyWsWmvYOzVx7R13xm91pwn6LJTxZXGyOkl3PsKsp3Yr8rWyvqfWh02YzLpcaTWj4oo34clq6dGn9lr5FqnIru818exko1KTLLCsim6yiTS10XOLNOm6N0N6P5rsPN+NC5ceEupoz5wtxbNeXY1yZPvF1/Xl/ytYFTHzYz0jZ5Mu3qZbKl245Y3G6oADUgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfG1Fat6ID6VMrLVesK+M+t9hFk5mvkVPh1yK9NM75aR5db7CLl8R6MOLX7ZPMYztnpHWUmXqMGMNJWeU+zqJ6KY0w0j+b7SU2Ypz5rfU6ACK2p2tLfcY9aXWU4x5syEnuVrpJ9i6u88LHna97Inr/pXIsQrjXHdikkejNK8tdPkYqKSikkupCUowjrJpLtZXty4xe5Wt+fYiNYtl0t/In/AOKG/psx+cnqWY5vdog5vt6j74PZdxvm/wAMeRYhXGuO7CKSPQ19nlJ/LxXVCpaQikewDUb2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADzKEZrSSTXtKssSVct/Hm4vsZcBmlTKxXhkLVQtXRz9vJljg0eLK42x3ZrVFbS7FfDWyrs60G6l6SWYkJPer/tzXJo+RvnU93Ijp2TXJk1dsbY70Hqj00pLRrVDR5XrITTWqeqPk4RnFxktUyLopUtuniuuD/YkrsU1w1TXNPmgnr3Gfk4jq8qPGHyPuNmOvSNmrj29aNJrVaMoZOFznUu+P8ABNmvcd8eSZTxzXYzjOKlF6pnoyKL50S4cV1pmlTfC6OsXx612Gy7c8+O4/8ASUAFOYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAV8rJ6DRJayYbJbdRJdbGmG9J9y7TLuvnc9ZPh2LkL7ndJScUmifDxd7+5YvJ6l2nO3fqPVjjOOeWXaPGxpXS1fCC6+004QjCKjFaJHpLRcD5KShFyk9EusuTThnnc6+kDyY9Kq4JzfXpyRHvWZbai3Crt65FiuuFUd2C0Q7ZqTvt7B8bSWr5FaWTKxuGPHefXLqRqZLUt18KVxesupIrdHflPWxuEOwnpxo1+VLyp9cmTma2vymPSOqmFS0itPaSAGudu+wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABDKjSW/U9yT59j7zzC9xn0d6UZdTXJlghyaVfXpro1yZi5ZfWSYGfXfbjSVdybj1MvxkpxUovVMSsyxuKN3xVvRy8l9WvJkpHbVC2Ok1qQxlPGkoWNyrfKfZ3g1L0ZWIrVvw4T+ZnxlKqWqbjNM2k9UQX40Llryl2mXH6dePl16y6ecXJVy3ZcJr9SyY7U8e7jwlE0qcmFyWj0l1oS/bOTj17x6TAApxAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIr7lTDefPqXaGybuo85OTGiOi4zfJGZZJzlvSlq2fJTc5uU3q2W8TE10ssXDqRz95PXJjxTd7MTE3tLLF5PUu00AVsnKVPkx4z+RfqPPblyVJdfCmOsnx6kusghCeU1O3hX1RXWeKcWVsukvb49ReSSWi5Gdl1h6nYkorRLRI82WQqjrN6I83Tmof2o70tdO4jqxuO/c9+ft5I1Mk7r1XKy57z8ivs04smjFRWkUkvYfQay3YAAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHmyuNkd2S1RS0swp6rWVTL58aUk01qmZYvHLXq9PNdkbYqUHqj1KKkmpLVPqKc6Z40+kp4x64lmq2N0N6L/LsEpcde50iW9ivR6yq7euP+xYTUkmnqmfWtVxKsoyxpb0ONTfGPo9w6Z/X/aTIojfDR8JLkzLlGdU9HqpI2YtSSa4pkOTjq+Gq4TXJmZTbpxcnj6vSPGzFNKFj0l29pbMOScW4taNF7CyddK7Hx6mZjl8VXJxa/bFeABbzgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAeLJxrg5SeiQHy62NNblL8l2mVbbK6TnL/wCHvJyHe1otIrkfcbGdz1fCC6+05279R68MZx4+WSTCx999JNeSuS7TRPkYqMVFLRIiyL40w15yfJFyajhlleTJ8ychUw0XGb5IhxcZ73S3cZPikxi0uyXT3cW+KTLkpKMW5PRIzv223xnjiNpLV8EU55Er7Oip4LrkRXXzyp9HUnu/MuY9EaYaLjJ82N7PGYTd7SVwVcFGK4I9AFOQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABVtplXPpqOf2o9paAbLpHVbG6G9H812EhWtrlXPpqlx+1HtJqrI2wUovgY2z5jzdKcEpxWsV5yPcJqcVKL1TPRDbPoIqSitzXytOr2ms79IszG6Rb8F5a/UzuKfDmbcZKSTT1TKGbj7r6WC4PmuwjKfL0cPJ/xqfEyeljuyflr9SyYtMty2Mt7d0fM1qroWpuD10Nxu0cvH43cSAApxAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM7MyVPWuKTS6/aWcy7oqtE/KlwRmQi5zUYrVsjK/D0cOH/KpMel32afZXNmtGKjFRS0SI8elU1qK59b7SU3Gac+TPyv+PFtkaq3OXJFGmuWXc7bPNX/uh9vk8rIVUPNRehGNcFGPBId1v8T/AGvvCK15JGZlZDvluQ13Pme8zJ330cH5K5vtJsPGUIqc15b5ewX36isZMJ5ZJMahUw/1PmycApxttu6AAMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAqWxljWO6tawfnx/ctnxpNNPkZW43T5CcbIKUXqmfWk00+TKXHDv/AOjN+4vJ6rVCVuWOvcQxcKZRpWq11aZK0pJp8UxprzPprNsrKx3TPhxg+TIqrZVTUo+7tNe6tW1Sg+sxpRcZOLWjRzs09fFn546rarmrIKUeTPRnYF+7LopPg+XeaJcu3mzw8boABqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPNk41wcpPgj0ZufdvWdGnwjz7zLdL48fLLSC613WOT/JdhdwaN2PSyXF8u4q41LutSfmrizW00Jxny7c2Wp4QKuZfuLo4efL9CXIuVNbl19SKmHU7bXdPik/ezbfhzwx9eVWcWhU18fOfNkede4R6OL8p8/Yie61VVuT/JdpXoxnKfTXcZPju9gv1DG+/LJ5w8XTSyxcepF4A2TSMsrld0ABqQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAeLK42QcZLVMrU2yx7OgtesfsyLhDk0K+GnKS5Myrxs6vSY8zbUG4rV9hXxLnJOqzhOPb1lodps8bp8T1RVzcfpF0kF5S5rtJlKUb3GXmy4xfZ7CUdtluN3GHyNiixWVRknx04lLNx9x9JBeS+a7CLEu6G3V+a+DInqvTnPyY7jWAT1WqB0eQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQ5NvQ0uXXyRkt69urfEs51yssUY8o/M9YFW9N2SXCPLvOd93T14SceHlVvFp6KlJrynxZMCpnXblfRxflS59xfUeaS55K1jll5OkeXJd3aaUIxrgoxWiRDh0KqvV+dLi/YMqb3VVDz58F7EZPXted8r4zpHDXJyd9/R1+b7WXDxVWqqowXUj2bEZXd9AANSAAAAAAAAAAAAAAAAAAACGzKqhw3tX2IrTzZvzEor28TNrmGVXwZUr7Zc7JflwPitsX/Ml7xtf4a1gZ9eZOPCflL9S1HKqkvO07xtFwyiYHxNSWqeqPpqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAVcup8Lq+E4/qiai1XVKa59a9pIVILwfK3f+XZy9jM6XL5TSzYm4SUXpLTgyPGtdsGpcJxekkTFS/Wi+Ny82XCSFZjN+lqUVKLjJapmRfU6bXF8up+w109UmuTK+bT0tW8vOjxRmU2viz8bqvOBZvVODfGPyLZlYVm5kLXlLgaoxvo5sdZAAKcgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAr5lvRUvTzpcEWDKzLelu4ebHgicrqOnFj5ZIa4OyxQXNs2a4KuCjHking06vppL8JeGMXzZ7uo82TVcHOXJGdRF5WS5z5Li/wBkSZ9rlJVR72WcWnoakn5z4sd1k/TDfzUspKEXJ8Eipi711075LhyiespuycKI/a4y7ixCChFRitEjflH84/7XoAGoAAAAAAAAAAAAAAA+OSitW0l7QPp8bSWreiK1ubGPCtbz7eop2Wzses5a+wzbpjx2rluZCPCC3n29RUsvss86XDsXIjBO3fHCQAAWAAAAALWDY1Y4dTL5nYS1yE+xamiVHl5f6AAa5gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABFfV0tbjya4p9jJQCXSHGt6WrV+cuDXtPdtatqlB9ZW+r5n+iz5lwyLy9XcVcGx7sqpedBlop3roMqFy82XCRcEM+9z5ZGRX0V8kuC11Rp0WdLVGXauJX2hVrBWLnHg+4j2dZpKVb6+KJnquuX78e/poAAt5wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEGXb0VDa5vgjLhFzmorm3oWc61yuUIvzeztPuBU5WdI1wjy7znfdevD9MNr8IqEFFcktD5bNV1ym+SPZTzG7bIUR6+LLrzYzyvtHh1O213T7eHeXrJKEHJ8khCChBRitEj5bBWVuD5MSajcsvLL/FfCi5ud8+cnou4tnyMVFJJaJH0RmV3dgANSAAAAAAAAA8zkoRcpcEihPLsk/Je6jNqxwuXTRPE7q6/OkkZsrrJc5y95GZt1nD9rlmd1Vx/NlWdk7HrOTZ5Bm3XHCToAAUAAAAAABPVi2WcWt1drDLZO0BJXTZZ5sXp2l6rFrr4tbz7WTm6ccuX6QY1HQx4vWT5k4BTjbu7oAAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEOVV0tLS85cUMa3paVJ81wZMUqpdDmzr+zLijL2vH3jYsZNfSUSj180eMO3pKFr50eDLBTr/sZsofZs4oXtuPvGxanFThKL5NGTTJ1ZEW+p6M2DHyFu5FifDiTl9unB73i2AQYdnSY615rgyctws1dAADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACO+zoqpT7ORIUNo2ebWu9mW6i8MfLLSpGc1JtPjLmzXpgq6owXUjNw6pTujJLyYvVs1ScXXns3qPM5KEHJ8ktStgxc3O6XnSeiPubJtRpj502WK4KuCiuSRXy5dY/8Ab0CDJtdcEo+fJ6RJ0anXrYAAwAAAAAAAAAAFXPlpXGPaygW89/3IrsRUJr1cc/UABjoAAAAAAPUISm9IxbLVeC3xslp7ENJucnaok29EtWWKsOcuM/JX6l2uqFa8iKR7K045ct+EVePXV5q49rJQDXG3YAAAAAAFfIyOh0SWsmGyW3UWAZry7n9pL8h4Xd6f6Izbp+LJpAzvDLf9PuPvhtv+n3DbPxZNAGc8y7tXuPDybn9t/kNt/Fk1A2kZLtsfOcveeW2+b1G2zhv21XbXHnOPvPDyqV9vXuRmAzapwxfedWuUZM8PP7K/eymBtU4sVl5tnUoo8vLuf2tPyIAZtvhj9JXkWv8A5jPPS2P7cveeAFaj1vz9KXvHST9OXvPIBqJFfauVkveSwzbF52kkVgNsuONadOTC3hyl2MmMdNp6rgzTx7OkpUnz5MqV5+TDx9xKADXMAAAAAAAAAAAp51fBXR86JcI74OypwTS19hlVhdXb7TZ0tUZ9qK2emlXYucWMCeilVLnFk+VDfx5rr01RncX/ADm9wkpQUlya1KO0a9JRsXXwZYwp7+Ou2PA9ZUN/HmvZqhfcZjfDNX2bLz49zLxk4dm5kR7HwZrDHpXNNZbAAU4gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGLbJztlJvXVmtdYqqpTa1S6jKnHVx3YOKfLV66kZPRwet1o4MNzHT65cSwfIRUYKK6loR5M+jolLr00RXUcb+2StjJ35U7nyT4F4hxYdHRFdemrJLJqEJSfJLUTpud3l6V4/3s5vnGtaLvLRXwobtO8+c3vMsCMz70AA1IAAAAAAAAAAM/O+n/ACKxPmP/AIh9yICK9eH8wAAWAAAXcbGjuqdi1b5Iq1Q37Yx7Way4I2OPLlr1HxJJaJaH0Ap5wAAAAAAAAAACnnw82f5MuEd8OkqlHr6hVYXV2ygAQ9gAAAAAAAAAAAAAAAAAAAAAAAAaOEtKNe16mcatC0oh+FGxx5b6SAAp5wAAAAAAAAAAAABQyP7GbGz7Muf7l/mivmVdJS2vOjxQwrN+hJ848CZ265ftjL9IcN9HkWVPl1F1rVNFS+PR5tdi5S4MuGxmfuysTjCftizZrkpwjJda1MvMjuZM+x8S5gT3qN3ri9CcfV06808sZktAAt5gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAU9oP8Atwj2srURnK5VJvdjLeaaJtpc6/zPuAkpy5NtJ6/sR/yemeuPa8Us179tVS63qy6U6v7ufOXVBaL/AN95VccPV39LiK2bL+3Gtc5ySLJUl/dz0uqta/mKYd7WktEkuo+gGoAAAAAAAAAAAAAGZl/WZ/l8iEmyvrMyEh7Mf5gAAoAAFjCWt+vYjRKOAvLm/YXio8vL/QADXMAAAAAAAAAAAAAZV0d26a9pGWM1aX69q1K5FezG7gAAoAAA9QhKx6QWrPJPiS0yI+3gE5XU3BYlz+yl+Z6WFb2x95oArTz/AJclFYMuuaPvgD9Z+hdA1D8mSn4B/wBT9B4B2WfoXANM/Jl9sy7HlSk200+BCaOatcdvsaM4yu/Hlcp7AAY6AAAGvV9FHuRkGvX9HHuRscOb4egAU4AAAAAAAAAAAAAAUcR9FlWVPgnyLxnZMnDOjJcORN+3Tj97izmR1p3uuDTLB8fmvhr7D5CTlBSacW+p9RSN+lPaNXCNi6uDPOzpaWTj2rUtZi1xp+8z8Se5kw9vAi+snow/bisawALeYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGfnwfSRnJ+Tpp3E2BVuVub+1y7iDNhLp9Zy0g+Xs/Iu01xrqjGL1Xb2kzt3yuuOR7nJRhKT5JalPZ2r6ST62iXNnu48u18Dzs+OmPr2sfKZNcdq0ypg+XK2z0pFi56VTfYmRYEdMZPtbZvymfzVgAGoAAAAAAAAAAAAAGXk/WJ95ES5P1ifeREPZj1AABQAALmz+dn5F0pbP52fkXSo8nJ/QADUAAAAAAAAAAAAACjnry4PtRULu0Fwg+8pE16uP+QAGOgAAB6rlu2Rl2PU8gMvTZB4plv1Rl2o9lvEAAAAAIsla48+4yzWv40T/CzJJr0cPQADHYAAA16/o49xkGvX9HHuRscOb4egAU4AAAAAAAAAAAAAAUdox8yf5F4q7QjrQn2SMvTpx3WUWIPehGS61qeiDDlvY0PYtCcRGU1dPM4qcJRfWtDGWsJ+1M2zIyo7uTNe3UnJ34L7sayeqTPpHjy3qIP2EhbhfVAAGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMrMf/ABE0uOumpo0R3aYLsRlXvevm/wDUzWpetMH2xRGPb0cs1jFTaUvMj3snw1pjQ95V2i/70V7C9THdqhHsSNnacvXHI8Zb0xp+1aHumG5VGPYj5fV0te7rotVqSG/Lnv1oABqQAAAAAAAAAAAABlZH08+8jJL/AKefeRkPZj1AABQAALeA/wC5JdqLxmY1sarHKWummnAteG1dkvcVHm5MbcvSyCq86vqjI8vPXVW/zY2n8eX0uAovOn1QSPDzbX6K/Ibb+LJogzHlXP7f6Hl3Wv8A5kveNt/FWqfHKK5tGQ5SfOTf5nwzavw/62E0+TPpjptPVMlryrYfa3l2M3bLw34aYIaciNvDlLsJjXKyztVz/oo95QNDO+hXeZ5Neji/kABjqAAAAANHCetC9jaLBWwPoX+Islx48/6oAAkAAHmxa1yXsZkGw+TMcmu/D8gAMdwAADXr+jj3IyDXq+ih3I2OHN8PQAKcAAAAAAAAAAAAAAIcuO9jT7tSY8zjvQlHtWhlbjdXars5/wBmS/1Fwo7Nf0i7mXhj0vl/uhl56/4l+1I1CjtGOm5Nc+RmXTeG6zSYE1KhR64viWils5xcZr7WurfaXTZ0nkmsqAA1AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADEs+kl3s2KlpVBdiMi36Wf4mbMeEURi9PP1FHIh0udCPsWpfKKe9tN+zh+heKjlyfE/xXv6R30xg2lrqywRdL/xKq04buupKEXqAANYAAAAAAAAAAAAAMq/6ef4mRkl/00/xMjIezHqAACgAAAAAAAAAAAAAAAAEtdFlnmx4drLVeHCPGflP9DdIyzkVKIylbHcT1TNU+RiorSKSXsPpsjz55eVV81f8O+9GcaWZ9Wl+XzM0yu3F/IADHUAAAAAX8D6KX4i0VcD6OXeWio8mf9UABqAAADHa0k17TYMif0ku9mV24fl5ABL0AAAGtT9DD8KMk1aPoIfhRscebqJAAU84AAAAAAAAAAAAAAACjh+TlWx7/mXuRnqXRbRl/qenvL8vNfcTHTk7lfU9UVNox1pT7GS4kt/Gg+xaDLSeNPXsNvTMf1zUtnvTI07UaZl4P1mP5moZj0vn/oABTiAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAxbFrdNf6mbXUZNkf8AjXHtmaxOLvzX1FDG459r7NfmXyniL/ib32P92XDYjk7Vl/kH+D9yyVanvZ1r7EkWhE5AANSAAAAAAAAAAAAAMq/6af4mRkl/00/xMjIezHqAACgAAAfUm3olqz2qbXyrl7gzciMEyxbn9jTvZJHBsfOUUNJ88Z8qoL0cFfam33IkjiUrmm+9m6TeXFmnuNU5ebBv8jUjVCPmwS/I9DSbzfUUIYU357UV7yzXjVV8dNX2smBunO55UABqAAAQ5fHGmZhqZP1efcZZNejh6AAY7AAAAAC9geZPvLZT2fyn+RcKjycn9UABqAAADJt+mn+JmsZV/wBPP8TMrtw9owAS9AAABq4/0EO4yjVxvq8O42OPN0kABTzgAAAAAAAAAAAAAAAM+2Ou0l3pmgZ+Q9NoQftRfb0i2TPl15Osf+lXZz1pkuyRLlrXGn3EOzfo5v2lqcd+uUX1rQ2dMz9Z7ZuC9MmPtTNQy8GLeTF9ibNQzHpXP/QACnEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABj77eTvv0tf1Ngxlp4Qn1b37myRi9HP8KmH9Nkfi/ktlTDf9+9f6tf1ZbKjln2pYr1y7u/9y6UcF65Fr7f5Lwx6byesgAGuYAAAAAAAAAAAAAyr/pp/iZGSX/TT/EyMh7MeoAAKAABoYUEqd7TjJ8yyQ4v1eBMXHjy/qgACQAAAAAAAAAAAABHkfQT7jKNa/6Cf4WZJNejh6oADHYAAAAAXdn/APM/IuFLZ/Oz8i6VHk5P6oADUAAAGXkfTz7zUMvK+sT7zK68PaIAEvSAAAamL9Xh3GWaeJ9Wh+fzNjjzdJgAU84AAAAAAAAAAAAAAADPyk3nV6ez5l256UzfZFlLL1ebXo9Hw+Zbyfq1ncTPl1y6xeMJJY0dOviTWa9HLTnoRYaaxYa/+8SWyW5XKXYtTZ0jL+qzcBtZKXamjUMvF3rctSb5cWahmPTpzf0AApxAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZN/lZct3ReVoaxi3fTT19JmrjS3seD9iIx7ejmn6x8pqULbZa6uT9xMfEktdFzPpbhbtn7P4Xz7v3NAo4cWsq3hwWq/UvE49L5bvIABTmAAAAAAAAAAAAAMq/6af4mRkl/wBNP8TIyHsx6AAFAAA1MX6vDuJSHEeuNAmLeLLugADAAAAAAAAAAAAAB4u+hn+FmSa9n0cu5mQTXfh+QAGO4AAAAAt7P86fci8UcD6SXcXio8vJ/QADXMAAAzMv6zP8vkaZm5n1mX5GV14v6QAAl6QAADSw/q0fzM00sL6uu9mxy5f5TgAp5gAAAAAAAAAAAAAAAFG9a7QrXsX7ljLemNPuIWtdpL2IkznpjP2tE/bt84xJjr/h6/wo85b0xp9x6x/q9f4UL0nTPe5aG/Dn/wAlHZ+vTvs3TSKGzY+VY+4vmY9L5v7AAU5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMrNhu5MvbxLuC9caPsbKWbr4TLX2F3BWmNH26kTt6eT/84sAilNxyIw6pJ+8lLefWlKE9zaM4LlLn36F0z7vI2jF9rX8GgTF8nxf8AAU5gAAAAAAAAAAAADKyE1fPXt1Iy/m1b0N9c48+4oEV68MtwAAWAACzjZKqjuyTa7UWVl0+lp+Rmg3bneOX20/C6fT/AEY8Lp9P9GZgG0/hxafhdPp/ox4XT6f6MzANn4cWn4XR6f6MLKpb03/0ZmAbPxRsgo4uRu6Vz5dT7C8U45Y3G6AAEgAA+T8x9xjmy+TMYmu/D8gAMdwAAAABawPpn+Evmfg/T/8AiaBUeXl/oABrmAAAZ2b9YfcjRM7O+n/IyuvF/SuACXpAAANHB+g/MzjQwPoX+I2OXL/KyACnmAAAAAAAAAAAAAAAAUore2nJ+iv2Pu0X/bhHtep9xVvZN8vboeMz+5l11k/DvP7n+RbrW7VFdiR4ynpjT7iYgzfqs/y+Zt6csfeUVtnT0nOHatTQMzAi3fr1JGmZj06c39gAKcQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGVmRayZOXDXkXMK1WU6aJOPPQr7RX96L6nHQ+bOlpdKPaiJ6yerKeXFtbvi+lpkuqWnvJz5J6JvTU+lvNapZ63ZV2dj0Lieq1IM6O9jN+i9T1iSc8aDfZoZ8rvvCVMADXMAAAAAAAAAAAAADOycd1S3o+Y/wBDRPjSa0a1TFVjl41jgnyaOhnw818iAh65dzcAAGgAAAAAAAABJXRZZ5sXp2sMtk7RmvVr0cd7notSCjEVb3peVL9EWSpHn5M5l0AA1yAAAMZ8zZMeXCT7ya7cPy+AAx6AAAAABPhvTIXczSMvFemRDvNQqPNy9gANcgAADPzvp/yNAzsx63vTsMrrxf0rgAl6QAAC/gfRS/EUC/gfRy7zY5cv8rQAKeYAAAAAAAAAAAAAD5JqMW31I+kGZLdxp+3gGybunjAX9mUnzlJsig9/aTfZ/Bbph0dMY9iKeF5eXOfVxf6k/UdZd+VaBS2jZpCMF18WXTM2g9cjTsQy6Zwzeb3s3Xen2aI0CDDio40e18Sc2dJ5LvKgANQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAp7Rg3VGSXmviVcOxV5EW+T4Gq0mmnxTMR8GyMvV29XDfLG4twEePPfohJ82iQt5rNXTzOKnBxfJrQq4DcekqfOLLhTs0ozFPlGzg+8y/asfcuK4ADUAAAAAAAAAAAAAAAAPFlcbI7slqitLBX2Ztd6LgGlTKzpQeDPqlFnzwK3/T7zQBmlflyZ3gd3YvePA7uxe80QNH5cmd4Hb/p956WDZ1yii+Bo/LkprA7bPciSOFUuesu9lgDTLnlfl4hVCHmwS/I9gGoAAAAAAAADIs4WS72a5k3cLp/iZlduHuvAAJegAAAAAeq5btkZdj1NJ5FUec4/kZsYSnruxb07D404vRpp+02VzywmVaEsypctX3Ijeevsw97KQG2TixWZZtj5KKI3k3S+2/yIgZtcwxnw9OcpedJvvZ5ADdAADQAAC9s/wA2feUS7s//AJn5Gxz5P5XAAU8oAAAAAAAAAAAAAFTNe9Kqv0pFspwXTZ0pfZr4fmZV4d7WL5blE5diIcCvdpcuuTPufLdx9PSehNTHcphHsSHy3rD/ALezIy3rkz7zXMpLpc3Ttn+hmS+H1bWlTFxqhF80kj2AU4UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAycuuNd0lF8+OnYaxR2jWvJsXPkycp6duG6ye9nz3qpQ9FlqWq5ac+OvYZ2z5qNzi+clwNFrVNdox6ZyzWb6V8yvfx5dseKPOHa2nTPzofItNarib3Ee8MkGJZ0mPFt8VwZOZ+M3RlSpfJvgaAnTeSaoADUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZeStMifeahmZf1mf5fIyuvD2hABL0gAAAAC9s9+TNe0syhGa0lFPvK+AtKpPtZaKjyZ39qrywqny1j3MhlgyXmzT7y8BomeUZksa2P2Ne7iRNNPRpp+02D44prRpPvGlzmvyxwac8WqX2dO4gngv7E/wAmZpc5capgkspsr86L07SMx0llAAGhYw57l271S4Fc90/TQ/EhE5TcawALeMAAAAAAAAAAAAAQ5VvRUSa5vgjzhQ3KE3zlxIsx9JfXSu3VlxaJexGfLpfWEn2pZj6TIrqX5l4z8Z9Lmyn1cWaAhyetYo77FVVKT/LvKWz4710pt+aj1tGzza13sbOhxnP8ib7rpJ48dv2vgAt5wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACDMhv40vZxJz40pJp8mGy6u2Im4vVPRo24Pein2oxrYOu2UH1M1MSe/jw9i0Ixenn9yVWvXQZsbOUZP8A+l8gy6+kolpzXFHzDt6Wla+dHgyp6rjl+2Mv0hz4OE4XR5lnHtV1Sl18mvaMivpaZQ6+opYNm5c63wUvmZ1VSeeH+xpAApxAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzsxaZD7kaJn5y/vJ+wyunF/SsACXqAAAAAGlhrTHj7dScjx1pRDuJC3iy7oAAwAAAAACtdiRnq4eTL9GWQGy2dMeUXFtNaNCMXJ6RTb9hrOEZedFPvR9SSXBJE6dvzf4o1YU5cbHurs6y3CiuDTjFarrJAbpyyztAAakAAAAAAAAAAAN6IFfNs6Ohpc5cEK3GbukWL/AHsqy58lwRYyZ9HRN+zRHjChuY615viQbQs1lGpd7J6jrryz097OhpXKfa9C4+CPFMOjqjDsRHmWdHjy7XwRvURf3zZ1sumyG19p6I1KodHFx0SSfDTsM7DhvZMfZxNUnH7dOa61jAAFuAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzdoQ3blLqkjzh39FZo/Nl+hbzob+O31xeplnO+q9nHrPDVbpnrXEzNPsTLOJb0lC1fFcGfMyrpaXovKjxRV9zbz4/rl41YM3Nq6O1WR4KT9zLeJb0tK185cGesirpqZR6+aF9wwvhl7fabFbVGa6yQobPs0lKt96RfNl3GZ4+OWgAGoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKW0F5UH3l0q56/txfYzKvjv7KAAJesAAAAAa1K0ph+FHs8w4Qj3Hot4aAAAAAAAAAAAAAAAAAAAAAAAAAAAAABRt/4jNjXzjDmWr7FVU5vq5EGBBqMrZc5sy/Tph6lyWm1GLb5JGfjx8Iy5WS5Lj/BPn27lO4ucvke8SroqVqvKlxZl91uP642/aczc+3ft3Fyjz7y/bNV1ym+pGM25Nt83xMyvwvgx3drezo62Tl1JaGiQYcNzHjw4viTlYz058l3laAA1zAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHxpNNPkzHurdVsoPq5GyU8+lzirI848+4nKbjtw5+OWlfCu6K7RvyZcGahhmti3K6pP7S4MzG/C+fD/lFVPwXMevmSNBcSDLo6arh50eKPGDbv17kvOj8jZ6unPL9sfJBmVuq5XQ4av9S5j3K6veXPrR6trVtbg+TM2qbxch7yfDg0h1VSfkx18xqg8wmpxUovVM9FOAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABDlrXHl7OJMebI79co9q0Dcbq7ZAAIe0AAAA+ri9Axrx5I+gFvEAAAAAAAAAAAAAAAAAAAAAAAAAAAAV8y7oauD8qXBBsm7qIL28nKVUX5MeZeSUY6Lgkitg1OFbnJeVL5HnPv3Y9HF8Zc+4nqbdbPLKYR4gvCstyfmQL5XwqnXRx86XFk7aS1ZsRyXd1PhR2jb5ta72VaK+lujDqb4i+zpbpT6m+Ba2dXxlY+5Ed16f/wA+NfXBAA6PGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADJy6uivaS0i+KPmLd0Nqf2XwZezqt+neS4x4mWcr6r28dmeGq3TOvUsbKVkV5MuP8k+Db0lW6/Oj8iXIqV1Tj180XfcefH9MtV7hJTgpR4plXOx9+PSRXFc12oiwrnXY6p8E3w16maI7jLvjy9MzDyeiluTfkP9DTMvMo6KzeivIl+jLeHf0te7J+VH9UMbr1V8mMynnFkAFOAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMq6O5dOPtIy1nw0sjLtRVIr2YXeIAAoPVa1siu1o8kuOtciC9uoZemoAC3iAAAAAAAAAAAAAAAAAAAAAAAAAAAb0Wpn1p5eU5y+jie829/Qw4t89PkWMeroqVHr5snuus/THfzXqyca4OUuSKeNU77XfYuGvBHy+Usq9VQfkrmy9CKhFRXJLQd0/jH/a9FPPu3Y9FF8Xz7ixdbGmtyl+S7TInNzm5S5sZVXDhu7r5FOUkktWzYor6OmMOxcSDCx9yKskvKfL2ItjGaObk8rqAAKcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHxMfIrdV0o9XNdxsFbMp6WrVLyo8icpt14s/HJQx7XTapdXJ9xrpqSTXFMwy/gX/8AKk/wk434dubDc8oZ1H/NgvxfyTYl/S16Pz48/aWOZSupePPpquS5xK69uMy8sfGrVlcba3CXJmWt/Gv4rjF+9GrXONkFKL4MiyqFdDh5y5MWb9nHn43V6SVWRtgpR5M9mVjXOi7dlwi3pJdhqp6my7ZyYeNAAa5gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIMuG/Q9OceJmmy1qjKvrdVrj1c0TXfiy+EYAMdwsYUdb9exFcvYENISl2s2OfJdYrYAKeUAAAAAAAAAAAAAAAAAAAAAAAAIsi5U1t9b5I9W2Rqrc5ckZ0d/MyPK5L9EZa6YYb93pPg1a63T4tvhr8z3m39HDci/Kl+iJbbI0U66cFwSKeLVLIud1nFJ+9mf5Fz9r55dLOHT0VWrXlS4snbSWrPpTz792PRRfGXPuN6jnJc8lTJud1uv2VyPWJj9NPWXmLn7SKquVs1CPNmvVXGqtQjyREm7t6OTKYY+MewAdHkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZeZR0du8l5MvmV4ycZJp6NcjZtrVtbhLkzIsrlVNxkuKOeU09nFn5TVauPcrqlLr60SSSkmnxTMnHudFmv2XzRrRkpRUk9UypduHJh4VRjJ4d+5LjXLky8mmtVyI8ilXVuPX1MrYt7rl0FvBrgmx0Wec3O3vLxukW/BeWuftI8PI3X0Vj9ib6vYXyjnY/8AzYL8S/cWa9xuGUynhkvApYeU5f27Hx6n2l02XbnljcbqgANSAAAAAAAAAAAAAAAAAAAAAAAAAAAAABDkUq6Gn2lyZMA2XXtkSjKEt2S0Z5NedcLFpKKZF4HTr5r95Onecs+VCuuVklGKNSuCrgorkhCuNa0jFI9GyOWefkAA1AAAAAAAAAAAAAAAAAAAAAAHxtJat6ISkoRcpPRIzMjIlkT3IJ7vUl1mW6Xhhcn3JteTaq6+KXL2suUVRx6eL485Mjwsd1JzmvKfJdhFm378uhr4rXjp1vsJ6911v7Xwx6eJylmZCjHhFfou00YQjXBRitEiPGoVNen2nzZLKShFyk9EuZUjnnlv1OkeRcqK9583yXaZM5Ssk5SerZ6vtd1jk+XUuwt4eLwVli9qRF/au+MnFju9pcOjoob0l5Uv0LIBc9PLlbld0ABrAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAhyKFfDskuTJgGy2XcYk4uuTjJaNFrCyNx9HN+S+T7CxmY/Sw3ory1y9pmcjn/NezGzlx1W4V8nHV0dVwmuTIsPK1SrsfHqfaXS+48tlwyUcfLcZdHdwa4av9y9zK2TjK5b0eE+3tIsPIcX0NvBrgtfkZPXqqsmU8sUeXj9FLpIebr1dRYxMnpVuz89fqWXFSTTWqZm5GLKl79erj+qFmvcVjlM545dtMFXCv6SG5J6zXb1loqXbjljcbqgADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA+TlGEXKT0SPk5xri5SeiRk33yunq3pHqRlunTj47nXvKyXc9I8IL9SfAolFuya01WiPGHjb76Sa8lcl2kuVlbn9uvjN82uomfddcr/APzwfMzJafRVvjybXyPuJi7n9yxeV1LsPWLjKtKc1rN/oWW9FqzZPmueWUk8cRtRTbeiRmZWS7nux4QT956ysnpZbkW9xPi+084lSsv108iPHj+hlu/UdMMJhPLJ7xMRyassWkepdpogFSacc87nd0ABqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKuViKxOcFpP5loCzbccrjdxhtNPR8GjQwsnfXRzflLk+0+5mN0i6SC8pc12mcm4tNcGjn/Nev1y4/63Cnm4+8ukgvKXNdpJjZCthpJpT5P2lgvuPNLcMlLEy97Sux+V1PtLpQysR6uypd8T7i5fKu190mZLr1V5YTKeWLzlYzrfS06pLi0uokxs1S0ja9JdvUy5zKOVh851LviLNe4Y5TKeOS8DOxct1+RY9Y9T7DQTUkmnqmbLtGeFxvt9ABqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADxZZGqG9N6IhyMuNLcV5UvkZ8p2X2cdZSfJE3LTthxXL3enu++eRPRJ6dUUWMfC00ld8JLi4ypjvS4zf6HjKyt3+3Vxm+Da6jNfNXcrf0wMnJ3f7VXGT4cOo9YuKq/Lnxm/0GJjdGt+fGb/QstpLVvRGyfNcsspJ44jeiM3Lyna9yD8hfqfcvK6TyIPyOt9pBTVK6e7H832GW79R24+OYzyyTYNKssk5JOMV1mjCEYLSKSXsPNNUaYKMf/pIVJpx5M/K7AAa5gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFHNxv+ZWvxJF4GWbVjlcbuMI0sLI6SO5N+UuXtR9y8bpVvQ4TX6mc1KuXHWMkR/NerePLj/rbKuTiK3yocJ/M842YptQt4S6n2lwv1Xm/bjrOx8mVMujuT0XbzRoJppNPVMiyMeN8ePCS5Mp1224k9yabj2fwZ12uycnvHtYycRWazhwn8ypRkTx57sk93ri+o0q7I2x3oPVHi/GhcuK0l6SFnzDHPX659JK5xsipReqZ6Mtxuw56p8O3qZcoy4W8H5MuxiVOXHr3PcWAAU5gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFe7KrqT0alLsQbJb6ieUlGLbeiRnX5sptxr8mPb1shtvsuejfDsRNRhSnpKzyY9nWyLbenox48cPeaCqmd0tIrvbNKjHhRHXm+uTPf8Abor6oxRXfSZb0WsKe3rZsmk5Z3P/ACPluRO6fRY/5yJqMWFPHnLtJKqoVR3YLQ+XXRphvS/JdpuvmouW/wBcXuUlCLcnokZmVlO57seEPmR35E7peU9I9SFFMrp6R5db7CLd+o74ccwnlk9Y+PK99kVzZp1VRphuwX+59rhGuCjFaJHoqTThyclyv+AAKcwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAjtqjbBxkiQAl0xbIOubjLmi7jZkXGMJ673LXtJ8jHjfHjwkuTMuyEq5uMlo0c/eL1y48s1e20eZ1xsjuzimijjZu6lC3Vr0i/GUZx3otNPrLl28+WGWFUbKLMZ9JS249aLGPkwuWnKXYTlW7CjJ71b3JfoZrXSvKZeslmUYzi4yWqZm5OI6tZQ1cf1RNHItx3u3xbj1SRarshZHWEk0PVJcuP38M+jNnXwn5Uf1NCu2FsdYPUjuxa7Vrpuy7UZ867caevFdjXWZ7i9YcnXqtcFGjP5RtWn+pF2MlJaxaafWipduOWFx7fQAakAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAbSXErWZtUOC8p+wbbMbelkgsy6a/tbz7EUb8udq3V5MexHiqiy3zY8O18iLl9O+PDJN5pbs2dicYLcX6ninGsu4paR7WWVh9HFOKU56/a5E9uRXTwk+PYhr7b5yeuOFGNClcFrL0mfLsiNb3Ypzm+UUeabrbp725u1+3myaFUK23GOjfNlf9ON7/ZDCiVklPIer6o9SLPIFLJzN3WFXF9cuweoSZZ3UTZGTGhac5dSMyyyVst6b1Z5cnJtt6t9ZcxsLeSnbql1RI3cnpmOPFN1Bj4875cOEetmpXXGqG7BaI9RiorSK0S6j6XJp5+TkuYADXMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACK+iN0dJcH1PsJQGy2e4x7qJ0y0kuHU+0U3zpesHw60zWlCM4uMkmmUL8GUW3V5UezrRzuOunqw5ZlNZLNOXC3g/Jl2MsGG009GtGTU5VlXJ6x7GbMvtOXB84tVpSWjWqKluG1LfoluvsJacqu3hruy7GTleq47ywqlHKtq4X1vT0kTwtpvjomnr1Mm01K9uJXZxS3JdqHtu8b/iG7AT41PT2Mqf3aJaeVBlnfysd6SW/FdfMkjmU2rdtjp38UT6dpllJ9xWjm3rnJPvRZqz4y4WLdfauR5nh12reoml7OaK08W6HODa7VxM9xuuPL/GorYNaqcdO3U9mG01z4E1WVbVHdTTXtN8kXgvxWsClXtCL4WRcfauJYhkVT82a+RW45XDKdxKADUAAAAAAAAAAAAAAAAAPErq4edOK/MiebQvta/kzNqmNvUWAUZ7Q9CH5srWX23yXb2R1M8o6ThyvbTndXW9JzSKl+c1LSnTTtIYYd0/s7veTw2f6c/cjN2qmPHj3dqc7bLPPk2SVYttvFLRdrLsceijynpquuTPNmfXHhBOT9yM19q/Jb6wj7Vg1w4y8t+3kSW5FVK0bWvoooyyL8h7sde6JLTgN8bX+SN39JuPzyV5lk3ZEtyqLivZzJ6MONflWeVP9EWIwjCOkUkvYebroUx1k+5dpuvmoue/WMSEF2VXVwb1l2IpXZllmqT3Y9iK5ly+nTDg+ck9uXZbqtd2PYiGMJTlpFNv2E1GLO7i/Jj2mlXVCqO7BaIyS3tWXJjx+sVbGwlBqdvGXUupFwAuTTzZZXK7oADUgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACK6iF0dJLj2mfdiWVcdN6PajVBlm3TDkyxYZPTmWVcG96PYy7diV28V5Mu1GfdjzpflLVdqI1Y9Mzw5PVaVWTXbwUtH2MmMMnpy7Knxe9HsZsy+3PLg/+WqQW4lVnHTR9qFWVVbwUtJdjJyvVcP2xrMsxLqXvVttdq5ivNtg9J+V38GaZDbjV28ZR49q5meP06Tll9ZxFHLotWlkdPxLUPEx7eMHp+FniWz19ifvRBLFvreqTftizPfzFSY/8ctLD2fHqsa70RSwLVylFniOVfW9G9fZJE8NoL7db/Jj9Vf+2f6jVGVV5munsZ98Kya/Pj8UdCzHNplzk13okV1UuU4v8zdfVRcr/wAsVWO0PSr9zJI51L570e9EkseizjuR/LgQvZ9bfCckP2Z/6736S+F0P7f6M++F0esRXezuyz3o8+L5+mvcN5N8eL7WllUv/mI9q6qXKyL/ADKa2c/WL3Dxc+qxe4brPHj+1uWRVHzrI+8ilnUrk2+5Ecdnx+1Y/wAkelgVelJ/mPZrjny8S2j6NfvZE8658t1fkWlhULmm/wAz46MSHPdXfIzWSplxzqKcsq6X22u7gRuc58HKUvz1L7lhw9B/lqPDaIcIxf5IzX3VzP8A+cVOGNdPlB6dr4FiGz39uaXsR9ltBfZrf5shnm2y5NRXsH6w3y3/ABchhUx5py72e3Omlaawj7DOjHIu5b7XtfAmhs+T8+aXsXE2X6iLjP8Alkmln1R83WX5FezOtlwglFe9liODTHnvS72Twprh5sEvyN1U+XHj1Ns2OPfe95p98mWK9nxXGybfsRclJRWsmkl2laedVHzdZdw1J238meXrFPXXCtaQikhZdXWvLkkZ1mbbPzfIXsK7bb1b1Znl9Nx4LfeVXLs9vhUtF2sqSlKctZNt+0+11zslpCLbLtOAlxtevsRnuuu8ONShXOx6Qi2y9RgqOkrfKfZ1FqMIwWkUkvYeipjpwz5rl6gACnEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD5KKktGk12M+gCpbgQlxg919nUVLMS2vi47y7UawJuMdcebKMNpolqybauUtV2M1ZwjOOkopr2mffhSi261vR7OtE3Gzp2x5cc/WSavaEH58XHu4liu6uzzJpmO009Gmn7Ry5DypeDG9NwGRHKujysf58SxXtB/8yGvtRXlHK8GUXZQjNaSin3ohnhUy+y49zPscumX29O/gSK2uXKcX3M31UftiqvZy+zY13ojez59U4vvNEGeMVOXP7ZTw74vhHXuZJDFyWvPce+TNEDxjbzZVnunMjym5d0v5POubH0/maQGmTl/yMt25a5ufwjpsp9c/hNQDx/1v5Z/8svfy36z3H3dy5es9+hpgeJ+X/GY8XJn5yf5yPqwLXzcUaQHjD82XwoR2c/tWe5Ekdn1rnKTLZ5lZCHnSS72bqJ/JnflFHDoX2Ne9kkaa4vVVxT7iOWXTH7evcRvaFa5Rkx6hrPJbBQltF/ZrX5sgnlXT5z0XYuBnlFTgyvbSndXX500n2FezaEF5kXL2vgZ61b4cWWKsO2zi1ur2meVvTp+LDH+qjuvnc/KfDsXIjjGUvNTfcadWHVXxa337SwklwSHjvsvNjj6xjNpwrJ8Z+QvbzLMcCqPnb0vzLQNmMcsuXKvMIRrWkUkvYegCnIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHmUIzWkop96IJ4VMuSce5lkDTZlZ1WfPZ8l5k0/YyGWJevsN9xrAnxjrOfKMZ02R51yX5Hg3DxOqufnQi/yM8Fz/AMj7jHjZOPmzku5kiyro8rH8y9LCplyTj3Mhns5/Yn70Zqq/Jx3tEs29daf5HpZ9vXGLPLwb11J9zPPgl/q/1Q/ZWuKp1tF9da9598Yr1b95UlTZHnCS/I8GeVPxcdX/ABivVv3nzxivVv3lEDyrfw4L3jFer/U+PaL6q17ykk3wSPcabZcq5e43yrPx8cWHtCzqhFEUsy6X29O5BYl7+x72j0sG7sS/Mfsa4ohdtj52Sf5nktLAt65RJI7O9Kz3IzVb+TCKJ8NWGFTD7Ll3k0a4R82EV3I3wRf/ACJ8Rk10WW+bF6dr5FqvZ652T19iLwKmMcsubK9I66a6vMil7SQApxt32AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHxxT5pM+gCPoKvVw+FHpVwXKMV+R6Abumi7AAGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAeZ2QrX9ycY6+k9APQIvCcf19XxoeE4/r6vjQEoIvCcf19Xxo9wnGcd6ElJdqeoHoAAAVs/KeJj9Kob3FLTXQpYu2JX5EKnSo7z013uQGsAAAAAAAAAAABl5W1/BsmdPQb26+e/pr+gGoCns/O8NjN9HubrS87XUtWTjXBzm0ori2wPQM2nbOPZY4zTrWvCT5P+DRjJSinFpp8mgPoAAAAAAAAAAAycva9mPlWVKqLUXzbLWzc2WbXOUoKO69OAFwAAAAAAAAHmdkK0nZOMdfSeh48Jx/X1fGgJQReE4/r6vjQ8Jx/X1fGgJQeYWQsWsJRku1PUTnGuDlOSjFc2+SA9Ag8NxfvFXxIeG4v3ir4kBOCDw3F+8VfEgszGb0WRVx/1ICcAAAAAAAAAAAZeVth4+TOroFLdfPe0/Yn2dnvO6TWvc3NOvXXXX+ALoAAAAAAAAAAAAAAAAAAAAAAAAAAAEGZkeC40rt3e3dOGunWBODHhtxznGPg6Wr08/wD2NgAAAABn5+0/A71X0O/rHe13tP2A0AUMDaXhtsodFubsddd7UvgAAAAAAAAACjtHPeE60q1Pf169NALwMvD2tLKyoUulR3teO9r1GoAAAAAAAD5KUYxcpNJLrbA+gi8Jx/X1fGh4Tj+vq+NASgi8Jx/X1fGj1C6qx6QshJ9kZJgewCDw3F+8VfEgJwQeG4v3ir4kPDcX7xV8SAnBB4bi/eKviRNCUZxUoSUovk0wPoAAAAAAAABR2htB4UoJV7+8n16AXgZeHtZ5WVCnoVHe1472vVr2GoAAAAAAAAAAAAAADM21TbdXUqoSm03rotdDRsmq65TfKKbehnePcb1dvuX8gY/gOV93s+EeA5X3ez4TY8e43q7fcv5Hj3G9Xb7l/IGP4Dlfd7PhN/ZVc6sCELIuMk3wa9pB49xvV2+5fyS421acm+NUIWKUteLS0+YGTLauYpNK1cH6KPnjbN9avhRsXLZ1E926FMZNa8YEfS7J7KPgAx78/JyK+jts3o666bqRBVZKqyNkHpKL1T0NTaU8CWLpjKrpN5ebHR6GfhutZVbu06PXytVwAn8bZvrV8KHjbN9avhRqdLsnso+AdLsnso+ADxsjMvyp2q6e8opacEjUIMVYzi54sYJPg3FaE4AGbl7WjjZE6XU5OOnHe9hF4+h93l8QGuDI8fQ+7y+IePofd5fEBrnMbV/yV3evkjQ8fQ+7y+Iysu9ZOTO5R3VLq11A1f6f+ju70X8zFjl09HKUo8dU0YeztoRwozTrc95p8HoXfH0Pu8viAz8vZ1+I25Ler9OP/vA8YubdiS/ty8nri+TNJ7dg1o8d6fiMzKsotnv01OpvmtdUB0GDn15kXupxml5UWWzAw9p04lKrhjyb+1Le5s0sDaCzZziq3DdWvF6gXQCjZtbFqslXJz3otp6RAj2tm3Yjq6Jpb2uuq17DO8c5fbD4TRltfCl5yk9O2B88aYHoP4AM/wAc5fbD4R45y+2Hwmh40wPQfwDxpgeg/gAw7rZX2ytnpvS56E2LnXYkZRqcdJPV6rU85tkLsuyypaQb4cNC3svLxsauavjq29V5OoHjxzl9sPhHjnL7YfCaHjTA9B/AeL9pYM6LIxi96UWl5HXoBS8c5fbD4ToKZOdMJPnKKbOPOgp2viwphFuesYpPyfYBpgq4u0KMqxwqctUtXqtCxZNV1ym+UU29AM7bVNt1VSqrlNqT10Rj+A5X3ez4TY8e43q7fcv5Hj3G9Xb7l/IGP4Dlfd7PhHgOV93s+E2PHuN6u33L+R49xvV2+5fyB72NVZThyjZCUHvt6NexEu1f8bd3L5ohq2xRbbCuMLE5NJapfyS7Wemzbvy+aA5lJt8D30Nvq5/Cz7jLXKp/GvmdcBx7qsitXCSXa0KfpofiR021P8dd3fuczT9ND8SA7ABvRasADxZdVU0rLYQb5b0kj2Yf9QfS0/hYGt4Zi/eKvjQ8MxfvFXxo5IAdb4Zi/eKvjQ8MxfvFXxo5IAWtozjPPtlCSlFvg09eou7Duqq6fpbIQ13dN6SWvMyAB1vhmL94q+NDwzF+8VfGjkgB1vhmL94q+NDwzF+8VfGjkgB2MLIWR3q5xnHti9UeihsX/Hx/Ey+AAAAAAAAAAAAAAAAAPF1ipqnZJNqC1eh7Ismt3Y1lcWk5RaTYFHx7jert9y/krZ21acrEnVCFilLTi0tOfeefEV/ra/1IsnZVuNRK2c4OMdOC1ApVy3bIyfJNM3fHuN6u33L+TBjHemorrehp+Ir/AFtf6gW/HuN6u33L+R49xvV2+5fyVPEV/ra/1HiK/wBbX+oFvx7jert9y/ky9pZUMzIVlakko7vld7LPiK/1tf6lLMxZ4dqrnKMm1vcAJdmZcMO6c7IyacdPJNPx7jert9y/kyMPDnmWShCUYuK14lzxFf62v9QNXDza8yMnXGS3Xo94slHZmFPChZGcoy3mn5JeAAAAAABi/wBQefR3S/Y2jF/qDz6O6X7AU9kf5Or8/kzpjmdkf5Or8/kzpgAAAAAAV8+Ep4VsYJyk48EussGdbtiiq2dcoWNwbT0S/kDF8Byvu9nwjwHK+72fCbHj3G9Xb7l/I8e43q7fcv5Ax/Acr7vZ8Jo7GxrqcqcrapwThpq1p1on8e43q7fcv5Hj3G9Xb7l/IGmcdLzpd519disqjYuCkk1qce3q2wPSqsa1Vcmn16H3obfVz+FnT4HDAo/AiwBxp1Ozf8fR+E5ez6SXezqNm/4+j8IFkBNPkAPM5wrjvWSjGPbJ6Ij8MxfvFXxorba/x0/xL5nNgdb4Zi/eKvjQ8MxfvFXxo5IAdb4Zi/eKvjRj7ctrtnS67Iz0T13XqZQAubLnGvaFUpyUYrXVt6LkzofDMX7xV8aOSAHW+GYv3ir40PDMX7xV8aOSAHW+GYv3ir40eq76rW1XbCbXPdkmcga/9P8A0134UBuAAAAAAAA8XQdlNkE9HKLRi+IrfXQ9zN0z9qZ1uF0XRxg9/XXeT6tAKXiK310Pcx4it9dD3M8+PMn1dXuf8jx5k+rq9z/kD14it9dD3MsYWyrMbKhdKyMlHXgu4q+PMn1dXuf8l3xha9lPK3YKe9pppw5gedp7Ouy8mNlcoJKCj5T9rKfiPK9Kr3v+B47yvRq+F/yPHeV6NXwv+QIcrZt+LT0tkoOOunBv+CtRVK+6NUGt6T0WpZytpX5VXR2KCjrrwRWptlRdG2CW9F6rUC/4jyvSq97/AIHiPK9Kr3v+B47yvRq+F/yPHeV6NXwv+QNXZuNPExejscXLeb8ktmLh7WyL8quqca92T0eievzNoDE2hs3JyM2y2uMXGWmmsvYiv4nzPQj8SOibUU23ol1mVlbajCxRx4qaT8qT6+4Cl4nzPQj8SHifM9CPxI3cbJryqlZW9e1daZMBznifM9CPxIp3VTotlXYtJR56HXnMbV/yV3evkgPGNhXZak6Unu89XoT+J8z0I/Ej5sfI6DNUW/Js8l9/UdIBznifM9CPxIeJ8z0I/EjoyhtTOWLTuQf92fL2LtAy/E+Z6EfiRf2ThXYllkrkkpJJaPUgwNsOOleU3JdU+td5triAMe/Ys7b7LFdFKcnLTTtZsADE8Q2evj8I8Q2evj8J92rkZVWZu0zmo7q4RRT8Mz/WW+4C34hs9fH4R4hs9fH4Sp4Zn+st9w8Mz/WW+4CDJpePkTqb1cXzLGDs6WbCUo2KO69OK1Kls5zscrG3N82yWi/Iqi1RKaTfHdA0PENnr4/CeLdizrqnY7otRi3poV/DM/1lvuPksrOlFxlO1prRrQCma1exJ2VxmroreSem6ZnRWehL3HWY/wBWq/AvkBS2fs2WHfKyVilrHd0S9qL10HZTZBPRyi0ewBheIrfXQ9zHiK310Pcy9tTOswui6OMHv6672vVoZ/jzJ9XV7n/IHrxFb66HuY8RW+uh7mefHmT6ur3P+R48yfV1e5/yBNj7GtpyK7HbBqElLRIm27coYsauucv0X/qPeHtLpMSy/I3IKMtPJ6+BiZuVLLyHZLguUV2ID3s2vpM+ldkt73cTqDH2FjNKWRJc/Jj+5sAVdqf467u/c5mn6aH4kdTnVu3CuhHi3Hgu05RNp6rmgOuyXu4tr7IP5HPYGbkV3VVRsbhKSjuvj1nmzaWXbW6526xktH5KR62TS7c+D04Q8pgdKYf9QfS0/hZuGPtui26yp1VznonrurUCvsLjmy/7b+aOg0XYjE2Nj3VZkpWVTgtxrWUdOtHvN2rfjZdlUIVuMdNNU9eXeBsaLsQ0XYjA8eZPq6vc/wCR48yfV1e5/wAgb+i7ENF2IwPHmT6ur3P+R48yfV1e5/yBv6LsQ0XYjA8eZPq6vc/5HjzJ9XV7n/IG/ouxHIZH1iz8b+ZvbLz7cydkbIwSik1upmRdh5Lvsax7GnJ6eS+0DZ2L/j4/iZfKWya51YKjZCUZbz4NaF0AAAIcq/wbHnbu7271a6EGPtTGv4OfRy7J8P1JNoVzuwra61vSa4L8zmLKp1S3bISg+xrQDsE9Vqgcpj5l+P8ARWNL0XxXuNPH24nosivT/VD+ANgEVOTTkLWqyMvZ1koAAAAAAAAApbY/xtvevmi6Utsf423vXzQHNxbjJSXNPUv+Osv/AKfwlGpJ2wT5NrU6PwHZ/q6/iAyvHWX/ANP4R46y/wDp/CavgOz/AFdfxDwHZ/q6/iAyvHWX/wBP4SrlZNmVarLdN5LTgjf8B2f6uv4jH2tVTTlRjRFKO4nwfXqwJ9gfWrPwfubxg7A+tWfg/c3gAAAyNu2WV9BuTlHXe13XpryMjwm/11nxs6bKw6cvd6VSe7rpo9Cv4mxOyfxAYPhN/rrPjY8Jv9dZ8bN7xNidk/iHibE7J/EBg+E3+us+Nnmdk7NN+cpact56mjtTExcSEY1qXSSfW+SMsD1GUoS3oycWutM9+E3+us+NkRc2bVRfkdFen5S8lp6cQIPCb/XWfGx4Tf66z42b3ibE7J/EPE2J2T+IDB8Jv9dZ8bLezL7pbQqjK2bTb4OT7DT8TYnZP4iSnZmNRbG2ClvR5asC4Y2Rsa27IssVsEpyb0aZslfOvljYllsEnKOmifLmBleIrfXQ9zHiK310Pczz48yfV1e5/wAjx5k+rq9z/kD14it9dD3MeIrfXQ9zPPjzJ9XV7n/Ja2ftS3KyHC2NcYqLk2tV+4Fu6XgmznvPjCtRXtemhy6Wr0Ro7Vz1lTVVb/tRfP0mR7KxnkZcZNeRX5T/AGA6KmHR0Vw9GKR7AA46z6SXezqNm/4+n8JzeVW6sq2Elo1JktW0cqmpV12aRXJbqA95GXdRtC902OPlvVdTOgxZysxapz86UU2crGM77lFeVOcvezrYRUIRguUUkgKW2v8AHT/EvmYOJ9co/wC5H5nQbWrnbgyjXFylquCWpjYuJkxyqZSosSU4ttxfDiB02i7ENF2Iz9qZ1uE6ujjB7+uu8uzQoePMn1dXuf8AIG/ouxDRdiMDx5k+rq9z/kePMn1dXuf8gb+i7ENF2IwPHmT6ur3P+R48yfV1e5/yBv6LsQ0XYjA8eZPq6vc/5JsTa99+VXVKFajJ6PRPX5gVtt/X/wDxRN/T/wBNd+FHza+Nfbm71dU5x3VxUdSXYlFtNtrtqnBOK03o6AbAAAAAAAABXysKnL3elTe7rpo9CwZG3bbKnR0dkoa72u69NeQE/ibE7J/EPE2J2T+IwvCsj7xb8bHhWR94t+NgbvibE7J/EWI4VEcbwfdbr110bOa8KyPvFvxs6DZE52YMZTlKUtXxb1A+T2ds+uO9OuMV2ym1+548F2V20/8A6/7jbv1BfjX7mDVVO6xV1rek+SA3vBdldtP/AOv+48F2V20//r/uZPivN9Q/iQ8V5vqH8SA1vBdldtP/AOv+48F2V20//r/uZD2bmRi26WkuL4oqAdTVs/ErnGyupKS4p7zLR4p+hr/Cj2AaTWjMHamzehbvoX9t+dH0f9jePjSaaa1T5oDlcTKsxLlOt98epo6bHvhk0xsreqf6PsMDaeC8S3egv7U3w9nsJdiO9ZD6OLdT8/Xkv9wN85jav+Su718kdOcxtX/JXd6+SAqJtPVczqcDJWVixs+1yl3nNKmUseVy4xjJJ/mT4GdLCnJpb0ZLjH29QG7nZsMOrefGb82Pac1bbO6yVlj1lLmz7fdZkWuyyWsn+hq7L2XyvyI+2MH82B92Ts3TTIvjx5wi+r2mwAAAPPSQXOcfeBlvbtaenQS948fV+ol7yTxVgvjvy+M+eKcH05fGB48fV+ol7x4+r9RL3nvxTg+nL4x4pwfTl8YGNl3LIyZ2paKT5MtbO2jHCrnGVblvPXgyrm1Qpy7K63rCL4cdS5svDx8mqcr2009FpLQC14+r9RL3jx9X6iXvPfinB9OXxjxTg+nL4wPHj6v1EveTYm1YZWRGqNUot68Wzx4pwfTl8ZLj4OJjXK2ub3l2yAvA+KcZcIyTfsZ9Ar5WHTl7vSpvd100ehX8TYnZP4iHbttlSo6OyUNd7XdemvIyPCsj7xb8bA3fE2J2T+IeJsTsn8RheFZH3i342PCsj7xb8bA3Ldj0SocK3KMtdU29TPxdk3WXuN0XCuL4vt7i/sSydmNY7Jym1PnJ69RgylLefF8wOvhCNcFCK0ilokfTjt6Xa/eN6Xa/eB2JUt2bi3ScpVJSfNptHM70u1+8b0u1+8Do/E+H6EviZZox6seO7TBRT5+05Wu2yqe9XOUZdqZ1dCmqYK16z3VvP2gSAAAZWZsiWTlTuVyipacN32GqZV22o1X2VujVQk46qQEPiGf3iPwjxDP7xH4TSwsyOZU7IwcUnpxLIHJZVHg2ROly3nHTj+RPgYDzVZpYobmnNa8xtb/JXfl8kXv6e83I74/uB48Qz+8R+EeIZ/eI/CbYAobO2e8Kc5OxT3lpwWhfAAAAAAAB5nXCyO7ZFSXY1qegBnX7Gx7NXXvVP2cV7jNv2RlVauMVZH/Tz9x0YA47y65/ajJfk0Xsfa+TToptWx/1c/ebmVHGlDXJVe72yOezVhqX/Cysfbry/kDZx9r412im3VL/AFcveXk1JJppp9aONOp2Z/j6fwgWgAAAKGRtajHulVOFjlHnolp8wL5S2x/jbe9fNEPjzG9Xb7l/JXztq0ZWJOqELFKWnNLTn3gZCTbSXNljwDL+72e4hrlu2Rk+SaZu+PMb1dvuX8gZHgGX93s9w8Ay/u9nuNfx5jert9y/kePMb1dvuX8gZHgGX93s9xFbVZTLdtg4S010ZuePMb1dvuX8mXtLKhmZCsrUklHTyu9gWdgfWrPwfubxzWzMuvDunOyMmpR08k0vHmN6u33L+QNMGZ48xvV2+5fyaSesU+0D6AAB4tsjTVKyb0jFatns5/a2d4RPoan/AGovi/SYFPKyJZWRK2XXyXYj5ZRKqiqyXDpNWl7ES7PxHl5Ci/Mjxk/YXdvJRePFLRJNJe4DNxqXkXKqL8pp6fktSNOUJ6rVSi/cy3sj/J1fn8mWdtYXR2eEVryZvyvYwNPZ+WsvHUvtx4SXtLRymFlTxL1ZHiuUo9qOopthfVGyt6xlyA9gAAR30wyKZVWa7suehIVNqSlDZ9soScZLTRp6PmgIvE2J2T+IeJsTsn8RheFZH3i342PCsj7xb8bA3fE2J2T+I+rZGLFSSU/KWnnGD4VkfeLfjZobGvtszXGds5LcfCUm+wCKzZGRHK6KC3oPip9WntNvExoYlKrh3t9rMLbDa2jZo3yXyKW9LtfvA7EHHb0u1+8b0u1+8DqsjDoyXrbWpPt5Mr+J8P0JfEznd6Xa/eFKSaak9VyeoHU4+Dj40t6qtKXa3qywUdkSusw1O6bnq3u69heAAACjtHAea69LFDc15rXXUpeIZ/eI/CXM/aawro19Fv6x3vO00PuFtOGZa641Si0tdWwKXiGf3iPwlPPwHhOGtinv68lppodOYv8AUPPH/wDL9gM3Ex3lZEaVLdcteOho+IZ/eI/CVdj/AOSq7n8mdKBieIZ/eI/CS4ux5Y+TC13KW69dN01gAAAAAAAAAAAAiusohp08q468t9olMX+oPOo7pfsBo9Pg+sx/eh0+D6zH96Oaqotv16KuU9Oei1JPAMv7vZ8IHQ9Pg+sx/eiaqVc4a1OLj/p5HJWVzqm4WRcZLqZ0GxP8evxMD5t36gvxr9zEw71jZULnFyUepdxt7d+oL8a/cxcKmORl11TbUZa6tc+QGr4+r9RL4h4+r9RL4iTxHi+nb71/A8R4vp2+9fwBDZtuudco9DJaprmYhvWbFxoVykp26pN81/BggdhT9DX+FHs8U/Q1/hR7AADkBHfTDIqddi1iwlVjU/Zrriu5IpZe16aNY06Wz9nJGJk5V2TPetm32LqQHU02wvrVlct6L5M5vav+Su718kaWwZz6CyEovcT1i9OHtM3av+Su718kBd2LXG7Gya5rWMtEzMyaJY18qp84vn2o1v6f+ju70WNq4XhVO/Bf3YcvauwDN2NDHnkvpeNi4wT5f/ToTjk5Qkmm1JPh7Dodm7RjlRVdjUbkviA0AAAObysHKllXSjRNxc5NPTnxOkAHK+L8v7vP3Dxfl/d5+46LOvlj4dlsNHKOmmvLmY/jzK9Gr3P+QKvi/L+7z9w8X5f3efuLXjzK9Gr3P+R48yvRq9z/AJAq+L8v7vP3Dxfl/d5+4tePMr0avc/5HjzK9Gr3P+QKvi/L+7z9w8X5f3efuLXjzK9Gr3P+R48yvRq9z/kCr4vy/u8/cPF+X93n7i148yvRq9z/AJNvGsldjV2S03pRTegGVsfFvpy5StqlCO41q17UbQAEV1lENOnlXHXlvtEfT4PrMf3ozv6g86jul+xl1UW369FXKenPRagdL0+D6zH96HT4PrMf3o57wDL+72fCRWVWUy3bIOEuejQHV0zpnFumUHHXjuaFXOqqx8aVtWLRJx56wXIh2B9Ts/7n7I05RU4uMlqmtGgOYqyl4TCdtVTrT4xVaS0Ohji4soqUaKWmtU9xHOZ2K8TJlW/N5xfajS2NncFjWvj9hv5AaXgeN93p+BGPtqVEJxopqrjJcZOMUu5Gtm5ccShzlxk+EY9rOXsnKyyU5vWUnq2BZ2XjvIzYJryYeVI6co7KxHi42s1/cnxfs9heAAAD5JqMXJ8ktWchZJzslN85Ns6Xal3Q4Fr14yW6vzOXA6XY9e5s+D9JuReKeyro3YNenOC3Wu4uAcztb/JXfl8kMDPlhKajWp7+nN9g2t/krvy+SPmDgTzVPcnGO5pz9oFvx9Z6iPxDx9Z6iPxHzxFd66v3MeIrvXV+5gffH1nqI/Ea2Jc8jGha1o5LXQyPEV3rq/czXxKXj41dUmm4rTVATAAAAAB8lJRi3JpJdbZBn2zow7LK3pKK4P8AM5m2+29622Sn3sDfv2vi1aqMnbLsjy95m37ZyLNVXpVH2cX7ynRjXZD0qrlL29XvNPH2G3xyLNP9MP5AyZTnbPWcpTk+tvVlvH2XlX8dzo49s+H6G9Rh0Y6/tVpP0nxfvJwM3H2Nj16O1u2Xt4I0YxjCKjGKjFckkfQAAAAx8zZN+Rl2WxnWoyfDVvX5GwAMDxFk+sq97/ghydmWYtW/bbVp1JN6v9DazdoVYkWm96zqgv3Odycm3Kt37Xq+pLkgIjRr2NkzhGTlXHVa6Sb1X6EmysOvVZF84LTjCLf6s2umq9bD4kBhPYt8fOtpXe3/AAFsa5vRXUPuk/4JdvTjN0bslLTe5PXsKux5KO0IuTSWj4t+wCbxFk+sq97/AIKOTj2YtzqsXFcdVyZ1XTVeth8SKudTj5lW67YKa82Wq4AYOLjPKs6ONkIy6lJviXPEWT6yr3v+DPshOmxxlwkuTT/VGtg7Y5V5X5TX7gQ+Isn1lXvf8G9FbsUuxCE4zipQkpRfJpn0AD5KUYRcpNKK5t9Rh7R2q7U6sZtQ659b7gPe1dpa72PRL2TkvkjKpqndZGutaylyR5hCVk1GCcpPgkjd2fXi4UW7L6umfCXlrh7ALmFiwxKFXHi+cpdrM3+oPPo7pfsanhmL94q+NGRty6q6VPRWRnonruvXTkBW2R/k6vz+TOksrjbXKE1rGS0aOa2XONe0KpTkoxWurb0XJnQ+GYv3ir40BzmdiSw73B8YvjGXaj3s/Pnh2aPyqpPyo/ujZyp4WVS67Mir2PfXBnP5OPPGs3J8VzjJcpLtA6qqyF1anXJSi+TR7OWw823DnrB6xfnRfJnQ4ubTlw1rl5S5xfNAWDxbKuNbdriodblyPZS2x/jbO9fNASdPg+sx/eh0+D6zH96OYrrlZNQhFyk+SRN4Bl/d7PhA6Hp8H1mP70e6rMac9KZ1OWn2GtTmLca6mKlbVKCfDVou7C+vS/7b+aA2rceqe9N0VTs04OUVxObvypTk10NNej5RrR1Rg7axOiu8IgvIn53sYGjhwxMrGhasenVritxcGT+B433en4EYOy83wS7SX0U/O9ntOhnbCup2SklBLXUDP2osbGxHu0VKyfCPkL82YVdcrbI1wWspPRE2dlSy8h2PhFcIrsRobExG5PJmuC4Q/kDXoqVNMK48orQ9gAAD5KShFylwSWrA5vbFm/tCa6opRLWwK/Lus7EomXdY7bZ2PnKTZr7Buju2UvhLXeXtA2DF/qHnj/8Al+xtGL/UPPH/APL9gM3EyHi5EblFScdeD7jQ8fWeoj8RnYuO8nIjTGSi5a8WaHiK711fuYH3x9Z6iPxDx9Z6iPxHzxFd66v3MeIrvXV+5gaOzs2WbCcpQUd1pcGXCls3CnhQsjOcZbzT4F0AAAAAAAAAYv8AUHnUd0v2Noxf6g86jul+wD+n/Ov7o/ubRz2yMunEdvTSa3tNNFr2mn44w/WS+FgZO2f8lZ3L5GpsT/Hr8TMfaV0MjMnZW9YtLThp1GxsT/Hr8TA+bd+oL8a/cwK5zrmpVtxkuTXM39u/UF+NfuZOyf8AJU97+TA8eGZnr7fex4Zmevt97OqAHKvLy2mndbo+fFlY7C/6Cz8L+Rx4HYU/Q1/hR7PFP0Nf4UepRUouMlqmtGBTytp4+NrHXpJ+jH92YuXtG/K1UpbsPQjyPOdiSxMh184vjF9qLOHsi2/Sd2tUOzrYFCqqds1CuLlJ9SRs4exow0nkvel6C5fmaGPjVY0N2qCj2vrZMB8jFRilFJJckjmdq/5K7vXyR05zG1f8jd3r5IDQ/p/6O7vRrmR/T/0d3ejXAx9rbO3t7IoXHnOK+ZjRk4yUotprimjsTJ2jslWN24ySl1w6n3AMDa8Z6V5T3ZdU+p95rJprVcUcdKMoScZJqS5pmnsaWVK3drn/AGY+cpcV+QG8AAKe1/8AGXfl80c3XorI73m6rU6Ta/8AjLvy+aOahHfnGPa9AOg6bZPZR8H+w6bZPZR8H+xV8Qz9fH4R4hn6+PwgWum2T2UfB/sOm2T2UfB/sVfEM/Xx+EeIZ+vj8IFrptk9lHwf7Hiy3ZfRT3VTvaPTSH+xB4hn6+Pwnmew5whKXTxei180DJOswPqFH4EcmdZgfUKPwICcAAYv9QedR3S/Yf0/51/dH9x/UHnUd0v2INkZdOI7emk1vaaaLXtA6E57bn19fgX7mn44w/WS+FmPtTIrycrpKm3HdS4rQDS2B9Ts/wC5+yNQy9gfU7P+5+yNG26umO9bOMF7WBBn4ccyhx5TjxizmZxnVY4yTjOL4+w2MvbS4xxY8fTl+yMeyyds3OcnKT5tger77cialbNyaWnE0dkYHSSWRavIi/JXazLlCUHpKLT014ov4W1bcZKFi6Stcl1ruA6IFfHzcfJS6Oxb3ovgywAAK+blRxMdzl5z4RXawMrbuRv3Roi+EOMu/wD9+ZlxhKUZSUW1Fat9gnOVk5Tk9ZSerZ0Gy8NV4T6WKbu4yT7OpAZOzsx4d+r1dcuEl+50sJxsgpwalF8U0c1n4M8O3rdcvNl+x5xM67EfkPWPXF8gPe1v8ld+XyRe/p7zcjvj+5l5d/hOTO7d3d7ThrrpwNLYE4xV6lJJvd01feBtAcwAAAAAAAABDl0vIxp0qW7vacdPaVsfZGNTo5J2y7ZcvcXwB8SUUkkkl1I+gAAAAAAAAADF2pnZdNrqSVcHylHi5LvNogy8WvLp6OfDjqmuaA5aMZ2z0inKT6lxbNrZ+yVW1bkpOXVDqXeX8bDpxY6VQ0fXJ8WycDkni5Gv0FvwMeC5HqLfgZ1oA5CdVlenSVyhry3lpqfIQlZLdhFyfYlqa39Q88f/AMv2Kuxf8jDufyAreC5HqLfgY8FyPUW/AzrQBlYuBDI2ZCu+EoTTeja0a4mXl4N2JLy46w6prkdSfGlJNSSafNMDl8CeSr4wxZtSl1dX5nURUlBKTTlpxaWhFTiUY85zqrUXLnoTAc9th5Sv3bpa1PjDTgv/AKUqKLMixQqi5Sf6HU5OPXlUuuxcHya5oUY9WNXuVR3V19rAr4Gz4YcdX5Vr5y7O457K+tXfjl8zriN0Ut6uqDfXrFAcgDr/AAej1Nfwox9u1wrlTuQjHVPXRadgGQC5sqMZ7RqjJJp68GvYzo/B6PU1/CgOQOpljV5WFXC2OvkrR9aehN4PR6mv4USJJLRcgOXzcC3Dl5S3oPlNEeLXbbkQjRqrNeDT009p1coxnFxkk0+aaIcfDpxpTlVHRz5+z2ASVRlCuMZzc5JcZaaalXbH+Ns7180XSltj/G2d6+aAxdk/5KnvfyZ05yuBbCjNrssekY66+43PHGH6yXwsCHb/ANVr/H+zKewvr0v+2/mj3tbOoyqIRpk21LV6rTqPGwvr0v8Atv5oDoDxdVC6qVdi1jJaM9Skoxbk0kutszsrbFNWsaf7s+1cgMbMxZ4l7rnxXOMu1HiWRbKiNMpt1xeqiesnKtyp71stexdSIt2Sipbr3XwT04AWcDDlmXaLhBedI6aEI1wjCC0jFaJHMYeddhy8h6xb4wfJm5i7Ux8hJOXRz7JfyBdAAAz9s5HRYjrT8q3h+XWXrJxrhKc2lGK1bOXzsqWXkSsfCPKK7EBBCErJqME3J8Eke6bZ490bIPSUWaWw8XeslkSXCPCPeNr7PcJSyKVrB8ZpdXtA1cTKry6VOD749aZmf1Dzx/8Ay/Yy6L7Mezfqk4v5k+dnPNjVvwUZQ1105PXQD1sf/JVdz+TOlOZ2TJR2jW5NJceL7jpU01wafcB9AAAAAAAAAAAAADF/qDzqO6X7G0Q34tGTu9NDe3eXFgc1i4duW5dEk93TXV6FjxNl9kPiN2jFoxt7oYbu9z4smA5zxNl9kPiNjZuPPGxFXZpvat8GWwBnbd+oL8a/cydk/wCSp738mdBl4sMuro7HJLXXySvj7Kox742wnY5R5atafIC+U9pZN2JTG2qMJLXSSkmXCO+mGRTKqeu7LnoBhz21kThKO5Wk1pqk/wCTOjFzkoxWrb0SOgWxcXtsf/kWMfAxseW9XWt70nxYFiEd2EY9i0PoAHmUIylGUopuPJtcj0AAOby78rGyrKvCLNE+HldXUdIUszZlWXcrJzlF6acOsDC8Py/vFnxEEpSnJyk22+bZvLYeP12Wv81/BNVsrEqlvdHvNek9QI9iUyrxHOS0dj1XcaIAAAAVsrCoy1/cj5XVJc0SY2PDGojVDkub7WSgAAAKe1/8Zd+XzRzUW4yUlzXE6zKoWTjzpk2lLTiu/UoR2JVGal0s3o9eSAzPGmb69/Cv4HjTN9e/hX8HS9HD0I+4dHD0I+4DmvGmb69/Cv4HjTN9e/hX8HS9HD0I+4dHD0I+4DmvGmb69/Cv4Etp5kotO5tPg/JR0vRw9CPuPk6oShKO6lqtOQHHnWYH1Cj8CKPiKj1tn6GlTWqaYVptqK01YHsAAYv9QedR3S/YzsXDty3Loknu6a6vQ6W/Foyd3pob27y4sUYtGNvdDDd3ufFgYXibL7IfEPE2X2Q+I6MAYbx83B2fNwnu6T1ko8eGi4mXOc7Jb05OT7W9Tr5JSi4taprRoqU7MxaeKr3n2z4gYONhZGS10db3fSfBG1h7Kqx9J2f3LF1vkvyNBLTgAIMrEqy4btsePVJc0YeXsq/HbcF0sO2K4+46MAcbxT7Ga2ybcy63dVrdUfO3uP5GpfhY+Rq7Kk36S4M942PXi0qutPdT1482BJJtRbjHeaXBa6anLZt192RJ3pxkuCj6J1RWy8GnLS6RaST4SXPTsAxdlYLybekmv7UHx/1PsOjPNdcaoKEIqMY8EkegPNlcLYOFkVKL5pmNlbFkm5Y0t5ehLn7zbAHI20W0vS2uUO9ER2bSa0ZDPExp8ZUVt9u6gOTTa5No+9JP05e86d7Nw3/yI+9nzxXheoXvYHM9JP05e8b8vSl7zpvFeF6hfEx4rwvUL4mBnbDpdls7patQ4R17f/fmbhHRRVjwcKobsW9dNSQAAAAAAAAAAAAAAAAAAAOd2xOcdoTUZyS0XJ+wo9LZ6yXvOucISerjFv2odFX6EfcByPS2esl7x0tnrJe867oq/Qj7h0VfoR9wHISlKXnSb72fItxeqbT9h2HRV+hH3Doq/Qj7gOR6Wz1kveOls9ZL3nXdFX6EfcOir9CPuA5HpbPWS946Wz1kvedd0VfoR9w6Kv0I+4DzR9Xr/CvkSBcAAAAAAADF/qDz6O6X7G0VczArzXB2Smt3XTdAw9kf5Or8/kzpihjbKpxr43QnY5R14NrTlp2F8AAAAAAFLbH+Ns7180XTxbVC+t12R3ovmgOTopnfdGqvTely1LnibL7IfEbVWBi02KyupRkuT1ZZA5zxNl9kPiLGJs7Mx5WTjKMJbjUWnrx1RtgDkrrrrZPprJSa6pPkfKaLb5btUJTfsXI6OWzcad8rpwcpSerTfAswhGuKjCKjFdSWgGVh7FjHSeS95+guX5mnOmqdXRSri4ct3TgSADDy9jThrLGe/H0XzRlThKEnGcXGS5prQ7Ejux6r46W1xmvagOcwbsvpY1Y9klq+T4pHTQTUUpPWWnF9pXxsGjFnOVUWnLteuhZAwNs35EruinBwqXGP+r2lLExp5V6rh+b7EdRfRXkVOu2OsX+h4xMWvEq3K1xfOT5sCSmqFFUaoLSMVoj3zAAy8zY8LW547VcvRfJ/wZF+FkY+vSVSS7UtUdWAOMPqenI66ePTZ59MJd8UQvZ2HLnRH8uAHMb8/Sl7x0k/Tl7zpvFeF6he9jxXheoXxMDmd+fpS95Z2fU8nMrhJtx5y49SN3xXheoXxMkow8fHm501qMmtNdWBOAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKe0szwOhOOnSSekUyHZ+1HlWKqdTU2uceQGkAeLLIVQc7JKMV1tgewVa9oYls9yFy3vamvmWgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM6W2caE5RcbNU9HwX8k+HnVZjmqlNbumu8gLQAAAAAAV8vNrw4xdqk97luoCwDN8d4vo2/Cv5NJPVagAAAAAAAAAR23VURUrZqCfDiRxz8Wc1CN0XKT0SXWBYAAAAAAAABFdk00OKtsUHLlqIZNFjShdXJvqUlqBKAAAAAAAAAZG3bbK3RuTlHXe13XpryA1wc9sm62e0K4ytnJaPg5N9R0IAAAAAAAM3P2o8Wx1Qqbmlzly/3A0gU9m5nhePrLTpIvSSXzLgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAp7Uv8HwptPyp+SvzAw9o5PhWXKafkR8mPcauxMbosZ3SXlWcvYjEx6nffCpc5PQ62MVCKjFaJLRAfTB29ObyYQfmKOqXt4m8VszDqzIJWaqUeUl1AcqdVs6c7MCqVnnNfuUqthVxmnZc5x7FHQ1YxUIqMVolwSQH0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACjtLOlhKvdgpb+vP2F4xP6gf9yhdibA+ePbfUw97Hj231MPezMqqldbGuHnSei1LnibM9GHxAT+PbfUw97Hj231MPeyDxNmejD4h4mzPRh8QGxs7LlmUSslFRalu6LuX8lspbKxrMXGlC1JSc9eD16kXQBXy82rEhrY9ZPlFc2SZF0ceids+UV7zlb7p5FsrLHrJ/oBet21kTf8AbjGtd2rI47XzE9XYpexxQwdmW5cd9vcr9JrXXuLduwtIa1Xay7JLmBJibZhZJQyIqtv7S5f7GqnqtTj7K5VTlCcWpRejTNjYuY5f8NY9WlrB/sBsAADkL/p7PxP5mr/T/n390f3Mq/6ez8T+Zq/0/wCff3R/cDaAAAAADI/qD6OnvZrmR/UH0dPewMM7KPmruONOyj5q7gPoAAAAAAAMvb6/4St/6/2Zj4L0zqP+5H5m1t5f8DH2WL5MxMR6ZdL/AOpH5gdafJSjCLlKSilzbZ9MnbeLZOCuhKTjHzoa8F7QL9GXRkTlGqak48yc5Ci6dFsbK3pKJ1OJkQyqI2w6+a7GBMAAMHb8tcquPZDX9SDZEd7aNfs1f6H3bE97aM16KS/Qm2DDXKsn6MNPewN4AAAR5M5V41s4vyowbXuOf8b5nrF8KA6QHN+N8z1i+FDxvmesXwoDpDF/qDzqO6X7FXxvmesXwogycu7K3emkpbvLhoBNsf8AyVfc/kdKcjRdPHtVlb0kuT01LXjfM9YvhQHSA5vxvmesXwoeN8z1i+FAdIDm/G+Z6xfCjX2XkWZOK7LXrLea100AumZtvG6THV8V5VfPuNM+SipwlGS1TWjA5jZuT4Llxk35EvJl3HUHIX1Oi+dUucXodHsu/wAIwoNvyoeS/wAgLgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABhbet3r66k+EY6vvZunLbRs6TPul/q093AC1sKrfy5WPlXH9X/6zfMzYNe7iTn1yn8jTAHi26qlJ22Rgny3noezJ/qD6Gn8TAv+HYv3iv4kTpprVHGHY1fRQ7kB6IrMqiqTjZdCMl1N6Epze2f8jPuXyA6Cq+q7XorIz057r10PU5xrjvTkoxXW3oc1gZvgUrJbu85R0S9pFkZV2TPetm32LqQG9Pa+HB6Kbl+FHqramJa9Fbuv/UtDm+is016OWnboeAOyTTWqeqZ9OawNoTxJqMm5UvnHs9qOkjJTipResWtU+0D6AeLbI1Vysm9IxWrYHvkVLdp4lT0dqb7IrUxc7aNmVJxi3Crqinz7ypCE7JbsIyk+xLUDoY7YxG9HKS9riW6ciq9a1WRn3M5eeJkQjvSosS7d1kddk6pqcJOMl1pgdgCjszP8LrcZ8LYrj7V2l4AD5JqMXJvRJatnO7Q2jZlScINxpXJel3gbNu0sSp6SuTfZHiRLbGG3o5SXtcTApptvlu1Qc37CxPZeZCO86W17GmBvLPxJLVZFf5vQ++HYv3iv4kco009HzCi3yTfcB1cczGlJRjfW23okpLiTnKYkJeF06xf0ker2nVgAAAMHb7/4utdkP3ZvHPbceufp2QS+YEWyI720qvZq/wBGdMc9sOOufr6MGzanmY1b0nfWn2bwE4IYZePY9IX1t9m8TAAABj7fu0VVC6/Kf7fuZOPU774VLnJpFnbE9/aM11RSS9x62JDe2gn6MW/2/cDoa4RrhGEFpGK0SPQAGNt7HWkMiK467sv2Mmi103Qsjzi9TpNqQ39n3LsWvuOXA7KMlKKkuKa1R9KuzZ9Js+l9kdPdwLQHIX/T2fifzNX+n/Pv7o/uZV/09n4n8zV/p/z7+6P7gbQBVz8yOHRvPjOXCMe0CWzJoqlu2XQjLscjys3Fb0WRW3+JHLWTlZOU5vWUnq2bGyNn7qWTcuP2Ivq9oGwZH9QfR097NcyP6g+jp72BhnZLhHj1I45cy5m7Ruy21ruV9UU/mBt3bTxKXo7VJ9keJ4htfDk9HOUe+Jzsa5yWsYSa9iPLTT0a0YHYV2QtjvVzjKPanqejk8bJtxbN+qWnaupnTYmTDKojbDhrwa7GBMAAM7bi/wCA7powcd6ZFT/1r5nQbaWuzpeySOeqelsH/qQHYHxpNaPimfQBzO0sN4mQ0vo5cYv9j7svM8FyEpP+3PhL2e03NoYqy8WUPtrjF+05Zpp6PmB2QKmy52zwodLGUZR4LXrXUyXLt6HEts9GL07wOYyrOlyrZ9UpNo19gV6UW2elJL3f/TCOo2XX0Wz6k+clvP8AMC2AAIcz6lf/ANuXyOSOtzPqV/8A25fI5IDaq2JXZVCfTSW9FPke/ENfr5fCaWN9Wq/AvkSAZPiGv18vhM/aOFHCnCMZuW8m3qjpjn9uz3s1RX2YJfmBVwMZZeSqnJxWjeqNTxDX6+XwlfYMNcqyfow097N4DJ8Q1+vl8I8Q1+vl8JrADkcitU5FlaeqhJrU3dhfUH+N/sYuf9ev/Gza2F9Qf43+wGiAAOf27VuZcbFysj+q/wDUe9g3bt9lT5Sjqu9Fnb1euLXPrjPT3mVs6zo8+mWv2tPfwA6kAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADkcdOW/OUu16nX2vSqb/0s44Dp9kx3dnVe3V/qXCvs5aYFH4EWABk/wBQfQ0/iZrGT/UH0NP4mBhHY1fRQ7kccdjV9FDuQHo5vbP+Rn3L5HSHN7Z/yM+5fICrRVO+6NUNN6T4anRYezqcWKe6p2dcmvkYmyf8lT3v5M6cAZu1NnwupldXFK2K14faRpADjDoNh39JjSqk+Nb4dzMO+HR5FkFyjJr9TQ2FPTMlHqlADfMLbmVvWrHi/Jjxl3m6cjfZ0t9lj+1JsD1iY8srIjVHhrzfYjp8fHqxq1CqO6uvtfeYuxr8fHds7rFGT0S17DV8Z4fr4+5gWjG21hQjDwmuKjx0ml8y/wCM8P18fcyvm52Jdh2wjdFyceC0fMDFw73j5VdvUnx7us6w4w67Flv4tMnzcE/0AqbaudeFurnZLdfcc6bu34t41clyUtH7jCi9JJ9jA6rCxo4uNGtLytNZPtZYPkZKUVJcU1qj6Bi7dxox3MiK0cnuy9vYUNn5Dx8uuSfkt7su41tuzSw4x65T4fqYVacrIxXNtIDsAAAAAA5vbL12lYuxJfodIV8vCpy46WR8rqkuaA5aMpR1UW1vLR6dZ66C3TXop6du6zp8bCoxY/24Le9J8ywBxpcw9o3Yskt5zr64N/LsNvNwKsuD4KNnVNfuczOEq5yhJaSi9GgOtouhkVRsresWSGFsLIcbp0N+TJby7/8A35G6Byu0Hrn3v/Wy5sBf8VY/9H7lLPWmdf8AjZe2B9YtX+j9wN0AAQ5i1w71/wBOXyOSOuy+GJc/+nL5HIgdJsV67PiuyTL5n7E/x6/EzQA5C/6ez8T+Zq/0/wCff3R/cyr/AKez8T+ZqbBkovIlJ6JJNt/mBr33Qx6ZW2PSK/U5fKyZ5V8rJ/kuxE20c15l2keFUfNXb7Txs/GWXlRrlJRjpq+19wFnZOz/AAifTWr+1F8F6TOgPkIRhBQgkopaJI+gDI/qD6OnvZrmR/UH0dPewMM3sDZMK4qzISnPmo9S/kwTso+au4AkktEtF7CDLw6sutxnFb32ZdaLAA5C2uVVsq5ryovRl/Yd7rynU35Ni/VHnbcFDPbX24p/t+xVw5uGZTLsmvmB1gAApbYWuzbPY18zmovSSftOm2stdm3fl80cwB2YPiesUz6AK0MHHhfK5Vpzk9dX1dxZAAy9u3bmPClc5vV9yNQ5jaWR4TmTknrGPkx7gK9NbuuhWucmkddFKMVFcElojB2HR0mTK18q1w72b4AAAQ5n1K//ALcvkckdbmfUr/8Aty+RyQHX431ar8C+RIR431ar8C+RIB8bUU23olxZyeVd4Rk2W+k+Hd1GztnMVVXg8H5c15XsRiUVSvujXDzpPQCTEyrMS3frffHqZ0mLlV5dW/W+PXHrRkbR2X0EOlo1lBLyl1r2lDGyLMa1WVvRrmupgdaCvh5leZVvQ4SXnR60WAOUz/r1/wCNm1sL6g/xv9jFz/r1/wCNm1sL6g/xv9gNEAAUtrx3tm2+zR/qc3CW7OMux6nUbSWuz7/wnKgdnzB5qetUH/pR6AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPNi1rmvYzjjszj7I7lk49jaA6fZz12fR+EslLZEt7ZtXs1X6l0AZP9QfQ0/iZrGT/AFB9DT+JgYR2NX0UO5HHHY1fRQ7kB6Ob2z/kZ9y+R0hze2f8jPuXyA8bJ/yVPe/kzpzmNk/5KnvfyZ04AA8W2RqqnZLlFasDls165t7/AOpL5lrYi/8A9BeyLKEpOc5SfNvVmtsCrW223sSivz/+AbUvNenYcadmcllVunJsrf2ZNIBTjXXpuquU0uehJ4uy/u8y3sK5QyJ1N/SLVd6N4DlvF2X93mPF2X93mdSAOW8XZf3eZ0mLB14tMJLRxgk/cSgCHKoWTjzqlw3lwfYzlrap02yrsWko8zrZzjXCU5PSMVq2czn5csy/f3UorhFdegFvZ21VRWqb9XFebJdXsL89rYcY6qxyfYoszfEuQ6oyUobzWri+DRGtj5jfmRXt3kBFnZk8y7fktIrhGPYWNj4krshXSX9uvjr2ssY+w9HrkWJr0Yfya9dcaoKEIqMVySA9AAAAAAATTAAAAc1tiCjtGen2kmdKcxtW1W7Qsa5R8n3AfNmS3doUv/VodQczsmtz2hVpyjrJnTAcxtWO7tG5drT/AEJ9hS0zZL0oP5o9beq3cmFnVOOn5oqbOt6HOqm+Wuj/AD4AdSAAK+0JbuBe/wDQ17+Byh0O3LdzCVevGyX6Lj/Bz6TbSXFsDptkR3dnVe3V/qXCOivoqK6/RikSAchf9PZ+J/MRtnGucIvSM9N726C/6ez8T+YppnfbGutaykB8hXOak4xbUVq9OpCqyVVkbIPSUXqjp8TDrxcfo0lJyXlvTzjn9oYrxMmUPsPjF+wDo8TIjlY8bY9fNdjJjnNk5ng2RuTf9uzg/Y+06MAZH9QfR097NcyP6g+jp72BhnZR81dxxp2UfNXcB9AAGBt5/wDGQX/TXzZn0cb60vSXzLG1Lldn2NcYx8lfkfNmVdLn1LqT3n+XEDqAABV2mtdnXfh/c5Y6LaWbjrGtpVilOS0SjxOdA6131U0RlbZGC3VzfMzsjbkVqseG8/Sly9xiylKb1lJyfa2T4+FkZP0db3fSfBAbOyMuzKhb0st6cZJ8up//AA0Shs7Z3gTlOVjlKS0aXIs5WTXi0uyx8FyXW2BW2tl+D47hF/3LOC9i62c2TZN88m6Vtj4vq7F2HnobOh6bcfR67u97QN/YsqvAlGt+WnrNdepoHJY99mNcrK3o1z9vsOmxMqGXSrIPj9qPYwJwABDmfUr/APty+RyR1uZ9Sv8A+3L5HJAdfjfVqvwL5FXaG0YYkXCOkrnyXZ3lbOysnHxKVVHdrlBf3Fz5foYvlTl1yk37wPtk5WTlObblJ6ts3dkYPQQ6axf3JLgvRRHs3Ze41dkLyucYdnea4Awdq7N6Ju+hf2/tRX2f9jeDSa0fFAclj32Y1qsrekl+p0uHl15dKnDg1wlHsZjbU2f4NPpal/ak/hZ82RVkSyVZT5MFwk3ya7AK2f8AXr/xs2thfUH+N/sYuf8AXr/xs2thfUH+N/sBogACttJ6bPv/AAnKnTbYlu7OsXpNL9TnK479kY+k0gOurWlUF2JHoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHL7Tr6PaFy7Xve/idQYm36dLKrlya3WBNsCzXGsr64y19/8A8NU57YlvR5rg+VkdPzOhAGT/AFB9DT+JmsZP9QfQ0/iYGEdjV9FDuRxx2NX0UO5Aejm9s/5GfcvkdIc3tn/Iz7l8gKuPdLHvjbHRuPadBjbVxr0t6Srn2Sf7mFh0LJyY0uW7vJ6P8hlYd2LLSyD3eqS5MDppZVEI70rq0vxIxdqbSWSuhp16Prb+0ZZ7rrnbNRrg5SfUkB5Scmklq3yR1Oz8bwXEjB+c+Mu8q7N2X4O1bfo7OpLlH/c0wBjbcxG2smC6tJ6fozZPkoqUXGS1T4NMDj4TlXNTi9JReqZ0GHtam6KjdJV2e3kynnbHnCTnjLeh6GvFfyZcoyjJxkmmupoDsFOMlqpJrtTILs3HoX9y2OvYnqzlD1GMpyUYxcm+pIDpsLaFeZKyMU4uPJPrXaWzF2Zs7IqvjfN9Gl9nrZtAUdsN+LrNO1a+85yEtycZaa6NPQ662uN1Uq5rWMlozlsqlY+RKtTjNRfNAdNTl0XwUq7IvXq14ol34+kvecaAOyUk+TR9OMJa8i6p612zj3MDrgZOzdqSumqcjTffmy7TWAAACntLM8Ex9Y/SS4R9ntMTD2hdizb134Sesot8/adHdTXfW67IqUWYeXse6luVOtsOz7SA1aNpYt6+kUJdk+BO76UtXbBLt3kclKLi2pJp9jR5A3s7a9cIOvGlvTfDeXJGFzep9jGU5KMU5N9SRq4OyJSkrMpbsVyh1vvAn2HiuuuWRNaOfCPcaoSSWi5ACntPGeThyUVrOHlROZOyMbaWypSm7sZa68ZQ/dAT7O2lXdVGu6ajbHhq35xdtyKqYb1lkYrv5nJyTi2pJprqZ5At7Qy3mZG/ppBcIol2RjO/LU2vIr8p9/UQ4mDdlyW5HSPXN8kdHi48MWlV18lzfawJgAByF/09n4n8zU/p9LpL3pxSXH3mXf8AT2fifzNX+n/Pv7o/uBtFTaWJ4XjNJf3I8Y/wWwBxumnA6HY+Z4RR0U3/AHK170Uds4nQ3dPBeRY+PsZRxr5Y98bYc4v3gdaZH9QfR097NSm2N9UbYPWMlqZf9QfR097Awzfw9sVTioZHkS9LqZk4FCyMyuqS8l8+4nzdl3YzcoJ2Vdq5rvA3lk0Naq6vTt3kZ+0NrVxrdeNLem+G8uSMIJNvRcWAN3YmK665ZE1o58I9xXwNkzskrMmO7Dmovm/4NxJJJJaJAfTm9p35PhVlNlknFPglwWnUdIUM3ZkczIjY57iS0louLA5xcS7jbKyb9G49HDtl/Bu4+Dj430da3vSfFlgCjjbJxqNHJdLPtly9xeS0WiIb8qnHWttkY+zr9xk5W2pS1jjR3V6UuYGnmZtWJDWb1k+UFzZzuVlWZdu/Y+6PUiGUpTk5Sk5SfNst4Oz7cuSfm1dcn+wHjBw55l26uEF50uw6VUVLH6DcXR6abooorx6lXVHSK/UkA5jaGDLDt4auuXmy/YjxMqzEuVkPzXajp76YZFUqrFrF/ocvl408W91z/J9qA6fHvhk0xtreqf6ewlOY2dmyw7uOrrl5y/c6aMlOKlF6prVNARZn1K//ALcvkckdbmfUr/8Aty+RyQHWVVxtwoQmlKMoJNPuI8TZ1GK96K3p+lLq7ifG+rVfgXyJAAAAAHyUlGLlJ6JLVsD5ZCNkHCcd6Mlo0K4RrgoQioxXJIh8PxH/AP0V/EPDsX7xX8QHOZ/16/8AGza2F9Qf43+xh5c42Zds4vWMptpm5sP6h/5v9gNEAAZW37NMeqvrlLX3f/TM2ZX0m0KV2Pe93En23b0mbuLlXHT8+ZNsCnWy258kt1AbYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABW2jj+E4dkEvKXlR70WQByFVkqrY2R5xaaOtrnG2uM48YyWqOc2rjeD5bcVpCzyo/ui/sPK3q5Y8nxjxj3Aaxkf1B9FT+JmhHNxZLVZFf5y0MTa+XDJujGp6wgnx7WBnHY18K49yOTx63dfXWvtSSOuAHN7Z/wAjPuXyOkOb2z/kZ9y+QHnZPDaVP5/JnTNJrR8Ucxsn/JU97+TOnAgeFiyerx69fwolhXCtaVwjBdkVoegAAAAAADzOqu1aWQjNf6lqegBXWDip6+D1/CiaFcK1pCEYrsitD0AAAAy9s5sqYqit6SmtZPsRmbOxVl5ShLzIrekTbci1nKT5SgtCPZOVDGytbOEJrdb7AN94eM0k6K2ly8lHnwDE+71+4nTUknFpp8mj6BWezsSS0ePD8uBjbVwYYkoTq13J6rRvkzoZyjCLlOSjFc22c7tXNjlWxjXxrhyfawKMJOFkZLnF6o7E5fZ2M8nLhHTyIvek/YdQAAAAAAeZ1V2LSyEZfiWpD4Di66+D1/CiwAPMKq6lpXCMF/pWh6AAAAAAAPFlFVv0lcJ/iWpHHCxovVY9ev4ScAEklogAAAAAAAAAAAAAAAAABFZi49r1nTXJvrcVqfa8emr6OqEX7I6EgAAAAAAAAAp7QwIZlWq0VqXky/ZnPwxL7LXVCqTnF6P2HWADJw9jQg1PJanL0Vy/3NVJRSSSSXUj6AAAAFXaGHHMoceU48YstADntn7LnfY5XxcK4vRp82+w6CMVCKjFJJcEkfQBDmfUr/8Aty+RyR2bSa0fI89FX6uPuA8431ar8C+RIEtOAAAAAHx4MADk8ynoMu2rqjLh3dRCdi4Rb1cU33BRS5JIDlaMLIvlpXVLTta0R0uJjrGxoVJ66c32smAA8W2RqqlZLzYrVnsyNuZW7XHHi+MuMu4DGssdtsrJc5PVnT7Ox/BsOEGvKa3pd7MPZOL4RlpyXkV+U/2R0oAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAVs7EjmY/Rt6ST1jLsZVjs+rBosujvWXRi9H7dOw0wBxvI+whOyW7CLk+xLU6+VcJcZQjLvR9jGMVpGKXcgMzZWzpY76a5aWNaKPomoAAOf2tRbPPnKFU5LRcVFvqOgAHObMouhtCqUqrIxTfFxa6mdGAAAAAAAAAAAAAAAAABVz8KOZTu67s48YyOdyMW7GlpbBrsfUzrA0mtGtUByNWRdT9FbOC7EybxlmaadPL3I6GeDizesqK/yjoeFs7EX/APPADm7Lrb3/AHLJzftepZxdl5GQ03F1w9KS/Y6Guimr6OqEe6OhIBBi4teJVuVrvb5snAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABRzNl05UnZrKFj+0uOv5F4AVsHEjiY6rT1k3rJ9rLIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH/9k=', '岡山　源輝', 'BBJ銀行', '日本支店', 1, '000001', 'Best Beer Japan', '12345678', 2, 32, 'invoice');
ALTER TABLE customize_dtb_invoice AUTO_INCREMENT = 2;

set foreign_key_checks = 1;
