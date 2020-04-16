*************
Add-on Scheme
*************

=========
addon.xml
=========

.. important::

    Every add-on must have a file called **addon.xml** in the root directory of the add-on—*app/addons/[addon_name]/addon.xml*

This file contains parameters of the add-on, such as a unique text identifier, name, description, add-on's position number in the list, etc.

Every time someone goes to **Add-ons → Manage add-ons** in a store's Administration panel, the system scans all the directories within *app/addons/* and reads the *addon.xml* files of the add-ons that aren't installed yet. These add-ons show up on the list of available add-ons.

When installing an add-on, the system saves all data of **addon.xml** to the database, except for the settings structure that is read from the file every time you work with the add-on.

For already installed add-ons, the system calls **addon.xml** when editing an add-on on the **Manage add-ons** page.

=================
Available Schemes
=================

The **addon.xml** file contains the scheme of the add-on. There are two possible schemes:

* **Scheme 2.0** is used in CS-Cart 2.x — 4.х. Add-ons with the old scheme will not be displayed on the **Add-ons → Manage add-ons** page, nor will they work correctly without a proper scheme conversion.

  :download:`Here <scheme/files/addon.xml>` you can download a fully commented example of an *addon.xml*.

* **Scheme 3.0** is used starting from CS-Cart 4.2.x. The main difference is that in scheme 3.0 translations and language variables are stored in the *.po* files, while in scheme 2.0 they are defined in the add-on scheme.

========
Examples
========

.. toctree::
    :maxdepth: 2
    :titlesonly:

    scheme/scheme2.0_structure
    scheme/scheme3.0_structure

===============
In This Section
===============

.. toctree::
    :maxdepth: 2

    scheme/addon_compatibility
    scheme/addon_dependencies
