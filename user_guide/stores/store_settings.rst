**********************************
Global and Store-Specific Settings
**********************************

=============
Setting Types
=============

When working with multiple stores, remember that CS-Cart has different types of settings:

* **Global settings** affect overall store functionality and the behavior of the administration panel. They include logging options, usage of secure connection in the administration panel, base for tax calculation methods, and so on.

* **Store-specific settings** affect a particular store and the behavior of the related storefront. They include storefront appearance options (for example, thumbnail dimensions), usage of secure connection at checkout, company information, and so on.

.. note::
    Every storefront also has different templates, blocks placement, site maps, menus, etc.

==================
Configure Settings
==================

The general rule for updating settings is as follows:

* Update **global settings** using the root administrator mode: select **All stores** in the store selector in the top left corner of the administration panel.

Normally, store-specific settings are grayed out in the root administrator mode to prevent unintended editing, if otherwise is not determined by the multiple-storefront feature configuration (**Settings → Stores**).

* Update **store-specific settings** in the store administrator mode.

Global settings are not available in the store administrator mode. However, you can use the root administrator mode to update store-specific settings in all stores at once. To do so, follow these steps:

1. When applicable, disable the protection of the setting that you want update.

* If a store-specific setting is protected, it is grayed out. To disable protection, click the grayed **three people icon**.

* If a store-specific setting is not protected, it is available for immediate editing and has the **three people icon** highlighted.

2. Update the setting as required.

3. Click **Save** to apply the changes. The option gets updated in all stores.

.. note::
    If you only have one store, there will be no edit icons: when there are no other stores, the storefront administrator acts as the root administrator. 
