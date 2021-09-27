<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210927172527 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $date = (new \DateTime())->format('Y-m-d H:i:s');

        //　受注CSV
        $csvExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 3 AND entity_name = 'Eccube\\\\Entity\\\\Order'
                               AND field_name = 'customize_order_no_section' AND reference_field_name is null AND disp_name = 'BBJ注文番号'");
        if ($csvExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (
                id, csv_type_id, creator_id, entity_name, field_name, reference_field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 3, NULL, 'Eccube\\\\Entity\\\\Order', 'customize_order_no_section', '', 'BBJ注文番号', 1, 0, ?, ?, 'csv'
            )",
                [
                    $date,
                    $date,
                ]);
        }

    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
