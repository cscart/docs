************************************************************
How To: Install and Configure Stripe Connect Payments Add-on
************************************************************

.. note::

    The **Stripe Connect payments** add-on comes with Multi-Vendor starting with version 4.7.1.

#. Open the Administration panel and go to **Add-ons → Manage add-ons**.

#. Switch to the **Browse all available add-ons** tab and install **Stripe Connect payments**.

   .. image:: img/stripe_connect_install.png
       :align: center
       :alt: Find and install the Stripe Connect Payments add-on.

   .. important::

       Please make sure you have the :doc:`Vendor plans </user_guide/addons/vendor_plans/index>` add-on installed. Otherwise you won’t be able to install **Stripe Connect payments**.

#. If the installation is successful, find **Stripe Connect payments** and click on its name to open the pop-up window where you can configure the add-on's settings.

   **Commission includes**—this radio button determines how the funds will be diverted to the store owner. There are 2 ways:

   * **Order commission**—when an order is paid, the commissions :doc:`specified via the Vendor plans add-on </user_guide/users/vendors/manage_vendor_plans>` will be deposited in the store owner's account automatically. The remaining money will be distributed among vendors, and completed :ref:`withdrawals <withdrawal>` will be created for vendors automatically. :ref:`Payouts <payout>` will be ignored.

   * **Order commission and unpaid payouts**—when an order is paid, the commissions :doc:`specified via the Vendor plans add-on </user_guide/users/vendors/manage_vendor_plans>` will be deposited in the store owner's account automatically.

     If a vendor owes the store owner a certain sum, that sum will be taken from the vendor's share in the order and diverted to the store owner's account as well.

     .. important:: 

         If the vendor's share in the order can cover all of the vendor's pending :ref:`payouts <payout>`, those payouts will be marked as *Completed*. Otherwise they'll remain with the *Pending* status until the remaining debt is covered by one of the next orders.

     After that, if the vendor's share has any sum of money left, it will be deposited in the vendor's account and recorded as a completed :ref:`withdrawal <withdrawal>`.

#. Once you have configured the add-on, click **Save**. Now it’s time to :doc:`create a payment method that uses Stripe Connect </user_guide/payment_methods/stripe_connect>`.

   .. image:: img/stripe_connect_addon_settings.png
       :align: center
       :alt: Configure the settings of the Stripe Connect Payments add-on.
