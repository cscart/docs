===================================
Adapting Add-on from CS-Cart 3 to 4
===================================

Addons for CS-Cart 3 are highly compatible with CS-Cart 4.

.. note::

    For most add-ons, it is not necessary to go through every step described below.

    Though, it is recommended to look over the whole list and refer to it during the adaptation routine.

.. note::

    CS-Cart 4 can automatically rebuild your template cache as you edit your templates. Activate the **Rebuild cache automatically** setting under **Design → Template editor** in your admin panel.

    You can also clean up the template cache manually. In order to do it, follow this link in your browser: **http://www.your_domain.com/admin.php?ctpl**, where **www.your_domain.com** is the address of your store and **admin.php** is a script file for the administration panel of your store (it should be `renamed <http://kb.cs-cart.com/adminarea-protection>`__ for security reasons).

.. hint::

    The **eDost** add-on is a good example of how things work in CS-Cart 4. Use it as a live referrence model.

Addon Folder
============

*   Move the add-on folder from ``addons`` to ``app/addons`` (according to the new folder structure)

addon.xml
=========

*   Language code is now spelled with lower-case letters: ``EN`` → ``en``, ``RU`` → ``ru``

config.local.php
================

*   Localizations are disabled by default in CS-Cart 4. To activate them, set the ``disable_localizations`` param to ``false``::

        'disable_localizations' => false,

PHP
===

*   Replace tabs with 4 spaces (according to the PSR standards)

*   If any pre or post controllers are used, they should reside in the **app/controllers/backend** and **app/controllers/frontend** directories for the admin area and the storefront respectively.

    See the new directory structure desciption.

*   If any core classes are used, define the namespace ``Tygh`` at the beginning of the file, e.g.::

        use Tygh\Registry;
        use Tygh\Http;
        use Tygh\Session;

    Example:

    If in the code you use::

        $my_settings = Registry::get('addons.myaddon');

    then you should insert the following line at the beginning of the file::

        use Tygh\Registry;

*   Class method calls must be renamed from *snake_notation* to *camelCaseNotation*.

    Example:

        CS-Cart 3::

            $block_scheme = SchemesManager::get_block_scheme($block['type'], array());

        CS-Cart 4::

            $block_scheme = SchemesManager::getBlockScheme($block['type'], array());

*   Replace ``Registry::getView();`` with ``Registry::get('view');``

*   At the beginning of every file, replace ``if (!defined('AREA')) { die('Access denied'); }`` with ``if (!defined('BOOTSTRAP')) { die('Access denied'); }``

*   GET and POST HTTP requests must be sent with the methods ``Http::get($url, $params)`` and ``Http::post($url, $params)`` (instead of ``fn_http_request`` and ``fn_https_request``).

    Multiple requests can be sent asynchronously with the ``Http::mget`` and ``Http::mpost`` functions.

    Example:

        ::

            $params = array(

               'user' => $user,

               'password' => Registry::get('addons.my_addon.password')

           );

           $user_profile = Http::get(

               'http://api.myserver.com/get_user_profile.php',

               $params

           );

*   Replace ``fn_get_lang_var`` with ``__`` (double underscore).

    Example:

        CS-Cart 3::

            fn_get_lang_var('myaddon_product_options');

        CS-Cart 4::

            __('myaddon_product_options');

*   Edition check is now performed with the function ``fn_allowed_for``.

    Example:

        CS-Cart 3::

            if (PRODUCT_TYPE == 'ULTIMATE')

        CS-Cart 4::

            if fn_allowed_for('ULTIMATE')

*   Replace ``PRODUCT_TYPE`` with ``PRODUCT_EDITION``

*   Replace the referrences to the ``COMPANY_ID`` constant with the Registry record ``Registry::get('runtime.company_id')``.

    Example:

        CS-Cart 3::

            COMPANY_ID
            ...
            if (defined('COMPANY_ID'))

        CS-Cart 4::

            Registry::get('runtime.company_id');
            ...
            if (Registry::get('runtime.company_id'))

*   Replace the referrences of all ``DIR_*`` constants with the respective ``Registry::get('config.dir.*')`` records.

    Example:

        CS-Cart 3::

            DIR_ROOT

        CS-Cart 4::

            Registry::get('config.dir.root')

