***********************************************************
How To: Make Shipping Cost Depend on Order Total and Weight
***********************************************************

To set up a shipping cost that depends on order total and weight:

#. In the Administration panel, go to **Administration → Shipping & taxes → Shipping methods**.

#. :doc:`Add  a new shipping method with manual rate calculation </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>`, or choose one of the existing methods to configure it.

#. The shipping method editing page will open. Switch to the **Shipping time and rates** tab.

#. Decide where your shipping method will be offered. To do this, choose :doc:`rate areas </user_guide/shipping_and_taxes/locations/index>` from the dropdown list. If there is a rate area in the store which you did not include in the shipping method, orders will not be delivered in this area.

   .. hint::
   
       If a certain rate area does not exist in your store, you can :doc:`add it  </user_guide/shipping_and_taxes/locations/set_location>`. This is only necessary if you need to add different conditions and availability/unavailability of delivery to this area.
       
#. Leave the **Rate** field empty.

#. Configure the **Price condition** section as follows:

   .. list-table::
       :widths: 10 20 10
       :header-rows: 1

       * - From 
         - To
         - Surcharge / Discount
       * - $00.00
         - $1000.00
         - $50.00
       * - $1000.00
         - and up (leave the field empty)
         - $20.00

#. Configure the **Weight condition** section as follows:

   .. list-table::
       :widths: 10 20 10
       :header-rows: 1

       * - From 
         - To
         - Surcharge / Discount
       * - 0 lbs
         - 100 lbs
         - $10.00
       * - 100 lbs
         - and up (leave the field empty)
         - $15.00

   .. note::

       Make sure to specify the weight when you :doc:`add or edit products </user_guide/manage_products/products/add_product>`.

#. Click **Save**.

   In this case the shipping rates from the **Price condition** and **Weight condition** sections will apply together. Here are some examples of how the shipping cost will be calculated:

   * The order total is below $1000, and the order weight is less than 100 lbs: **$50 + $10**.

   * The order total is below $1000, and the order weight exceeds 100 lbs: **$50 + $15**.

   * The order total exceeds $1000, and the order weight is less than 100 lbs: **$20 + $10**.

   * The order total exceeds $1000, and the order weight exceeds 100 lbs: **$20 + $15**.

.. meta::
   :description: How to set shipping rates that depend on order total and weight in CS-Cart or Multi-Vendor?
