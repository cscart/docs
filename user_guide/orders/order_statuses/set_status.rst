******************************
How To: Set up an Order Status
******************************

To set up an order status:

*   In the Administration panel, go to **Administration → Order statuses**.
*   Create a new order status by clicking the **+** button or set up the existing one by clicking on its name.

.. image:: img/order_status_02.png
    :align: center
    :alt: Add status

.. important ::

    		Your store can have up to 26 order statuses at the same time, as the database uses letters to identify them.

*   Specify the following status options:

    *   **Name** — The name of the status.
    *	**Status** — Letter symbol to identify the status in the database.
    *   **E-mail subject** — The text, which will be the subject of the e-mail notification about the order with this status.
    *   **E-mail header** — The text, which will be displayed in the e-mail notification about the order with the status.
    *   **Color** — Color to be used to visually distinguish orders in this status from other orders in the order list in the Administration panel. Either enter an RGB code into the text field, or click the palette icon to open a palette and pick the color.
    *   **Notify customer** — Tick the check box if you want to inform the customer about placing the order with this status or changing the order information.
    *   **Notify orders department** — Tick the check box if you want to inform the store administrator about placing the order with this status.

    	.. note ::

    		The email address of the order department to receive notification at is specified in the section **Settings → Company**.

    *   **Inventory** — Choose whether to decrease or increase the number of items in stock for products included in the order.
    *   **Remove CC info** — Select to remove sensitive credit card info from the database when the order status changes to this status.
    *   The **Pay order again** option allows a customer to pay the order again if it was declined.

        .. important ::

        	To make this option work properly, enable the **Allow a customer to pay the order again if transaction was declined** option in the **Settings → Checkout** section.

    *   **Invoice/Credit memo** — Choose the condition of the order after receiving this status: *Default* — the default behavior (an invoice ID is not generated); *Invoice* — the order has been paid and processed successfully (an invoice ID is generated); *Order* — the order has been placed, but not paid out; *Credit memo* — the order has been paid and processed, but then returned (a credit memo ID is generated).

    *	**Notify supplier** — Select to send an automatic email notification to suppliers whose products are in the order when the order status changes to this status.

        .. note ::

        	This setting appears when the **Suppliers** add-on is installed and set up in the **Add-ons → Manage add-ons** section.

    *   **Change gift certificate status to** - Choose a status to be automatically assigned to gift certificates included in the order when the order status changes to this status.

        .. note ::

        	This setting appears when the **Gift certificates** add-on is installed and set up in the **Add-ons → Manage add-ons** section.

    *   **Allow return registration** — Select to allow customers to request a return if the order has this status.

    	.. note ::

    		This setting appears when the **RMA** add-on is installed and set up in the **Add-ons → Manage add-ons** section.

.. image:: img/order_status_01.png
    :align: center
    :alt: Status settings

*   Click the **Save** button.
