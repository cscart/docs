************************************************************************
How To: Set a Base Shipping Charge for One Item and Increase it Per Item
************************************************************************

You can make flexible shipping charges that depend on the number of products purchased in one order. There are multiple ways to do it:

======================================
Way 1. Configuring the Shipping Method
======================================

#. In the Administration panel, go to **Administration → Shipping & taxes → Shipping methods**.

#. :doc:`Create a new shipping method with manual rate calculation </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>` or click on the name of an existing one.

#. The shipping method editing page will open. Switch to the **Shipping times and rates** tab.

#. Decide where your shipping method will be offered. To do this, choose :doc:`rate areas </user_guide/shipping_and_taxes/locations/index>` from the dropdown list. If there is a rate area in the store which you did not include in the shipping method, orders will not be delivered in this area.

   .. hint::
   
       If a certain rate area does not exist in your store, you can :doc:`add it  </user_guide/shipping_and_taxes/locations/set_location>`. This is only necessary if you need to add different conditions and availability/unavailability of delivery to this area.
       
#. In the **Rate** field enter the base shipping cost, for example, $50.

#. Configure the **Items condition** section as follows:

   .. list-table::
       :widths: 10 20 10 10
       :header-rows: 1

       *   -   From 
           -   To
           -   Surcharge / Discount
           -   Per Item
       *   -   0 item
           -   and up (leave the field empty)
           -   $10.00
           -   ✓
           
#. Click **Save**.

   The shipping method is set up. For the mentioned example the shipping cost will be $60 if one item is ordered. An extra sum of $10 will be added to the cost per each additional item.

   .. note:: 

       This extra charge does not depend on the product that is ordered. For example, if a customer has *2\*Product A + 1\*Product B*, the shipping cost will be $80.

===========================
Way 2. Configuring Products
===========================

A product has :doc:`a property </user_guide/manage_products/products/product_attributes>` that allows you to specify a fixed sum of money to be added to the calculated shipping cost for each item of that product in the cart.

#. Go to **Products → Products**.

#. Click on the name of a product. This will open the product's editing page.

#. Switch to the **Shipping properties** tab.

#. Find the **Shipping freight** field and enter sum (for example, $20.00) which will be added to the shipping cost for each additional item of that product.

#. Click the **Save** button.

   Now let's assume you followed the instructions from **Way 1**, and then used **Way 2** to set up shipping freight for *Product A*, but not for *Product B*. In that case the shipping costs will be calculated as follows:

   * **1\*Product A** = $50.00 + ($10.00 + $20.00) = **$80.00**

   * **2\*Product A** = $50.00 + 2\*($10.00 + $20.00) = **$110.00**

   * **2\*Product A + 1\*Product B** = $50.00 + 2\*($10.00 + $20.00) + 1\*$10.00 = **$120.00**

.. meta::
   :description: How to increase the base shipping charge per item in CS-Cart or Multi-Vendor ecommerce software?
