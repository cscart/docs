************************
Price List for Customers
************************

.. important::

    This functionality is available in our B2B products.

An organization might need extra information before making a purchase. In this case, a price list comes in handy. It helps to:

* Quickly find out what products you offer without going through your entire web-site.

* Check the prices and available quantities before placing a large order.

* Prepare a cost sheet to show to the boss or a potential client.

These are the situations that the **Price List for Customers** add-ons was designed for.

=============
Functionality
=============

#. Prepare an XLSX price list for your customers. Here are some important things to keep in mind:

   * Every :doc:`user group </user_guide/users/user_groups/index>` can have its own price list. Whether a user group has one is determined in the user group settings.

   * A customer has access to only one price list at any time. When a customer belongs to multiple user groups, he or she will get the price list with a higher **Price list priority**.

     .. image:: img/user_group_settings.png
         :align: center
         :alt: Whe

   * There is a common price list. It is always available to customers who are not in any user group. It is also available to user groups that don't have their own price lists.

   * Price lists can be generated automatically. To generate them, add a command from the add-on settings to `Cron job scheduler <https://en.wikipedia.org/wiki/Cron>`_ on your server.

#. Give customers a full price list with all the available products. Customers will be able to download the price list from "My Account" menu once they sign in.

   .. note::

       You can decide what data to include in the price list, and whether you allow downloading full price lists at all. Do that in the add-on settings.

   .. image:: img/download_price_list.png
       :align: center
       :alt: Price list download link in the "My Account" menu allows you to download the entire price list.

#. Give customers a short price list with whatever products they've added to cart. Customers will be able to download that price list from the cart page, if the add-on's settings allows that.

   .. image:: img/download_cart_price_list.png
       :align: center
       :alt: Price list download link on the cart page allows you to download the price list for all the products you've added to cart.

===============
Add-on Settings
===============

* **Command for automatic generation of price lists**::

    php /path/to/cart/admin.php -p --dispatch=customer_price_list.runner

  .. important::

      Price list generation is resource-demanding, and should be done during the least busy hours. That's why price lists can only be generated via a command. It's best to add the command to `Cron job scheduler <https://en.wikipedia.org/wiki/Cron>`_ for automatic price list generation.

* **Command for testing if your server is properly configured to generate price lists**::

    php /path/to/cart/admin.php --dispatch=customer_price_list.check

  .. hint::

      Replace ``/path/to/cart/admin.php`` with the path to the admin panel on your server.

* **List of fields**—the columns that will be included in the XLSX file of the price list.

* **Sort by**—the field that will determine the order of products in the price list.

* **Group by category**—if you enable this setting, categories will appear in price lists, and products will be grouped by them.

* **Show download link in "My Account"**—if you enable this setting, customers will have a way to download a full price list with all the products available to them.

* **Show download link in the cart**—if you enable this setting, customers will have a way to download a short price list with the products that they have added to cart.

.. meta::
   :description: An add-on for generating price lists for customers in CS-Cart B2B platform.
