******************************
How To: Set up an Order Status
******************************

To set up an order status:

#. In the Administration panel, go to **Administration → Order statuses**.

#. Create a new order status by clicking the **+** button or set up the existing one by clicking on its name.

   .. image:: img/order_status_02.png
       :align: center
       :alt: Adding a new order status in CS-Cart.

   .. important ::

    	You can have up to 26 order statuses at the same time, because the database uses letters to identify them.

#. Specify the following status properties:

   * **Name**—the name of the status.

   * **Status**—the letter that identifies the status in the database.

   * **E-mail subject**—the subject of an e-mail notification about the order with this status.

   * **E-mail header**—the actual text of an e-mail notification about the order with the status.

   * **Color**—the color to be used for this status the Administration panel.

   * **Notify customer**—tick this checkbox to inform the customer by email about an order getting this status.
    
   * **Notify orders department**—tick the checkbox if you want to inform the store administrator about orders getting this status.

     .. note::

         The email address of the order department to receive notification at is specified in the section **Settings → Company**.

   * **Inventory**—choose whether to decrease or increase the number of items in stock for products included in the order.

   * **Remove CC info**—tick this checkbox to remove sensitive credit card info from the database when an order gets this status.

   * **Pay order again**—tick this checkbox to allow a customer to make a payment for the order again, if it was declined.

     .. note::

         To make this option work properly, go to **Settings → Checkout** and enable the **Allow a customer to pay the order again if transaction was declined** setting.

   * **Invoice/Credit memo**——choose the desired behavior after an order gets this status:

     * *Default*—the default behavior (an invoice ID is not generated);

     * *Invoice*—the order has been paid and processed successfully (an invoice ID is generated);

     * *Order*—the order has been placed, but not paid out;

     * *Credit memo*—the order has been paid and processed, but then returned (a credit memo ID is generated).

   .. important

       The properties described below appear only when the corresponding add-ons are installed and activated under **Add-ons → Manage add-ons**. These add-ons are: **Suppliers**, **Gift certificates**, **RMA**.

   * **Notify supplier**—tick this checkbox to send an automatic email notification to suppliers whose products are in the order when the order gets this status.

   * **Change gift certificate status to**—choose a status to be automatically assigned to gift certificates included in the order when the order status changes to this status.

   * **Allow return registration**—tick this checkbox to allow customers to request a return if the order has this status.

#. Click the **Save** button.

   .. image:: img/order_status_01.png
       :align: center
       :alt: Status settings
