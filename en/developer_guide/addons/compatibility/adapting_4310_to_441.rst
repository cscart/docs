**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.4.1
**********************************************

==============
Common changes
==============

* Settings **Products per page**, **CMS pages per page**, and **Orders per page** have been removed. Now settings are initialized in the ``fn_init_settings`` function in *app/function/fn.init.php*. Here is how it works::

    $default_elements = Registry::get('settings.Appearance.admin_elements_per_page');
    Registry::set('settings.Appearance.admin_products_per_page', $default_elements);
    Registry::set('settings.Appearance.admin_orders_per_page', $default_elements);
    Registry::set('settings.Appearance.admin_pages_per_page', $default_elements);

* Custom icons for add-ons are now supported by default. They will appear on the add-on list next to the descriptions under **Add-ons → Manage add-ons**.

  To add an icon for your add-on, specify ``<has_icon>Y</has_icon>`` in your **addon.xml**. Put the icon in *design/backend/media/images/addons/[addon_name]/icon.png*.

============================
Reworked Email Notifications
============================

1. The ``\Tygh\Mailer`` class is deprecated, but still remains for backward compatibility.
    
2. The new mechanism of managing email notifications was implemented:

   * New templates are stored in the ``cscart_template_emails`` table of the database.
        
   * Templates can now be edited from the Administration panel of the store.
        
   * The **Twig** library is used as the template engine.
        
   * Snippets were implemented to provide a way to reuse some parts of the template in different notifications.
        
   * Every template has its own default value, so that store owners can easily revert to original templates at any time.

3. The new ``\Tygh\Mailer\Mailer`` component was implemented to send email notifications. The component is available from the ``Tygh::$app`` container. Example usage::

    /** @var \Tygh\Mailer\Mailer $mailer */
    $mailer = Tygh::$app['mailer'];

    $mailer->send(array(
        'to' => 'company_orders_department',
        'from' => 'default_company_orders_department',
        'data' => array(
            'url' => $url,
            'customer' => $params['name'],
            'phone_number' => $params['phone']
        ),
        'template_code' => 'call_requests_call_request',
        'tpl' => 'addons/call_requests/call_request.tpl',
        'company_id' => $company_id,
    ), 'A', $lang_code);

  The input parameters remain largely unchanged, except for 2 things:

  * You can now specify ``template_code``—a sequence of characters that identifies the email template stored in the database.

  * The ``mailer_settings`` key will be ignored. To send an email notification with non-default settings, pass these settings as the 4th argument. For example::

      /** @var \Tygh\Mailer\Mailer $mailer */
      $mailer = Tygh::$app['mailer'];

      $mailer->send(
        array(
           'to' => $to,
           'from' => $_from,
           'reply_to' => $reply_to,
           'data' => array(
               'body' => $body,
               'subject' => $subj
           ),
           'attachments' => $attachments,
           'template_code' => 'newsletters_newsletter',
           'tpl' => 'addons/newsletters/newsletter.tpl',
        ),
        'C',
        $lang_code,
        array(
            'mailer_send_method' => 'smtp',
            'mailer_smtp_host' => 'example.com',
            'mailer_smtp_username' => 'username',
            'mailer_smtp_password' => 'password',
            'mailer_smtp_ecrypted_connection' => 'ssl',
            'mailer_smtp_auth' => 'Y',
        )
      );

  * The ``settings.Appearance.email_templates`` setting was added. It determines the ability to use new email templates. If the value is ``old``, then the ``\Tygh\Mailer\Mailer`` component will ignore ``template_code``. The new mechanism is disabled by default in the stores that previously worked on an older version of CS-Cart/Multi-Vendor. Store owners can enable the new mechanism in the settings manually.
        
  * The export and import of email notification templates were implemented.
       
  * All the existing hooks are preserved.

===============
Document Editor
===============

The new mechanism of working with documents (such as invoices, packing slips, gift certificates, etc.) was implemented:

* A visual editor for modifying documents was added.

* Document templates are stored in the ``cscart_template_documents`` table of the database.
    
* The ``include_doc`` Twig function was implemented to include the document into the email body.
   
* Snippets were implemented to store complicated logic.

* The export and import of document templates were implemented.

* All the necessary program components and mechanisms for adding your own documents, snippets, and variables were implemented.

