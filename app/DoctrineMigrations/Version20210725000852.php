<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210725000852 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql("INSERT INTO dtb_csv (id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type) VALUES
            (NULL, '1', '1', 'Eccube\\\\\\\\Entity\\\\\\\\Product', 'BeerStyle', 'name', 'ビアスタイル', '1', '0', '2021-04-09 09:00:00', '2021-04-09 05:51:29', 'csv'),
            (NULL, '3', '1', 'Eccube\\\\\\\\Entity\\\\\\\\OrderItem', 'Product', 'BeerStyle', 'ビアスタイル', '1', '0', '2021-04-09 09:00:00', '2021-04-09 05:51:29', 'csv'),
            (NULL, '4', '1', 'Eccube\\\\\\\\Entity\\\\\\\\OrderItem', 'Product', 'BeerStyle', 'ビアスタイル', '1', '0', '2021-04-09 09:00:00', '2021-04-09 05:51:29', 'csv');");
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql("DELETE FROM dtb_csv WHERE field_name = 'BeerStyle' OR reference_field_name = 'BeerStyle'");
    }
}
