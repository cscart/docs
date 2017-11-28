**************
Order Statuses
**************

.. important::

    If your CS-Cart installations has :doc:`multiple storefronts </user_guide/stores/index>`, you need to be in the **All stores** mode to add order statuses.

The **Administration → Order statuses** page allows you to adjust the default set of order statuses. You can easily sort statuses according to your business needs, edit the details of the existing statuses as well as add custom statuses.

.. note::

    You can have up to 26 order statuses at the same time, as the database uses letters to identify them.

The following statuses are available by default and cannot be deleted:

* **Processed**—the payment was received.

* **Complete**—all work on the order was completed.

  .. note::

      CS-Cart and Multi-Vendor only consider that the money has been paid when an order gets the *Processed* or *Complete* status (regardless of how you rename them). If you'd like to have more statuses that signify that the order has been paid for, that would have to be done via a third-party add-on.

* **Open**—the order was placed and created in the store database, but it hasn't been processed yet.

* **Failed**—the payment transaction failed.

* **Declined**—the order was canceled by the store administrator.

* **Backordered**—the order hasn't been processed yet, as it contains out-of-stock items.

* **Canceled**—the order was canceled by the customer.

* **Awaiting call**—the order was placed when the customer sent a call request. This status is associated with the :doc:`Call requests </user_guide/addons/call_requests/index>` add-on.

There is also one hidden initial status—**Incomplete**. It means that the order was created in the store database, and the system is awaiting the response from a payment method. This status cannot be set by administrator.

That is how order statuses are assigned:

* A customer places an order, and the order is placed with the *Incomplete* status which does not change the inventory.

* If the customer uses an offline payment method, the order status changes to *Open* until the store administrator assigns a different status to the order.

* If the customer uses an online payment method, a positive response of the payment gateway will change the order status to *Complete*. If the response is negative, no new order will be created, and the customer will be offered to place the order again.

===============
In This Section
===============

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    set_status
    disable_notifications
    allow_repay
    remove_cc_info_auto
    order_failed