==========================
Themes Functioning Changes
==========================

------------------
Theme Dependencies
------------------

If theme X has theme Y specified in the ``parent_theme`` field of the **manifest.json** file, then we say that theme X is the **dependent theme**, and theme Y is the **parent theme**.

The dependent theme contains only that files that differ from the files of the parent theme.

Dependent themes use the content (templates, logos, etc.) of the parent theme, when necessary.

* The *css*, *media* and *templates* folders of the parent and the dependent theme will be merged in runtime.

  * If a file is missing in the dependent theme, the corresponding file from the parent theme will be used instead.

  * If the dependent theme has files that are missing in the parent theme (for example, product and product list templates, block wrappers, static templates), they will be listed together with the files of the parent theme.

  * If a file is present both in the dependent theme and in the parent theme, the file of the dependent theme will be preferred.

* The *layouts* and *styles* folders of the themes won't be merged.

  * If the dependent theme has its own layouts, only they will be used. Otherwise, the layouts of the parent theme will be used.

  * Styles will be used only from the dependent theme.

* Images can be loaded from the parent theme by using the ``$images_dir`` variable. 

  * If the theme has a parent, using ``$images_dir`` in Smarty templates will point to the *media/images* directory of the parent theme.

  * If the theme has no parent, it will point to the theme's own *media/images* directory.

  The new ``$self_images_dir`` variable was added. Use this variable in Smarty templates to point to the theme's own *media/images* directory.

Use the following methods to operate the contents of the theme:

  * ``\Tygh\Themes\Themes::getDirContents()`` provides the contents of the specified theme directory with the exact location of each file/directory specified.

  * ``\Tygh\Themes\Themes::getContentPath()`` provides absolute and relative paths to the file.

---------------------
Upgrading Theme Files
---------------------

The Upgrade Center will not upgrade custom themes files. Only the **Responsive** and **Basic** themes will be affected when upgrading a store.

-----------------
Installing Themes
-----------------

Files of the parent theme won't be merged with the files of the dependent theme during the installation of the dependent theme. Only the files of the dependent theme will be copied from *var/themes_repository* to *design/themes*.

--------------
Cloning Themes
--------------

* If the source theme has no parent, its files won't be copied to the clone theme's directory.

  The clone theme will contain only the **manifest.json** file and the */media/images/* folder with theme logos.

  The name of the source theme be specified as ``parent_theme`` in the **manifest.json** file of the clone theme.

* If the source theme has a parent, the whole content of source theme will be copied to the directory of the clone theme.

The clone theme won't be activated automatically after creation.

-----------------------
Installing Add-on Files
-----------------------

Theme-related files (such as styles, templates, etc.) from add-ons  will be installed only for the theme they are created for, and not for themes that depend on it.

For example, *var/themes_repository/responsive/templates/addons/[addon]* will be copied only to *design/themes/responsive/templates/addons/[addon]*.

Add-ons that provide template files only for the **Basic** theme will be usable only in the **Basic** theme and the themes that depend on it.

CS-Cart will not fall back to the templates of the **Basic** theme when the required templates are missing in the current theme.

------------------
Theme Translations
------------------

Ability to add translations via a theme was added. Translation files must be located in the *var/themes_repository/[theme_name]/langs/* directory and must be named **[language_code].po**.

The ``default_language`` field was added to the theme's **manifest.json** to specify the theme's default language::

  "default_language": "en"

The default language will be used to provide translations for all languages the theme is not translated to.

When no ``default_language`` is specified, there are two possible scenarios:

* If the *langs* directory contains the PO file for the default language of the store's Administration panel, it will be used as the default language.

* Otherwise the first file in *langs* directory will be used to provide default translations.

================
Shipping Changes
================

The new ``getInfo()`` method can be used when creating real-time shipping service classes to provide the name of the carrier and the tracking URL. For example::

  class SamplePost implements IService
  {
      /* ... */

      public static function getInfo()
      {
          return array(
              'name' => __("carrier_sample_post"),
              'tracking_url' => 'http://example.com/tracking_number=%s'
              // %s will be replaced with the tracking number
          );
      }

      /* ... */
  }

=======================
New PHP Libs (Composer)
=======================

* twig/twig

* twig/extensions

* tijsverkoyen/css-to-inline-styles

============
Hook Changes
============