*   Replace the referrences of the constants ``CONTROLLER``, ``MODE``, and ``ACTION`` with ``Registry::get('runtime.controller)``, ``Registry::get('runtime.mode)``, and ``Registry::get('runtime.action)`` respectively.

*   In order to support PHP 5, prepend all hook parameters with ``&``::

        fn_myaddon_place_order(&$order_id, &$order_status, &...)

*   Getting pagination data routine has changed.

    #.  The array ``$params`` must have the key ``total_items``
    #.  ``items_per_page`` (passed as the 2nd function param) values is assigned to ``$params['items_per_page']`` if it is empty

    CS-Cart 3::

        $total = db_get_field(...);

        $limit = fn_paginate($params['page'], $total, $items_per_page);

    CS-Cart 4::

        $params['total_items'] = db_get_field(...); //Get total item count

        $limit = db_paginate($params['page'], $params['items_per_page']); //Generate SQL condition to get only the necessary items

CSS, Smarty Templates, and Images
=================================

*   CSS files, TPL files, and images must now be located in the special directories.

    Admin area files:

    *   ``design/backend/css/addons/myaddon``
    *   ``design/backend/media/images/addons/myaddon``
    *   ``design/backend/templates/addons/myaddon``

    Customer area files:

    *   ``var/skins_repository/basic/css/addons/myaddon``
    *   ``var/skins_repository/basic/media/images/addons/myaddon``
    *   ``var/skins_repository/basic/templates/addons/myaddon``

*   Replace ``$lang.`` with ``__()`` (double underscore).

    Example:

        CS-Cart 3::

            {$lang.myaddon_product_options}

        CS-Cart 4::

            {__('myaddon_product_options')}

*   Replace the referrences to the ``COMPANY_ID`` constant with the Registry record ``Registry::get('runtime.company_id')``.

    Example:

        CS-Cart 3::

            $smarty.const.COMPANY_ID
            ...
            {if "COMPANY_ID"|defined}

        CS-Cart 4::

            $runtime.company_id
            ...
            {if $runtime.company_id}

*   Replace the referrences to the constants ``$controller``, ``$mode``, and ``$action`` with ``$runtime.controller``, ``$runtime.mode``, and ``$runtime.action`` respectively.

*   Use the function ``fn_generate_pagination`` to the items for the given page::

        $params = array(

            'total_items' => count($data_array),

            'items_per_page' => ,

            'page' =>

        );

        $pagination = fn_generate_pagination($params);


JavaScript
==========

*   JS files must now be located in the ``js/addons/myaddon`` directory.

*   Clear the code from the `deprecated jQuery methods <http://api.jquery.com/category/deprecated/>`_

Database
========

*   Payment methods

    *   ``cscart_payments``, the ``params`` field was renamed to ``processor_params``

    *   Full template paths must be used instead of simple template name.

    Example:

        CS-Cart 3:

        .. code-block:: sql

            INSERT INTO cscart_payments (
                payment_id,
                position,
                status,
                template,
                processor_id,
                params,
                a_surcharge,
                p_surcharge,
                payment_category
            ) VALUES (
                '1',
                '10',
                'A',
                'сc.tpl',
                '0',
                '',
                '0.000',
                '0.000',
                'tab1'
            );

        CS-Cart 4:

        .. code-block:: sql

            INSERT INTO cscart_payments (
                payment_id,
                position,
                status,
                template,
                processor_id,
                processor_params,
                a_surcharge,
                p_surcharge,
                payment_category
            ) VALUES (
                '1',
                '10',
                'A',
                'views/orders/components/payments/cc.tpl',
                '0',
                '',
                '0.000',
                '0.000',
                'tab1'
            );

        *   ``processor_params`` used instead of ``params``

        *   ``views/orders/components/payments/cc.tpl`` defined instead of ``сc.tpl`` in the ``template`` field

*   Shipping methods, ``cscart_shipping``, the ``params`` field was renamed to ``service_params``

*   An empty array passed to the ``?a`` SQL placeholder, will be compiled to the ``IN()`` expression, which will return 0 objects.

    Example:

        ::

            $product_ids = array();
            db_get_array("SELECT * FROM cscart_products WHERE product_id IN (?a)", $product_ids);

        In CS-Cart 3, this would return **all** products, in CS-Cart 4, this will return **none**.

        If you want to return all products in CS-Cart 4, you should use::

            $condition = '';

            if (!empty($product_ids)) {

                $condition = db_quote(" AND product_id IN (?a)", $product_ids);

            }

            db_get_array("SELECT * FROM cscart_products WHERE 1 $condition");

            $product_ids = array();
            db_get_array("SELECT * FROM cscart_products WHERE product_id IN (?a)", $product_ids);
