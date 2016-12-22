**********************************
Global and Store-Specific Settings
**********************************

.. important::

    This article applies only to CS-Cart, not Multi-Vendor.

=============
Setting Types
=============

When working with multiple storefronts, remember that CS-Cart has different types of settings:

* **Global settings** affect overall store functionality and the behavior of the Administration panel. They include logging options, usage of secure connection in the administration panel, base for tax calculation methods, and so on.

* **Storefront-specific settings** affect a particular storefront and its behavior. These settings include storefront appearance options (for example, thumbnail dimensions), usage of secure connection at checkout, company information, and so on.

.. note::
    Every storefront also has different templates, blocks placement, site maps, menus, etc.

==================
Configure Settings
==================

The general rule for updating settings is as follows:

* Update **storefront-specific settings** in the storefront administrator mode: choose the desired storefront in the selector in the top left corner.

  .. note::

      Global settings are not available in the storefront administrator mode.

* Update **global settings** using the root administrator mode: choose **All stores** in the selector in the top left corner.

.. image:: img/administrator_mode.png
    :align: center
    :alt: Select a storefront or choose "All Storefronts".

Normally, storefront-specific settings are grayed out in the root administrator mode to prevent unintended editing. You can disable this protection under **Settings → Stores**. 

You can also use the root administrator mode to update storefront-specific settings for all the storefronts at once. To do so, follow these steps:

1. When applicable, disable the protection of the setting that you want update.

   * If a storefront-specific setting is protected, it is grayed out. To disable protection, click the **three people icon**.

   * If a storefront-specific setting is not protected, it can be edited, and its **three people icon** is highlighted.

.. image:: img/settings_protection.png
    :align: center
    :alt: Protected and non-protected settings as they appear in the Administration panel of CS-Cart.

2. Update the setting as required.

3. Click **Save** to apply the changes. The setting will get updated for all storefronts.

.. note::
    When you have only one storefront, the **three people icon** won't appear, because your changes are supposed to affect only one storefront.
