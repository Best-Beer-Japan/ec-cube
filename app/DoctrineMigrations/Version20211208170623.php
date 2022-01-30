<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211208170623 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        // 請求CSV
        $csvTypeExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM mtb_csv_type WHERE name = '請求CSV'");
        if ($csvTypeExists == 0) {
            $CsvTypeId = $this->connection->fetchColumn('SELECT MAX(id) + 1 FROM mtb_csv_type');
            $sortNo = $this->connection->fetchColumn('SELECT MAX(sort_no) + 1 FROM mtb_csv_type');

            $this->addSql('INSERT INTO mtb_csv_type (id, name, sort_no, discriminator_type) VALUES ('.$CsvTypeId.", '請求CSV', ".$sortNo.", 'csvtype')");

            $sortNo = 0;
            $csvData = [
                [null, 'Eccube\\\\Entity\\\\Order', 'id', null, '注文ID', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'order_no', null, '注文番号', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'Customer', 'id', '会員ID', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'name01', null, 'お名前(姓)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'name02', null, 'お名前(名)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'kana01', null, 'お名前(セイ)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'kana02', null, 'お名前(メイ)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'company_name', null, '会社名', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'postal_code', null, '郵便番号', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'Pref', 'id', '都道府県(ID)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'Pref', 'name', '都道府県(名称)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'addr01', null, '住所1', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'addr02', null, '住所2', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'email', null, 'メールアドレス', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'phone_number', null, 'TEL', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'Sex', 'id', '性別(ID)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'Sex', 'name', '性別(名称)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'Job', 'id', '職業(ID)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'Job', 'name', '職業(名称)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'birth', null, '誕生日', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'note', null, 'ショップ用メモ欄', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'subtotal', null, '小計', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'discount', null, '値引き', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'delivery_fee_total', null, '送料', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'tax', null, '税金', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'total', null, '合計', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'payment_total', null, '支払合計', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'OrderStatus', 'id', '対応状況(ID)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'OrderStatus', 'name', '対応状況(名称)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'Payment', 'id', '支払方法(ID)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'payment_method', null, '支払方法(名称)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'order_date', null, '受注日', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Order', 'payment_date', null, '入金日', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'id', null, '注文詳細ID', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'Product', 'id', '商品ID', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'ProductClass', 'id', '商品規格ID', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'product_name', null, '商品名', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'product_code', null, '商品コード', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'class_name1', null, '規格名1', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'class_name2', null, '規格名2', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'class_category_name1', null, '規格分類名1', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'class_category_name2', null, '規格分類名2', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'price', null, '価格', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'quantity', null, '個数', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'tax_rate', null, '税率', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'tax_rule', null, '税率ルール(ID)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'OrderItemType', 'id', '明細区分(ID)', 1, '2018-07-23 09:00:00', '2018-07-23 09:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\OrderItem', 'OrderItemType', 'name', '明細区分(名称)', 1, '2018-07-23 09:00:00', '2018-07-23 09:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'id', null, '出荷ID', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'name01', null, '配送先_お名前(姓)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'name02', null, '配送先_お名前(名)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'kana01', null, '配送先_お名前(セイ)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'kana02', null, '配送先_お名前(メイ)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'company_name', null, '配送先_会社名', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'postal_code', null, '配送先_郵便番号', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'Pref', 'id', '配送先_都道府県(ID)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'Pref', 'name', '配送先_都道府県(名称)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'addr01', null, '配送先_住所1', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'addr02', null, '配送先_住所2', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'phone_number', null, '配送先_TEL', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'Delivery', 'id', '配送業者(ID)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'shipping_delivery_name', null, '配送業者(名称)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'DeliveryTime', 'id', 'お届け時間ID', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'shipping_delivery_time', null, 'お届け時間(名称)', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'shipping_delivery_date', null, 'お届け希望日', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'DeliveryFee', 'id', '送料ID', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'shipping_delivery_fee', null, '送料', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'shipping_date', null, '発送日', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'tracking_number', null, '出荷伝票番号', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'note', null, '配達用メモ', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
                [null, 'Eccube\\\\Entity\\\\Shipping', 'mail_send_date', null, '出荷メール送信日', 1, '2021-12-09 00:00:00', '2021-12-09 00:00:00', 'csv'],
            ];

            foreach ($csvData as $csv) {
                $this->addSql(
                    "INSERT INTO dtb_csv (csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'csv')",
                    [$CsvTypeId, $csv[0], $csv[1], $csv[2], $csv[3], $csv[4], $sortNo++, $csv[5], $csv[6], $csv[7]]
                );
            }
        }
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
    }
}
