*****************
Application Class
*****************

The ``Tygh\Application`` entity appeared in the version 4.3.2.

An object of the ``Application`` class is created during core initialization in the **init.php** file, and then it is available from everywhere::

  // getting the Application object
  Tygh::$app

Its current mission is an IoC container that stores objects and factory anonymous functions for creating objects.

=============
IoC Container
=============

Previously, the ``Registry`` class was responsible for storing objects. Now its function is to store the cache and other runtime data::

  // Old
  $smarty = Registry::get('view');

  // New
  $smarty = Tygh::$app['view'];

The main difference between the ``Application`` container and the ``Registry`` container is the ability to "lazy" declare the objects that should be stored in it. Objects stored in a container are called services. Usually they are components of a larger system and provide limited functionality, for example: an email manager, a database connection.

::

  // Register the object in the container using an anonymous factory function.
  Tygh::$app['foo'] = function($app) {
      return new Tygh\Foo();
  };

  Tygh::$app['bar'] = function($app) {
      return new Tygh\Bar($app['foo']);
  };

  // At the moment no object has been created yet, they will be created on demand.

  // Application will return the result of executing the anonymous factory function we've registered earlier.
  // Moreover, the result of executing another factory function will be passed to the constructor of the Tygh\Bar class.
  $bar_instance = Tygh::$app['bar'];

  // The line above is equal to this code:
  $foo_instance = new Tygh\Foo();
  $bar_instance = new Tygh\Bar($foo_instance);

  // When you get the service from the container again, the same object is returned (without creating          a new one).
  var_dump($bar_instance === Tygh::$app['bar']); // true

  // If you NEED to return a NEW object to the container every time you call the service, 
  // then during service registration you need to wrap the anonymous factory function as follows:
  Tygh::$app['cool_service'] = Tygh::$app->factory(function($app) {
      return new Tygh\CoolService();
  });

  // These are all different objects
  $a = Tygh::$app['cool_service'];
  $b = Tygh::$app['cool_service'];
  $c = Tygh::$app['cool_service'];

  // In addition to the above methods, you can simply put a specific object in a container―
  // the behavior that Registry provided.
  Tygh::$app['my_object'] = new Tygh\MyClass();

Find the detailed documentation on using the container at https://github.com/silexphp/Pimple.

For compatibility, ``Registry`` redirects calls to ``api``, ``crypt``, ``view``, ``ajax`` and ``class_loader`` services to the container.

============
What's Next?
============

In the future, ``Application`` will take over the initializer functions (``fn_init()``) and handle current requests (``fn_dispatch()``).
