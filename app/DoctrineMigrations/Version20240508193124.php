<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240508193124 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 330 WHERE id = 1;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 330 WHERE id = 2;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 350 WHERE id = 3;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 355 WHERE id = 4;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 360 WHERE id = 5;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 370 WHERE id = 6;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 500 WHERE id = 7;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 700 WHERE id = 8;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 750 WHERE id = 9;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 1000 WHERE id = 10;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 1000 WHERE id = 11;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 10000 WHERE id = 12;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 13500 WHERE id = 13;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 15000 WHERE id = 14;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 20000 WHERE id = 15;");
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = 500 WHERE id = 20;");
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql("UPDATE customize_dtb_beer_container_capacity SET capacity_ml = null;");
    }
}
