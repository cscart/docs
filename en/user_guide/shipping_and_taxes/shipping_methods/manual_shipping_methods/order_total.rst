***************************************************
How To: Make Shipping Cost Dependent on Order Total
***************************************************

Let's say you want delivery in your store to become cheaper when a customer purchases products for a certain amount. To do this, follow these steps:

#. Open  the **Administration → Shipping & Taxes → Shipping methods** page.

#. :doc:`Add  a new shipping method with manual rate calculation </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>`, or choose one of the existing methods to configure it.

#. Go to the **Shipping time and rates** tab.

#. Decide where your shipping method will be offered. To do this, choose :doc:`rate areas </user_guide/shipping_and_taxes/locations/index>` from the dropdown list. If there is a rate area in the store which you did not include in the shipping method, orders will not be delivered in this area.

   .. hint::
   
       If a certain rate area does not exist in your store, you can :doc:`add it  </user_guide/shipping_and_taxes/locations/set_location>`. This is only necessary if you need to add different conditions and availability/unavailability of delivery to this area.

#. Configure each rate area, and specify the **Price condition**. In this case there are two ways to configure this section:
   
   * **Way 1**:
   
     In the **Rate** field enter the base shipping cost, for example, **$50**. Configure the **Price condition** as follows:
   
     .. list-table::
         :widths: 10 20 10
         :header-rows: 1

         * - From 
           - To
           - Surcharge / Discount
         * - $1,000.00
           - and up (leave the field empty)
           - -$30.00
			 
   * **Way 2**:
   
     Leave the **Rate** field empty, and configure the **Price condition** as follows:
	
     .. list-table::
         :widths: 10 20 10
         :header-rows: 1

         * - From 
           - To
           - Surcharge / Discount
         * - $0.00
           - $1,000.00
           - $50.00
         * - $1,000.00
           - and up (leave the field empty)
           - $20.00

   .. note::

       In this case, for orders from $0 to $1000, the shipping cost will be $50, and for orders over $1000, it will be $20.

#. Click **Save**.

.. meta::
   :description: How to set shipping rates that depend on the sum of purchase in CS-Cart or Multi-Vendor?
