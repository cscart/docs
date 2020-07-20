*******************************************************
How To: Make Shipping Cost Depend on the Product Amount
*******************************************************

Let's say you want delivery in your store to become cheaper when a customer purchases more one product at a time. To do this, follow these steps:

#. Open  the **Administration → Shipping & Taxes → Shipping methods** page.

#. :doc:`Add  a new shipping method with manual rate calculation </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>`, or choose one of the existing methods to configure it.

#. Go to the **Shipping time and rates** tab.

#. Decide where your shipping method will be offered. To do this, choose :doc:`rate areas </user_guide/shipping_and_taxes/locations/index>` from the dropdown list. If there is a rate area in the store which you did not include in the shipping method, orders will not be delivered in this area.

   .. hint::
   
       If a certain rate area does not exist in your store, you can :doc:`add it  </user_guide/shipping_and_taxes/locations/set_location>`. This is only necessary if you need to add different conditions and availability/unavailability of delivery to this area.

#. Configure each rate area, and specify the **Items condition**. In this case there are two ways to configure this section:
   
   * **Way 1**:
   
     In the **Rate** field enter the base shipping cost, for example, *$50*. Configure the **Items condition** as follows:
   
     .. list-table::
         :widths: 10 20 10
         :header-rows: 1

         * - From 
           - To
           - Surcharge / Discount
         * - 5 item
           - and up (leave the field empty)
           - -$30.00
			 
   * **Way 2**:
   
     Leave the **Rate** field empty, and configure the **Items condition** as follows:
	
     .. list-table::
         :widths: 10 20 10
         :header-rows: 1

         * - From 
           - To
           - Surcharge / Discount
         * - 1 item
           - 5 item
           - $50.00
         * - 5 item
           - and up (leave the field empty)
           - $20.00

   .. note::

       In this case, if a client has 5 or more products in his order, the shipping will cost him *$20* instead of *$50*.

#. Click the **Save** button.

.. meta::
   :description: How to set shipping rates that depend on the amount of ordered products in CS-Cart or Multi-Vendor?
