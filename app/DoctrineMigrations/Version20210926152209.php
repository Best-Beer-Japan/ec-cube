<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210926152209 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $date = (new \DateTime())->format('Y-m-d H:i:s');

        //　受注CSV
        $csvExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 3 AND entity_name = 'Eccube\\\\Entity\\\\Product'
                               AND field_name = 'ProductBeerContainers' AND reference_field_name = 'beer_container_id' AND disp_name = '容器'");
        if ($csvExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 3, NULL, 'Eccube\\\\Entity\\\\Product', 'ProductBeerContainers', 'beer_container_id', '容器', 1, 0, ?, ?, 'csv'
            )",
                [
                    $date,
                    $date,
                ]);
        }
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
