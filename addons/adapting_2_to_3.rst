***********************************
Adapting Add-on from CS-Cart 2 to 3
***********************************

Add-on scheme
=============

In CS-Cart 3, the version 2.0 add-on scheme is used.

You should explicitly define the scheme version in the **addon.xml** file:

    .. code-block:: xml

        <addon scheme="2.0">

Generally, an add-on should be operational even with the old scheme, but some features may not work. Errors will occur with section title translations in settings dialog, edition-specific queries, add-on dependencies and conflicts.

.. warning::

    All settings require the ``id`` attribute, otherwise they will not be imported to database.

Hooks
=====

There are numerous modifications in the hooks to be taken into account. Use the `hook base`_ to expore and compare the hooks in different CS-Cart versions.

.. _hook base: http://www.cs-cart.com/api/

Skin Directory
==============

The skin directory was renamed in CS-Cart 3.

The new skin directory in CS-Cart 3 is *skins/basic/customer* instead of *skins/base/customer* as it was before.

All the templates have to be moved to the new directory. Otherwise, these templates will not be detected.

Normally, the template path should not be explicitly mentioned anywhere in non-core files; all the template names are defined relatively, without absolute paths. Still, if there are any such occurances, they must be handled, and the path must be updated manually.

Block manager
=============

Adapt the add-on for the new block manager scheme.

Use the detailed block scheme description in the Block manager section

Class auto-load
===============

The new version introduces the class auto-load mechanism.

Classes are loaded automatically when requested by name. It is no longer necessary to connect them explicitly with the ``require`` or ``include`` instructions. It is sufficient just to name class in a certain way and place it in a certain place.

All classes must reside in the add-on directory, in the *core/classes* subdirectory.

Class reference convention is as follows:

    *   Slashes are substituted with underscores (``foo/bar`` → ``Foo_Bar``)
    *   CamelCase with the first capital letter is used (``FooBar``)

Examples
--------

    *
        File: *addons/my_addon/core/classes/my_class.php*

        Class name: ``class MyClass {...}``

    *
        File: *addons/my_addon/core/classes/some_package/my_class.php*

        Class name: ``class SomePackage_MyClass {...}``

Ultimate Edition
================

It is necessary to plan how the add-ons settings should behave with the separate storefronts in the CS-Cart Ultimate edition.

A setting can be available for the root admin only, or also for every storefront admin and have different values for each storefront.

In the first case, the ``edition_type`` attribute must be specified as ``ULT:ROOT``, in the second—as ``ULT:ROOT, ULT:VENDOR``.

.. note::
    A setting cannot be available for a storefront admin only. Root admin has the permission to view and change any setting in any storefront (that's why they are called the *root* admin).