---------
New Hooks
---------

#. This hook allows you to change the message before sending it::
   
     fn_set_hook('mailer_send_pre', $this, $transport, $message, $area, $lang_code);

#. This hook allows you to check the result of sending the message::

     fn_set_hook('mailer_send_post', $this, $transport, $message, $result, $area, $lang_code);

#. This hook allows you to change the name of the email template::

     fn_set_hook('template_email_get_name', $this, $name); 

#. This hook allows you to perform additional actions after deleting an email template::

     fn_set_hook('template_email_remove_post', $this, $template);

#. This hook allows you to change the name of the document template::

     fn_set_hook('template_document_get_name', $this, $result);

#. This hook allows you to perform additional actions after deleting a document template::

     fn_set_hook('template_document_remove_post', $this, $document);

#. This hook allows you to change the context of documents of the ``order`` type::

     fn_set_hook('template_document_order_context_init', $this, $order);

#. This hook allows you to perform additional actions after importing a snippet::

     fn_set_hook('template_snippet_import', $this, $data, $snippet, $result); 

#. This hook allows you to change snippet data before the export::

     fn_set_hook('template_snippet_export', $this, $snippet, $result);

#. This hook allows you to perform additional actions after saving a snippet::

     fn_set_hook('template_snippet_save_post', $this, $snippet, $lang_code);

#. This hook allows you to perform additional actions after changing the status of a snippet::

     fn_set_hook('template_snippet_update_status_post', $this, $snippet, $new_status);

#. This hook allows you to perform additional actions after deleting a snippet template::

     fn_set_hook('template_snippet_remove_post', $this, $snippet);

#. This hook allows you to affect snippet rendering::

     fn_set_hook('template_snippet_render_pre', $snippet, $context, $variable_collection); 

#. This hook allows you to affect the results of snippet rendering::

     fn_set_hook('template_snippet_render_post', $snippet, $context, $variable_collection, $result);

-------------
Changed Hooks
-------------

#. 

  ::

    // old:
    fn_set_hook('url_pre', $url, $area, $protocol, $lang_code, $override_area);

    // new::
    fn_set_hook('url_pre', $url, $area, $protocol, $lang_code);

#. The ``$variant_id`` (int) was replaced with ``$applied_variants_ids`` (array<int>) in the following hook::

     // old:
     fn_set_hook('apply_option_modifiers_get_option_modifiers', $type, $fields, $om_join, $om_condition, $variant_id)

     // new:
     fn_set_hook('apply_option_modifiers_get_option_modifiers', $type, $fields, $om_join, $om_condition, $applied_variants_ids)

==============
Core Functions
==============

-------------
New Functions
-------------

#. Get the list of category identifiers with parent categories::

     fn_get_category_ids_with_parent($category_ids)

#. Set the ``disabled`` status for filters related to the product feature::

     fn_disable_product_feature_filters($product_feature_id)

#. Send email notification on activation for Skrill (Moneybookers)::

     fn_mb_send_activation_email($params)

#. Generate order invoice for supplier::

     fn_print_supplier_invoices($order_ids, $supplier, $pdf = false, $lang_code = CART_LANGUAGE)

#. Get the information about a shipping service::

     Tygh\Shippings\IService::getInfo()

#. Get the carrier name and a template to get a tracking URL for an Australia Post shipping method::

     Tygh\Shippings\Services\Aup::getInfo()

#. Get the carrier name and a template to get a tracking URL for a Canada Post shipping method::

     Tygh\Shippings\Services\Can::getInfo()

#. Get the carrier name and a template to get a tracking URL for a DHL shipping method::

     Tygh\Shippings\Services\Dhl::getInfo()

#. Get the carrier name and a template to get a tracking URL for a FedEx shipping method::

     Tygh\Shippings\Services\Fedex::getInfo()

#. Get the carrier name and a template to get a tracking URL for a SwissPost shipping method::

     Tygh\Shippings\Services\Swisspost::getInfo()

#. Get the carrier name and a template to get a tracking URL for a Temando shipping method::

     Tygh\Shippings\Services\Temando::getInfo()

#. Get the carrier name and a template to get a tracking URL for a UPS shipping method::

     Tygh\Shippings\Services\Ups::getInfo() 

