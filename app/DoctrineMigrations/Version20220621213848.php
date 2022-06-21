<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220621213848 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql("UPDATE customize_mtb_beer_type set name = '350: ビール' WHERE id = 1");
        $this->addSql("UPDATE customize_mtb_beer_type set name = '583: 発泡酒(3)': 'その他発泡酒' WHERE id = 2");
        $this->addSql("UPDATE customize_mtb_beer_type set name = '582: 発泡酒(2)': '麦芽含有率50%未満25%以上' WHERE id = 3");
        $this->addSql("UPDATE customize_mtb_beer_type set name = '581: 発泡酒(1)': '麦芽含有率50%以上又はアルコール分10度以上のもの' WHERE id = 4");
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
