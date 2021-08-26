<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210826090543 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql("DELETE FROM `dtb_block_position`");

        $this->addSql("INSERT INTO `dtb_block_position` (
                `section`, `block_id`, `layout_id`, `block_row`, `discriminator_type`
            ) VALUES
            (3, 7, 1, 0, 'blockposition'),
            (3, 7, 2, 0, 'blockposition'),
            (3, 10, 1, 1, 'blockposition'),
            (3, 10, 2, 1, 'blockposition'),
            (7, 15, 1, 1, 'blockposition'),
            (7, 16, 1, 2, 'blockposition'),
            (7, 17, 1, 0, 'blockposition'),
            (10, 6, 1, 0, 'blockposition'),
            (10, 6, 2, 0, 'blockposition'),
            (11, 13, 1, 0, 'blockposition'),
            (11, 13, 2, 0, 'blockposition')"
        );
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
