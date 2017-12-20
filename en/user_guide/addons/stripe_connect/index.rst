***********************
Stripe Connect Payments
***********************

.. note::

    This add-on comes with Multi-Vendor 4.7.1 and newer versions.

By default, all the money from purchases in a Multi-Vendor store goes to the store owner. The store owner is then supposed to distribute that money among vendors and use the :doc:`Accounting </user_guide/users/vendors/account_balance>` page to keep track of the transactions.

The **Stripe Connect Payments** add-on allows store owners to avoid manual distribution of funds among vendors. Instead, a single payment made by a customer is automatically shared between vendors and the store owner.

.. image:: img/stripe_connect_scheme.png
    :align: center
    :alt: The general scheme of the Stripe Connect Payments add-on.

===================
General Information
===================

* All main credit cards are accepted—Visa, MasterCard, American Express, Discover, JCB, and many others.

* The add-on supports payments in 135+ currencies. Currency conversion is included—customers pay in their native currency, vendors receive funds in theirs.

* Vendors can use `Standard <https://stripe.com/docs/connect/standard-accounts>`_ Stripe accounts.

* When a customer pays for an order that consists of products from different vendors in one cart, Stripe Connect automatically splits the payment between the vendors, transferring the commission to the account of the store owner.

* The money is transferred straight from the customer to the vendor without any deposits on the store owner side. The store owner simply gets his or her fee during the process.

* Every transaction is charged with additional Stripe fee.

* The vendor is responsible for the cost of Stripe fees, refunds, and chargebacks.

* Stripe allows to connect an unlimited number of vendor accounts to the store owner's account.

* Stripe Connect is fully integrated with Multi-Vendor's :doc:`RMA </user_guide/addons/rma/index>` add-on to provide easier processing of return requests and refunds.

================
Related Articles
================

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:
    
    *
