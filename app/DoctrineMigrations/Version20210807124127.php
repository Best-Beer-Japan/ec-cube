<?php declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210807124127 extends AbstractMigration
{
    public function up(Schema $schema) : void
    {
        // オーダーステータス
        $orderStatusExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM mtb_order_status WHERE id = 6 AND name = '入金済み(一般顧客)'");
        if ($orderStatusExists == 0) {
            $this->addSql("UPDATE mtb_order_status SET name = '入金済み(一般顧客)' WHERE id = 6");
        }

        // オーダーステータス
        $orderStatusExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM mtb_order_status WHERE id = 10 AND name = '請求済み'");
        if ($orderStatusExists == 0) {
            $this->addSql("INSERT INTO mtb_order_status (
                id, display_order_count, name, sort_no, discriminator_type
            ) VALUES (
                10, 1, '請求済み', 8, 'orderstatus'
            )");
        }

        // オーダーステータス
        $orderStatusExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM mtb_order_status WHERE id = 11 AND name = '入金済み(BtoB)'");
        if ($orderStatusExists == 0) {
            $this->addSql("INSERT INTO mtb_order_status (
                id, display_order_count, name, sort_no, discriminator_type
            ) VALUES (
                11, 0, '入金済み(BtoB)', 9, 'orderstatus'
            )");
        }

        // オーダーステータスカラー
        $orderStatusColorExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM mtb_order_status_color WHERE id = 10 AND name = '#cd69a7'");
        if ($orderStatusColorExists == 0) {
            $this->addSql("INSERT INTO mtb_order_status_color (
                id, name, sort_no, discriminator_type
            ) VALUES (
                10, '#cd69a7', 8, 'orderstatuscolor'
            )");
        }

        // オーダーステータスカラー
        $orderStatusColorExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM mtb_order_status_color WHERE id = 11 AND name = '#a3a3a3'");
        if ($orderStatusColorExists == 0) {
            $this->addSql("INSERT INTO mtb_order_status_color (
                id, name, sort_no, discriminator_type
            ) VALUES (
                11, '#a3a3a3', 9, 'orderstatuscolor'
            )");
        }

        // 会員オーダーステータス
        $customerOrderStatusExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM mtb_customer_order_status WHERE id = 10 AND name = '請求書処理中'");
        if ($customerOrderStatusExists == 0) {
            $this->addSql("INSERT INTO mtb_customer_order_status (
                id, name, sort_no, discriminator_type
            ) VALUES (
                10, '請求書処理中', 8, 'customerorderstatus'
            )");
        }

        // 会員オーダーステータス
        $customerOrderStatusExists = $this->connection->fetchColumn("SELECT COUNT(*) FROM mtb_customer_order_status WHERE id = 11 AND name = '支払済み'");
        if ($customerOrderStatusExists == 0) {
            $this->addSql("INSERT INTO mtb_customer_order_status (
                id, name, sort_no, discriminator_type
            ) VALUES (
                11, '支払済み', 9, 'customerorderstatus'
            )");
        }
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
