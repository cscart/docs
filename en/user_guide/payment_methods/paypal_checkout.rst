******************************
How To: Set Up PayPal Checkout
******************************


PayPal Checkout allows you to quickly set up a payment method in your online store and offer your customers secure and familiar payment options. 

#. Go to **Add-ons → Downloaded Add-ons**. Search for the **PayPal Checkout** add-on and enable it.
#. Go to **Settings → Payment methods**.
#. Click on the **+** icon to add a :doc:`new payment method </user_guide/payment_methods/adding_payment>`.
#. Create a new payment method based on the **PayPal Checkout** processor.

   .. image:: img/pp_checkout_general.png
       :align: center
       :alt: Creating a new PayPal Checkout payment method.
    
#. Switch to the **Configure** tab and specify PayPal settings.

   * **Account settings:**

     * **App Client ID, App Secret**—these settings connect your store to your PayPal account. Get these credentials from PayPal. 
     
     * **Test/Live mode**—set to *Live* to accept real payments.
     
       The test mode is intended for developers. It works with the special PayPal sandbox instead of live servers. No real money is involved in sandbox transactions.
       
     * **Currency**—if you specify the currency that is not the same as the store's primary currency, then it will be converted as soon as you go to the PayPal checkout page. The currency is converted at the exchange rate set for it in this store.
     
   * **Funding sources to show on checkout**—choose the payment services you want to be displayed on the PayPal checkout page.
     
   * **Button appearance**—choose the shape, color and height of the PayPal button on the checkout page.

#. Click the **Create** button.

   .. image:: img/paypal_checkout_configure.png
    :align: center
    :alt: A PayPal Checkout Configure tab.


