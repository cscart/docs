**************
Order Statuses
**************

The **Administration → Order statuses** section allows you to adjust the default set of order statuses. You can edit the details of the existing statuses as well as add custom statuses.

.. important ::

    Your store can have up to 26 order statuses at the same time, as the database uses letters to identify them.

.. important ::

    If your CS-Cart installations has :doc:`multiple storefronts <../../stores/index>`, you need to be in the root administrator mode to add order statuses.

The following statuses are available by default and cannot be deleted:

*	**Processed** – Payment has been received.
*	**Complete** – All work on the order has been completed.
*	**Open** – Order has been placed and created in the store database, but it hasn't been processed yet.
*	**Failed** – Payment transaction hasn't been completed.
*	**Declined** – Order has been canceled by the store administrator.
*	**Backordered** – Order hasn't been processed yet as it contains out-of-stock items.
*	**Canceled** – Order was canceled by a customer.
*	**Awaiting call** - Order was created and customer sent a call request. This status is associated with the `Call requests <http://docs.cs-cart.com/4.3.x/user_guide/addons/call_requests/index.html>`_ add-on.

There is also one hidden initial status – **Incomplete**. The order is created in the store database and the system waits for the response from a payment method. This status cannot be set by the user.

That is how order statuses are assigned:

*	A customer places an order, and the order is placed with the status *Incomplete* which does not change the inventory.
*	If the customer uses an offline payment method, the order status changes to *Open* until the store administrator assigns a different status to the order.
*	If the customer uses an online payment method, a positive response of the payment gateway changes the order status to *Complete* while with a negative response the customer is suggested to replace the order. In the latter case, no new order is created.

In this section
***************

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    *
