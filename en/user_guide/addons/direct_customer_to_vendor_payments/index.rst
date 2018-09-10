**********************************
Direct Customer-to-Vendor Payments
**********************************

.. note::

    This add-on first appeared in Multi-Vendor 4.9.1. It is available only in Multi-Vendor Plus.

=============
Functionality
=============

By default, the money in Multi-Vendor first goes to the marketplace owner, who then distributes it among vendors. Here is :doc:`an article in the documentation </user_guide/users/vendors/workflow>` that explains how it works. The **Direct Customer-to-Vendor Payments** add-on changes that behavior as follows:

* When a customer buys products from multiple vendors, he or she has to pay each vendor individually. 

  .. image:: img/separate_checkouts.png
      :align: center
      :alt: Customers pay each vendor separately at checkout.

* That allows vendors to set up their own :doc:`payment methods </user_guide/payment_methods/index>`. Money goes to vendors directly, and it achieves two goals:

  * Marketplace owners don't need to distribute money from orders among vendors.

  * Vendors get their money faster (because they no longer need to wait for the marketplace owner to distribute it).

  .. image:: img/vendor_payment_methods.png
      :align: center
      :alt: Vendors create their own payment methods to receive money faster.

  If a vendor doesn't set up a payment method, then the payment methods created by the marketplace owners will be offered to customers buying from that vendor instead. In this case the money will go to the marketplace owner, who'd then have to transfer it to the vendor.

* Separate checkouts for vendors mean that each vendor can now set up own :doc:`promotions </user_guide/manage_products/promotions/index>`.

  .. image:: img/vendor_promotions.png
      :align: center
      :alt: Vendors run their own promotions.

============
Installation
============

The **Direct Customer-to-Vendor Payments** add-on is installed :doc:`like any other add-on </user_guide/addons/1manage_addons>`. The only difference is that after installation you'll also need to set the set the status of the add-on to *Active*.

During activation, the add-on will automatically disable the following add-ons:

* :doc:`/user_guide/addons/gift_certificates/index`

* :doc:`/user_guide/addons/paypal_adaptive/index`

* :doc:`/user_guide/addons/stripe_connect/index`

* :doc:`/user_guide/addons/reward_points/index`

  .. image:: img/direct_payments_activation.png
      :align: center
      :alt: The "Direct Customer-to-Vendor Payments" add-on automatically disables other conflicting add-ons.
