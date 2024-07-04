<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240704033205 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $csvTypeId = $this->connection->fetchColumn("SELECT id FROM mtb_csv_type WHERE name = ?", ['ゆうパックプリントRCSV（ShippingSlip）']);
        $csvId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = ? AND entity_name = ? AND field_name = ? AND reference_field_name is null AND disp_name = ?", [
            $csvTypeId,
            'Eccube\\\\Entity\\\\Order',
            'email',
            'お届け先 メールアドレス１',
            ]);

        if (false !== $csvId) {
            $csvIds = $this->connection->fetchAll("SELECT id FROM dtb_csv WHERE id > ? AND csv_type_id = ? AND entity_name = ? AND field_name = ? AND reference_field_name is null AND disp_name = ?", [
                $csvId,
                $csvTypeId,
                'Eccube\\\\Entity\\\\Order',
                'email',
                'お届け先 メールアドレス１',
            ]);

            if (false != $csvIds){
                $this->deleteCsv($csvIds);
            }
        }

        /********************/

        $csvTypeId = $this->connection->fetchColumn("SELECT id FROM mtb_csv_type WHERE name = ?", ['ヤマトB2クラウドCSV（ShippingSlip）']);
        $csvId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = ? AND entity_name = ? AND field_name = ? AND reference_field_name is null AND disp_name = ?", [
            $csvTypeId,
            'Plugin\\\\ShippingSlip\\\\Entity\\\\YamatoB2CloudConfig',
            'billing_classification_code',
            'ご請求先分類コード',
        ]);

        if (false !== $csvId) {
            $csvIds = $this->connection->fetchAll("SELECT id FROM dtb_csv WHERE id > ? AND csv_type_id = ? AND entity_name = ? AND field_name = ? AND reference_field_name is null AND disp_name = ?", [
                $csvId,
                $csvTypeId,
                'Plugin\\\\ShippingSlip\\\\Entity\\\\YamatoB2CloudConfig',
                'billing_classification_code',
                'ご請求先分類コード',
            ]);

            if (false != $csvIds){
                $this->deleteCsv($csvIds);
            }
        }

        /********************/

        $csvTypeId = $this->connection->fetchColumn("SELECT id FROM mtb_csv_type WHERE name = ?", ['ヤマトB2クラウドCSV（ShippingSlip）']);
        $csvId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = ? AND entity_name = ? AND field_name = ? AND reference_field_name is null AND disp_name = ?", [
            $csvTypeId,
            'Plugin\\\\ShippingSlip\\\\Entity\\\\YamatoB2CloudConfig',
            'fare_control_number',
            '運賃管理番号',
        ]);

        if (false !== $csvId) {
            $csvIds = $this->connection->fetchAll("SELECT id FROM dtb_csv WHERE id > ? AND csv_type_id = ? AND entity_name = ? AND field_name = ? AND reference_field_name is null AND disp_name = ?", [
                $csvId,
                $csvTypeId,
                'Plugin\\\\ShippingSlip\\\\Entity\\\\YamatoB2CloudConfig',
                'fare_control_number',
                '運賃管理番号',
            ]);

            if (false != $csvIds){
                $this->deleteCsv($csvIds);
            }
        }

        /********************/

        $csvTypeId = $this->connection->fetchColumn("SELECT id FROM mtb_csv_type WHERE name = ?", ['e飛伝ⅡCSV（ShippingSlip）']);
        $csvId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = ? AND entity_name = ? AND field_name = ? AND reference_field_name is null AND disp_name = ?", [
            $csvTypeId,
            'Plugin\\\\ShippingSlip\\\\Entity\\\\EhidenConfig',
            'packing_code',
            '荷姿コード',
        ]);

        if (false !== $csvId) {
            $csvIds = $this->connection->fetchAll("SELECT id FROM dtb_csv WHERE id > ? AND csv_type_id = ? AND entity_name = ? AND field_name = ? AND reference_field_name is null AND disp_name = ?", [
                $csvId,
                $csvTypeId,
                'Plugin\\\\ShippingSlip\\\\Entity\\\\EhidenConfig',
                'packing_code',
                '荷姿コード',
            ]);

            if (false != $csvIds){
                $this->deleteCsv($csvIds);
            }
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }

    public function deleteCsv($csvIds)
    {
        foreach ($csvIds as $id) {
            $this->addSql("DELETE FROM dtb_csv WHERE id = ?;",
                [
                    $id['id']
                ]);
        }
    }
}
