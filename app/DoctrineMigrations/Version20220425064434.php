<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220425064434 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $exists = $this->connection->fetchColumn("SELECT COUNT(*)
            FROM customize_mtb_beer_style WHERE id = 10");
        if ($exists > 0) {
            return;
        }

        $this->addSql("UPDATE customize_mtb_beer_style SET sort_no = sort_no + 1 WHERE sort_no >= 5");

        $this->addSql("INSERT INTO customize_mtb_beer_style (
            id, name, sort_no, discriminator_type )
            VALUES ('10', 'Hazy IPA', '5', 'beerstyle')");
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql("DELETE FROM customize_mtb_beer_style WHERE id = 10");
        $this->addSql("UPDATE customize_mtb_beer_style SET sort_no = sort_no - 1 WHERE sort_no >= 5");
    }
}
