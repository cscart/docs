*******************************************************
How To: Set Up PayPal Commerce Platform in Multi-Vendor
*******************************************************

.. note::

    PayPal is not yet ready to provide the new payment solution massively. If you are going to use this payment method in your marketplace, please contact `CS-Cart Customer Care <https://helpdesk.cs-cart.com>`_.

.. contents::
    :backlinks: none
    :local:
    
How it Works
============

#. A customer adds a few products from different vendors to his cart.

#. On the checkout page he chooses the PayPal Commerce Platform payment method.

   .. image:: img/paypal_checkout.png
       :align: center
       :alt: Paypal payment method on the checkout page

#. When the customer clicks one of the buttons, he goes to the PayPal checkout page, where he pays for his order.

#. Then there are two ways of what happens next:

   * PayPal automatically splits all the money between the marketplace and the vendors whose products were bought. The marketplace owner doesn’t have to transfer money manually.

   * After placing an order, the **Transfer funds to vendors** button appears on the order page. This button allows the marketplace owner to tranfer money to the vendor for the current order manually. After clicking this button, the note will inform you if **Funds have been transferred successfully** or not.

     .. note::

         This action is available after ticking the **Delay transfer of funds** checkbox when configuring the payment method.

How to Configure the Payment Method
===================================

#. `Sign up for PayPal Commerce Platform <https://www.paypal.com/us/business/platforms-and-marketplaces>`_.
	
#. Install the :doc:`/user_guide/addons/paypal_commerce_platform/index` add-on.

#. Create a :doc:`new payment method </user_guide/payment_methods/adding_payment>` based on the PayPal Commerce Platform processor.

#. Open the Configure tab and fill in the following fields:

   * **Account settings:**

     * **Partner integration code**—your build notation (BN) code. Contact `CS-Cart Customer Care <https://helpdesk.cs-cart.com>`_ to get it.

     * **Merchant account ID, App Client ID, App Secret**—these settings connect your marketplace to your PayPal account. Get these credentials from PayPal.

     * **Test/Live mode**—set to *Live* to accept real payments.

       The test mode is intended for developers. It works with the special PayPal sandbox instead of live servers. No real money is involved in sandbox transactions.

     * **Currency**—if you specify the currency that is not the same as the marketplace primary currency, then it will be converted as soon as you go to the PayPal checkout page.

   * **Delay transfer of funds to vendors:**

     * **Delay transfer of funds**—delay sending money to vendors up to 28 days. Configure manual or automatic disbursements to vendors.

       To schedule automatic periodic disbursements, add a special command to cron. Set the desired value of the "--days" parameter. Money will be automatically transfered to vendors for orders that are older than this value.

       ``php /path/to/cart/admin.php --dispatch=paypal_commerce_platform.disburse_payouts_by_cron --payment_id=14 --days=14`` 

   * **Funding sources to show on checkout**—choose the payment services you want to be displayed on the PayPal checkout page.

   * **Cards to show on checkout**—choose the payment cards you want PayPal to accept payments from.

   * **Button appearance**—choose the shape, color and height of the PayPal button on the checkout page.

#. Click the **Create** button.

   .. image:: img/paypal_settings.png
       :align: center
       :alt: Configure tab in the settings of the paypal commerce platform add-on

Have Your Vendors Connect Their Accounts
========================================

Vendors connect their PayPal business accounts to receive the money for their products that have been sold. If a customer adds products from different vendors to his cart, and all those vendors have their PayPal accounts connected to the marketplace, then this payment method will be offered to the customer.

.. note::

    CS-Cart uses `Connected path <https://www.paypal.com/lu/smarthelp/article/what-integration-methods-are-available-for-paypal-for-marketplaces-ts2126>`_ as an integration method with PayPal Commerce Platform. This method requires business accounts from all vendors. 

Here is an instruction for vendors on how to connect their PayPal accounts:

#. Open the **Vendors → Vendors** page.

#. Click on the vendor’s name to open his settings.

#. Go to the **PayPal** tab.

#. Click **Connect with PayPal**.

   .. image:: img/connect_with_paypal.png
       :align: center
       :alt: Connecting with paypal in the vendor's settings

#. You’ll be taken to the PayPal website. Follow the instructions there to connect your account to the marketplace. This will allow you to receive money from orders to your PayPal account without the need to request its withdrawal from the marketplace owner.

#. After you have done everything on the PayPal’s side, you will be redirected back to your store.

#. Click the **Save** button.

