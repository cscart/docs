***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.17.1
***********************************************

.. contents::
    :local:
    :backlinks: none

==============
Common changes
==============

* Phinx library was updated to version **0.12.9**. Note that migrations don't support Query Builder because we need to support MySQLi.
* Htmlpurifier library was updated to version **4.15.0**.
* Imagine library was updated to version **1.3.0**.
* Pimple library was updated to version **3.5.0**.
* Twig library was updated to version **2.14.10**.
* CssToInlineStyles library was updated to version **2.2.4**.
* Console library was updated to version **4.4.49**.
* Lock library was updated to version **5.4.21**.
* Collect library was updated to version **8.68.0**.
* Process library was updated to version **5.4.21**.
* McryptCompat library was updated to version **2.0.3**.
* CssSelector library was updated to version **5.4.21**.
* Phpunit library was updated to version **8.5.33**.
* Paratest library was updated to version **4.0.0**.
* ComposerPatches library was updated to version **1.7.0**.
* Dbunit library was updated to version **5.2.1**.


============
Core Changes
============

---------------------------------------------------
Vendor name, city, and address are now translatable
---------------------------------------------------

Previously, vendor name, city, and address were only displayed in one language. We added the ability to translate them. The translations appear instead of original names on some storefront pages, in customer notifications, and in some documents.

The ``company_descriptions`` table now has new fields:

* ``i18n_company``—Translated Vendor name

* ``i18n_city``—Translated Vendor city

* ``i18n_address``—Translated Vendor address

Administrators can translate the vendor name, city, and address just like any other fields. To do that, switch to the required content language on the vendor editing page.

When Vendor information is saved, now only the following fields are filled with the selected language:``i18n_company, i18n_city, i18n_address``. General fields are only filled, if the content's language matches the Vendor's language.

Translated fields are displayed now on main pages of the storefront, in customer notifications, and in some documents. The general fields ``company, city, address`` of the ``companies`` table are used on the Admin panel, in the Shipping information, and in other elements where the translation is not yet implemented.

You can show the translated vendor data in add-ons and your custom elements. To do that, we've added parameters ``use_i18n_fields`` and ``use_i18n_company_fields`` to the following functions:

* fn_get_companies
* fn_get_company_data
* fn_get_company_name
* fn_get_company_placement_info

-----------------
Changed functions
-----------------

#. ::

        // Old:
        \Tygh\Template\Document\Order\Order::__construct($order_id, $lang_code = DESCR_SL, $currency_code = '')
        // New:
        \Tygh\Template\Document\Order\Order::__construct($order_id, $lang_code = DESCR_SL, $currency_code = '', array $params = [])
     

#. ::

        // Old:
        \Tygh\Template\Document\Order\Type::renderById($order_id, $code, $lang_code, $currency_code = '', $area = AREA)
        // New:
        \Tygh\Template\Document\Order\Type::renderById($order_id, $code, $lang_code, $currency_code = '', $area = AREA, array $order_params = [])
     

#. ::

        // Old:
        \Tygh\Mailer\AMessageBuilder::getCompany($company_id, $lang_code)
        // New:
        \Tygh\Mailer\AMessageBuilder::getCompany($company_id, $lang_code, $area = '')
     

#. ::

        // Old:
        function fn_get_order_info($order_id, $native_language = false, $format_info = true, $get_edp_files = false, $skip_static_values = false, $lang_code = CART_LANGUAGE)
        // New:
        function fn_get_order_info($order_id, $native_language = false, $format_info = true, $get_edp_files = false, $skip_static_values = false, $lang_code = CART_LANGUAGE, array $extra_params = [])
     

#. ::

        // Old:
        function fn_get_company_name($company_id, $zero_company_name_lang_var = '')
        // New:
        function fn_get_company_name($company_id, $zero_company_name_lang_var = '', $lang_code = DESCR_SL, array $params = [])
     
 
#. ::

        // Old:
        function fn_get_company_placement_info($company_id, $lang_code = null)
        // New:
        function fn_get_company_placement_info($company_id, $lang_code = null, array $params = [])
     

#. ::

        // Old:
        function fn_get_product_data($product_id, &$auth = [], $lang_code = CART_LANGUAGE, $field_list = '', $get_add_pairs = true, $get_main_pair = true, $get_taxes = true, $get_qty_discounts = false, $preview = false, $features = true, $skip_company_condition = false, $feature_variants_selected_only = false)
        // New:
        function fn_get_product_data($product_id, &$auth = [], $lang_code = CART_LANGUAGE, $field_list = '', $get_add_pairs = true, $get_main_pair = true, $get_taxes = true, $get_qty_discounts = false, $preview = false, $features = true, $skip_company_condition = false, $feature_variants_selected_only = false, array $params = [])
     
#. ::

        // Old:
        function fn_allow_place_order(&$cart, $auth = null, $parent_order_id = null)
        // New:
        function fn_allow_place_order(array &$cart, array $auth = [], $parent_order_id = null)

--------------------------------------------------------
Google Fonts for your Theme should be stored locally now
--------------------------------------------------------

If you develop themes for CS-Cart, this change will be important for you. A court in Munich, Germany declared that using Google Fonts stored on Google servers isn't compliant with the GDPR (a European law on data protection and privacy). Some store owners already received complaints, asking for money or threatening to go to court.

That's why we've made the CS-Cart standard themes store Google Fonts locally. You should do it for your themes as well. Here's how:

#. Upload the fonts to the theme's **/media/fonts/** directory. 

#. Change the path to the font to a local one in your .css and .less files.

Common Google Fonts usage:

::

        @font-face {
        font-family: 'Open Sans';
        font-style: normal;
        font-weight: normal;
        font-display: swap;
        src: local('Open Sans'), local('OpenSans'), url(//fonts.gstatic.com/s/opensans/v20/mem8YaGs126MiZpBA-U1Vw.woff2) format('woff2');
        }

The new Google Fonts usage, with fonts saved locally in **design/themes/responsive/media/fonts/mem8YaGs126MiZpBA-U1Vw.woff2**:

::

        @font-face {
        font-family: 'Open Sans';
        font-style: normal;
        font-weight: normal;
        font-display: swap;
        src: local('Open Sans'), local('OpenSans'), url(../media/fonts/mem8YaGs126MiZpBA-U1Vw.woff2) format('woff2');
        }

-----------------------------------------
New placeholder to build database Queries
-----------------------------------------

**?t**

This placeholder converts data to a fractional number with triple precision.

Accepted data: string, number

Example usage:

::

        $product_weight = '1.120';
        db_query('SELECT * FROM ?:shippings WHERE min_weight >= ?t', $product_weight);

Resulting query::

        SELECT * FROM cscart_shippings WHERE min_weight >= 1.120;


============
Hook Changes
============

---------
New Hooks
---------

::

        fn_set_hook('update_product_before_update', $_data, $product_info, $product_id, $lang_code); 
    
Executes before product updating, allows changing data.

================
Template changes
================

-----------------------
Deleted duplicate hooks
-----------------------

::

        index:simple_dashboard

---------
New hooks
---------

::

        index:simple_dashboard_content
