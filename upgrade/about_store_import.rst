******************
About Store Import
******************

**Store Import** is an add-on that imports the database from an older version of your store to 4.x.x. The process takes several steps: 

1. Install CS-Cart/Multi-Vendor 4.x.x to a subfolder of your old store.

2. Import the data from your old store to the new one with :doc:`the Store Import add-on <../user_guide/addons/store_import/index>`.

3. Configure your new store (CSS styles, layouts, blocks, settings, etc.). In the meantime, your old store can continue working as usual.

4. Import the data that was accumulated in your old store while you were customizing your new store.

.. important::

    **Starting from CS-Cart 4.3.7, the Store Import add-on doesn't come with the CS-Cart installation package**. Please `get the Store Import add-on <http://marketplace.cs-cart.com/add-ons/store-import.html>`_ for CS-Cart 4.3.7 and newer from the Marketplace. It's free. 

    Although CS-Cart 4.3.6 has the Store Import add-on by default, we recommend that you get it from the Marketplace as well: on the Marketplace, the add-on is fresher than the one that comes with 4.3.6.

    Learn :doc:`how to upgrade your store with Store Import <importing_a_store>`.

==================
Supported Versions
==================

Use the table below to see the versions that you can upgrade to and from:

.. list-table::
    :header-rows: 1
    :widths: 5 5

    *   -   Upgrade from:
        -   Upgrade to:
    *   -   CS-Cart Professional 2.2.4 - 3.0.6
        -   CS-Cart 4.0.2 - 4.3.2, 4.3.6 - 4.3.8
    *   -   CS-Cart Ultimate 3.0.1 - 3.0.6
        -   CS-Cart 4.0.2 - 4.3.2, 4.3.6 - 4.3.8
    *   -   CS-Cart Multi-Vendor 2.2.4 - 3.0.6
        -   Multi-Vendor 4.0.2 - 4.3.2

The Store Import add-on for CS-Cart 4.3.6 can also import data from CS-Cart 4.3.1 - 4.3.5.

.. note::

    If you want to upgrade your store from CS-Cart or Multi-Vendor 4.0.x and later versions, :doc:`use the Upgrade Center <upgrade_process>`.

============
Restrictions
============

----------------------
Technical Restrictions
----------------------

* Store Import can't import several CS-Cart Professional stores to one CS-Cart installation as different storefronts.
    
* CS-Cart Community stores cannot be imported directly.

.. important::

    CS-Cart/Multi-Vendor 4.2.x and 4.3.x require **PHP 5.3.x** or higher. CS-Cart 4.3.6 requires **PHP 5.3.6** or higher.

--------------------
License Restrictions
--------------------

You can use the **Store Import** add-on if you own a license with an active upgrade subscription. If you license does not have an active upgrade subscription, you can either prolong upgrades for the current license, or buy a new license.

.. important::

    Don't use both the old and the new store at the same time with one license. Keep the new store closed (**Settings → General → Close storefront**) while you configure it. Close the storefront of the old store right after you go live with your new store. :doc:`Learn more about closing your storefront <../user_guide/look_and_feel/changing_attributes/store_closed>`.

=============
Imported Data
=============

Depending on what version of CS-Cart/Multi-Vendor you used for your old store, some data may be left out during the import process.

----------
From 3.0.x
----------

The add-on imports all the data, including layouts and settings.

----------------
From 2.2.4/2.2.5
----------------

The add-on **doesn't** import some settings:

* Core settings (the **Settings** section of the Administration panel) are replaced with default settings.

* Add-on settings are imported.


The add-on **doesn't** import most of the layout data (information about blocks and tabs). There are some **exceptions**:

* Blocks from **Design → Layouts → Products** are imported if they have the *Products* type and their **Filling** is set to *Manually*.

* The **Description**, **Features** and **Files** product tabs are imported by default.

* The product tabs created automatically after the installation of certain add-ons are also improted.
