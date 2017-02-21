******************
Language Variables
******************

Language variables are one of the primary means for `internationalization and localization <https://en.wikipedia.org/wiki/Internationalization_and_localization>`_ of CS-Cart, Multi-Vendor, and their add-ons.

Texts in various languages don’t appear in the PHP code or Smarty template files directly—a special function is called instead. The name of the language variable is passed to the function, which then returns the text in one of the languages, depending on the user’s locale.

.. note::

    We have a separate article about :doc:`the usage of language variables in add-ons <../addons/language_variables_in_addon>`.

============================
Declaring Language Variables
============================

--------
PO Files
--------

The translations of CS-Cart, Multi-Vendor, or any add-on are stored in PO files (*portable object*). Each language must have a separate PO file that stores the values of the language variables.

PO is a widely used format: many services related to localization can import and export PO files. For example, we use `Crowdin <https://crowdin.com/>`_ to :doc:`translate CS-Cart <../../user_guide/look_and_feel/languages/crowdin>`.

.. hint::

    Learn more about PO files at the `GNU project website <https://www.gnu.org/software/gettext/manual/html_node/PO-Files.html>`_.

PO files are located in the subfolders of *var/langs* of your CS-Cart/Multi-Vendor installation. You can edit them with special programs or a simple text editor.

--------------------------------
Structure of a Language Variable
--------------------------------

This is what a language variable in the PO file for the English language looks like:

.. code-block:: po

    msgctxt "Languages::email_marketing.subscription_confirmed"
    msgid "Thank you for subscribing to our newsletter"
    msgstr "Thank you for subscribing to our newsletter"

And here’s the same language variable in the French PO file:

.. code-block:: po

    msgctxt "Languages::email_marketing.subscription_confirmed"
    msgid "Thank you for subscribing to our newsletter"
    msgstr "Merci de votre inscription à notre newsletter"

* **msgctxt**—the message context that serves to identify the same lines of text in different parts of the program. In CS-Cart, Multi-Vendor, and their add-ons we use message context to store the name of the language variable as it appears in the Smarty templates and PHP code (except for the prefixes).

  PO files store the translations of strings, add-on names and descriptions, the names of various settings and sections. That’s why translations for different types of data have different prefixes. The names of the language variables that appear in the **PHP** or **TPL** files must begin with the ``Languages::`` prefix.

  .. important::

      Omit the prefixes when passing the name of the language variable to the translation function.

  The name of the language variable must be unique among the language variables that belong to the core and installed add-ons. That’s why it’s important to **put the name of the add-on at the beginning of msgctxt.** For example, this is a language variable of the *Email Marketing* add-on:

  .. code-block:: po

      msgctxt "Languages::email_marketing.subscription_confirmed"

* **msgid**—the value of the language variable in the original language. We recommend to specify the value in English here—it’s easier to find translators who know English.

* **msgstr**—the translation of the original text to the target language. In the PO file for the original language **msgstr** will be the same as **msgid**.

------------
Placeholders
------------

You may need to add changeable data to the language variables, such as product names, links, the number of elements, etc. This is done via placeholders that are put in the square brackets, for example:

.. code-block:: po

    msgctxt "Languages::admin_text_letter_footer"
    msgid "E-shop of [company_name]."
    msgstr "E-shop of [company_name]."

:ref:`See how a placeholder is used in a Smarty template. <langvar-placeholders>`

------------
Plural Forms
------------

Many languages have different singular and plural word forms. For example, let’s take two possible phrases:

* *(The delivery will take)* 1 day.
* *(The delivery will take)* 2 days.

If you create a language variable with different forms, use the ``|`` symbol to separate forms in **msgid** and **msgstr**. Also add the ``[n]`` placeholder that will be replaced with a number. Here’s the example of a language variable with two forms:

.. code-block:: po

    msgctxt "Languages::n_days"
    msgid "[n] day|[n] days"
    msgstr "[n] day|[n] days"

Some languages (for example, Russian) have multiple plural forms. If the target language has more plural forms than the original language, then:

* **msgid** remains the same as in the original language.

* **msgstr** has the description of all the forms of the target language.

Here’s the same language variable for the Russian language, that has two plural forms:

.. code-block:: po

    msgctxt "Languages::n_days"
    msgid "[n] day|[n] days"
    msgstr "[n] день|[n] дня|[n] дней"

When listing multiple word forms, the singular form always comes first. The order, in which the forms for different languages are listed, complies with the `Language Plural Rules <http://unicode.org/repos/cldr-tmp/trunk/diff/supplemental/language_plural_rules.html>`_.

========================
Using Language Variables
========================

-----------
In PHP Code
-----------

The special core function called ``__`` is used in the PHP code to show the value of a language variable::

  function __($var, $params = array(), $lang_code = CART_LANGUAGE);

The only required parameter is the name of the language variable. The second parameter passes the values of placeholders, and the third parameter specifies the target language.

.. note::

    By default, the target language is determined by the user’s current locale.

Here’s the example of the ``__`` function::

  $confirmed_text = __('email_marketing.subscription_confirmed');
  fn_set_notification('I',$confirmed_text, $msg);

-------------------
In Smarty Templates
-------------------

You can use ``__`` to insert a language variable into a Smarty template. Surround the expression with curly brackets. For example, this is how you insert the hello language variable:

.. code-block:: smarty

    {__("hello")}

Expressions like this are replaced with the calling of the ``__`` method of the Smarty wrapper class during template compilation. In turn, that class calls the core function described above.

.. _langvar-placeholders:

------------
Placeholders
------------

Here is a language variable with a placeholder, inserted into a template:

.. code-block:: html+smarty

  <p>
     {__("admin_text_letter_footer", ["[company_name]" => $settings.Company.company_name])}
  </p>

------------
Plural Forms
------------

When using a language variable with multiple plural forms, pass the substituted number instead of the ``[n]`` placeholder in the second parameter of the ``__`` function. For example:

.. code-block:: php

    $return[$service_code]['delivery_time'] = __("n_days", array($shipment->GuaranteedDaysToDelivery));

Depending on the passed number, an appropriate form will be selected automatically. For example, for the English language that would be:

* 0 days
* 1 day
* 3 days

==========================
Editing Language Variables
==========================

There are ways to edit language variables, other than changing PO files:

* **In the Administration panel:** go to :doc:`Administration → Languages → Manage languages <../../user_guide/look_and_feel/languages/translate>`.

* **Via the REST API:** use the :doc:`langvars <../api/entities/langvars>` entity.
