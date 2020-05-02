*******
Schemes
*******

A scheme is a special file describing certain object structure. There are schemes for :doc:`blocks <front-end/blocks/index>`, settings, promotions, etc. All schemes are stored in the *schemas* directory (*...app/schemas*). 

An add-on can extend and override a scheme fully or partially (:doc:`learn more <../addons/scheme_extending>`).

What is a scheme
================

A scheme contains data structure, that can be used by some other entity when processing the actions, defined by this scheme. For example, exim (export/import) is not attached to some particular item (product, page, etc.), and all its exported/imported data are described by a scheme.

Scheme types
============

There are three scheme types: **data array**,  **XML-structure**, and **set of functions**. They cannot be mixed with each other (for example, it is impossible to describe data and functions in the same script).

Data array
++++++++++

A scheme returns an array. For example:

*   *app/schemas/permissions/admin.php*
*   *app/schemas/clone/objects.php*
*   *app/schemas/sharing/schema.php*

::
        
    <?php
     return array(
        'layouts' => array(
             'checked_by_default' => true,
            'function' => 'fn_clone_layouts'
        ),
        'settings' => array(
            'checked_by_default' => true,
            'tables' => array(
                array(
                    'name' => 'settings_vendor_values',
                    'key' => '', // Do not needed
                 ),
             ),
        ),
        // Some other code
    );
    ?>

XML-structure
+++++++++++++

A scheme is an ordinary text file, which content is read by ``fn_get_contents``. Now it is treated as out of date and is not used in the core.

::

    <menu>
        <items>
            <subitems>
                ....
            <subitems>
        </items>
    </menu>


Set of functions
++++++++++++++++

Functions are decribed in such schemes. In most cases a scheme with functions is an addition to a scheme with data array. Than, it is not necessary to call this scheme separately. It is possible to include it with the help of ``include_once`` at the very beginning of a file. If a scheme is a separate one (actions and variants in settings, for example), it is included as usual: ``fn_get_schema("settings", "actions.functions")``.

*   *app/schemas/exim/products.functions.php*
*   *app/schemas/last_view/frontend.functions.php*

::

    <?php
    function fn_some_scheme_func1($params)
    {
         ...
     }

    function fn_some_scheme_func2()
    {
         ...
    }
    ?>

Scheme extending
================

There are two ways of extending - with the help of add-ons and with the help of editing tags.

Add-ons
+++++++

To extend a scheme with the help of add-on, in the add-on catalog create the same directories and files structure as for the scheme. And add the *.post* suffix to a file name. For example, the path to the main file: 

*   *app/schemas/permissions/admin.php*
  
And the path to the extending file:

*   *app/addons/seo/schemas/permissions/admin.post.php*

When including the extending scheme, the ``$schema`` variable is passed into it. This variable contains extending data. The script works with this variable and returnes it at the end.

Example::

    <?php
    // $schema already contains data returned by the main scheme
    $schema['news'] = array(
        'modes' => array(
            'manage' => array(
                'permissions' => 'manage_news'
            )
        )
    );
    return $schema;

:doc:`Here <../addons/scheme_extending>` you can find more information on how to extend a scheme with an add-on.

Editing tags
++++++++++++

Editing tags are used to form necessary scheme data depending on edition (Ultimate or Multi-Vendor). To extend a scheme with the editing tag, create the *schema_[PRODUCT_EDITION]* file in the scheme directory. For example, the path to the main file:

*   *app/schemas/permissions/admin.php*

And the path to the editing tag file:

*   *app/schemas/permissions/admin_ultimate.php*

The ``$schema`` variable is used here too. It contains extending data. The script works with this variable and returnes it at the end.

How to get the scheme data
==========================

Use the ``fn_get_schema`` function to get the scheme data::

    function fn_get_schema($schema_dir, $name, $type = 'php', $force_addon_init = false)

Where:

*   ``$schema_dir`` - scheme subdirectory relatively the *schemas* directory (*permissions*, *settings*).
*   ``$name`` - scheme file name without extension (*admin*, *schema*). If a scheme type is a function, the name will be as follows: *actions.functions*, *variants.functions*. 
*   ``$type`` - scheme type (file extension) - *php* or *xml*. 
*   ``$force_addon_init`` - indicates that disabled add-ons and their *func.php* files must be taken into account when including a scheme.

During the scheme request the whole scheme tree is build including schemes of the add-ons.

Example::

    $menu = fn_get_schema('menu', 'menu', 'php');

*   Searching for the main scheme file: */app/schemas/menu/menu.php*. It can be also placed in the add-on directory: *addons/my_addon/app/schemas/xxx/yyy.php*. Than, it will be included with the help of following function: ``fn_get_schema('xxx', 'yyy')``.

*   Checking add-on schemes for additions:

    *   *app/addons/access_restrictions/schemas/menu/menu.post.php*
    *   *app/addons/attachments/schemas/menu/menu.post.php*
    *   *app/addons/banners/schemas/menu/menu.post.php*
    *   *app/addons/data_feeds/schemas/menu/menu.post.php*
    *   *app/addons/news_and_emails/schemas/menu/menu.post.php*, etc.

*   Adding the scheme to cache. So, it will not be necessary to scan all directories at the next request.

*   Including the found files one by one. As a result we have the complete scheme, including all add-on schemes.
