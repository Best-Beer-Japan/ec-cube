<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240730022751 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $csvId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = ? AND field_name = ? AND reference_field_name = ?", [
            3,
            'ProductClass',
            'beer_container_capacity_other_ml',
        ]);

        if (false !== $csvId) {
            $this->addSql("UPDATE dtb_csv SET entity_name = ?, reference_field_name = 'capacity_ml' WHERE id = ?;",
                [
                    'Eccube\\\\Entity\\\\OrderItem',
                    $csvId
                ]);
        }

        $csvId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = ? AND field_name = ? AND reference_field_name = ?", [
            3,
            'ProductClass',
            'BeerContainerCapacity',
        ]);

        if (false !== $csvId) {
            $this->addSql("UPDATE dtb_csv SET disp_name = '容器タイプ' WHERE id = ?;",
                [
                    $csvId
                ]);
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
