******************************
How To: Set up an Order Status
******************************

To set up an order status:

#. In the Administration panel, go to **Administration → Order statuses**.

#. Create a new order status by clicking the **+** button or set up the existing one by clicking on its name.

   .. image:: img/order_status_02.png
       :align: center
       :alt: Add status

   .. important ::

    	Your store can have up to 26 order statuses at the same time, as the database uses letters to identify them.

#. Specify the following status properties:

   * **Name**—the name of the status.

   * **Status**—the letter that identifies the status in the database.

   * **E-mail subject**—the text that will be the subject of the e-mail notification about the order with this status.

   * **E-mail header**—the text that will be displayed in the e-mail notification about the order with the status.

   * **Color**—the color to be used for this status the Administration panel. Either enter an RGB code into the text field, or click the palette icon to open a palette and pick the color.

   * **Notify customer**—tick the checkbox if you want to inform customers via email about their orders getting this status.
    
   * **Notify orders department**—tick the checkbox if you want to inform the store administrator about orders getting this status.

     .. note::

         The email address of the order department to receive notification at is specified in the section **Settings → Company**.

   * **Inventory**—choose whether to decrease or increase the number of items in stock for products included in the order.

   * **Remove CC info**—tick this checkbox to remove sensitive credit card info from the database when an order gets this status.

   * **Pay order again**—tick this checkbox to allow a customer to pay for the order again if it has this status.

    .. important ::

        To make this option work properly, go to **Settings → Checkout** and enable the **Allow a customer to pay the order again if transaction was declined** setting.

   * **Invoice/Credit memo**—Choose the condition of the order after receiving this status: 

     * *Default*—the default behavior (an invoice ID is not generated);

     * *Invoice*—the order has been paid and processed successfully (an invoice ID is generated);

     * *Order*—the order has been placed, but not paid out;

     * *Credit memo*—the order has been paid and processed, but then returned (a credit memo ID is generated).

   * **Notify supplier**—tick this checkbox to send an automatic email notification to suppliers whose products are in the order when the order gets this status.

     .. note::

         This setting appears when the **Suppliers** add-on is installed and set up in the **Add-ons → Manage add-ons** section.

   * **Change gift certificate status to**—choose a status to be automatically assigned to gift certificates included in the order when the order status changes to this status.

     .. note::

         This setting appears when the **Gift certificates** add-on is installed and set up in the **Add-ons → Manage add-ons** section.

   * **Allow return registration**—tick this checkbox to allow customers to request a return if the order has this status.

     .. note ::

         This setting appears when the **RMA** add-on is installed and set up in the **Add-ons → Manage add-ons** section.

   .. image:: img/order_status_01.png
       :align: center
       :alt: Status settings

#. Click the **Save** button.
