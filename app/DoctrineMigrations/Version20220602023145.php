<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220602023145 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs

        $date = (new \DateTime())->format('Y-m-d H:i:s');

        $this->addSql("INSERT INTO dtb_csv (csv_type_id, entity_name, field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type) VALUES
            (2, 'Eccube\\\\Entity\\\\Customer', 'customize_store_name', '店舗名', 1, 0, ?, ?, 'csv')",
            [
                $date,
                $date
            ]);

        $this->addSql("INSERT INTO dtb_csv (csv_type_id, entity_name, field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type) VALUES
            (2, 'Eccube\\\\Entity\\\\Customer', 'customize_account_name', '振込名義', 1, 0, ?, ?, 'csv');",
            [
                $date,
                $date
            ]);

    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql("DELETE FROM dtb_csv WHERE csv_type_id = 2 AND field_name in ('customize_store_name', 'customize_account_name');");
    }
}
