********************************
How To: Set Up PayPal in CS-Cart
********************************

CS-Cart provides PayPal integrations to ensure a seamless and secure payment experience for both merchants and customers. We suggest using **PayPal Checkout** for your online store or **PayPal Commerce Platform** for your marketplace. 

There are two distinct PayPal integrations:

#. :doc:`PayPal Checkout for online stores </user_guide/payment_methods/paypal_checkout>`
#. :doc:`PayPal Commerce Platform for marketplaces </user_guide/payment_methods/paypal_commerce_platform>`

.. note::
    
    If your marketplace uses the :doc:`Direct Customer-to-Vendor Payments </user_guide/addons/direct_customer_to_vendor_payments/index>` add-on, then you can also use PayPal Checkout.

PayPal Checkout for online stores
=================================

PayPal Checkout is a solution for online stores, it follows the principle: one seller—one byuer, so there is only one transaction per order. 


   .. image:: img/paypal_checkout.png
       :align: center
       :alt: Paypal payment method on the checkout page


It allows your customers to pay with the following payment methods:
    
* **Credit** and **debit card**
* **PayPal** (including Pay Later)
* **Alternative payment methods**: Like Venmo, iDEAL, giropay. `See PayPal Docs for more information on that <https://developer.paypal.com/docs/checkout/apm/#link-availablepaymentmethods>`_.

It offers features: 

* **Pay Later** allows your customers to pay in convenient installments, while ensuring that you receive full payment at the checkout. Terms and conditions may vary from one country to another.

* The available payment methods appear based on the customer's locations.

* Provides the flexibility to customize the appearance of payment buttons. 


PayPal Commerce Platform for marketplaces
=========================================

Works as PayPal Checkout, but for marketplaces: offers *everything that is in PayPal Checkout* and also facilitates multiple transactions from one buyer to various sellers within single order. PayPal Commerce Platform automatically splits the funds between the marketplace and the vendors whose products were purchased and the marketplace owner doesn’t have to transfer money manually. 

PayPal Commerce Platform allows your customers to pay with the following payment methods:

* **Credit** or **debit cards**
* **PayPal Credit**
* **Alternative payment methods**: Like Venmo, iDEAL, giropay. `See PayPal Docs for more information on that <https://developer.paypal.com/docs/checkout/apm/#link-availablepaymentmethods>`_.

 Allows to show various cards on checkout: Visa, Mastercard and other. 

