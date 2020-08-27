************************
PayPal Commerce Platform
************************

By default, :doc:`all the money from orders in Multi-Vendor goes to marketplace owner </user_guide/users/vendors/workflow>`. After that, vendors can request that money when they decide to withdraw it. The marketplace owner then has to transfer that money to vendors by whatever means.

The PayPal Commerce Platform add-on allows marketplace owners to make the splitting process automatic. Money from each order is automatically distributed between the marketplace and the involved vendors.

.. contents::
    :backlinks: none
    :local:
    
Functionality
=============

This add-on allows the marketplace owner to:

* accept payments using different payment services;

* split the payments between vendors.

  .. image:: img/paypal_payment.png
      :align: center
      :alt: Paypal page with payment options
      
How to Install and Configure the Add-on
=======================================

#. Install the PayPal Commerce Platform add-on :doc:`just like any other add-on </user_guide/addons/1manage_addons>`.

#. Configure the add-on. It has only one setting, and allows you to choose an order status on refund. This is the status which the order gets after a refund has been requested via PayPal or RMA. This setting will only appear if you have the :doc:`/user_guide/addons/rma/index` add-on installed.

#. Create  a payment method that uses PayPal Commerce Platfrorm.

#. Have your vendors connect their PayPal accounts to your marketplace.That will allow them to receive money from orders.

   .. note:: 
   
       Learn more about setting up the payment method and connecting your vendors :doc:`in a dedicated article </user_guide/addons/paypal_commerce_platform/configure>`.

Related Articles
================

:doc:`How To: Set Up PayPal Commerce Platform in Multi-Vendor </user_guide/payment_methods/paypal_commerce_platform>`


