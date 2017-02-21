********************************
The Order Gets the Failed Status
********************************

The most probable reason for the orders getting the **Failed** status is that the **Remove CC info** option is enabled for the **Open** status. 

If a realtime payment method is set up in CS-Cart, untick the **Remove CC info** checkbox for the **Open** status under **Administration → Order statuses** and click **Save**.

When a customer clicks the **Place order** button, the new order is registered as **Open**, and after that the necessary information is passed over to the server of the payment method. But if the **Remove CC info** option is enabled, the credit card information is passed over as **XXXX**, and the error occurs.

.. note::

    If these instructions do not help, and an order still gets the **Failed** status when using a realtime payment method, please contact the CS-Cart support team.
 
