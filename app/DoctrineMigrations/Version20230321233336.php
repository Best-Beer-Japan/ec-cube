<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230321233336 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $csvOrderStoreNameExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 4 and disp_name = '店舗名'");
        if ($csvOrderStoreNameExists == 0) {
            $date = (new \DateTime())->format('Y-m-d H:i:s');

            $maxSortNo = $this->connection->fetchColumn('SELECT MAX(sort_no) + 1 FROM dtb_csv WHERE csv_type_id = 4;');
            $sortNo = $this->connection->fetchColumn("SELECT sort_no FROM dtb_csv WHERE csv_type_id = 4 and disp_name = '会社名'");

            // sortNoアップデート
            $this->addSql("UPDATE dtb_csv SET sort_no = sort_no + 1 WHERE sort_no BETWEEN ? AND ? AND csv_type_id = 4;",
                [
                    $sortNo + 1,
                    $maxSortNo
                ]);

            // データ挿入
            $this->addSql("INSERT INTO dtb_csv (csv_type_id, entity_name, field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type) VALUES
            (3, 'Eccube\\\\Entity\\\\Order', 'customize_store_name', '店舗名', ?, true, ?, ?, 'csv')",
                [
                    $sortNo + 1,
                    $date,
                    $date
                ]);
        }

        $csvShipStoreNameExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 4 and disp_name = '配送先_店舗名'");
        if ($csvShipStoreNameExists == 0) {
            $date = (new \DateTime())->format('Y-m-d H:i:s');

            $maxSortNo = $this->connection->fetchColumn('SELECT MAX(sort_no) + 1 FROM dtb_csv WHERE csv_type_id = 4;');
            $sortNo = $this->connection->fetchColumn("SELECT sort_no FROM dtb_csv WHERE csv_type_id = 4 and disp_name = '配送先_会社名'");

            // sortNoアップデート
            $this->addSql("UPDATE dtb_csv SET sort_no = sort_no + 1 WHERE sort_no BETWEEN ? AND ? AND csv_type_id = 4;",
                [
                    $sortNo + 1,
                    $maxSortNo
                ]);

            // データ挿入
            $this->addSql("INSERT INTO dtb_csv (csv_type_id, entity_name, field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type) VALUES
            (3, 'Eccube\\\\Entity\\\\Order', 'customize_store_name', '配送先_店舗名', ?, true, ?, ?, 'csv')",
                [
                    $sortNo + 1,
                    $date,
                    $date
                ]);
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        {
            $deleteId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = 4 and disp_name = '店舗名'");
            $sort_no = $this->connection->fetchColumn("SELECT sort_no FROM dtb_csv WHERE csv_type_id = 4 and disp_name = '店舗名'");
            $this->addSql("DELETE FROM dtb_csv WHERE id = ?;",
                [
                    $deleteId
                ]);

            $maxSortNo = $this->connection->fetchColumn('SELECT MAX(sort_no) FROM dtb_csv WHERE csv_type_id = 4;');
            $this->addSql("UPDATE dtb_csv SET sort_no = sort_no - 1 WHERE sort_no BETWEEN ? AND ? AND csv_type_id = 4;",
                [
                    $sort_no,
                    $maxSortNo
                ]);
        }
        {
            $deleteId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = 4 and disp_name = '配送先_店舗名'");
            $sort_no = $this->connection->fetchColumn("SELECT sort_no FROM dtb_csv WHERE csv_type_id = 4 and disp_name = '配送先_店舗名'");
            $this->addSql("DELETE FROM dtb_csv WHERE id = ?;",
                [
                    $deleteId
                ]);

            $maxSortNo = $this->connection->fetchColumn('SELECT MAX(sort_no) FROM dtb_csv WHERE csv_type_id = 4;');
            $this->addSql("UPDATE dtb_csv SET sort_no = sort_no - 1 WHERE sort_no BETWEEN ? AND ? AND csv_type_id = 4;",
                [
                    $sort_no,
                    $maxSortNo
                ]);
        }
    }
}
