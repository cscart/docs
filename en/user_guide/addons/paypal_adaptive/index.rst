************************
PayPal Adaptive Payments
************************

.. note::

    This add-on comes with Multi-Vendor 4.5.1 and newer versions. New clients :ref:`will need to contact their PayPal manager <paypal-adaptive-app>` to start using PayPal Adaptive Payments.

By default, all the money from purchases in a Multi-Vendor store goes to the store owner. The store owner is then supposed to distribute that money among vendors and use the :doc:`Accounting </user_guide/users/vendors/account_balance>` page to keep track of the transactions.

The **PayPal Adaptive Payments** add-on allows store owners to avoid manual distribution of funds among vendors. Instead, a single payment made by a customer is automatically shared between vendors and the store owner.

.. image:: img/adaptive_payments_scheme.jpg
    :align: center
    :alt: Change the status of the payout when necessary.

========================
Key Points to Know About
========================

* PayPal deducts money from a customer’s account and deposits it in the accounts of the store owner and vendors automatically, depending on how the store owner configured the commission. 

* The customer only knows about the store owner as a primary recipient, not the vendors. The vendors only know about the primary recipient, not the customer.

* The store owner must have a PayPal Business account.

* The payments made via PayPal Adaptive Payments must be authorized and approved by the customer. Adaptive Payments uses the web redirect approval method, in which web stores redirect the customer to PayPal.com to log in for approval.

* PayPal can process up to 5 vendors at a time. If there are more than 5 vendors in an order, the add-on splits the order into several steps. 

  For example, if a customer buys products from 12 vendors in one order, the payment will be automatically split into three steps. That way the customer can buy anything he or she wants in one order.

===================
Server Requirements
===================

Your server must support:
        
* TLS version 1.2

* OpenSSL version 1.0.1 or higher

.. important::

    If your server doesn't meet these requirements, then the **PayPal Adaptive Payments** add-on won't work properly. Learn more in `PayPal Developer Blog <https://devblog.paypal.com/upcoming-security-changes-notice/>`_.

================
Related Articles
================

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:
    
    *

.. meta::
   :description: An addon for Multi-Vendor that adds PayPal Adaptive Payments to your marketplace. This service allows you to distribute money from each order among vendors automatically.
