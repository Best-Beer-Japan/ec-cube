<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210807132657 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $date = (new \DateTime())->format('Y-m-d H:i:s');

        // 商品CSV
        $csvExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 1 AND entity_name = 'Eccube\\\\Entity\\\\Product' AND field_name = 'alcohol_percentage' AND reference_field_name = NULL AND disp_name = 'アルコール度数'");
        if ($csvExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 1, NULL, 'Eccube\\\\Entity\\\\Product', 'alcohol_percentage', NULL, 'アルコール度数', 1, 0, ?, ?, 'csv'
            )",
                [
                    $date,
                    $date
                ]);
        }

        //　受注CSV
        $csvExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 3 AND entity_name = 'Eccube\\\\Entity\\\\OrderItem'
                               AND field_name = 'Product' AND reference_field_name = 'alcohol_percentage' AND disp_name = 'アルコール度数'");
        if ($csvExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 3, NULL, 'Eccube\\\\Entity\\\\OrderItem', 'Product', 'alcohol_percentage', 'アルコール度数', 1, 0, ?, ?, 'csv'
            )",
                [
                    $date,
                    $date
                ]);
        }

        // 配送CSV
        $csvExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 4 AND entity_name = 'Eccube\\\\Entity\\\\OrderItem'
                               AND field_name = 'Product' AND reference_field_name = 'alcohol_percentage' AND disp_name = 'アルコール度数'");
        if ($csvExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 4, NULL, 'Eccube\\\\Entity\\\\OrderItem', 'Product', 'alcohol_percentage', 'アルコール度数', 1, 0, ?, ?, 'csv'
            )",
                [
                    $date,
                    $date
                ]);
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
