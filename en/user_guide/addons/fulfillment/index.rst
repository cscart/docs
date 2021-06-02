********************************
Order Fulfillment by Marketplace
********************************

.. note:: 
   
    Before using, please make sure that the :doc:`/user_guide/addons/vendor_plans/index` add-on is installed and active.

.. contents::
    :backlinks: none
    :local:
    
Functionality
=============

Previously, when a customer added several products from different vendors to one order, he or she had to choose the shipping method for each product at checkout.

Now fulfillment allows buyers to choose one shipping method for products from different vendors. At the same time, the marketplace handles shipping and gets money for it.

Settings
========

The add-on doesn't have settings. You can enable shipping by the marketplace for products from a specific vendor as follows:

#. Install the **Order Fulfillment By Marketplace** add-on :doc:`just like any other add-on </user_guide/addons/1manage_addons>`.

#. On the **Vendors → Vendor plan** page, find a plan of the vendor whose products will be delivered by the marketplace. Open settings of this plan. 

#. On the **Shipping** tab, tick the **Fulfillment by marketplace** checkbox.

   .. image:: img/enable_fulfillment.png
       :align: center
       :alt: Enabling fulfillment for the vendor plan.

Now all the products from the vendor with this plan will be delivered by the marketplace. A vendor with a ticked fulfillment checkbox in his plan won't be able to use his/her shipping methods. In the shipping method used by the marketplace, an **Owner** is set to *Marketplace*. You can check this in the settings of the shipping method in the **Availability** section.

When the add-on is enabled, all the values ​​from the **Shipping Methods** tab of the vendor settings page are saved, but the tab disappears. When you turn off the add-on, the tab returns with the old settings.

Displaying on the Storefront
============================

.. list-table::
   :widths: 30 40

   * - 1. If a customer has chosen several products from different vendors with fulfillment, there will be one shipping — from the marketplace.
     - .. figure:: img/one_shipping.png
              :scale: 20 %
              :align: left
              :alt: All the products are from vendors with fulfillment.
     
              One shipping — products from vendors with fulfillment are delivered by the marketplace.
   * - 2. If a customer has chosen several products from different vendors and only some of them have fulfillment enabled, then at least it will be two shippings:

          * from the marketplace for products from vendors with fulfillment;

          * from the vendor without fulfillment for his own products.
     - .. figure:: img/several_shippings.png
              :scale: 20 %
              :align: left
              :alt: Poducts are from vendors with and without fulfillment.
              
              Two shippings — products from vendors with fulfillment are delivered by the marketplace, vendor without fulfillment delivers his own products. 