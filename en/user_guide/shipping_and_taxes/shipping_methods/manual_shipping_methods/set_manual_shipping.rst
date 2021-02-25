***************************************
How To: Set Up a Manual Shipping Method
***************************************

To set up a manual shipping method with pre-determined rates depending on a rate area:

#. Open  the **Administration → Shipping & Taxes → Shipping methods** page.

#. Click the **+** botton in the upper-right corner to add a new shipping method, or choose one of the existing methods to configure it.

#. On the **General** tab in the **Rate calculation** section choose **Manual (by rate areas)**.

   .. image:: img/manual_shipping.png 
       :align: center
       :alt: Creating a manual shipping method in CS-Cart

#. Go to the **Shipping time and rates** tab.

#. Decide where your shipping method will be offered. To do this, choose :doc:`rate areas </user_guide/shipping_and_taxes/locations/index>` from the dropdown list. If there is a rate area in the store which you did not include in the shipping method, orders will not be delivered in this area.

   .. hint::
       
       If a certain rate area does not exist in your store, you can :doc:`add it  </user_guide/shipping_and_taxes/locations/set_location>`. This is only necessary if you need to add different conditions and availability/unavailability of delivery to this area.

#. (optional) Specify the **Shipping time** value for each rate area. If a rate area has it's own shipping time, it will be displayed to customers from this area instead of the **Delivery time** from the **General** tab.

#. Specify the **Rate** for each rate area. If you leave the **Rate** field empty (equal to zero by default), the delivery will be free.

#. Add different conditions for each rate area. There are three types of conditions: 

   * :doc:`Price condition </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/order_total>` — the surcharge/discount depends on the total order amount.

   * :doc:`Weight condition </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/total_and_weight>` — the surcharge/discount depends on the weight of products in the order.

   * :doc:`Items condition </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/product_amount>` — the surcharge/discount depends on the number of products in the order.

   .. important::

       The rates within each section are not summed up.  Let’s use **Price condition** as an example: 
       
       Let's say if the order cost is greater than *$0.00*, then the **Surcharge / Discount** is *$20.00*. If the order cost is greater than *$50.00*, then  the **Surcharge/Discount** value increases to *$30.00*. In this case, after specifying the condition *From $50.00*, you need to enter *$30.00* (not *$10.00*) in the **Surcharge / Discount** field.

#. Click **Save**.

   .. image:: img/dependencies.png 
       :align: center
       :alt: Configuring rate areas in CS-Cart
       
.. meta::
   :description: Configuring a shipping method with custom manually-specified shipping rates in CS-Cart or Multi-Vendor.
