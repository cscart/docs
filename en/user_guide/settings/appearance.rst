**********
Appearance
**********

In this section you can configure the general appearance and behavior of your store (both the customer area and the Administration panel). These parameters are common for all storefront themes.

======================
Administrator Settings
======================

.. note::

    The following parameters only apply to the appearance of the Administration panel.

* **Backend default language**—the default language of the Administration panel.

* **Elements per page**—the default number of elements (like orders or products) displayed on one page of the list.

* **Default WYSIWYG editor**—the WYSIWYG editor to be used in the Administration panel.

  .. note::

      You can select *TinyMCE* or *Redactor*, or you can choose to disable WYSIWYG. Starting with version 4.6.3, you can also select *Redactor II*.

=================
Customer Settings
=================

.. note::

    The following parameters only apply to the appearance of the customer area.

* **Frontend default language**—the default language of the storefront.

* **Orders per page**—the number of orders displayed on one page.

* **Products per page**—the number of products displayed on one page.

* **Elements per page**—the number of other items displayed on one page.

* **Number of columns in the product list**—the number of columns with products on a product list page. This setting applies to the *Grid* layout only.

* **Estimate taxes using default address on cart/checkout pages**—if you enable this setting, customers without their own address in the database will see the taxes calculated for the :doc:`default customer address </user_guide/shipping_and_taxes/address>`.

* **Display prices with taxes on category/product pages if the method of calculating taxes is based on a unit's price**—if you enable this setting, product prices displayed on the product and category pages will include taxes.

* **Display prices with taxes on cart/checkout pages if the method of calculating taxes is based on a unit's price**—if you enable this setting, product prices displayed on the cart and checkout pages will include taxes.

* **Show number of available products**—if you enable this setting, the number of product items in stock will be displayed to customers on the storefront.

* **Display mini thumbnail images as a gallery**—if you enable this setting, multiple product thumbnails will be displayed as a small gallery.

* **Use "Value changer" for the Quantity field**—if you enable this setting, then the **+** and **-** buttons will be displayed next to the *Quantity* field; these buttons increase and decrease the quantity of selected items.

* **Display the "Pagination section" on the top of the listed object**—if you enable this setting, the pagination bar will appear not only at the bottom, but also at the top of a list of objects that consists of multiple pages.

* **Default image previewer**—select one of the supported image previewers.

* **Product detailed page view**—choose the default template for the product details page. If necessary, the other templates can be selected separately for every product (on the **General** tab) or category (on the **Views** tab). 

* **Display product details in tabs**—if you enable this setting, product details (description, features and so on) will be arranged in multiple tabs.

  .. hint::

      To manage product tabs, go to **Design → Product tabs**.

* **Display track my orders section**—if you enable this setting, the *Track my orders* bar will appear in the *My account* section of the customer area. With this bar a customer will be able track orders by order ID or email.

=============================
Product List Layouts Settings
=============================

* **Available product list views**—select the available ways of displaying the product list on the storefront. A customer will be able to select any of these ways.

* **Product list default view**—select the default way of displaying the product list.

* **Use the selected view for current category or search page only**—if you enable this setting, customers will be allowed to select only the look of the category or product list page that they are browsing at the moment. That choice won't be saved when moving to a different category, and the default look will be used there.

  When this setting is disabled, the look selected by a customer will apply to all category and product list pages that the customer visits during one session.

* **Available product list sortings**—the possible ways of sorting products in the product list:

  *  *Oldest/Newest Items first*—by the product creation date. 

  *  *Position*—by :doc:`the positions of products on the list </user_guide/manage_products/categories/sorting_products_by_position>`.

  *  *Alphabetically*—by product names.
  
  *  *Price*—by product prices.

  *  *Popularity*—by product ratings.

  *  *Bestsellers*—by the number of sold items.

  *  *Discount*—by the difference between **Price** and **List price** of products.

* **Product list default sorting**—the default order in which products are sorted on a product list page.

* **Enable quick view**—if you enable this setting, the **Quick view** button will appear on the product list when the customer hovers a cursor over the product; that button will open a pop-up window with product information.

===============
Common Settings
===============

The following settings apply both to the storefront and the Administration panel:

* **Date format**

* **Time format**

* **Time zone**

* **Calendar date format**

* **Calendar week starts from**

* **Unsaved changes warning**—if you enable this setting, administrators will be warned of unsaved changes before they leave the page.

* **Show menu description**—if you enable this setting, drop-down menus in the Administration panel will have a short description of each item.

* **Notice displaying time**—the time in seconds to display pop-up notifications that follow an event like changing a status of an item in the Administration panel, or adding a product to the cart.

  .. hint::

      If you set *0*, then the notifications won't be hidden automatically.

* **Email templates mode**—the way how email templates and documents work:

  * *New*—:doc:`documents </user_guide/look_and_feel/documents/index>` and :doc:`email templates </user_guide/look_and_feel/email_templates/index>` are stored in the database and can be modified via built-in editors.

  * *Old*—the templates of documents and email notifications are stored as files that can be edited directly (:doc:`but that's inadvisable </developer_guide/getting_started/guidelines>`) or via third-party add-ons.