#. Get the carrier name and a template to get a tracking URL for a USPS shipping method::

     Tygh\Shippings\Services\Usps::getInfo()

#. Get the information about all available carriers::

    Tygh\Shippings\Shippings::getCarriers()

#. Get the information about a carrier::

    Tygh\Shippings\Shippings::getCarrierInfo()

#. Display the document template::

     Tygh\SmartyEngine\Core::displayDoc($template, $to_screen = false, $company_id = null, $lang_code = CART_LANGUAGE)

#. Format the phone number for PayPal Standard::

     fn_pp_format_phone_number($number, $country, $rules = array())

#. Provide regex to validate phone number for PayPal Standard::

     fn_pp_get_phone_validation_rule($schema)

#. Get theme of specified area and company::

     \Tygh\Themes\Themes::areaFactory($area = AREA, $company_id = null)

#. Get the directories of the theme::

     \Tygh\Themes\Themes::getThemeDirs($search_options = self::USE_DEFAULT)

#. Convert absolute theme path to relative path::

     \Tygh\Themes\Themes::convertToRelativePath($path)

#. Get the contents of directory in the theme, optionally merged with the contents of the parent theme's directory::

     \Tygh\Themes\Themes::getDirContents($params = array(), $strategy = self::STR_SINGLE, $dir_type = self::PATH_ABSOLUTE, $search_options = self::USE_DEFAULT)

#. Get the path to content in the theme or in the parent theme::

     \Tygh\Themes\Themes::getContentPath($path = '', $content_type = self::CONTENT_FILE, $dir_type = self::PATH_ABSOLUTE, $search_options = self::USE_DEFAULT)

#. Get the theme's parent theme::

     \Tygh\Themes\Themes::getParent()

#. Get the path to HybridAuth provider's icon::

     fn_get_hybrid_auth_provider_icon($provider_id)

#. Get product features from imported data::

     fn_exim_parse_features($data, $features_delimiter)

#. Save a product feature::

     fn_exim_save_product_feature(array $feature, $company_id, $lang_code)

#. Save the values of features of a product::

     fn_exim_save_product_features_values($product_id, array $features, $lang_code)

#. Find product feature by params::

     fn_exim_find_feature($name, $type, $group_id, $lang_code, $company_id = null)

#. Set styles manifest data::

     \Tygh\Themes\Styles::setManifest($manifest_data)

#. Save styles manifest file::

     \Tygh\Themes\Styles::saveManifest()

#. Set styles schema data::

     \Tygh\Themes\Styles::setSchema($schema_data)

#. Save styles schema file::

     \Tygh\Themes\Styles::saveSchema()

#. Export data using a pattern::

     fn_export($pattern, $export_fields, $options)

#. Process a CSV file using a pattern::

     fn_exim_get_csv($pattern, $file, $options)

#. Export data fields::

     fn_exim_export_fill_fields($result, $data, $processes, $pattern, $options)

#. Put data into a CSV file::

     fn_exim_put_csv($data, $options, $enclosure)

#. Import data using a pattern::

     fn_import($pattern, $import_data, $options)

#. Analyze import schema and convert fields using a pattern::

     fn_exim_analyze_schema($schema, $pattern)

#. Attach a prefix to the value::

     fn_exim_attach_value_helper($value, $key, $attachment)

#. Export an image:: 

     fn_exim_export_image($image_id, $object, $backup_path = '', $include_alt = true) 

#. Import an image pair::

     fn_exim_import_images($prefix, $image_file, $detailed_file, $position, $type, $object_id, $object)

#. Get the absolute URL of the image::

     fn_exim_get_image_url($product_id, $object_type, $pair_type, $get_icon, $get_detailed, $lang_code)

#. Get the absolute URL to the detailed image::

     fn_exim_get_detailed_image_url($product_id, $object_type, $pair_type, $lang_code)

#. Get the pattern definition by its ID::

     fn_exim_get_pattern_definition($pattern_id, $get_for = '')

#. Get all the patterns available for the section::

     fn_exim_get_patterns($section, $get_for)

#. Sort patterns:

     fn_exim_sort_patterns($a, $b)

#. Check if an admin has rights to use this pattern::

     fn_exim_check_pattern_permissions($pattern, $get_for, $user_id)

#. Get a product URL::

     fn_exim_get_product_url($product_id, $lang_code = '')

