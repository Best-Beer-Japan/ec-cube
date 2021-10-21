<?php

namespace Customize\Repository;

use Doctrine\ORM\QueryBuilder;
use Eccube\Doctrine\Query\QueryCustomizer;
use Eccube\Repository\QueryKey;

class OrderSearchAdminWhereCustomizer implements QueryCustomizer
{
    /**
     * {@inheritdoc}
     */
    public function customize(QueryBuilder $builder, $params, $queryKey)
    {
        if (null !== $params['Delivery']) {
            $builder
                ->andWhere('s.Delivery = :Delivery')
                ->setParameter(':Delivery', $params['Delivery']);
        }
    }

    /**
     * {@inheritdoc}
     */
    public function getQueryKey()
    {
        return QueryKey::ORDER_SEARCH_ADMIN;
    }
}
