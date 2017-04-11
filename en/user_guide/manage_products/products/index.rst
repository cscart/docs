********
Products
********

Go to **Products → Products** to manage the products in your catalog. That page contains the list of all products in your store. To filter products by some criteria, use the search panel to the right of the list.

.. image:: img/products.png
    :align: center
    :alt: The product list in CS-Cart admin panel.

Some product properties can be edited directly on the list, without the need to open the product editing page:

* **Image**—product thumbnail; you can't edit it on the list, but by clicking on the thumbnail you open the product editing page.

* **Name**—the name of the product.

* **CODE**—the identifier of the product that you use in your store (a stock keeping unit or SKU). This identifier doesn't have to be unique; it can even be missing.

* **Price**—product price.

* **List price**—the price recommended by the manufacturer. This property can be used to show that your price is lower than the recommended price.

* **Quantity**—the number of products in stock.

* **Status**—the current status of the product:

  * *Active*—the product is available on the storefront.

  * *Hidden*—the product does not appear on the storefront, but customers can access it via a direct link.

  * *Disabled*—the product is not available on the storefront.

===================
Actions on Products
===================

.. hint::

    More detailed instructions are available in :doc:`this article <add_product>`.

When on the **Products → Products** page, administrators can perform the following actions:

------------
Add Products
------------

* To add products individually, click the **+** button in the upper right part of the page.

* To add products in bulk, click the gear button in the upper right part of the page and choose **Bulk product addition**.

-------------
Edit Products
-------------

* To change the properties of a specific product, click on the product's name or icon. Alternatively, you can click the product's gear button (it appears when you hover over the product) and choose **Edit**.

* To change the properties of multiple products at the same time, tick the checkboxes of those products, click the gear button in the upper right part of the page and choose **Edit selected**.

--------------
Clone Products
--------------

To clone selected products, tick the checkboxes of those products, click the gear button in the upper right part of the page and choose **Clone selected**.

---------------
Export Products
---------------

To export selected products, tick the checkboxes of those products, click the gear button in the upper right part of the page and choose **Export selected**. See this :doc:`article <../import_export/product_export>` for more information about the export procedure.

---------------
Delete Products
---------------

* To delete a specific product, hover the mouse pointer over this product. The gear button will appear for this product. Click it and choose **Delete**.

* To delete multiple products at the same time, tick the checkboxes of those products, click the gear button in the upper right part of the page, and choose **Delete selected**.

---------------------------------------
View Products with Customers Subscribed
---------------------------------------

When a product is out of stock, customers may sign up for a notification. When you update the number of products in stock, the customers who signed up for a notification will receive an email.

.. note::

    The product must have **Sign up for notification** as its :doc:`out-of-stock action <out_of_stock_actions>`, or customers won't be able to sign up for a notification.

* To look through the list of products with subscribers, click the gear button in the upper right part of the page, and choose **Product subscriptions**.

* To view the list of subscribers for a specific product, open that product's editing page and switch to the **Subscribers** tab.

-----------------------
Export Products to eBay
-----------------------

To export selected products to eBay, tick the checkboxes of those products, click the gear button in the upper right part of the page, and choose **Export to eBay**. 

.. note::

    The :doc:`eBay synchronization </user_guide/addons/eBay/index>` add-on must be installed and set up in the **Add-ons → Manage add-ons** section.

===============
In This Section
===============

.. toctree::
    :maxdepth: 1
    :glob:

    product_attributes
    out_of_stock_actions
    attaching_files_to_products
    downloadable
    max_order_quantity
    minimum_order_quantity
    quantity_select_box
    same_value_all_products
    upload_file_size
    wholesale
    images_import_problem
    incorrect_thumbnails
    wysiwyg
    add_product