#. Convert price to its representation with the selected decimal separator::

     fn_exim_export_price($price, $decimals_separator)

#. Convert price to float with dot as the decimal separator:: 

     fn_exim_import_price($price, $decimals_separator)

#. Call the functions with the necessary parameters specified in the ``processing`` array::

     fn_exim_processing($type_processing, $processing, $options, $vars = array())

#. Get the parameters for building exported fields::

     fn_exim_export_build_retrieved_fields(&$processes, &$table_fields, &$pattern, $export_fields)

#. Get the array of table joins::

     fn_exim_export_build_joins($pattern, $options, $primary_key, $langs)

#. Form an array of conditions based on the passed fields and values::

     fn_exim_export_build_conditions($pattern, $options)

#. Add quotes for string values::

     fn_exim_set_quotes($value, $quote = "'")

#. Add quotes for values::

     fn_exim_quote(&$value, $quote = "'")

#. Get the values of the parameters for functions::  

     fn_exim_get_values($values, $pattern, $options, $vars = array(), $data = array(), $quote = "'")

#. Form groups of the field parameters::

     fn_exim_import_build_groups($type_group, $export_fields)

#. Call functions with the parameters specified in the ``groups`` array::

     fn_exim_import_prepare_groups(&$data, $groups, $options, $skip_record = false)

#. Parse language of the imported fields:: 

     fn_exim_import_parse_languages($pattern, &$import_data, $options)

#. Change ``company_id`` in the table specified as ``object_type``::

     fn_exim_set_company($object_type, $object_key, $object_id, $company_name) 

#. Wrap string values into quotes and removes commas::

     fn_exim_wrap_value($value, $enclosure = '"', $delimiter = ',')

#. Add current ``company_id`` as altkey::

     fn_exim_apply_company($pattern, &$alt_keys, &$object, &$skip_get_primary_object_id)

#. Convert a human-readable date to a timestamp::

     fn_date_to_timestamp($date)

#. Convert a timestamp to a human-readable date::

     fn_timestamp_to_date($timestamp)

#. Find a file and get the real path to it::

     fn_find_file($prefix, $file)

#. Get the amount of a product in stock:: 

     fn_get_product_amount($product_id)

#. Replace the width of the location, container, grid of the XML layout with the width of the layout itself::

     \Tygh\BlockManager\Exim::setLayoutElementsWidth()

#. Replace the widths of containers and grids of the given layout with the width of this layout::

     \Tygh\BlockManager\Layout::setLayoutElementsWidth() 

#. Get the status of the order. If the order is a parent order, the status of the its first child will be returned (used in the PayPal Payments add-on)::

     fn_pp_get_order_status($order_info)

#. Update customer notes of the order (used in the PayPal Payments add-on)::

     fn_pp_set_customer_notes($order_id, $customer_notes)

#. Get the path to translations for the specified language:: 

     \Tygh\Themes\Themes::getPoPath($lang_code)

#. Get the default language of the theme::

     \Tygh\Themes\Themes::getDefaultLanguage() 

#. Get translations from theme files::

     \Tygh\Themes\Themes::getLanguageValues($only_originals = false, $languages = array()) 

#. Install theme translations:: 

     \Tygh\Themes\Themes::installTranslations($languages = array())

--------------------
New Smarty Modifiers
--------------------

* ``sanitize_html``—sanitizes HTML from any XSS code. Usage::

    {$html|sanitize_html}

-----------
New Classes
-----------

#.  ``\Tygh\Mailer\Mailer``—responsible for sending email messages. It is the replacement of the old ``\Tygh\Mailer`` class. An instance of the class is available from the ``Tygh::$app['mailer']`` container.

#. ``\Tygh\Mailer\Message``—the DTO class for a message.

#. ``\Tygh\Mailer\IMessageBuilder``—the interface of the class responsible for building a message from the parameters.

#. ``\Tygh\Mailer\IMessageBuilderFactory``—the interface of the class factory responsible for creating the message builder object.

#. ``\Tygh\Mailer\ITransport``—the interface of the class responsible for sending the message.

#. ``\Tygh\Mailer\ITransportFactory``—the interface of the class factory responsible for creating the message sender object.

#. ``\Tygh\Mailer\AMessageBuilder``—the base abstract class of the message builder.

