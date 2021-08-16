<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210816053719 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $date = (new \DateTime())->format('Y-m-d H:i:s');

        // 容器（マスター）
        $beerContainerExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM customize_dtb_beer_container WHERE 1");
        if ($beerContainerExists == 0) {
            $this->addSql("INSERT INTO `customize_dtb_beer_container` (
                `id`, `name`, `sort_no`, `discriminator_type`
            ) VALUES ('1', '樽', '1', 'beercontainer'),
                    ('2', '瓶', '2', 'beercontainer'),
                    ('3', '缶', '3', 'beercontainer'),
                    ('4', 'その他の容器の容器', '4', 'beercontainer')"
            );
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
