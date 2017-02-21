*************
Add-on Scheme
*************

=========
addon.xml
=========

This file is mandatory for any add-on. Parameters of the add-on such as a unique text identifier, name, description, ordinal number in the list, etc. are described there.

:download:`Here <files/addon.xml>` you can download a fully commented example of an *addon.xml*.

Every time the *Manage add-ons* page is opened in the administration panel, the system scans all the directories within *app/addons/* and reads the files *addon.xml* for not installed add-ons to display them in the list of available ones.

When installing an add-on, the system saves all data of *addon.xml* to the database, except for the settings structure that is read from the file every time you work with the add-on.

For already installed add-ons the system calls *addon.xml* when editing an add-on on the *Manage add-ons* page.

========
Location
========

File must be located in the root directory of the add-on - *app/addons/[addon_name]/addon.xml*

======
Scheme
======

**Scheme 2.0** addon.xml scheme is used in CS-Cart. Add-ons with the old scheme will not be displayed in *Administration -> Add-ons -> Manage add-ons* nor will they work correctly without a proper scheme conversion.

=========
Structure
=========

The *addon.xml* file structure is fully described below. Use this scheme as a memo when developing your own add-ons.

Top level
---------

.. code-block:: xml
 
 <addon scheme="2.0" edition_type="ROOT,ULT:VENDOR">

    <id>sample_addon_2_0</id>
    <version>1.0</version>
    <default_language>en</default_language>
    <name>2.0 scheme addon sample</name>
    <description>This is description of addon</description>
    <priority>100</priority>
    <status>active</status>
    <auto_install>PROFESSIONAL,MULTIVENDOR,ULTIMATE</auto_install>
    
Add-on Attributes:

    *	``scheme`` - add-on scheme version. The value "2.0" should be used.
    *	``edition_type`` - An optional attribute available for any settings-related element. It defines editions in which one or another setting is available. If left empty, the parent element value. will be used. If the latter is not set, the value is considered ROOT. Possible values: PRO:ROOT, ULT:ROOT, ULT:VENDOR, MVE:ROOT, MVE: VENDOR, ROOT and VENDOR.
    *	``id`` - Add-on identifier. It must be equal to the catalog name in which the add-on resides.
    *	``version`` - Add-on version.
    *	``default_language`` - Add-on native (default) language. An optional parameter; if not specified, the language will be recognized as English (EN).
    *	``name`` - Add-on name in the default language.
    *	``description`` - Add-on description in the default language.
    *	``priority`` - Add-on priority. The higher the priority, the later the add-on is connected.
    *	``status`` - Status to be set after the add-on installation (active/disabled); "disabled" by default.
    *   ``auto_install`` - Defines CS-Cart products, in which the add-on will be automatically includded in the list after installation.

Compatibility block
-------------------

.. code-block:: xml

 <!-- Block for the other add-ons compatibilities descriptions -->
    <compatibility>
        <dependencies>discussion,form_builder</dependencies>
 
        <conflicts>catalog_mode,reward_points</conflicts>
    </compatibility>
    
*	``compatibility`` - Block for the other add-ons compatibilities descriptions.
*	``dependencies`` - The add-ons listed in this section must be installed in order to install the current one; otherwise an error message will be displayed.
*	``conflicts`` - The add-ons listed in this section will be automatically disabled before the current add-on installation starts and the notification will be displayed.

Translations block
------------------

.. code-block:: xml

 <!-- Translations for the non-default languages -->
    <translations> 
      
        <item for="name" lang="RU">Пример аддона версии 2.0</item>
        <item for="description" lang="RU">Описание для аддона версии 2.0</item>
    </translations>

*	``translations`` - Translations for the non-default languages.
*	``item`` - A translation item.

    Attributes:
        *	``for`` - Points to the property for which the translation is provided. Possible values: *name/description/tooltip*. Optional. The default value is *name*.
        *	``lang`` - The translation language code. If there is no language with the given code, the translation will be ignored.

Settings block
--------------

You can find an example :download:`here <files/addon.xml>`.

 *	``settings`` - Add-on settings block. Optional.

 Attributes:
    *	``layout`` - Defines where the settings page will be opened (*popup/separate*). Optional attribute; *popup* by default.
    *	``edition_type`` - See ``edition_type`` attribute description in the **Top level** section.

 *	``sections`` - List of tabs on the add-on settings page.

     *	``section`` - Settings tab.

     Attributes:
        *	``id`` - Text identifier. This setting can be accessed later on through ``Registry::get('addons.[addon_id].[setting_id]')``
        *	``edition_type`` - See ``edition_type`` attribute description in the **Top level** section.
        *	``name`` - Tab name in the default language.
        *	``translations`` - See translations block description in the **Translations** block section.
        *	``items`` - List of settings in the tab.

             *	``item`` - Add-on settings.

             Attributes:
                *	``id`` - Setting identifier.
                *	``edition_type`` - See ``edition_type`` attribute description in the **Top level** section.
                *	``type`` - Element type: input, textarea, password, checkbox, selectbox, multiple select, multiple checkboxes, countries list, states list, file, info, header, template.
                *	``name`` - Setting name in the default language.
                *	``translations`` - See translations block description in the **Translations** block section.
                *	``tooltip`` - Tooltip.
                *	``default_value`` - Default value; variant id for lists (and items with multiple variants like selectbox, multiple select etc.)
                *	``variants`` - Variants for the types selectbox, multiple select, multiple checkboxes, combo select.

                     *	``item`` - Variant item.

                     Attributes:
                        *	``id`` - Variant identifier.
                        *	``name`` - Variant name.
                        *	``translations`` - Similar to ``translations`` block described in the **Translations** block section, only the ``for`` attribute is used.

                    *	``handler`` - Handler function for the ``info`` type settings. The return value of the specified function will be used as output text.

Language variables block
------------------------

.. code-block:: xml

    <language_variables>

        <item lang="en" id="test_xml_2.0_1">First language variable</item>
        <item lang="en" id="test_xml_2.0_2">Second language variable</item>
        <item lang="en" id="sample_addon_handler">Sample addon handler</item>
        <item lang="ru" id="test_xml_2.0_1">Первая языковая переменная</item>
        <item lang="ru" id="test_xml_2.0_2">Вторая языковая переменная</item>
        <item lang="ru" id="sample_addon_handler">Пример обработчика модуля</item>
    </language_variables>

*	``language_variables`` - Additional language variables.

    *	``item`` - Language variable item.

    Attributes:
       *	``id`` - Language variable identifier.
       *	``lang`` - Code of the language it is added for.

Queries block
-------------

.. code-block:: xml

 <queries>
     <!-- If parameter "for" equals "install" or is not set, the query is executed during the add-on installation -->
     <item for="install">
     CREATE TABLE `?:addon_test_123456789` (
            `queue_id` mediumint NOT NULL auto_increment,
            PRIMARY KEY (`queue_id`)
     ) ENGINE=MyISAM DEFAULT CHARSET=UTF8
     </item>
     <!-- If the "editions" attribute is given, the request will be executed only for the editions that are defined in it (separated with commas) -->
     <item for="install" editions="ULTIMATE,MULTIVENDOR">
            ALTER TABLE `?:addon_test_123456789` ADD company_id INT NOT NULL DEFAULT 0;
     </item>
     <!-- If the parameter "for" equals "uninstall", the query is executed during the add-on uninstallation -->
     <item for="uninstall">DROP TABLE IF EXISTS `?:addon_test_123456789`</item>
 </queries>

*	``queries`` - Additional database queries.

    *	``item`` - Database query item.

    Attributes:
        *	``for`` - If this parameter is set to *install* or is not set, the query is executed during the add-on installation; if this parameter is set to *uninstall*, the query is executed during the add-on uninstallation.
        *	``editions`` - Comma-separated list of editions. If this attribute is given, the request will be executed only for the specified editions.

Functions block
---------------

.. code-block:: xml

 <functions>
     <item for="install">fn_google_export_add_features</item>
     <item for="install">fn_google_export_add_feed</item>
     <item for="uninstall">fn_google_export_remove_features</item>
     <item for="uninstall">fn_google_export_remove_feed</item>
 </functions>

*	``functions`` - User-defined functions called on certain events:

    *	``before_install`` - before the add-on installation.
    *	``install`` - after the installation of the add-on, its templates, settings and language variables but before its activation and cache clearing.
    *	``uninstall`` - before uninstallation.

        *	``item`` - Function item.

        Attributes:
            *	``for`` - Trigger event for the function. The function will be called when the specified event occures. Possible values: *before_install, install, uninstall*.
