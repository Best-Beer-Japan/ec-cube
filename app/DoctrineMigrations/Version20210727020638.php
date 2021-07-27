<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210727020638 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $this->addSql("INSERT INTO customize_mtb_beer_style (id, name, sort_no, discriminator_type) VALUES
            ('1', 'Lager / Pilsner', '1', 'beerstyle'),
            ('2', 'White Ale/Weizen', '2', 'beerstyle'),
            ('3', 'Ale Beer', '3', 'beerstyle'),
            ('4', 'IPA', '4', 'beerstyle'),
            ('5', 'Black Beer', '5', 'beerstyle'),
            ('6', 'Fruit & Herb/Flavor Beer', '6', 'beerstyle'),
            ('7', 'Sour / Gose', '7', 'beerstyle'),
            ('8', 'Special Beer', '8', 'beerstyle'),
            ('9', 'その他', '9', 'beerstyle');");
    }

    public function down(Schema $schema) : void
    {
        $this->addSql("DELETE FROM customize_mtb_beer_style;");
    }
}
