******************************************************
How To: Use a Single Shipping Method for All Customers
******************************************************

Sometimes you only use one shipping method, and that's what you want to use for all customers. This article describes how to set it up.

================================================
Step 1. Leave Only One Shipping Method Available
================================================

#. Go to **Administration → Shipping & taxes → Shipping methods**.

#. Make sure that you have only one shipping method with the *Active* status. Now it will be selected for all customers by default, and they won't be able to change it.

   .. note::

       If a shipping method doesn't work with some region, customers who specify that region won't be able to place an order. Here's `how to troubleshoot shipping issues like that </user_guide/shipping_and_taxes/shipping_methods/no_options>`.

===========================================
Step 2. Adjust the Checkout Page (Optional)
===========================================

#. Go to **Design → Layouts** and switch to the **Checkout** tab.

#. If the shipping method doesn't require customer input (for example, :doc:`selecting a pickup point </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/pickup>`), then you can hide the block for shipping method selection.

#. If you hide shipping selection, it'll make sense to let your customers know how you intend to ship their orders. For that purpose, you can :doc:`add an HTML block with shipping policy </user_guide/shipping_and_taxes/shipping_methods/shipping_tips>`.

.. meta::
   :description: How to disable shipping method selection at checkout in CS-Cart/Multi-Vendor and use a single shipping method?
