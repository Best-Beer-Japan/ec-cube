<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220406071532 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql("INSERT INTO customize_dtb_beer_container (id, name, sort_no, discriminator_type) VALUES
            (1, '樽', 1, 'beercontainer'),
            (2, '瓶', 2, 'beercontainer'),
            (3, '缶', 3, 'beercontainer'),
            (4, 'その他の容器', 4, 'beercontainer');");
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql("DELETE FROM customize_dtb_beer_container WHERE id in (1,2,3,4);");
    }
}