#. ``\Tygh\Mailer\MessageBuilders\FileTemplateMessageBuilder``—the class responsible for building a message based on the Smarty template files.

#. ``\Tygh\Mailer\MessageBuilders\DBTemplateMessageBuilder``—the class responsible for building a message based on the Twig templates from the database.

#. ``\Tygh\Mailer\MessageBuilders\DefaultMessageBuilder``—the class responsible for building the message based on the message parameters only. 

   This class is used when the message body is passed in the parameters.

#. ``\Tygh\Mailer\Transports\PhpMailerTransport``—the class responsible for sending the message. To preserve backward compatibility, this class is the extension of ``\PHPMailer``.

#. ``\Tygh\Mailer\MailerException``—the exception class that is specific to Mailer. 

#. ``\Tygh\Mailer\MessageBuilderFactory``—the class factory responsible for creating message builder objects.

#. ``\Tygh\Mailer\MessageStyleFormatter``—the class responsible for converting CSS styles of the message.

#. ``\Tygh\Mailer\TransportFactory``—the class responsible for creating the sender object.

#. ``\Tygh\Mailer\SendResult``—the DTO class for sending the result.

#. ``\Tygh\Twig\TwigCoreExtension``—the extension class for the Twig template engine; it implements basic filters and functions.

#. ``\Tygh\Twig\TwigCacheFilesystem``—the class that extends the standard Twig class for template caching; it solves problems with file permissions.

#. ``\Tygh\Twig\TwigEnvironment``—the class that extends the standard Twig class and adds the ability to render a template from a string.

#. ``\Tygh\Template\Collection``—the class that allows creating collections of objects.

#. ``\Tygh\Template\IVariable``—the base interface for the variables of documents and snippets.

#. ``\Tygh\Template\IActiveVariable``—the extended interface for the variables of documents and snippets. It allows a variable to use its own meta data.

#. ``\Tygh\Template\IContext``—the interface for the context of documents and snippets.

#. ``\Tygh\Template\ITemplate``—the interface for the templates of documents, snippets, and email notifications.

#. ``\Tygh\Template\ObjectFactory``—the factory class that implements the logic of object creation based on the object schema.

#. ``\Tygh\Template\Renderer``—the class that implements the logic of template rendering.

#. ``\Tygh\Template\VariableCollectionFactory``—the factory of variable collections; it implements the logic of creating collections of variables based on a schema.

#. ``\Tygh\Template\VariableMetaData``—the class that provides access to the meta data of a variable.

#. ``\Tygh\Template\VariableProxy``—the class that implements delayed initialization of variables.

#. ``\Tygh\Template\Document\Document``—the entity class of a document template.

#. ``\Tygh\Template\Document\IType``—the interface for the document type.

#. ``\Tygh\Template\Document\IIncludableType``—the interface for the document type that allows to include the document into email notification templates.

#. ``\Tygh\Template\Document\IPreviewableType``—the interface for the document type that implements the ability to preview the document.

#. ``\Tygh\Template\Document\TypeFactory``—the factory class of document types.

#. ``\Tygh\Template\Document\Repository``—the repository class that implements the logic of interaction with the storage for document templates.

#. ``\Tygh\Template\Document\Service``—the service class that implements the logic of document template management.

#. ``\Tygh\Template\Document\Exim``—the class that implements the logic of export and import of document templates.

#. ``\Tygh\Template\Document\Order\Context``—the context class for the documents with the ``order`` type (Invoice, Order summary).

#. ``\Tygh\Template\Document\Order\Order``—the proxy class that serves to retrieve data about the order.

#. ``\Tygh\Template\Document\Order\Type``—the class that implements the order document type.

#. ``\Tygh\Template\Document\Order\Variables\OrderVariable``—the class of the order variable; it allows access to order data in the document editor.

#. ``\Tygh\Template\Document\PackingSlip\Context``—the context class for the documents of the ``packing_slip`` type.

#. ``\Tygh\Template\Document\PackingSlip\Type``—the class that implements the ``packing_slip`` document type.

#. ``\Tygh\Template\Document\Variables\CompanyVariable``—the class of the company variable; it allows access to company data in the document editor.

#. ``\Tygh\Template\Document\Variables\GenericVariable``—the class that allows you to specify the variables available in the document editor with a schema, without the need to create separate classes.

