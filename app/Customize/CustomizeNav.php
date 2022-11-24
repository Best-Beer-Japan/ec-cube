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
            'customer' => [
                'children' => [
                    'customize_agreement' => [
                        'name' => 'customize.admin.customer.agreement_registration',
                        'url' => 'customize_admin_customer_agreement',
                    ],
                ],
            ],
            'order' => [
                'children' => [
                    'customize_invoice_billing' => [
                        'name' => 'customize.admin.setting.invice.invoice_billing',
                        'url' => 'customize_admin_setting_invoice_billing',
                    ],
                ],
            ],
            'setting' => [
                'children' => [
                    'customize_invoice' => [
                        'name' => 'customize.admin.setting.invice',
                        'children' => [
                            'customize_invoice_index' => [
                                'name' => 'customize.admin.setting.invice.invoice_setting',
                                'url' => 'customize_admin_setting_invoice',
                            ],
                        ],
                    ],
                ],
            ],
        ];
    }
}
