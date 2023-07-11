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
        $csvFieldTaxExist = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 3 and field_name = 'tax'");
        if ($csvFieldTaxExist > 0) {
            $this->addSql("DELETE FROM dtb_csv WHERE csv_type_id = 3 and field_name = 'tax';");
        }

        $csvFieldTaxExist = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 4 and field_name = 'tax'");
        if ($csvFieldTaxExist > 0) {
            $this->addSql("DELETE FROM dtb_csv WHERE csv_type_id = 4 and field_name = 'tax';");
        }

        $csvFieldTaxExist = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 9 and field_name = 'tax'");
        if ($csvFieldTaxExist > 0) {
            $this->addSql("DELETE FROM dtb_csv WHERE csv_type_id = 9 and field_name = 'tax';");
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $date = (new \DateTime())->format('Y-m-d H:i:s');

        $sort_no = $this->connection->fetchColumn("SELECT max(sort_no) FROM dtb_csv WHERE csv_type_id = 3");
        $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 3, NULL, 'Eccube\\\\Entity\\\\Order', 'tax', NULL, '税金', ?, 1, ?, ?, 'csv'
            )",
            [
                $sort_no + 1,
                $date,
                $date
            ]);

        $sort_no = $this->connection->fetchColumn("SELECT max(sort_no) FROM dtb_csv WHERE csv_type_id = 4");
        $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 4, NULL, 'Eccube\\\\Entity\\\\Order', 'tax', NULL, '税金', ?, 1, ?, ?, 'csv'
            )",
            [
                $sort_no + 1,
                $date,
                $date
            ]);

        $sort_no = $this->connection->fetchColumn("SELECT max(sort_no) FROM dtb_csv WHERE csv_type_id = 9");
        $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 9, NULL, 'Eccube\\\\Entity\\\\Order', 'tax', NULL, '税金', ?, 1, ?, ?, 'csv'
            )",
            [
                $sort_no + 1,
                $date,
                $date
            ]);
    }
}
