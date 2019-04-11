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

#. Select the :doc:`rate area </user_guide/shipping_and_taxes/locations/index>` for which you'd like to configure the shipping cost. If you don't see the choice of rate areas, it means that you only have one.

#. Configure the **Cost dependencies** section as follows:

   .. list-table::
       :widths: 10 10 10
       :header-rows: 1

       *   -   Products cost 
           -   Rate value
           -   Type
       *   -   More than $0.00
           -   4.50
           -   Absolute ($)

#. Configure the **Items dependencies** section as follows:

   .. list-table::
       :widths: 10 10 10 10
       :header-rows: 1

       *   -   Product quantity 
           -   Rate value
           -   Type
           -   Per Item
       *   -   More than 0 item(s)
           -   1.50
           -   Absolute ($)
           -   ✓

#. Click the **Save** button (or **Create**, if you're creating a new shipping method).

   The shipping method is set up. For the mentioned example the shipping cost will be $6 if one item is ordered. An extra sum of $1.50 will be added to the cost per each additional item in case of 2 or more items.

   .. note:: 

       This extra charge does not depend on the product that is ordered. For example, if a customer has *2\*Product A + 1\*Product B*, the shipping cost will be $9.

===========================
Way 2. Configuring Products
===========================

A product has :doc:`a property </user_guide/manage_products/products/product_attributes>` that allows you to specify a fixed sum of money to be added to the calculated shipping cost for each item of that product in the cart.

#. Go to **Products → Products**.

#. Click on the name of a product. This will open the product's editing page.

#. Switch to the **Shipping properties** tab.

#. Find the **Shipping freight** field and enter sum (for example, 2.00) which will be added to the shipping cost for each additional item of that product.

#. Click the **Save** button.

   Now let's assume you followed the instructions from **Way 1**, and then used **Way 2** to set up shipping freight for *Product A*, but not for *Product B*. In that case the shipping costs will be calculated as follows:

   * **1\*Product A** = $4.50 + ($1.50 + $2) = **$8**

   * **2\*Product A** = $4.50 + 2\*($1.50 + $2) = **$11.50**

   * **2\*Product A + 1\*Product B** = $4.50 + 2\*($1.50 + $2) + 1\*$1.50 = **$13**

.. meta::
   :description: How to increase the base shipping charge per item in CS-Cart or Multi-Vendor ecommerce software?
