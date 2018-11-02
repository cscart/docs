********
Products
********

Go to **Products → Products** to manage the products in your catalog. That page contains the list of all products in your store. To filter products by some criteria, use the search panel to the right of the list.

.. image:: img/products.png
    :align: center
    :alt: The product list in CS-Cart admin panel.

The product list contains the essential information about each product:

* **Image**—a small thumbnail of the main product image.

* **Name**—the name of the product.

  .. hint::

      Click on the product name or image to open the product editing page.

* **CODE**—the identifier of the product that you use in your store (a stock keeping unit or SKU). This identifier doesn't have to be unique; it can even be missing.

* **Price**—product price.

* **List price**—the price recommended by the manufacturer. This property can be used to show that your price is lower than the recommended price.

* **Quantity**—the number of products in stock.

* **Status**—the current status of the product:

  * *Active*—the product is available on the storefront.

  * *Hidden*—the product does not appear on the storefront, but customers can access it via a direct link.

  * *Disabled*—the product is not available on the storefront.

  .. note::

      You can change product price, list price, quantity, and status on the product list. If you change anything other than status, make sure to use **Save** button before leaving the page.

===================
Actions on Products
===================

.. note::

    Below is a brief list of what an administrator can do on the **Products → Products** page. For more detailed instructions, check :doc:`this article <add_product>`.

------------
Add Products
------------

* To add products individually, click the **+** button in the upper right part of the page.

* To add products in bulk, click the gear button in the upper right part of the page and choose **Bulk product addition**.

-------------
Edit Products
-------------

* To change the properties of a specific product, click on the product's name or icon. Alternatively, you can click the product's gear button (it appears when you hover over the product) and choose **Edit**.

* To change the properties of multiple products at the same time, select those products by clicking on them, then click **Edit selected** above the product list.

--------------
Clone Products
--------------

To clone a product or multiple products, select them by clicking on them, then choose **Clone selected** in the **Actions** menu above the product list.

---------------
Export Products
---------------

To export products, select them by clicking on them, then choose **Export selected** in the **Actions** menu above the product list. See this :doc:`article </user_guide/manage_products/import_export/product_export>` for more information about the export procedure.

---------------
Delete Products
---------------

* To delete a specific product, hover the mouse pointer over the product. The gear button of the product will appear. Click it and choose **Delete**.

* To delete multiple products at the same time, select them by clicking on them, and choose **Delete selected** from the **Actions** menu above the product list.

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

To export some products to eBay, select them by clicking on them, click the gear button in the upper right part of the page, and choose **Export/Revise products on eBay**.

.. note::

    The :doc:`eBay synchronization </user_guide/addons/eBay/index>` add-on must be installed and set up in the **Add-ons → Manage add-ons** section.

===============
In This Section
===============

.. toctree::
    :maxdepth: 1
    :glob:

    product_attributes
    add_product
    product_variations
    simple_versus_configurable
    convert_combinations_to_variations
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
