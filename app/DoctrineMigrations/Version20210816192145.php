<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210816192145 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $tagExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_tag WHERE 1");
        if ($tagExists == 0) {
            $this->addSql("INSERT INTO `dtb_tag` (
                `id`, `name`, `sort_no`, `discriminator_type`, `group_no`
                ) VALUES ('1', 'ミックスパック', '1', 'tag', '1'),
                    ('2', '樽', '2', 'tag', '2'),
                    ('3', '瓶', '3', 'tag', '2'),
                    ('4', '缶', '4', 'tag', '2'),
                    ('5', 'その他の容器', '5', 'tag', '2'),
                    ('11', 'ラガー / ピルスナー', '11', 'tag', '3'),
                    ('12', 'ホワイトエール / ヴァイツェン', '12', 'tag', '3'),
                    ('13', 'エール系', '13', 'tag', '3'),
                    ('14', 'IPA', '14', 'tag', '3'),
                    ('15', '黒ビール系', '15', 'tag', '3'),
                    ('16', 'フルーツビール', '16', 'tag', '3'),
                    ('17', 'サワー / ゴーゼ', '17', 'tag', '3'),
                    ('18', 'その他スタイル', '18', 'tag', '3'),
                    ('19', 'ビール以外', '19', 'tag', '3'),
                    ('20', 'その他', '20', 'tag', '3')"
            );

            $this->addSql("ALTER TABLE `dtb_tag` AUTO_INCREMENT = 100"
            );
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}


