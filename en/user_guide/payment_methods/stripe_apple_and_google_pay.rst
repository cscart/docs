*************************************************************************
How To: Set Up Apple Pay, Google Pay, and Credit Card Payments via Stripe
*************************************************************************

#. Make sure that the :doc:`/user_guide/addons/stripe_payments/index` add-on is installed and active. If not, :doc:`install and enable the add-on </user_guide/addons/1manage_addons>`.

#. :doc:`Add a payment method </user_guide/payment_methods/adding_payment>` with *Stripe* as **Processor**.

#. Switch to the **Configure tab** and specify the settings:

   * **Publishable key** and **Secret key**—`obtain them from your Stripe dashboard <https://stripe.com/docs/keys>`_.

   * **Stripe account country**—select the country of your Stripe account.

   * **Currency**—the currency of your Stripe account.

   * **Payment type**—what type of payments this method will accept:

     * Credit card

     * Apple Pay

     * Google Pay

     .. note::

         If you want all three, you'll need to create 3 separate payment methods.

     .. image:: img/stripe_configuration.png
         :align: center
         :alt: The Google Pay button on the product page added via the Stripe Payments add-on.

#. For Apple Pay or Google Pay, you'll need to add the correct icon to the payment method. You'll find the correct icon for each of the shipping methods on the **Configure** tab. Both Apple and Google require that their icons are displayed at least as prominently as the other payment method icons in your store.

#. Choose whether or not to show the instant purchase button on the product page.

#. Click **Create** to finish the creation of the payment method. Now it should be available to customers. Please note that:

   * Apple Pay button will appear only in Safari on Apple devices.

   * Google Pay button will appear only to Google Chrome, if a credit card is linked to the Google account.

     .. image:: /user_guide/addons/stripe_payments/img/google_pay_in_cscart.png
         :align: center
         :alt: The Google Pay button on the product page added via the Stripe Payments add-on.

.. meta::
   :description: How to set up Apple Pay and Google Pay in a CS-Cart online store or Multi-Vendor marketplace?