#. ``\Tygh\Template\Document\Variables\RuntimeVariable``—the class of the runtime variable; it allows access to environment data.

#. ``\Tygh\Template\Document\Variables\SettingsVariable``—the class of the settings variable; it allows access to the store’s settings.

#. ``\Tygh\Template\Mail\Context``—the context class for email notifications.

#. ``\Tygh\Template\Mail\Repository``—the repository class that implements the logic of interaction with the storage for email templates.

#. ``\Tygh\Template\Mail\Service``—the service class that implements the logic of email template management.

#. ``\Tygh\Template\Mail\Template``—the entity class of an email template.

#. ``\Tygh\Template\Mail\Exim``—the class that implements the logic of import and export of email templates.

#. ``\Tygh\Template\Snippet\Snippet``—the entity class of the snippet template.

#. ``\Tygh\Template\Snippet\Service``—the service class that implements the logic of snippet template management.

#. ``\Tygh\Template\Snippet\Repository``—the repository class that implements the logic of interaction with the storage for snippet templates.

#. ``\Tygh\Template\Snippet\Exim``—the class that implements the logic of import and export of snippet templates.

#. ``\Tygh\Template\Snippet\Table\Column``—the entity class of a table column.

#. ``\Tygh\Template\Snippet\Table\ColumnRepository``—the repository class that implements the logic of interaction with the storage for column templates.

#. ``\Tygh\Template\Snippet\Table\ColumnService``—the service class that implements the logic of table column management.

#. ``\Tygh\Template\Snippet\Table\ItemContext``—the context class for an item represented in a table.

#. ``\Tygh\Template\Snippet\Table\ProductVariable``—the class of the product variable; it allows access to product data.

#. ``\Tygh\Template\Snippet\Table\TableVariable``—the class of the table variable that allows access to the table.

#. ``\Tygh\Providers\CommonProvider``—the provider class that registers common components.

#. ``\Tygh\Providers\TemplateProvider``—the provider class that registers components for working with the templates of documents, email notifications, and snippets.

#. ``\Tygh\Providers\MailerProvider``—the provider class that registers the components for sending messages in the Tygh::$app container.

#. ``\Tygh\Providers\TwigProvider``—the provider class that registers the twig component in the Tygh::$app container.

-----------------
Changed Functions
-----------------

#. ``fn_rma_print_packing_slips`` will now return the result instead of writing it straight to the output stream.

#. ``fn_show_postal_card`` will now return the result instead of writing it straight to the output stream.

#. ``fn_print_order_invoices()`` will now return the result instead of writing it straight to the output stream.

#. ``fn_print_order_packing_slips()`` will now return the result instead of writing it straight to the output stream.

#. ``fn_print_shipment_packing_slips()`` will now return the result instead of writing it straight to the output stream.

#.

  ::

    // old:
    function fn_url($url = '', $area = AREA, $protocol = 'current', $lang_code = CART_LANGUAGE, $override_area = false)

    // new:
    function fn_url($url = '', $area = AREA, $protocol = 'current', $lang_code = CART_LANGUAGE)

#.

  ::

    // old:
    function fn_rma_print_packing_slips($return_ids, $auth, $area = AREA)

    // new:
    function fn_rma_print_packing_slips($return_ids, $auth, $area = AREA, $lang_code = CART_LANGUAGE)

#.

  ::

    // old:
    function fn_show_postal_card($gift_cert_data, $stored_products = array())

    // new:
    function fn_show_postal_card($gift_cert_data, $stored_products = array(), $lang_code = CART_LANGUAGE)

#.

  ::

    // old:
    function fn_get_rma_returns($params, $items_per_page = 0)

    // new:
    function fn_get_rma_returns($params, $items_per_page = 0, $lang_code = CART_LANGUAGE)

#.

  ::

    // old:
    function fn_send_return_mail(& $return_info, & $order_info, $force_notification = array())

    // new:
    function fn_send_return_mail(&$return_info, &$order_info, $force_notification = array(), $area = AREA)

#.

  ::

    // old:
    function fn_print_order_invoices($order_ids, $pdf = false, $area = AREA, $lang_code = CART_LANGUAGE)

    // new:
    function fn_print_order_invoices($order_ids, $params = array())

