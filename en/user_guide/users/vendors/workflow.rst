************************************************
Money Flow in Multi-Vendor and How to Control It
************************************************

This article describes the flow of money in Multi-Vendor, and how the marketplace owners can control it. The best way to describe it is to explain the standard behavior of Multi-Vendor (without any add-ons), and how various built-in add-ons extend the functionality.

.. contents::
   :backlinks: none
   :local:

===============================
Basic Multi-Vendor (No Add-Ons)
===============================

**By default, all the money from orders in Multi-Vendor goes to the marketplace owner.** That way customers have to make only one payment for one order with products from different vendors. The order is then automatically split into multiple orders, so that each vendor could manage their own part of the original order.

Once the marketplace owner receives the money, it's up to him or her to distribute it among vendors. For that purpose, Multi-Vendor has the :doc:`Accounting </user_guide/users/vendors/account_balance>` page. It tracks vendors' account balance and provides the following tools for money management:

* A vendor can :ref:`request the withdrawal <withdrawal>` of a certain sum of money from his or her account balance. It's up to the marketplace owner to actually transfer the money; the transfer itself isn't performed through Multi-Vendor.

* The marketplace owner can also :ref:`issue payouts <payout>` to take sum from a vendor's account balance in favor of the marketplace. That's how the marketplace makes its profits.

  .. image:: img/account_balance.png
      :align: center
      :alt: The Accounting page in Multi-Vendor.

If a vendor's balance is negative, the marketplace owner has to contact the vendor and resolve the situation somehow. For example, :doc:`the vendor's status </user_guide/users/vendors/vendor_statuses>` can be manually changed to *Pending*—that way vendor’s administrators will be able to work in their administration panel, but the vendor’s products won't appear on the storefront.

.. note::

    **Summary:** By default, a Multi-Vendor marketplace receives all the money from orders. Marketplace owners then manually distribute money between vendors and manage debtors. Payments for marketplace services also have to be taken manually. Some built-in add-ons that we'll describe below will help with automating these processes.

============
Vendor Plans
============

The :doc:`/user_guide/addons/vendor_plans/index` add-on helps with accounting. It offers plans for vendors with various restrictions and conditions. The add-on provides the following tools for the marketplace owners to make money off those plans:

* One-time or periodic fee for using the plan.

* A commission from every order of a vendor who uses the plan.

  .. image:: /user_guide/addons/vendor_plans/img/vendor_plans.png
      :align: center
      :alt: Vendor plans in Multi-Vendor ecommerce software.

The information about fees and commissions is recorded automatically on the **Accounting** page. As a result, it's easier for a marketplace owner to take periodic or transaction fees into account when distributing money among vendors.

.. note::

    **Summary:** The :doc:`/user_guide/addons/vendor_plans/index` add-on doesn't automate money distribution by itself. It only makes accounting easier by tracking one-time and periodic fees and commissions from orders.

===========================
Marketplace Payment Methods
===========================

Some real-time payment methods are designed specifically for marketplaces. These payment methods automatically distribute money from orders between the marketplace and the vendors right when the payment is received. The distribution of money is automatically documented on the **Accounting** page as completed payouts and withdrawals.

Currently, Multi-Vendor has the following payment methods with automatic money distribution (as built-in add-ons):

* :doc:`/user_guide/addons/paypal_for_marketplaces/index`

* :doc:`/user_guide/addons/stripe_connect/index`

These add-ons can be configured to collect the following sums in favor of the marketplace:

* Transaction fees only.

* Transaction fees and any unpaid payouts (debts) that the vendor might have.

However, for these payment methods to work, all vendors whose products are being bought it one order must be able to receive payments via the chosen payment method. 

.. note::

    **Summary:** Payment methods designed for marketplaces allow to distribute money from orders automatically. These payment methods can also collect debts from vendors. The drawback is that all the vendors handling an order need to be able to receive money via the chosen payment method.

==================
Vendor Debt Payout
==================

The :doc:`/user_guide/addons/vendor_debt_payout/index` add-on covers the situations when vendor debts and fees for plans need to be collected without using marketplace payment methods. Here is what the add-on offers:

* Limit on the maximum debt of a vendor and the time within which a vendor must pay for using the vendor plan.

* Automatic restriction of functionality of the vendor's administration panel when the vendor exceeds the limits mentioned above.

* The ability for a vendor to pay the debts by clicking a button in the Administration panel. The process works much like checkout on the storefront.

  .. image:: /user_guide/addons/vendor_debt_payout/img/vendor_panel_blocked.png
     :align: center
     :alt: Vendor plans in Multi-Vendor ecommerce software.

Although this approach requires action from vendors, it allows marketplace owners to use any payment methods, even if they weren't designed with marketplaces in mind.

.. note::

    **Summary:** The :doc:`/user_guide/addons/vendor_debt_payout/index` add-on allows marketplace owners to automate the collecting of debts from vendors. If vendors don't pay, they won't be able to work in their administration panels. The payment process itself is just like placing an order on the storefront.

==================================
Direct Customer-to-Vendor Payments
==================================

.. note::

    This add-on is available only in Multi-Vendor Plus.

The :doc:`/user_guide/addons/direct_customer_to_vendor_payments/index` add-on frees the marketplace owners from the need to distribute money among vendors. Here's how it works:

#. Vendors create their own payment methods.

#. When customers buy products from multiple vendors, they pay to each vendor separately at checkout.

#. The money from orders goes directly to vendors.

   .. hint::

       If a vendor doesn't set up a payment method, then the marketplace payment methods will be offered at checkout. The money will go to the marketplace owner, who will have to transfer it to vendor.

#. Any transaction fees imposed by the marketplace are listed as :ref:`unpaid payouts <payout>` (vendor's debt to the marketplace owner).

   .. image:: /user_guide/addons/direct_customer_to_vendor_payments/img/vendor_payment_methods.png
       :align: center
       :alt: Paying to vendors separately means that each vendor gets money directly from customers, without the need for you to do something about it.

Direct payments to vendors work best when combined with some other add-ons mentioned above. Here is what they achieve together:

* :doc:`/user_guide/addons/vendor_plans/index` keep track of the periodic and order-specific fees that a vendor has to pay for using the marketplace.

* :doc:`/user_guide/addons/direct_customer_to_vendor_payments/index` ensure that vendors get their money faster, and that you don't need to bother with distributing the money among vendors.

* :doc:`/user_guide/addons/vendor_debt_payout/index` helps you to collect the periodic and order-specific fees from vendors automatically.

  You just set up a payment method, and vendors use it to pay their fees from time to time. If vendors don't pay, they lose access to their admin panel.

.. note::

    **Summary:** The :doc:`/user_guide/addons/direct_customer_to_vendor_payments/index` add-on changes the way your marketplace works: the money goes directly to vendors, and you don't have to distribute it. Other add-ons ensure that vendors pay their fees to the marketplace in a timely manner.
