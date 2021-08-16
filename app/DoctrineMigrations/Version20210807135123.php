<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210807135123 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $date = (new \DateTime())->format('Y-m-d H:i:s');

        // 商品CSV
        $csvExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 1 AND entity_name = 'Eccube\\\\Entity\\\\Product' AND field_name = 'BeerType' AND reference_field_name = 'name' AND disp_name = 'ビール種別'");
        if ($csvExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 1, NULL, 'Eccube\\\\Entity\\\\Product', 'BeerType', 'name', 'ビール種別', 1, 0, ?, ?, 'csv'
            )",
                [
                    $date,
                    $date
                ]);
        }

        //　受注CSV
        $csvExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 3 AND entity_name = 'Eccube\\\\Entity\\\\OrderItem'
                               AND field_name = 'Product' AND reference_field_name = 'BeerType' AND disp_name = 'ビール種別'");
        if ($csvExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 3, NULL, 'Eccube\\\\Entity\\\\OrderItem', 'Product', 'BeerType', 'ビール種別', 1, 0, ?, ?, 'csv'
            )",
                [
                    $date,
                    $date
                ]);
        }

        // 配送CSV
        $csvExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 4 AND entity_name = 'Eccube\\\\Entity\\\\OrderItem'
                               AND field_name = 'Product' AND reference_field_name = 'BeerType' AND disp_name = 'ビール種別'");
        if ($csvExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 4, NULL, 'Eccube\\\\Entity\\\\OrderItem', 'Product', 'BeerType', 'ビール種別', 1, 0, ?, ?, 'csv'
            )",
                [
                    $date,
                    $date
                ]);
        }

        $beerTypeExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM customize_mtb_beer_type WHERE 1");
        if ($beerTypeExists == 0) {
            $this->addSql("INSERT INTO customize_mtb_beer_type (
                id, name, sort_no, discriminator_type
            ) VALUES ('1', 'ビール', '1', 'beertype'),
                    ('2', '発泡酒 < 25%モルト', '2', 'beertype'),
                    ('3', '発泡酒 < 50%モルト', '3', 'beertype'),
                    ('4', '発泡酒 < 100%モルト', '4', 'beertype'),
                    ('5', 'その他の酒類', '5', 'beertype'),
                    ('6', 'その他', '6', 'beertype')");
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
