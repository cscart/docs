*******************************************
How To: Set up the SMS Notifications Add-on
*******************************************

#. In the Administration panel, go to **Add-ons → Manage add-ons**.

#. Change the status of the **SMS notifications** add-on to *Active*.

   .. hint::

       If you do not see this add-on in the **Installed add-ons** tab, switch to the **Browse all available add-ons** tab and click the **Install** button near the **SMS notifications** add-on.

#. Click on the name of the add-on to open its settings.

#. Fill in the following fields:

   * **Phone number**—the phone number to which all SMS notifications will be sent.

   * Specify **Clickatell settings**:

     * **API ID**—the unique API key that you generate in your account on the Clickatell side.

     * **Use Unicode**—select to send SMS in `the Unicode format <https://www.clickatell.com/faqs/answer/do-you-support-unicode/>`_.

     * **Split long SMS into several parts**—choose whether or not to split long SMS into shorter parts to avoid possible loss of information.

   * Configure the settings in the **Send SMS if** and **SMS content** sections:

     * Send SMS if:

       * **New order has been placed**—choose whether or not to receive notifications about new orders.

       * **New customer has been registered**—choose whether or not to receive notifications about newly-registered customers.

       * **Product quantity is less than zero**—choose whether or not to receive notifications about out-of-stock products.

       * **Only send when order total amount is more than**—select the minimum order subtotal; you won't be notified via SMS about orders with lower subtotal.

       * **Only send for these shipping methods**—select the shipping methods that must be used in an order; if an order uses other shipping methods, you won't be notified about that order via SMS.

     * SMS content

       * **Add payment info**—if you tick this checkbox, then SMS notifications will include payment details.

       * **Add customers e-mail**—if you tick this checkbox, then SMS notifications will include customers' email addresses.

#. Click the **Save** button.

   .. note ::

       If you have configured everything, but do not receive SMS notifications, please refer to :doc:`this article <sms_not_sent>`.
