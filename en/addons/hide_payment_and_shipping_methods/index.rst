*********************************
Hide Payments
*********************************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000139" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local:
    :depth: 3

--------
Overview
--------

    The `Hide Payments <https://www.simtechdev.com/addons/site-management/hide-payment-and-shipping-methods-for-user-groups.html>`_ add-on is the best way to make sure the right customers see the right payment or shipping options in your store. It allows you to hide any payment or shipping method from a particular user group.

=========================================
Why standard functionality is not enough?
=========================================

    Say, you want the **Credit card** payment method to be available to your retail customers and hide it from wholesale customers. So you try to set this up in the payment method settings:

    .. fancybox:: img/Hide_payment_and_shipping_010.png
        :alt: Hide Payments

    But you face with the problem that both retail and wholesale customers are associated with the registered users. So, you cannot allow your retail customers who have registered in the store to use the credit card option without also allowing the wholesale group to do so. It's kind of a dilemma, huh?

========================
What does the add-on do?
========================

    The main idea of the add-on is to allow you to show/hide any payment or shipping method from any user group. So, there is no more confusion with user groups. The above issue can be easily solved by adjusting the settings in the following way:

    .. fancybox:: img/Hide_payment_and_shipping_011.png
        :alt: Hide Payments

    Install the add-on and see it in action! 

============
Key features
============
 
    * Restrict access to payment and shipping methods for specific user groups.

    * Override default user group settings for payment and shipping methods.

    * Restrict access to payment and shipping methods for certain admins.

============= 
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/latest/cscart_addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

--------------------------
Managing in the admin area
--------------------------

=====================
Installing the add-on
=====================

    Install the “Hide Payments” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Hide_payment_and_shipping_001.png
        :alt: Hide Payments

======================
Hiding payment methods
======================

    To hide the payment method from a particular user group:

    Navigate to **Administration > Payment methods**.

    Open the settings of the desired method.

    .. fancybox:: img/Hide_payment_and_shipping_005.png
        :alt: Hide Payments

    In the **General** tab, find the **Restrict for user groups** setting and select the user groups for which you want to hide this payment method.

    .. fancybox:: img/Hide_payment_and_shipping_002.png
        :alt: Hide Payments

    .. note::

        If the same user group is selected in both **Restrict for user groups** and **User groups** settings, the **Restrict for user groups** setting will prevail.

        .. fancybox:: img/Hide_payment_and_shipping_004.png
            :alt: Restrict Payment and Shipping Methods

    Place a test order to check the changes. As you can see, the **Credit card** option is not available as we hid it for the guest user group.

    .. fancybox:: img/Hide_payment_and_shipping_006.png
        :alt: Hide Payments

=======================
Hiding shipping methods
=======================

    To hide the shipping method from a particular user group:

    Navigate to **Administration > Shipping & taxes > Shipping methods**.

    Open the settings of the desired method.

    .. fancybox:: img/Hide_payment_and_shipping_007.png
        :alt: Hide Payments

    In the **General** tab, find the **Restrict for user groups** setting and select the user groups for which you want to hide this shipping method.

    .. fancybox:: img/Hide_payment_and_shipping_003.png
        :alt: Hide Payments

    .. note::

        If the same user group is selected in both **Restrict for user groups** and **User groups** settings, the **Restrict for user groups** setting will prevail.

        .. fancybox:: img/Hide_payment_and_shipping_008.png
            :alt: Restrict Payment and Shipping Methods

    Place a test order to check the changes. As you can see, the **FedEx** option is not available as we hid it for the guest user group.

    .. fancybox:: img/Hide_payment_and_shipping_009.png
        :alt: Hide Payments

==========================================================================
How to restrict access to shipping and payment methods for certain admins?
==========================================================================

    You may want to hide some of your payment or shipping methods from particular administrators. For example, you have the main administrator who has access to all shipping and payment methods and you also have some other managers for whom you want to forbid using this or that method. To do so:

+++++++++++++++++++++++++++
Step 1. Create a user group
+++++++++++++++++++++++++++

    1. Go to **Customers > User groups**.

    2. Click the + button in the top right corner.

    3. Name the user group and select the **Administrator** type.

    .. fancybox:: img/Hide_payment_and_shipping_012.png
        :alt: creating a user group

    4. Click **Create**.

+++++++++++++++++++++++++++++++++++++++++++++++++
Step 2. Assign an administrator to the user group
+++++++++++++++++++++++++++++++++++++++++++++++++

    1. Go to **Customers > Administrators**.

    2. Select the necessary administrator.

    .. fancybox:: img/Hide_payment_and_shipping_013.png
        :alt: administrators list

    3. Switch to the **User groups** tab, select the user group you created, hover the mouse pointer over it and select **Active**.

    .. fancybox:: img/Hide_payment_and_shipping_014.png
        :alt: user groups list

+++++++++++++++++++++++
Step 3. Restrict access
+++++++++++++++++++++++

    To restrict access to the particular payment method for the admin, select the corresponding user group in the payment method settings. See `Hiding payment methods`_.

    .. fancybox:: img/Hide_payment_and_shipping_015.png
        :alt: restricting access to payment method

    To restrict access to the particular shipping method for the admin, select the corresponding user group in the shipping method settings. See `Hiding shipping methods`_.

    .. fancybox:: img/Hide_payment_and_shipping_016.png
        :alt: restricting access to shipping method

==================================================
How to quickly forbid payment methods for vendors?
==================================================

    1. Go to **Vendors > Vendors**.

    2. Select the necessary vendor.

    3. Switch to the **Payment methods** tab.

    4. Select the checkboxes next to the payment methods you want to forbid for this vendor.

    .. fancybox:: img/Hide_payment_and_shipping_017.png
        :alt: rforbid payment method for vendor

    5. Click **Save**.