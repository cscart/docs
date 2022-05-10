***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.15.1
***********************************************

.. contents::
    :local:
    :backlinks: none

==============
Addons changes
==============

"GDPR Compliance (EU)" add-on
-----------------------------

In 4.15.1, we introduced a new tool that allows users to refuse optional cookies and view the list of cookies that the store uses.

Existing cookies
~~~~~~~~~~~~~~~~

#. Strictly necessary cookies (cannot be disabled) — ``strictly_necessary``

#. Performance cookies — ``performance``

#. Functional cookies — ``functional``

#. Marketing cookies — ``marketing``

The names that should be used as ``cookie purpose`` in the schema are specified after the "—".

Extend cookies with an add-on
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If your add-on brings new cookies and you want to extend the existing list to comply with the standard, then you need to:

#. Extend the ``gdpr/klaro_config.php`` schema.

   Each schema element has the following structure::

     php
     $schema['services']['cookie_name'] = [
      'purposes' => ['cookie_purpose'],
         'name' => 'cookie_name',
         'translations' => [
             'zz' => [
                 'title' => __('cookie_title'),
                 'description' => __('cookie_description')
             ],
         ],
         'required' => true/false,
         'default' => true/false
     ];
     return $schema;

#. Enable the JS script that will set the cookie. There are several ways to do it:

   2.1. ::

          html
          {script src="path/script.js" cookie-name="cookie_name"}

   2.2. ::

          html
          <script
              type="text/plain"
              data-type="application/javascript"
              data-src="src"
              data-name="cookie_name"
          ></script>
