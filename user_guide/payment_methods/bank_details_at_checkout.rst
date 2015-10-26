*********************************************
How To: Display Your Bank Details at Checkout
*********************************************

To display some additional payment information during checkout (e.g. your bank details):

*   In the Administration panel, go to **Administration > Languages > Translations**.
*   Click the **+** button and add a new language variable (e.g. *bank_details*) using the form in the popup window. Enter your banking details into the **Value** field (HTML tags are supported), and click the **Create** button.
*   Create the **bank_wire_transfer.tpl** file with the following content on your local computer:

.. code-block:: none

    {__("bank_details")}

*   Upload the created file into the *design/themes/[CUSTOMER_ACTIVE_THEME]/templates/views/orders/components/payments* directory of CS-Cart installation on your server, where *[CUSTOMER_ACTIVE_THEME]* is an active theme of your storefront.
*   In the Administration panel, go to **Administration > Payment methods** and open the settings of the desired payment method, i.e. *Bank wire transfer* (create it if necessary).
*   Select *bank_wire_transfer.tpl* in the **Template** select box in the opened popup window.
*   Click the **Save** button to save the changes.
*   Open the storefront and go to checkout. Select the payment method in the **Billing options** section. The banking details should be displayed below the payment method name.

To add your bank details to a printable/email invoice:

*   Open the **invoice.tpl** file located in the *design/themes/[CUSTOMER_ACTIVE_THEME]/mail/templates/orders* directory.
*   Enter your banking information below the following line:

.. code-block:: none

    {* /Order totals *}

and save the file.

Your banking information will be displayed on the invoice after a customer placed an order and will be sent to this customer's e-mail.

.. note::

	All customers will get e-mail with your banking information despite of chosen payment method.