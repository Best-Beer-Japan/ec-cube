<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230704223318 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $csvTypeId = $this->connection->fetchColumn("SELECT id FROM mtb_csv_type WHERE name = '受注CSV'");
        $csvFieldTaxExist = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = ? and field_name = 'tax'", [$csvTypeId]);
        if ($csvFieldTaxExist > 0 && false !== $csvTypeId) {
            $this->addSql("DELETE FROM dtb_csv WHERE csv_type_id = ? and field_name = 'tax';", [$csvTypeId]);
        }

        $csvTypeId = $this->connection->fetchColumn("SELECT id FROM mtb_csv_type WHERE name = '配送CSV'");
        $csvFieldTaxExist = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = ? and field_name = 'tax'", [$csvTypeId]);
        if ($csvFieldTaxExist > 0 && false !== $csvTypeId) {
            $this->addSql("DELETE FROM dtb_csv WHERE csv_type_id = ? and field_name = 'tax';", [$csvTypeId]);
        }

        $csvTypeId = $this->connection->fetchColumn("SELECT id FROM mtb_csv_type WHERE name = '請求CSV'");
        $csvFieldTaxExist = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = ? and field_name = 'tax'", [$csvTypeId]);
        if ($csvFieldTaxExist > 0 && false !== $csvTypeId) {
            $this->addSql("DELETE FROM dtb_csv WHERE csv_type_id = ? and field_name = 'tax';", [$csvTypeId]);
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $date = (new \DateTime())->format('Y-m-d H:i:s');

        $csvTypeId = $this->connection->fetchColumn("SELECT id FROM mtb_csv_type WHERE name = '受注CSV'");
        if (false !== $csvTypeId) {
            $sort_no = $this->connection->fetchColumn("SELECT max(sort_no) FROM dtb_csv WHERE csv_type_id = ?", [$csvTypeId]);
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, ?, NULL, 'Eccube\\\\Entity\\\\Order', 'tax', NULL, '税金', ?, 1, ?, ?, 'csv'
            )",
                [
                    $csvTypeId,
                    $sort_no + 1,
                    $date,
                    $date
                ]);
        }

        $csvTypeId = $this->connection->fetchColumn("SELECT id FROM mtb_csv_type WHERE name = '配送CSV'");
        if (false !== $csvTypeId) {
            $sort_no = $this->connection->fetchColumn("SELECT max(sort_no) FROM dtb_csv WHERE csv_type_id = ?", [$csvTypeId]);
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, ?, NULL, 'Eccube\\\\Entity\\\\Order', 'tax', NULL, '税金', ?, 1, ?, ?, 'csv'
            )",
                [
                    $csvTypeId,
                    $sort_no + 1,
                    $date,
                    $date
                ]);
        }

        $csvTypeId = $this->connection->fetchColumn("SELECT id FROM mtb_csv_type WHERE name = '請求CSV'");
        if (false !== $csvTypeId) {
            $sort_no = $this->connection->fetchColumn("SELECT max(sort_no) FROM dtb_csv WHERE csv_type_id = ?", [$csvTypeId]);
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, ?, NULL, 'Eccube\\\\Entity\\\\Order', 'tax', NULL, '税金', ?, 1, ?, ?, 'csv'
            )",
                [
                    $csvTypeId,
                    $sort_no + 1,
                    $date,
                    $date
                ]);
        }
    }
}
