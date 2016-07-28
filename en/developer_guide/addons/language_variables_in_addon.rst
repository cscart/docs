*****************************
Language Variables in Add-ons
*****************************

.. note::

    First you may want to :doc:`learn more about language variables and their use <../core/language_variables>`.

Language variables allow you to maintain translations for your CS-Cart/Multi-Vendor add-ons.

Texts in various languages don’t appear in the PHP code or Smarty template files directly—a special function is called instead. The name of the language variable is passed to the function, which then returns the text in one of the languages, depending on the user’s locale.

Language variables of the add-ons are stored in PO files. There is a separate PO file for each language, located in a separate folder according to its language code: *var/langs/[language_code]/addons/[addon_name].po*.

For example, the PO file with the English translation for the *Access Restrictions* add-on lies in *var/langs/en/addons/access_restrictions.po*.

.. important::

    The name of the PO file must be the same as the content of the ``<id>`` section of :doc:`addon.xml <scheme/scheme3.0_structure>`, which is located in *app/addons/<addon_name>*.

This article describes what happens to the language variables when the add-on is installed, uninstalled, or upgraded.

====================
Installing an Add-on
====================

:ref:`When an add-on is installed <install-addon-process>`, its PO files are analyzed. The values of the language variables for every available language are written into the ``language_values`` table. The table consists of the following fields:

* **lang_code**—the code of the language.

* **name**—the name of the language variable without a prefix.

* **value**—the value of the language variable for the specified language code.

The values are also put into the ``original_values`` table. Here’s its structure:

* **msgctxt**—the name of the language variable with a prefix, just like the ``msgctxt`` from the PO file.

* **msgid**—the value of the language variable in the original language (as a rule, it’s English), just like the ``msgid`` from the PO file.

===============
Using an Add-on
===============

When the variable is used in the ``__`` function for the first time, the value is taken from the ``language_values`` table and cached. Later the values are taken from the cache. Language variables are a part of CS-Cart/Multi-Vendor general cache. The caching mechanism depends on CS-Cart/Multi-Vendor settings.

Administrators can :doc:`change the values of the language variables <../../user_guide/look_and_feel/languages/translate>` in the Administration panel. These changes are recorded to the **value** field of the ``language_values`` table. The ``original_values`` table remains unchanged.

When the language variables are exported to a PO file from the Administration panel, the values of **msgtxt** and **msgid** come from ``original_values``, and the value of **msgstr** comes from ``language_values``.

===================
Upgrading an Add-on
===================

When an add-on is upgraded, the PO files in the upgrade package are analyzed. The new language variables are added, but the existing language variables aren’t updated. This applies to CS-Cart/Multi-Vendor upgrades as well.

.. hint::

    Learn more about :doc:`creating an upgrade package for an add-on <../../upgrade/upgrade_addon>`.

======================
Uninstalling an Add-on
======================

:ref:`When an add-on is uninstalled <uninstall-addon-process>`, it’s PO files are analyzed. All the language variables of the add-on are removed from the ``original_values`` and ``language_values`` tables. The language cache is cleared.
