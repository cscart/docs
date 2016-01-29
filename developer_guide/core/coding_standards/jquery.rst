******
jQuery
******

The current version of CS-Cart/Multi-Vendor uses jQuery. We provide all additional functionality as plugins.

=============
General Rules
=============

1. Use the short notation (**$**) to summon all jQuery methods: 

.. code-block:: javascript

    $.browser.msie;
    $('#test').ourMethod();

.. important::

    **Don’t** use the ``jQuery`` variable to summon methods.

2. When you create plugins, use the jQuery coding style. Functions follow the standard PHP guidelines.

.. code-block:: javascript

    $(window).myFunc();
     myVar = 123;

3. Format inline JavaScript as follows: 

.. code-block:: html

    <script type="text/javascript">
     ...
     </script>

.. important::

    Try to keep inline JavaScript to a minimum. If you have to write logic in a template, then there is a problem with logic. Use inline JavaScript only to pass data from PHP to JavaScript.

4. Connect external scripts with the ``{script}`` Smarty function

.. code-block:: smarty

   {script src="js/core.js"}

5. If you must load an external script with JavaScript, use ONLY the ``$.getScript`` function—it is adjusted to track the loaded scripts and to work with namespaces and third-party libraries.

6. We store third-party JavaScript libraries in the **js/lib** directory. If we want to extend functionality, we write a wrapper like ``ceDialog``.

7. Use full notation with the reference to ``document`` for the ``ready`` event, that is summoned when the document is loaded.

  * **Right:**

    .. code-block:: javascript

           $(document).ready(function() {
                // do something
               });

      **or**

    .. code-block:: javascript

             $(function() {
                   // do something
                  });

  * **Wrong:**

    .. code-block:: javascript

             $(function()), $(window).ready(), etc…

========
Features
========

---------
Callbacks
---------

Callbacks are used in AJAX requests and in many other places. If you want to pass a callback to the method of a particular object, use an anonymous function:

.. code-block:: javascript

    $.ceAjax('request', url, {callback: function() {
         obj.method();
     }});
