******************************************************************
How To: Offer Free Shipping When Order Total Exceeds Certain Value
******************************************************************

Let's say ypu want delivery in your store to become free if the client's order total exceeds certain value. To do this:

#. Open  the **Administration → Shipping & Taxes → Shipping methods** page.

#. :doc:`Add  a new shipping method with manual rate calculation </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>`, or choose one of the existing methods to configure it.

#. The shipping method editing page will open. Go to the **Shipping time and rates** tab.

#. Decide where your shipping method will be offered. To do this, choose :doc:`rate areas </user_guide/shipping_and_taxes/locations/index>` from the dropdown list. If there is a rate area in the store which you did not include in the shipping method, orders will not be delivered in this area.

   .. hint::
   
       If a certain rate area does not exist in your store, you can :doc:`add it  </user_guide/shipping_and_taxes/locations/set_location>`. This is only necessary if you need to add different conditions and availability/unavailability of delivery to this area.
       
#. Configure each rate area, and specify the **Price condition**. In this case there are two ways to configure this section:

   * **Way 1**:
   
     In the **Rate** field enter the base shipping cost, for example, *$50*. Configure the **Price condition** as follows:
   
     .. list-table::
         :widths: 10 20 10
         :header-rows: 1

         * - From 
           - To
           - Surcharge / Discount
         * - $1,000.00
           - and up (leave the field empty)
           - -$50.00
			 
   * **Way 2**:
   
     Leave the **Rate** field empty, and configure the **Items condition** as follows:
	
     .. list-table::
         :widths: 10 20 10
         :header-rows: 1

         * - From 
           - To
           - Surcharge / Discount
         * - $00.00
           - $1,000.00
           - $50.00
         * - $1,000.00
           - and up (leave the field empty)
           - $00.00
           
   .. note::

       In this case, for orders from *$00.00* to *$1,000.00*, the shipping cost will be *$50.00*, and for orders over *$1,000.00*, it will be free.

#. Click the **Save** button.

.. meta::
   :description: How to take no charge for a shipping method with custom manual rates in CS-Cart or Multi-Vendor?
