<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230413215837 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $maxSortNo = $this->connection->fetchColumn('SELECT MAX(sort_no) + 1 FROM dtb_csv WHERE csv_type_id = 2;');

        $csvCustomerDeliverysExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 2 and field_name = 'plg_delivery_fee_extension_customer_deliverys'");
        if ($csvCustomerDeliverysExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (csv_type_id, entity_name, field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type) VALUES
            (2, 'Eccube\\\\Entity\\\\Customer', 'plg_delivery_fee_extension_customer_deliverys', '自社配送', $maxSortNo, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'csv')");

            $maxSortNo++;
        }

        $csvCustomerDeliverysExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 2 and field_name = 'plg_delivery_fee_extension_customer_delivery_names'");
        if ($csvCustomerDeliverysExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (csv_type_id, entity_name, field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type) VALUES
            (2, 'Eccube\\\\Entity\\\\Customer', 'plg_delivery_fee_extension_customer_delivery_names', '自社配送名', $maxSortNo, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'csv')");

            $maxSortNo++;
        }

        $csvCustomerInvoiceMemoExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM dtb_csv WHERE csv_type_id = 2 and field_name = 'plg_invoice_docurain_invoice_memo'");
        if ($csvCustomerInvoiceMemoExists == 0) {
            $this->addSql("INSERT INTO dtb_csv (csv_type_id, entity_name, field_name, disp_name, sort_no, enabled, create_date, update_date, discriminator_type) VALUES
            (2, 'Eccube\\\\Entity\\\\Customer', 'plg_invoice_docurain_invoice_memo', '請求用メモ欄', $maxSortNo, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'csv')");
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        {
            $deleteId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = 2 and field_name = 'plg_delivery_fee_extension_customer_deliverys'");
            $sort_no = $this->connection->fetchColumn("SELECT sort_no FROM dtb_csv WHERE csv_type_id = 2 and field_name = 'plg_delivery_fee_extension_customer_deliverys'");
            $this->addSql("DELETE FROM dtb_csv WHERE id = ?;",
                [
                    $deleteId
                ]);

            $maxSortNo = $this->connection->fetchColumn('SELECT MAX(sort_no) FROM dtb_csv WHERE csv_type_id = 2;');
            $this->addSql("UPDATE dtb_csv SET sort_no = sort_no - 1 WHERE sort_no BETWEEN ? AND ? AND csv_type_id = 2;",
                [
                    $sort_no,
                    $maxSortNo
                ]);
        }
        {
            $deleteId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = 2 and field_name = 'plg_delivery_fee_extension_customer_delivery_names'");
            $sort_no = $this->connection->fetchColumn("SELECT sort_no FROM dtb_csv WHERE csv_type_id = 2 and field_name = 'plg_delivery_fee_extension_customer_delivery_names'");
            $this->addSql("DELETE FROM dtb_csv WHERE id = ?;",
                [
                    $deleteId
                ]);

            $maxSortNo = $this->connection->fetchColumn('SELECT MAX(sort_no) FROM dtb_csv WHERE csv_type_id = 2;');
            $this->addSql("UPDATE dtb_csv SET sort_no = sort_no - 1 WHERE sort_no BETWEEN ? AND ? AND csv_type_id = 2;",
                [
                    $sort_no,
                    $maxSortNo
                ]);
        }
        {
            $deleteId = $this->connection->fetchColumn("SELECT id FROM dtb_csv WHERE csv_type_id = 2 and field_name = 'plg_invoice_docurain_invoice_memo'");
            $sort_no = $this->connection->fetchColumn("SELECT sort_no FROM dtb_csv WHERE csv_type_id = 2 and field_name = 'plg_invoice_docurain_invoice_memo'");
            $this->addSql("DELETE FROM dtb_csv WHERE id = ?;",
                [
                    $deleteId
                ]);

            $maxSortNo = $this->connection->fetchColumn('SELECT MAX(sort_no) FROM dtb_csv WHERE csv_type_id = 2;');
            $this->addSql("UPDATE dtb_csv SET sort_no = sort_no - 1 WHERE sort_no BETWEEN ? AND ? AND csv_type_id = 2;",
                [
                    $sort_no,
                    $maxSortNo
                ]);
        }
    }
}
