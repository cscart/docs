***********************************************
How To: Let Customers Pick Up Orders from Store
***********************************************

CS-Cart and Multi-Vendor allow you to create stores and pickup points and set the shipping rates and times depending on where you send the products. Customers will be able to select the store or pickup point where they want to collect their orders.

.. important::

    The rates and time of shipping to a specific store or pickup point are determined by their :doc:`rate areas </user_guide/shipping_and_taxes/locations/index>`.

#. Install the :doc:`Stores and Pickup Points </user_guide/addons/stores_and_pickup_points/index>` add-on.

#. To create stores/pickup points click the **+** button in the upper right part of the **Administration → Stores & pickup points** page.

   Make sure to switch to the **Pickup** tab and select the rate area there. The rate area will determine the rates and time of shipping to that store/pickup point.

   This tab also allows you to choose in which other rate areas the store should appear. That way you'll be able to offer pickup to the residents of nearby areas and not offer it in remote areas.

   .. image:: img/pickup_point_settings.png
       :align: center
       :alt: Select all the rate areas where the pickup point is supposed to appear at checkout.

#. :doc:`Add a shipping method </user_guide/shipping_and_taxes/shipping_methods/add_shipping_method>`. Set "Pickup from store" in the **Rate calculation** setting.

#. Switch to the **Shipping time and rates** tab. Here you can see the rate areas where pick-up from store is available.

   .. hint::

       Free pickup is done :doc:`just like for other shipping methods with manually-specified shipping rates </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_free_shipping>`.

   If you specify shipping time for a specific rate area, it will override the delivery time from the **General** tab of the shipping method editing page.

   .. image:: img/pickup_rates_and_time.png
       :align: center
       :alt: Shipping time and rates for "Pickup from store" shipping method.
	   
#. Check how the new shipping method works at the storefront.

.. meta::
   :description: Create a "Pick up from store" shipping method to let customers select a store or pick-up point where they want to collect orders.
