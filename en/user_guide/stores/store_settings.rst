***************************************
Global and Storefront-Specific Settings
***************************************

.. important::

    This article applies only to CS-Cart, not Multi-Vendor.

=============
Setting Types
=============

When working with multiple storefronts, remember that CS-Cart has different types of settings:

* **Global settings** affect overall store functionality and the behavior of the Administration panel. They include logging, usage of secure connection in the administration panel, base for tax calculation methods, and so on.

* **Storefront-specific settings** affect a particular storefront and its behavior. These settings include storefront appearance options (for example, thumbnail dimensions), usage of secure connection at checkout, company information, and so on.

.. note::
    Different storefronts also have different block placement, site maps, menus, etc.

==================
Configure Settings
==================

The general rule for updating settings is as follows:

* To update **storefront-specific settings**, choose the desired storefront in the selector in the upper left part of the page.


* To update **global settings**, choose *All storefronts* in the selector in the upper left part of the page.

  .. image:: img/switch_modes.png
      :align: center
      :alt: Select a storefront or choose "All Storefronts".

Normally, storefront-specific settings are grayed out in the root administrator mode to prevent unintended editing. You can disable this protection under **Settings → Stores**. 

You can also use the root administrator mode to update storefront-specific settings for all the storefronts at once. To do so, follow these steps:

#. When applicable, disable the protection of the setting that you want update.

   * If a storefront-specific setting is protected, it is grayed out. To disable protection, click the **three people icon**.

   * If a storefront-specific setting is not protected, it can be edited, and its **three people icon** is highlighted.

     .. image:: img/settings_protection.png
         :align: center
         :alt: Protected and non-protected settings as they appear in the Administration panel of CS-Cart.

#. Update the setting as required.

#. Click **Save** to apply the changes. The setting will get updated for all storefronts.

   .. note::
      When you have only one storefront, the **three people icon** won't appear, because your changes are supposed to affect only one storefront.

.. meta::
   :description: How to configure different settings for different storefronts in CS-Cart online store?
