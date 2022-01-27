<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211124022902 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql("UPDATE dtb_product_class SET bbj_price = price02 where bbj_price is null");
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
    }
}
