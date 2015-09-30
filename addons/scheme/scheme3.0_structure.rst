******************************************
Example of the addon.xml file (scheme 3.0)
******************************************

Compatible with CS-Cart versions starting from 4.2.x.

=============
Add-on scheme
=============

The full commented add-on scheme
================================

.. code-block:: xml

	<?xml version="1.0"?>
	<!--
	    Add-on scheme version 3.0 description
	    All parameters that are not marked as optional must be defined in the scheme. 
	    @edition_type - An optional attribute available for any settings-related element. It defines editions in which one or another setting is available. If left empty, the parent element value will be used. If the latter is not set, the value is considered ROOT
	-->
	<addon scheme="3.0" edition_type="ROOT,ULT:VENDOR">
	    <!-- Add-on identifier. It must be equal to the catalog name in which the add-on resides -->
	    <id>sample_addon_3_0</id>
	    <!-- Add-on version -->
	    <version>1.0</version>
	    <!-- Add-on native (default) language. An optional parameter; if not specified, the language will be recognized as English (EN) -->
	    <default_language>en</default_language>
	    <!-- Add-on priority. The higher the priority the later the add-on is connected -->
	    <priority>100</priority>
	    <!-- Status to be set after the add-on installation (active/disabled); "disabled" by default -->
	    <status>active</status>
	    <!-- Defines CS-Cart products in which the add-on will be automatically included in the list after installation -->
	    <auto_install>MULTIVENDOR,ULTIMATE</auto_install>
	    <!-- Block for the other add-ons compatibilities descriptions -->
	    <compatibility>
	        <!-- Dependencies. These add-ons must be installed in order to install the current one; otherwise an error message will be displayed -->
	        <dependencies>discussion,form_builder</dependencies>
	        <!-- Conflicts. These add-ons will be automatically disabled before the current add-on installation starts and the notification will be displayed -->
	        <conflicts>catalog_mode,reward_points</conflicts>
	    </compatibility>

	    <!-- Add-on settings block. Optional.
	    	@layout - Defines where the settings page will be opened (popup/separate). Optional attribute; "popup" by default
	    -->
	    <settings layout="separate" edition_type="ROOT,ULT:VENDOR">
	        <!-- List of tabs on the add-on settings page -->
	    	<sections>
	            <!-- Tab for settings.
	            	@id - text identifier. This setting can be accessed later on through Registry::get('addons.[addon_id].[setting_id]')
	            	@edition_type - list of editions in which the tab will be available. Optional
	            -->
	            <section id="section1">
	                <!-- List of settings in the tab -->
	                <items>
	                    <!-- Add-on settings
	                		@id - setting identifier.
	                        @edition_type - list of editions in which the setting will be available. Optional.
	                    -->
	                    <item id="header">
	                        <!-- Element type:
	                            input, textarea, password, checkbox, selectbox, multiple select,
	                            multiple checkboxes, countries list, states list,
	                            file, info, header, template
	                        -->
	                        <type>header</type>
	                        <variants/>
	                    </item>
	                    <item id="input">
	                        <type>input</type>
	                        <variants/>
	                    </item>
	                    <item id="password">
	                        <type>password</type>
	                        <variants/>
	                    </item>
	                    <item id="checkbox">
	                        <type>checkbox</type>
	                        <variants/>
	                    </item>
	                    <item id="textarea">
	                        <type>textarea</type>
	                        <default_value>Sample textarea text</default_value>
	                        <variants/>
	                    </item>
	                    <item id="radiogroup">
	                        <type>radiogroup</type>
	                        <default_value>radio_2</default_value>
	                        <!-- Variants - for types selectbox, multiple select,
	                            multiple checkboxes, combo select -->
	                        <variants>
	                            <!-- @id - variant identifier-->
	                            <item id="radio_1"></item>
	                            <item id="radio_2"></item>
	                        </variants>
	                    </item>
	                    <item id="file">
	                        <type>file</type>
	                        <variants/>
	                    </item>
	                </items>
	            </section>
	            <section id="section2">
	                <translations>
	                    <item lang="ru">Списки</item><!-- Can be translated through PO (SettingsSection) -->
	                </translations>
	                <items>
	                    <item id="selectbox">
	                        <type>selectbox</type>
	                        <variants>
	                            <item id="select_box_1"></item>
	                            <item id="select_box_2"></item>
	                        </variants>
	                    </item>
	                    <item id="countries_list">
	                        <type>countries list</type>
	                        <variants/>
	                    </item>
	                    <item id="states_list">
	                        <type>states list</type>
	                        <variants/>
	                    </item>
	                    <item id="multiple_select">
	                        <type>multiple select</type>
	                        <variants>
	                            <item id="select_box_1"></item>
	                            <item id="select_box_2"></item>
	                            <item id="select_box_3"></item>
	                        </variants>
	                    </item>
	                    <item id="multiple_checkboxes">
	                        <type>multiple checkboxes</type>
	                        <variants>
	                            <item id="select_box_1"></item>
	                            <item id="select_box_2"></item>
	                            <item id="select_box_3"></item>
	                        </variants>
	                        <default_value>select_box_2</default_value>
	                    </item>
	                </items>
	            </section>
	            <section id="section3">
	                <items>
	                    <item id="selectable_box">
	                        <!-- The current setting options will be taken from the function fn_settings_variants_[addon_id]_[setting_id]-->
	                        <type>selectable_box</type>
	                        <default_value><![CDATA[#M#product_code=Y&product=Y&amount=Y&price=Y]]></default_value>
	                        <variants/>
	                    </item>
	                    <!-- In this case the information returned by the function "handler" will be displayed -->
	                    <item id="info">
	                        <type>info</type>
	                        <handler>fn_sample_addon_3_0_info</handler>
	                        <variants/>
	                    </item>
	                    <!-- Setting appearance; type "template". In this case a user-defined template from the themes/THEME_NAME/addons/ADDON_NAME/setings/TEMPLATE_NAME directory is loaded.
	                         The template name is stored in the default_value-->
	                    <item id="template">
	                        <type>template</type>
	                        <default_value>sample.tpl</default_value>
	                        <variants/>
	                    </item>
	                    <!-- A hidden setting. Exists in the database and in the Registry but is not shown to the user. -->
	                    <item id="hidden">
	                        <type>hidden</type>
	                        <default_value>Some hidden setting value</default_value>
	                    </item>
	                </items>
	            </section>
	        </sections>
	    </settings>

	    <!-- Additional database queries -->
	    <queries>
	        <!-- If parameter "for" equals "install" or is not set, the query is executed during the add-on installation. -->
	        <item for="install">
	        CREATE TABLE `?:addon_test_123456789` (
	            `queue_id` mediumint NOT NULL auto_increment,
	            PRIMARY KEY  (`queue_id`)
	        ) ENGINE=MyISAM DEFAULT CHARSET=UTF8
	        </item>
	        <!-- If the "editions" attribute is given, the request will be executed only for the editions that are defined in it (separated with commas). -->
	        <item for="install" editions="ULTIMATE,MULTIVENDOR">
	            ALTER TABLE `?:addon_test_123456789` ADD company_id INT NOT NULL DEFAULT 0;
	        </item>
	        <!-- If the parameter "for" equals "uninstall", the query is executed during the add-on uninstallation. -->
	        <item for="uninstall">DROP TABLE IF EXISTS `?:addon_test_123456789`</item>
	    </queries>
	    <!-- 
		User-defined functions called on certain events:
	            before_install - before the add-on installation
	            install - after the installation of the add-on, its templates, settings and language variables but before its activation and cache clearing
	            uninstall - before uninstallation
	            -->
	    <functions>
	        <item for="install">fn_google_export_add_features</item>
	        <item for="install">fn_google_export_add_feed</item>
	        <item for="uninstall">fn_google_export_remove_features</item>
	        <item for="uninstall">fn_google_export_remove_feed</item>
	    </functions>
	</addon>

Settings functions
==================

You can use functions to get settings, if necessary.

Example:

.. code-block:: xml

	<?php
	/***************************************************************************
	*                                                                          *
	*   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
	*                                                                          *
	* This  is  commercial  software,  only  users  who have purchased a valid *
	* license  and  accept  to the terms of the  License Agreement can install *
	* and use this program.                                                    *
	*                                                                          *
	****************************************************************************
	* PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
	* "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
	****************************************************************************/

	if (!defined('BOOTSTRAP')) { die('Access denied'); }

	function fn_settings_variants_addons_sample_addon_3_0_selectable_box()
	{
	    $schema = array(
	        'fields' => array(
	            'product_id' => array('title' => __('product_id'), 'sort_by' => ''),
	            'product' => array('title' => __('product_name'), 'sort_by' => 'product'),
	            'min_qty' => array('title' => __('min_order_qty'), 'sort_by' => ''),
	            'max_qty' => array('title' => __('max_order_qty'), 'sort_by' => ''),
	            'product_code' => array('title' => __('sku'), 'sort_by' => 'code'),
	            'amount' => array('title' => __('quantity'), 'sort_by' => 'amount'),
	            'price' => array('title' => __('price'), 'sort_by' => 'price'),
	            'weight' => array('title' => __('weight'), 'sort_by' => 'weight'),
	            'image' => array('title' => __('image'), 'sort_by' => ''),
	        ),
	    );
	    $result = array();

	    if (!empty($schema['fields'])) {
	        foreach ($schema['fields'] as $field_id => $field) {
	            $result[$field_id] = $field['title'];
	        }
	    }

	    return $result;
	}

	function fn_sample_addon_3_0_info()
	{
	    $text = __('sample_addon_handler') . '<hr/>' . __('test_xml_3.0_1') . '<br />' . __('test_xml_3.0_2');

	    return $text . '<hr/>' ;
	}

File with translations
======================

Translations are added with the *.po* file that is stored in the following directory: */var/langs/en/addons/[add-on_id].po*
There is a separate **.po** file with translation for each language. Store additional translations in the directory with the corresponding language code: */var/langs/[language_code]/addons/[add-on_id].po*

The ``msgid`` value should be the same for all languages.

Example:

.. code-block:: xml

	msgid ""
	msgstr "Project-Id-Version: tygh"
	"Content-Type: text/plain; charset=UTF-8\n"
	"Language-Team: English\n"
	"Language: en_US"

	msgctxt "Addons::name::sample_addon_3_0"
	msgid "3.0 scheme addon sample"
	msgstr "3.0 scheme addon sample"

	msgctxt "Addons::description::sample_addon_3_0"
	msgid "Sample add-on description. Do not use the add-on in production mode."
	msgstr "Sample add-on description. Do not use the add-on in production mode."

	msgctxt "Languages::test_xml_3.0_1"
	msgid "First language variable"
	msgstr "First language variable"

	msgctxt "Languages::test_xml_3.0_2"
	msgid "Second language variable"
	msgstr "Second language variable"

	msgctxt "Languages::sample_addon_handler"
	msgid "Sample addon handler"
	msgstr "Sample addon handler"

	msgctxt "SettingsSections::sample_addon_3_0::section1"
	msgid "Generic settings"
	msgstr "Generic settings"

	msgctxt "SettingsSections::sample_addon_3_0::section2"
	msgid "Selects"
	msgstr "Selects"

	msgctxt "SettingsSections::sample_addon_3_0::section3"
	msgid "Additional settings"
	msgstr "Additional settings"

	msgctxt "SettingsOptions::sample_addon_3_0::header"
	msgid "Header"
	msgstr "Header"

	msgctxt "SettingsOptions::sample_addon_3_0::input"
	msgid "Input"
	msgstr "Input"

	msgctxt "SettingsOptions::sample_addon_3_0::password"
	msgid "Password input"
	msgstr "Password input"

	msgctxt "SettingsOptions::sample_addon_3_0::checkbox"
	msgid "Checkbox"
	msgstr "Checkbox"

	msgctxt "SettingsOptions::sample_addon_3_0::textarea"
	msgid "Textarea"
	msgstr "Textarea"

	msgctxt "SettingsOptions::sample_addon_3_0::radiogroup"
	msgid "Radio group box"
	msgstr "Radio group box"

	msgctxt "SettingsOptions::sample_addon_3_0::file"
	msgid "File"
	msgstr "File"

	msgctxt "SettingsOptions::sample_addon_3_0::selectbox"
	msgid "Selectbox"
	msgstr "Selectbox"

	msgctxt "SettingsOptions::sample_addon_3_0::countries_list"
	msgid "Countries list"
	msgstr "Countries list"

	msgctxt "SettingsOptions::sample_addon_3_0::states_list"
	msgid "States list"
	msgstr "States list"

	msgctxt "SettingsOptions::sample_addon_3_0::multiple_select"
	msgid "Multiple select"
	msgstr "Multiple select"

	msgctxt "SettingsOptions::sample_addon_3_0::multiple_checkboxes"
	msgid "Multiple checkboxes"
	msgstr "Multiple checkboxes"

	msgctxt "SettingsOptions::sample_addon_3_0::selectable_box"
	msgid "Selectable box"
	msgstr "Selectable box"

	msgctxt "SettingsOptions::sample_addon_3_0::info"
	msgid "Info Url"
	msgstr "Info Url"

	msgctxt "SettingsTooltips::sample_addon_3_0::input"
	msgid "Tooltip"
	msgstr "Tooltip"

	msgctxt "SettingsVariants::sample_addon_3_0::radiogroup::radio_1"
	msgid "Radio button 1"
	msgstr "Radio button 1"

	msgctxt "SettingsVariants::sample_addon_3_0::radiogroup::radio_2"
	msgid "Radio button 2"
	msgstr "Radio button 2"

	msgctxt "SettingsVariants::sample_addon_3_0::multiple_checkboxes::select_box_1"
	msgid "Select box item 1"
	msgstr "Select box item 1"

	msgctxt "SettingsVariants::sample_addon_3_0::multiple_checkboxes::select_box_2"
	msgid "Select box item 2"
	msgstr "Select box item 2"

	msgctxt "SettingsVariants::sample_addon_3_0::multiple_checkboxes::select_box_3"
	msgid "Select box item 3"
	msgstr "Select box item 3"