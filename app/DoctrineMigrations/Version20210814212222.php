<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210814212222 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $date = (new \DateTime())->format('Y-m-d H:i:s');

        $blockExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_block WHERE file_name = 'corpse_tag_style'");
        if ($blockExists == 0) {
            $this->addSql("INSERT INTO dtb_block (
                id, device_type_id, block_name, file_name, use_controller, deletable, create_date, update_date, discriminator_type
            ) VALUES (
                NULL, 10, 'スタイル一覧', 'corpse_tag_style', 1, 0, ?, ?, 'block'
            )",
                [
                    $date,
                    $date
                ]);
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
