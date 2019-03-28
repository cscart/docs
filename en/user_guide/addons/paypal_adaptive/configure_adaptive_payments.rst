*************************************************************
How To: Install and Configure PayPal Adaptive Payments Add-on
*************************************************************

.. note::

    The :doc:`PayPal Adaptive Payments <index>` add-on comes with Multi-Vendor starting with version 4.5.1. New clients :ref:`will need to contact their PayPal manager <paypal-adaptive-app>` to start using PayPal Adaptive Payments.

1. Open the Administration panel and go to **Add-ons → Manage add-ons**.

2. Switch to the **Browse all available add-ons** tab and install **PayPal Adaptive Payments**.

   .. important::

       Please make sure you have the :doc:`Vendor plans </user_guide/addons/vendor_plans/index>` add-on installed. Otherwise you won't be able to install **PayPal Adaptive Payments**.

   .. image:: img/install_paypal_adaptive.png
       :align: center
       :alt: Find and install the PayPal Adaptive Payments add-on.

3. If the installation is successful, find **PayPal Adaptive Payments** and click on its name to access the add-on's settings.

4. A pop-up window open. Configure the add-on's settings there:

   * **Commission includes**—this radio button determines how the funds will be diverted to the store owner. There are 2 ways:

     * **Order commission**—when an order is paid, the commissions :doc:`specified via the Vendor plans add-on </user_guide/users/vendors/manage_vendor_plans>` will be deposited in the store owner's account automatically. The remaining money will be distributed among vendors, and completed :ref:`withdrawals <withdrawal>` will be created for vendors automatically. :ref:`Payouts <payout>` will be ignored.

     * **Order commission and unpaid payouts**—when an order is paid, the commissions :doc:`specified via the Vendor plans add-on </user_guide/users/vendors/manage_vendor_plans>` will be deposited in the store owner's account automatically.

       If a vendor owes the store owner a certain sum, that sum will be taken from the vendor's share in the order and diverted to the store owner's account as well.

       .. important:: 

           If the vendor's share in the order can cover all of the vendor's pending :ref:`payouts <payout>`, those payouts will be marked as *Completed*. Otherwise they'll remain with the *Pending* status until the remaining debt is covered by one of the next orders.

       After that, if the vendor's share has any sum of money left, it will be deposited in the vendor's account and recorded as a completed :ref:`withdrawal <withdrawal>`.

   * **PayPal Adaptive logo**—the logo that will appear on the PayPal page during checkout at the top of the cart review area. Your image shouldn't be wider that 190 pixels and higher than 60 pixels. PayPal crops larger images.

   * **Display verification status to customers**—this checkbox determines whether or not to display the PayPal verification status of the vendor on a product page next to the vendor's name.

     .. important::

         By **PayPal verification** we mean that a vendor provided a correct email associated with a functioning PayPal account.

   * **Verification image**—if you don't upload an image, the verification status next to the vendor's name on a product page will appear as text. Otherwise, the uploaded verification image will replace the text status.

     * **Image width**—the width of the verification image.

     * **Image height**—the height of the verification image.

   * **Use this link to get E-mail verification status of your vendors via CRON**—this link checks the verification statuses of all vendors at once. 

     We recommend you set up a CRON job to do this regularly. It's important, because when a customer buys products from multiple vendors in one order, all those vendors must be verified.

5. Once you have configured the add-on, click **Save**. Now it's time to :doc:`create a payment method that uses PayPal Adaptive Payments </user_guide/payment_methods/paypal_adaptive_payments>`.

   .. image:: img/paypal_adaptive_addon_settings.png
      :align: center
      :alt: Configure PayPal Adaptive Payments.

.. meta::
   :description: Use PayPal Adaptive Payments to collect debts and payments for plans from vendors in Multi-Vendor ecommerce software.
