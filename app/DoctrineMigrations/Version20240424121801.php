<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240424121801 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $maxSortNo = $this->connection->fetchColumn('SELECT MAX(sort_no) + 1 FROM dtb_csv WHERE csv_type_id = 3;');

        $csvOrderCustomerGroupExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 3 and field_name = 'ProductClass' and reference_field_name = 'BeerContainerCapacity'");
        if ($csvOrderCustomerGroupExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (csv_type_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type) VALUES
            (3, 'Eccube\\\\Entity\\\\OrderItem', 'ProductClass', 'BeerContainerCapacity', '容器容量', $maxSortNo, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'csv')");
        }
    }

    public function down(Schema $schema) : void
    {
        $deleteId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = 3 and field_name = 'ProductClass' and reference_field_name = 'BeerContainerCapacity'");
        $this->addSql("DELETE FROM dtb_csv WHERE id = ?;",
            [
                $deleteId
            ]);
    }
}
