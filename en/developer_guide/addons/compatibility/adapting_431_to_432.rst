**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.3.2
**********************************************

==============
Common Changes
==============

1. All API entities now return the *HTTP/1.1 204 No Content* status after a successful ``DELETE`` request.

2. In the development mode JavaScript errors are now displayed in the document body.

3. Smarty plugin ``array_to_fields`` was added. It converts the given array to hidden HTML fields.

4. Smarty library is now required via Composer.

5. Storage type ``statics`` was renamed to ``assets``. However, backward compatibility was preserved. The storage type is set in **config.local.php**.

6. Custom PHP error handlers were implemented. They are registered in the new ``fn_init_error_handler()`` initializer function.

   * Fatal PHP errors are now caught—the *Service unavailable* page will appear in case of a fatal error in production mode.

   * Non-fatal PHP errors, warnings, and notices are caught and properly formatted now (only in development mode and if the xdebug extension is not installed).

============
Hook Changes
============

1.

  ::

    // old:
    fn_set_hook('create_seo_name_pre', $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code);

    // new:
    fn_set_hook('create_seo_name_pre', $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params);

2.

  ::

    // old:
    fn_set_hook('create_seo_name_post', $_object_name, $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code);

    // new:
    fn_set_hook('create_seo_name_post', $_object_name, $object_id, $object_type, $object_name, $index, $dispatch, $company_id, $lang_code, $params);

==============
Core Functions
==============

-------------
New Functions
-------------

1. A polyfill for PHP 5.5 ``array_column`` function::

     fn_array_column($array, $column_key, $index_key = null)

2. Return runtime ``company_id`` in any mode::

     fn_get_runtime_company_id()

3. Clear the content of the output buffers::

     fn_clear_ob()

4. Return the list of supported image formats to be used as setting variants::

     fn_get_supported_image_format_variants()

5. The ``Tygh\Tools\ImageHelper`` class was added:

   * Calculate the size for a bounding box of text written in given font::

       ImageHelper::calculateTextSize($string, FontInterface $font)

   * Calculate the coordinates of the top left corner of the layer that should be positioned on canvas using the given vertical and horizontal positions::

        ImageHelper::positionLayerOnCanvas(BoxInterface $canvas_size, BoxInterface $layer_size, $horizontal_position, $vertical_position, BoxInterface $padding = null)

   * Return the image formats supported by the current image manipulation driver. The only formats checked are **jpg**, **png** and **gif**::

        ImageHelper::getSupportedFormats()

6. Register custom error handlers::

      fn_init_error_handler()

7. Register image manipulation library object in the Application container::

      fn_init_imagine()

-----------------
Changed Functions
-----------------

1. ``fn_create_seo_name()``—the ``$params`` parameter was added:
        
   * (bool) ``$params['use_generated_paths_cache']``—determines whether to cache ``fn_get_seo_parent_path()`` calls

   *

    ::

      // old:
      function fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = '', $company_id = '', $lang_code = CART_LANGUAGE, $create_redirect = false, $area = AREA)

      // new:
      function fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = '', $company_id = '', $lang_code = CART_LANGUAGE, $create_redirect = false, $area = AREA, $params = array())

2. ``fn_get_seo_parent_path()``—the ``$use_caching`` parameter was added. It indicates whether to cache results of ``path_function`` calls::

      // old:
      function fn_get_seo_parent_path($object_id, $object_type, $company_id = 0)

      // new:
      function fn_get_seo_parent_path($object_id, $object_type, $company_id = 0, $use_caching = true)

3. ``fn_generate_seo_url_from_schema()``—the ``$company_id`` parameter was added::

       // old:
       function fn_generate_seo_url_from_schema($redirect_data, $full = true, $query_string = array())

       // new:
       function fn_generate_seo_url_from_schema($redirect_data, $full = true, $query_string = array(), $company_id = null)

4. ``fn_exim_parse_data()``—the ``$is_option`` parameter was added::

       // old:
       function fn_exim_parse_data($data, $variants_delimiter = ',', $features_delimiter = '///')

       // new:
       function fn_exim_parse_data($data, $variants_delimiter = ',', $features_delimiter = '///', $is_option = false)

5. ``fn_settings_actions_general_secure_storefront()``—renamed to ``fn_settings_actions_security_secure_storefront()``.

