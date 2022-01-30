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

        if (empty($params['customize_billing_date'])) {
            // oreder_date
            if (!empty($params['order_customize_billing_datetime_start']) && $params['order_customize_billing_datetime_start']) {
                $date = $params['order_customize_billing_datetime_start'];
                $builder
                    ->andWhere('o.customize_billing_month_date >= :order_date_start')
                    ->setParameter('order_date_start', $date);
            } elseif (!empty($params['order_customize_billing_date_start']) && $params['order_customize_billing_date_start']) {
                $date = $params['order_customize_billing_date_start'];
                $builder
                    ->andWhere('o.customize_billing_month_date >= :order_date_start')
                    ->setParameter('order_date_start', $date);
            }

            if (!empty($params['order_customize_billing_datetime_end']) && $params['order_customize_billing_datetime_end']) {
                $date = $params['order_customize_billing_datetime_end'];
                $builder
                    ->andWhere('o.customize_billing_month_date <= :order_date_end')
                    ->setParameter('order_date_end', $date);
            } elseif (!empty($params['order_customize_billing_date_end']) && $params['order_customize_billing_date_end']) {
                $date = $params['order_customize_billing_date_end'];
                $builder
                    ->andWhere('o.customize_billing_month_date <= :order_date_end')
                    ->setParameter('order_date_end', $date);
            }
        } else {
            $builder
                ->andWhere('o.customize_billing_month_date IS NULL');
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
