***************************************
Order Fulfillment by Marketplace [Beta]
***************************************

.. note:: 

    This add-on is available only in Multi-Vendor Plus and Ultimate. Before using, please make sure that the :doc:`/user_guide/addons/vendor_plans/index` add-on is installed and active.

.. contents::
    :backlinks: none
    :local:

Functionality
=============

Marketplaces can handle shipping differently. Sometimes vendors ship their products by themselves. Sometimes orders are shipped by the marketplace. There are times when both types of shipping are available in the same marketplace.

By default, Multi-Vendor implements one case: each vendor ships his products by himself, and buyers pay for shipping separately to each vendor. This approach is easier for the marketplace that is just starting its business.

Other cases are implemented by the "Order fulfillment by marketplace [Beta]" add-on. Since the fulfillment service costs money to the marketplace, this cost is included in the vendor plans. When the add-on is active, vendors during the registration can see which plan has a fulfillment advantage.

   .. image:: img/vendor_plans.png
       :align: center
       :alt: Fulfillment is a property of vendor plans.
       
The availability of fulfillment in vendor plans can influence the checkout.

.. list-table::
   :widths: 30 40

   * - 1. If a customer has chosen several products from different vendors with fulfillment, there will be one shipping — from the marketplace.
     - .. figure:: img/one_shipping.png
              :scale: 20 %
              :align: left
              :alt: All the products are from vendors with fulfillment.
     
              One shipping — products from vendors with fulfillment are shipped by the marketplace.
   * - 2. If a customer has chosen several products from different vendors, and only some of them have fulfillment, then at least it will be two shippings:

          * one shipping is from the marketplace for products from vendors with fulfillment;

          * one more shipping is from each vendor without fulfillment.
     - .. figure:: img/several_shippings.png
              :scale: 20 %
              :align: left
              :alt: Products are from vendors with and without fulfillment.
              
              Two shippings — products from vendors with fulfillment are shipped by the marketplace, vendor without fulfillment ships his products by himself.

How to Set Up Fulfillment for Vendors
=====================================

The add-on doesn't have settings. You can enable shipping by the marketplace for products from a specific vendor as follows:

#. Install the Order Fulfillment by Marketplace [Beta] add-on :doc:`just like any other add-on </user_guide/addons/1manage_addons>`.

#. On the **Vendors → Vendor plan** page, choose a plan which will offer fulfillment to vendors.

#. Open settings of this plan. On the **Shipping** tab, tick the **Fulfillment by marketplace** checkbox.

#. Push the **Save** button. Now all the products from the vendor with this plan will be shipped by the marketplace.

   .. image:: img/enable_fulfillment.png
       :align: center
       :alt: Enabling fulfillment for the vendor plan.

#. Go to the **Administration → Shipping & taxes → Shipping Methods** page. :doc:`Create a shipping method </user_guide/shipping_and_taxes/shipping_methods/add_shipping_method>` or find an existing one that will be offered to vendors with fulfillment. To make the shipping method be offered to vendors with fulfillment, set the *Marketplace* as an **Owner** in the **General** tab of this method settings.

Logic Changes after Add-on Activation
=====================================

* While the add-on is off, vendors create their own shipping methods or use created by the marketplace ones. In any case, the money paid for shipping will go to the vendor.

* If the add-on is active, then shipping methods owned by the marketplace become available only for vendors with fulfillment. The marketplace receives money for shipping by these methods. Shipping methods that calculate rates in real time, for example, Canada Post, DHL, etc., use the marketplace address as the origin address for the calculation.