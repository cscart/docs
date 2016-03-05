*************
Add-on Scheme
*************


=========
addon.xml
=========

This file is mandatory for any add-on. Parameters of the add-on such as a unique text identifier, name, description, ordinal number in the list, etc. are described there.

Every time the *Manage add-ons* page is opened in the administration panel, the system scans all the directories within *app/addons/* and reads the files *addon.xml* for not installed add-ons to display them in the list of available ones.

When installing an add-on, the system saves all data of *addon.xml* to the database, except for the settings structure that is read from the file every time you work with the add-on.

For already installed add-ons the system calls *addon.xml* when editing an add-on on the *Manage add-ons* page.

========
Location
========

File must be located in the root directory of the add-on - *app/addons/[addon_name]/addon.xml*

======
Scheme
======

Two schemes of the *addon.xml* file are used in CS-Cart:

**Scheme 2.0** addon.xml scheme is used in CS-Cart versions	2.x — 4.х. Add-ons with the old scheme will not be displayed in *Administration -> Add-ons -> Manage add-ons* nor will they work correctly without a proper scheme conversion.

:download:`Here <scheme/files/addon.xml>` you can download a fully commented example of an *addon.xml*.

**Scheme 3.0** addon.xml scheme is used starting from CS-Cart version 4.2.x. The main difference is that in scheme 3.0 translations and language variables are stored in the *.po* files, while in scheme 2.0 they are defined in the add-on scheme.

=========
Structure
=========

.. toctree::
    :maxdepth: 2
    :titlesonly:

    scheme/scheme2.0_structure
    scheme/scheme3.0_structure
