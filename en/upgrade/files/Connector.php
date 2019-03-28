<?php

namespace Tygh\UpgradeCenter\Connectors\SampleAddon;

use Tygh\Addons\SchemesManager;
use Tygh\Http;
use Tygh\Registry;
use Tygh\Settings;
use Tygh\Tools\Url;
use Tygh\UpgradeCenter\Connectors\BaseAddonConnector;
use Tygh\UpgradeCenter\Connectors\IConnector;

/**
 * Class Connector implements Upgrade center connector for the sample add-on.
 *
 * @package Tygh\UpgradeCenter\Connectors\SampleAddon
 */
class Connector extends BaseAddonConnector implements IConnector
{
    /**
     * @var string The name of the HTTP request parameter that indicates what action is requested from the upgrade server
     */
    const ACTION_PARAM = 'dispatch';

    /**
     * @var string The value of ACTION_PARAM that informs the upgrade server that CS-Cart has requested a check for available upgrades
     */
    const ACTION_CHECK_UPDATES = 'updates.check';

    /**
     * @var string The value of ACTION_PARAM that informs the upgrade server that CS-Cart has requested a download of the upgrade package
     */
    const ACTION_DOWNLOAD_PACKAGE = 'updates.download_package';

    /**
     * @var string Unique identifier of the add-on
     */
    protected $addon_id = 'sample_addon';

    /**
     * @var string Current add-on version
     */
    protected $addon_version;

    /**
     * @var string Store URL
     */
    protected $product_url;

    public function __construct()
    {
        parent::__construct();

        // upgrade server address must be specified in the Connector constructor
        $this->updates_server = 'https://updates.example.com';

        // add-on data
        $addon = SchemesManager::getScheme($this->addon_id);

        $this->addon_version = $addon->getVersion() ? $addon->getVersion() : '1.0';
        // value of the 'license_number' of the add-on
        $this->license_number = (string) Settings::instance()->getValue('license_number', $this->addon_id);

        // store data
        $this->product_name = PRODUCT_NAME;
        $this->product_version = PRODUCT_VERSION;
        $this->product_build = PRODUCT_BUILD;
        $this->product_edition = PRODUCT_EDITION;
        $this->product_url = Registry::get('config.current_location');
    }

    /**
     * Provides data to connect to the upgrade server of the add-on.
     * Called when checking for available updates.
     *
     * @return array
     */
    public function getConnectionData()
    {
        // store license can be accessed via $this->uc_settings['license_number']

        $data = [
            self::ACTION_PARAM => self::ACTION_CHECK_UPDATES,
            'addon_id'         => $this->addon_id,
            'addon_version'    => $this->addon_version,
            'license_number'   => $this->license_number,
            'product_name'     => $this->product_name,
            'product_version'  => $this->product_version,
            'product_build'    => $this->product_build,
            'product_edition'  => $this->product_edition,
            'product_url'      => $this->product_url,
        ];

        $headers = [];

        return [
            'method'  => 'get',
            'url'     => $this->updates_server,
            'data'    => $data,
            'headers' => $headers,
        ];
    }

    /**
     * Downloads an add-on upgrade package.
     *
     * @param array  $schema       Update package schema
     * @param string $package_path Absolute path on the server to put the update package to
     *
     * @return array
     */
    public function downloadPackage($schema, $package_path)
    {
        $download_url = new Url($this->updates_server);

        $download_url->setQueryParams(array_merge($download_url->getQueryParams(), [
            self::ACTION_PARAM => self::ACTION_DOWNLOAD_PACKAGE,
            'package_id'       => $schema['package_id'],
            'addon_id'         => $this->addon_id,
            'license_number'   => $this->license_number,
        ]));

        $download_url = $download_url->build();

        $request_result = Http::get($download_url, [], [
            'write_to_file' => $package_path,
        ]);

        if (!$request_result || strlen($error = Http::getError())) {
            $download_result = [false, __('text_uc_cant_download_package')];

            fn_rm($package_path);
        } else {
            $download_result = [true, ''];
        }

        return $download_result;
    }
}
