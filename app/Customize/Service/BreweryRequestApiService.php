<?php

namespace Customize\Service;

use Eccube\Common\EccubeConfig;

class BreweryRequestApiService
{
    /**
     * @var EccubeConfig
     */
    protected $eccubeConfig;

    /**
     * CorpseTagStyleController constructor.
     *
     * @param EccubeConfig $eccubeConfig
     */
    public function __construct(
        EccubeConfig $eccubeConfig
    ) {
        $this->eccubeConfig = $eccubeConfig;
    }

    /**
     * API request processing
     *
     * @param string $url
     * @param bool $post
     */
    public function requestApi(string $url, bool $post = false)
    {
        if (true !== $this->eccubeConfig['brewery_api_is_enable']) {
            return;
        }

        $curl = curl_init($url);

        if ($post) {
            curl_setopt($curl, CURLOPT_POST, 1);
        }

        // Option array
        $options = [
            CURLOPT_HTTPGET => $post === false,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FAILONERROR => true,
            CURLOPT_CAINFO => \Composer\CaBundle\CaBundle::getSystemCaRootBundlePath(),
            CURLOPT_TIMEOUT_MS => 5000,
        ];

        // Set option value
        curl_setopt_array($curl, $options);

        curl_exec($curl);
        $info = curl_getinfo($curl);
        $message = curl_error($curl);
        $info['message'] = $message;
        curl_close($curl);

        if ($info['http_code'] !== 200) {
            log_error('http corpse_request_api', [$url, $info]);
        } else {
            log_info('http corpse_request_api', [$url]);
        }
    }
}
