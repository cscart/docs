*************************************
How To: Set Up a Free Shipping Method
*************************************

#. In the Administration panel, go to **Administration → Shipping & Taxes → Shipping methods**.

#. :doc:`Add  a new shipping method </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>`, or choose one of the existing methods to configure it.

   .. important::

       Set the **Rate calculation** of this method to one of the options of *Manual calculation (by rate areas)*. In this case, the shipping cost is also set manually.

#. Go to the **Shipping time and rates** tab.

#. Decide where your shipping method will be offered. To do this, choose :doc:`rate areas </user_guide/shipping_and_taxes/locations/index>` from the dropdown list. If there is a rate area in the store which you did not include in the shipping method, orders will not be delivered in this area.

   .. hint::
   
       If a certain rate area does not exist in your store, you can :doc:`add it  </user_guide/shipping_and_taxes/locations/set_location>`. This is only necessary if you need to add different conditions and availability/unavailability of delivery to this area.

#. Leave the **Rate** field empty (equal to zero by default). You do not need to specify price/weight/items conditions either.

   .. hint::

       If you want the shipping to certain rate areas to be paid, just specify the **Rate** or price/weight/items conditions for those areas. 

#. If you want to check the shipping cost, click the **Recalculate rates** button on the **Test rate calculation** tab.

#. Click **Save**.

.. meta::
   :description: How to create a shipping method that is always free in CS-Cart or Multi-Vendor?
