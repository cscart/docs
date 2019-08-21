***************
Stripe Payments
***************

.. note::

    If you use Multi-Vendor without the :doc:`/user_guide/addons/direct_customer_to_vendor_payments/index` add-on, then all money will go to you, and you will have to distribute it among vendors. To automate this process, use the :doc:`/user_guide/addons/stripe_connect/index` add-on instead of this one.

`Stripe <https://stripe.com/>`_ is an online payment processing service. This add-on for CS-Cart and Multi-Vendor adds Stripe support and allows you to offer the following payment methods to customers:

* Credit cards

* Apple Pay (only to Safari users on Apple devices)

* Google Pay (only to Google Chrome users, and if a credit card is linked to the Google account)

  .. important::

      3-D Secure (and therefore, `Strong Customer Authentication <https://en.wikipedia.org/wiki/Strong_customer_authentication>`_ required by the EU) is supported in our Stripe add-on starting with version 4.10.4.

  .. image:: img/google_pay_in_cscart.png
      :align: center
      :alt: The Google Pay button on the product page added via the Stripe Payments add-on.

================
Related Articles
================

* :doc:`/user_guide/payment_methods/stripe_apple_and_google_pay`

.. meta::
   :description: An add-on for Stripe, Apple Pay, and Goole Pay integration in CS-Cart and Multi-Vendor ecommerce platforms.
