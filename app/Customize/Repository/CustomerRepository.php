<?php

namespace Customize\Repository;

use Eccube\Repository\CustomerRepository as BaseCustomerRepository;
use Eccube\Util\StringUtil;

class CustomerRepository extends BaseCustomerRepository
{
    /**
     * ユニークなシークレットキーを返す.
     *
     * @return string
     */
    public function getUniqueCustomizeInvoiceParentKey(): string
    {
        do {
            $key = StringUtil::random(10);
            $Customer = $this->findOneBy(['customize_invoice_parent_key' => $key]);
        } while ($Customer);

        return $key;
    }
}
