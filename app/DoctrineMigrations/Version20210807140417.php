<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210807140417 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $date = (new \DateTime())->format('Y-m-d H:i:s');

        // 商品CSV
        $csvExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 1 AND entity_name = 'Eccube\\\\Entity\\\\Product' AND field_name = 'BeerStyle' AND reference_field_name = 'name' AND disp_name = 'ビアスタイル'");
        if ($csvExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 1, NULL, 'Eccube\\\\Entity\\\\Product', 'BeerStyle', 'name', 'ビアスタイル', 1, 0, ?, ?, 'csv'
            )",
                [
                    $date,
                    $date
                ]);
        }

        //　受注CSV
        $csvExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 3 AND entity_name = 'Eccube\\\\Entity\\\\OrderItem'
                               AND field_name = 'Product' AND reference_field_name = 'BeerStyle' AND disp_name = 'ビアスタイル'");
        if ($csvExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 3, NULL, 'Eccube\\\\Entity\\\\OrderItem', 'Product', 'BeerStyle', 'ビアスタイル', 1, 0, ?, ?, 'csv'
            )",
                [
                    $date,
                    $date
                ]);
        }

        // 配送CSV
        $csvExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 4 AND entity_name = 'Eccube\\\\Entity\\\\OrderItem'
                               AND field_name = 'Product' AND reference_field_name = 'BeerStyle' AND disp_name = 'ビアスタイル'");
        if ($csvExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 4, NULL, 'Eccube\\\\Entity\\\\OrderItem', 'Product', 'BeerStyle', 'ビアスタイル', 1, 0, ?, ?, 'csv'
            )",
                [
                    $date,
                    $date
                ]);
        }

        // ビアスタイル（マスター）
        $beerTypeExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM customize_mtb_beer_style WHERE 1");
        if ($beerTypeExists == 0) {
            $this->addSql("INSERT INTO customize_mtb_beer_style (
                id, name, sort_no, discriminator_type
            ) VALUES ('1', 'ラガー / ピルスナー', '1', 'beerstyle'),
                    ('2', 'ホワイトエール / ヴァイツェン', '2', 'beerstyle'),
                    ('3', 'エール系', '3', 'beerstyle'),
                    ('4', 'IPA', '4', 'beerstyle'),
                    ('5', '黒ビール系', '5', 'beerstyle'),
                    ('6', 'フルーツビール', '6', 'beerstyle'),
                    ('7', 'サワー / ゴーゼ', '7', 'beerstyle'),
                    ('8', 'その他スタイル', '8', 'beerstyle'),
                    ('9', 'ビール以外', '9', 'beerstyle')"
            );
        }

    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
