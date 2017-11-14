********************
Out of Stock Actions
********************

If a product runs out of stock, you can still allow your customers to do something on the product page. Go to **Products → Products**, click on the name of the desired product, and choose one of the following **Out of stock actions**: 

* **None**—forbid customers from buying the product in one of the following cases:

  * When the product is out of stock.

  * If you have specified the date when the product would become available (the **Avail since** property of a product).

* **Buy in advance**—make the product available on backorder; customers will be able to order this product, regardless of the availability date and whether or not the product is in stock.

* **Sign up for notification**—offer customers to sign up for an email notification so that they receive an email once the product is in stock again.

  .. image:: img/out_of_stock_actions.png
      :align: center
      :alt: You can allow your customers to sign up for notifications and buy products in advance.

  .. important::

      If you set the **Inventory** parameter of a product to *Do not track*, the product will always be treated as in-stock. The same will happen if you go to **Settings → General → Catalog** and tick the **Allow negative amount in inventory** checkbox.

====
None
====

The **Add to Cart** button won't appear in these cases:

* You have *0* items in stock and you don't allow negative amount of items in your inventory.

* The product isn’t available yet because you have specified a later date in the **Avail since** field.

  .. note::

      If your product is supposed to be available starting from a specific date, your customers will see that date on the product page.

  .. image:: img/no_action.png
      :align: center
      :alt: There is no Add to Cart button, but there is a message about when the product becomes available.

.. _buy-in-advance:

==============
Buy in Advance
==============

When a product is out of stock, it will be marked as available on backorder. Customers will be able to order this product, regardless of the availability date. The product's quantity in stock can also become negative, even if negative inventory is not allowed :doc:`on the "Settings → General" page </user_guide/settings/general>`.

.. image:: img/buy_in_advance.png
    :align: center
    :alt: Despite the message that the product isn't available yet, customers can add the product to cart.

.. _product-subscribers:

========================
Sign Up for Notification
========================

If a product is out of stock, you can allow users to sign up for an email notification:

* Registered users only need to tick the **Notify me when this product is back in stock** checkbox on the product page.

* Guests have to provide their email addresses to receive the notification.

The customers who signed up for the notification will receive an email when the product is in stock again.

.. important::

    The product must be **out of stock** for the notification checkbox to appear. The checkbox only appears on the pages of products that are **tracked without options**. 

.. image:: img/notification.png
    :align: center
    :alt: Customers who tick the checkbox will receive a notification by email when the product is in stock again.

----------------------------
Manage Product Subscriptions
----------------------------

You can view product subscriptions in 2 ways:

* To view all the product subscriptions, go to **Products → Products**, click the **gear button** in the top right corner, and choose **Product subscriptions**. You will see the list of products, as well as the number of subscriptions for those products in the separate column.

* To view subscriptions for a certain product, go straight to **Products → Products → <Desired Product>** and switch to the **Subscribers** tab.

  .. image:: img/subscribers.png
      :align: center
      :alt: Every product has its own list of subscribers.

You can add subscribers to the list using these buttons:

* **Add subscriber**—enter the email address of a subscriber manually.

* **Select customer**—choose the registered customers you want to subscribe to email notifications about the product's availability.

  .. important::

      Once a subscriber receives the email saying that the product is in stock, they are removed from the list of product subscribers automatically.

To remove subscribers from the list manually, tick the checkboxes next to their email addresses and click the **trash can button**.
