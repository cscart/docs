***********************
Stripe Connect Payments
***********************

By default, all the money from purchases in a Multi-Vendor store goes to the marketplace owner. The marketplace owner is then supposed to distribute that money among vendors and use the :doc:`Accounting </user_guide/users/vendors/account_balance>` page to keep track of the transactions.

The **Stripe Connect Payments** add-on allows marketplace owners to avoid manual distribution of funds among vendors. Instead, a single payment made by a customer is automatically shared between vendors and the marketplace owner.

===================
General Information
===================

* All main credit cards are accepted—Visa, MasterCard, American Express, Discover, JCB, and many others.

* The add-on supports payments in 135+ currencies. Currency conversion is included—customers pay in their native currency, vendors receive funds in theirs.

* Vendors can use `Standard <https://stripe.com/docs/connect/standard-accounts>`_ or `Express <https://stripe.com/docs/connect/express-accounts>`_ Stripe accounts.

* When a customer pays for an order that consists of products from different vendors in one cart, Stripe Connect automatically splits the payment between the vendors, transferring the commission to the account of the marketplace owner.

* Stripe fees are payable by sellers (when 3D Secure is disabled) or shared proportionally between the seller and the marketplace (when 3D Secure is enabled).

* Stripe allows to connect an unlimited number of vendor accounts to the marketplace owner's account.

* Stripe Connect is fully integrated with Multi-Vendor's :doc:`RMA </user_guide/addons/rma/index>` add-on to provide easier processing of return requests and refunds.

* `Stripe Checkout <https://stripe.com/payments/checkout>`_ support for easy and secure online payment acceptance starting from CS-Cart Multi-Vendor 4.16.1. Stripe checkout allows you to:

  * Provide customers around the world with familiar payment systems like Apple and Google Pay, Sofort and Klarna, WeChat and Alipay, Przelewy24 and Afterpay, and many more (see all the payment options on your `Stripe Dashboard <https://dashboard.stripe.com/settings/payment_methods>`_);

  * Allow customers to purchase without paying upfront via Klarna and Afterpay: the service pays you immediately in full and then collects payments from buyers itself;

  * Reduce the potential anxiety about the safety of customer personal and financial information. Even though CS-Cart software is absolutely safe, customers might not know that. Familiar payment systems reduce the likelihood of abandoned carts;

  * Split the money automatically in all the above scenarios.

================
Related Articles
================

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:
    
    *

.. meta::
   :description: A Stripe Connect integration for Multi-Vendor marketplace to distribute money among vendors automatically.
