<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230119183222 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $beerContainerCapacityExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM customize_dtb_beer_container_capacity WHERE 1");
        if ($beerContainerCapacityExists == 0) {
            $this->addSql("INSERT INTO customize_dtb_beer_container_capacity (
                id, name, sort_no, beer_container_id, discriminator_type
            ) VALUES ('1', '瓶330ml', '1', '2', 'beercontainercapacity'),
                    ('2', '缶330ml', '2', '3', 'beercontainercapacity'),
                    ('3', '缶350ml', '3', '3', 'beercontainercapacity'),
                    ('4', '缶355ml', '4', '3', 'beercontainercapacity'),
                    ('5', '缶360ml', '5', '3', 'beercontainercapacity'),
                    ('6', '缶370ml', '6', '3', 'beercontainercapacity'),
                    ('7', '瓶500ml', '7', '2', 'beercontainercapacity'),
                    ('8', '瓶700ml', '8', '2', 'beercontainercapacity'),
                    ('9', '瓶750ml', '9', '2', 'beercontainercapacity'),
                    ('10', '缶1000ml', '10', '3', 'beercontainercapacity'),
                    ('11', '瓶1000ml', '11', '2', 'beercontainercapacity'),
                    ('12', '樽10L', '12', '1', 'beercontainercapacity'),
                    ('13', '樽13.5L', '13', '1', 'beercontainercapacity'),
                    ('14', '樽15L', '14', '1', 'beercontainercapacity'),
                    ('15', '樽20L', '15', '1', 'beercontainercapacity'),
                    ('16', 'その他容量の樽', '16', '1', 'beercontainercapacity'),
                    ('17', 'その他容量の瓶', '17', '2', 'beercontainercapacity'),
                    ('18', 'その他容量の缶', '18', '3', 'beercontainercapacity'),
                    ('19', '樽・瓶・缶以外', '19', '4', 'beercontainercapacity');");
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql("DELETE FROM customize_dtb_beer_container_capacity WHERE id in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19);");
    }
}
