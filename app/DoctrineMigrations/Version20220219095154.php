<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220219095154 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $invoiceExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM customize_dtb_invoice WHERE id = 1");
        if ($invoiceExists == 0) {
            $this->addSql("INSERT INTO customize_dtb_invoice (account_type, discriminator_type) VALUES (1, 'invoice')");
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
    }
}
