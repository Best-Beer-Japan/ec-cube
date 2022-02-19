<?php

namespace Customize;

use Eccube\Common\EccubeNav;

class CustomizeNav implements EccubeNav
{
    /**
     * @return array
     */
    public static function getNav()
    {
        return [
            'setting' => [
                'children' => [
                    'shop' => [
                        'children' => [
                            'customize_shop_invoice' => [
                                'name' => 'customize.admin.setting.shop.invoice_setting',
                                'url' => 'customize_admin_setting_shop_invoice',
                            ],
                        ],
                    ],
                ],
            ],
        ];
    }
}
