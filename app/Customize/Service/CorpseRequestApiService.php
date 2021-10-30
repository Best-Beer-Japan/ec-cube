<?php

namespace Customize\Service;

use Eccube\Common\EccubeConfig;

class CorpseRequestApiService
{
    protected $curl = null;

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

    private function setCurl(string $url, bool $post = false) {

        $this->curl = curl_init($url);

        if ($post) {
            curl_setopt($this->curl, CURLOPT_POST, 1);
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
        curl_setopt_array($this->curl, $options);
    }

    private function execCurl() {
        curl_exec($this->curl);

        $info = curl_getinfo($this->curl);

        $message = curl_error($this->curl);
        $info['message'] = $message;

        curl_close($this->curl);

        return $info;
    }

    /**
     * API request processing
     *
     * @param string $url
     * @param bool $post
     */
    public function requestApi(string $url, bool $post = false)
    {
        if (true !== $this->eccubeConfig['corpse_api_is_enable']) {
            return;
        }

        $this->setCurl($url, $post);

        $info = $this->execCurl();

        if ($info['http_code'] !== 200) {
            log_error('http corpse_request_api', [$url, $info]);
        } else {
            log_info('http corpse_request_api', [$url]);
        }
    }
}