#.

  ::

    // old:
    function fn_get_order_info($order_id, $native_language = false, $format_info = true, $get_edp_files = false, $skip_static_values = false)

    // new:
    function fn_get_order_info($order_id, $native_language = false, $format_info = true, $get_edp_files = false, $skip_static_values = false, $lang_code = CART_LANGUAGE)

#.

  ::

    // old:
    function fn_get_simple_statuses($type = STATUSES_ORDER, $additional_statuses = false, $exclude_parent = false, $lang_code = DESCR_SL)

    // new:
    function fn_get_simple_statuses($type = STATUSES_ORDER, $additional_statuses = false, $exclude_parent = false, $lang_code = CART_LANGUAGE)

#.

  ::

    // old:
    function fn_install_addon_templates($addon_name)

    // new:
    function fn_install_addon_templates($addon_name, $target_themes = array())

#.

  ::

    // old:
    fn_exim_find_feature_id($name, $type, $group_id, $lang_code)

    fn_exim_find_feature_id($name, $type, $group_id, $lang_code, $company_id = null)

#.

  ::
   
    // old:
    fn_exim_find_feature_group_id($name, $lang_code)

    // new:
    fn_exim_find_feature_group_id($name, $lang_code, $company_id = null)

#.

  ::

    // old:
    fn_put_csv($data, $options, $enclosure)

    // new:
    fn_exim_put_csv($data, $options, $enclosure)

#.

  ::

    // old:
    fn_export_image($image_id, $object, $backup_path = '', $include_alt = true)

    // new:
    fn_exim_export_image($image_id, $object, $backup_path = '', $include_alt = true)

#.

  ::

    // old:
    fn_import_images($prefix, $image_file, $detailed_file, $position, $type, $object_id, $object)

    // new:
    fn_exim_import_images($prefix, $image_file, $detailed_file, $position, $type, $object_id, $object)

#.

  ::

    // old:
    fn_import_build_groups($type_group, $export_fields)

    // new:
    fn_exim_import_build_groups($type_group, $export_fields)

#.

  ::

    // old:
    fn_get_csv($pattern, $file, $options)

    // new:
    fn_exim_get_csv($pattern, $file, $options)

#.

  ::

    // old:
    fn_get_pattern_definition($pattern_id, $get_for = '')

    // new:
    fn_exim_get_pattern_definition($pattern_id, $get_for = '')

#.

  ::

    // old:
    fn_export_fill_fields(&$result, $data, $processes, $pattern, $options)

    // new:
    fn_exim_export_fill_fields(&$result, $data, $processes, $pattern, $options)

#.

  ::

    // old:
    fn_analyze_schema(&$schema, $pattern)

    // new:
    fn_exim_analyze_schema(&$schema, $pattern)

#.

  ::

    // old:
    fn_attach_value_helper(&$value, $key, $attachment)

    // new:
    fn_exim_attach_value_helper(&$value, $key, $attachment)

#.

  ::

    // old:
    fn_get_patterns($section, $get_for)

    //new:
    fn_exim_get_patterns($section, $get_for)

#.

  ::

    // old:
    fn_sort_patterns($a, $b)

    // new:
    fn_exim_sort_patterns($a, $b)

#.

  ::

    // old:
    fn_check_pattern_permissions($pattern, $get_for, $user_id)

    // new:
    fn_exim_check_pattern_permissions($pattern, $get_for, $user_id)

#.

  ::

    // old:
    fn_export_build_retrieved_fields(&$processes, &$table_fields, &$pattern, $export_fields)

    // new:
    fn_exim_export_build_retrieved_fields(&$processes, &$table_fields, &$pattern, $export_fields)

#.

  ::

    // old:
    fn_export_build_joins($pattern, $options, $primary_key, $langs)

    // new:
    fn_exim_export_build_joins($pattern, $options, $primary_key, $langs)

#.

  ::

    // old:
    fn_export_build_conditions($pattern, $options)

    // new:
    fn_exim_export_build_conditions($pattern, $options)

#.

  ::

    // old:
    fn_import_parse_languages($pattern, &$import_data, $options)

    // new:
    fn_exim_import_parse_languages($pattern, &$import_data, $options)

#. ``\Tygh\Themes\Styles::getStylesPath()`` was made public.

#. ``\Tygh\Themes\Styles::getStylesDir()`` was made public.
