<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210824095150 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 20 WHERE `id` = 1");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 19 WHERE `id` = 2");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 18 WHERE `id` = 3");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 17 WHERE `id` = 4");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 16 WHERE `id` = 5");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 15 WHERE `id` = 6");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 14 WHERE `id` = 7");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 13 WHERE `id` = 8");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 12 WHERE `id` = 9");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 11 WHERE `id` = 10");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 10 WHERE `id` = 11");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 9 WHERE `id` = 12");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 8 WHERE `id` = 13");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 7 WHERE `id` = 14");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 6 WHERE `id` = 15");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 5 WHERE `id` = 16");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 4 WHERE `id` = 17");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 3 WHERE `id` = 18");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 2 WHERE `id` = 19");
        $this->addSql("UPDATE `dtb_tag` SET `sort_no` = 1 WHERE `id` = 20");
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
