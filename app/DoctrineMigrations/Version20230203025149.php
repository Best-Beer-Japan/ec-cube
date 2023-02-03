<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230203025149 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $beerContainerCapacityExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM customize_dtb_beer_container_capacity WHERE name = '缶500ml'");
        if ($beerContainerCapacityExists == 0) {
            $this->addSql("INSERT INTO customize_dtb_beer_container_capacity (
                id, name, sort_no, beer_container_id, discriminator_type
            ) VALUES ('20', '缶500ml', '8', '3', 'beercontainercapacity');");

            $this->addSql("UPDATE customize_dtb_beer_container_capacity SET sort_no = sort_no + 1 WHERE id BETWEEN 8 AND 19;");
        }

    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET sort_no = sort_no - 1 WHERE id BETWEEN 8 AND 19;");
        $this->addSql("DELETE FROM customize_dtb_beer_container_capacity WHERE id = 20;");
    }
}