6. ``fn_settings_actions_general_secure_admin()``—renamed to ``fn_settings_actions_security_secure_admin()``.

--------------------
Deprecated Functions
--------------------

Deprecated functions still work, but will be removed in the next major release (CS-Cart 5.x):

1. ``fn_create_image_from_file()``

2. ``fn_check_gd_formats()``—use ``fn_get_supported_image_format_variants()`` instead

3. ``fn_parse_rgb()``—use ``Imagine\Image\Palette\RGB`` class instead

=======
Imagine
=======

Instead of our own solution, CS-Cart 4.3.2 core uses the **Imagine** library for working with images. External interfaces for working with images remained unchanged (``fn_resize_image()``, for example). But the Imagine class object is available in the ``Application`` container and can be used directly, if needed::

  /** @var $imagine Imagine\Image\ImagineInterface **/
  $imagine = Tygh::$app['image'];

  $imagine->open('/path/to/large_image.jpg')
      ->thumbnail($size, $mode)
      ->save('/path/to/thumbnail.png');

.. hint::

    Learn more about `the Imagine library <http://imagine.readthedocs.org/en/latest/>`_. 

The ``auto`` variant appeared in the ``$config['tweaks']['image_resize_lib']`` setting. This variant is used by default. It chooses the driver used for images manipulation (**Imagick**/**GD**) automatically. If you have the **php-imagick** extension installed on your server, Imagick will be used for working with images, otherwise GD will be used.

===========
Application
===========

The new ``Tygh\Application`` functionality appeared in CS-Cart 4.3.2

The Application class object is created when initializing the core in the **init.php** file. After that it is available from every part of code::

  // to get the Application object
  Tygh::$app

If the object is needed to retrieve inside a file with the namespace, the call looks like this::

  // to get the Application object inside a file with the namespace
  \Tygh::$app

Its single purpose at the moment is the IoC container that stores objects and factory anonimous functions for creating objects.

-------------
IoC Сontainer
-------------

Earlier the ``Registry`` class stored objects. It also used to store cache and other runtime-data.

::

  // before
  $smarty = Registry::get('view');

  // now
  $smarty = Tygh::$app['view'];

The main difference between the ``Application`` container and the ``Registry`` class is the lazy object initialization in ``Application``. Objects stored in a container are called *services*. In most cases they are components of a larger system and have their own area of responsibility, such as database connection, sending e-mail messages, etc.

::

  // register an object in a container using an anonymous factory function
  Tygh::$app['foo'] = function($app) {
      return new Tygh\Foo();
  };

  Tygh::$app['bar'] = function($app) {
      return new Tygh\Bar($app['foo']);
  };

  // no object was created by this moment, they will be created on demand

  // Application will return the anonymous factory function call result.
  // Besides, the Tygh\Bar class constructor will get the result of calling another factory function.
  $bar_instance = Tygh::$app['bar'];

  // the line above equals the following code:
  // $foo_instance = new Tygh\Foo();
  // $bar_instance = new Tygh\Bar($foo_instance);

  // if getting service from a container again, the same object is returned (a new one is not created).
  var_dump($bar_instance === Tygh::$app['bar']); // true

  // if we want a NEW object to be returned EACH TIME we get a service,
  // we should wrap the anonymous factory function like this when initializing service:
  Tygh::$app['cool_service'] = Tygh::$app->factory(function($app) {
     return new Tygh\CoolService();
  });

  // these are different objects
  $a = Tygh::$app['cool_service'];
  $b = Tygh::$app['cool_service'];
  $c = Tygh::$app['cool_service'];

  // apart from the mentioned methods it is possible to simply put an object to a container,
  // it is the behaviour Registry provided
  Tygh::$app['my_object'] = new Tygh\MyClass();

.. hint::

    Learn more about `advanced container usage <http://pimple.sensiolabs.org/>`_.

=======================
Backwards Compatibility
=======================

To ensure backwards compatibility, ``Registry`` redirects the ``api``, ``crypt``, ``view``, ``ajax``, and ``class_loader`` service calls to a container. 

The code that uses ``Registry::get('view|ajax|crypt|api|class_loader')`` will work as before, no modifications required. ``Application`` was added to improve system architecture and testing its components.
