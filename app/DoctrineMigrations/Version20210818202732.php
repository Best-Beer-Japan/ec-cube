<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210818202732 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $mixpackBeerTypeExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM customize_mtb_beer_type WHERE id = 7");
        if ($mixpackBeerTypeExists == 0) {
            $this->addSql("INSERT INTO `customize_mtb_beer_type` (
                    `id`, `name`, `sort_no`, `discriminator_type`
                ) VALUES ('7', 'ミックスパック', '7', 'beertype')"
            );
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
