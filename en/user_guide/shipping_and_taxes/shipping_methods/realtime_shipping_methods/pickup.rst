***********************************************
How To: Let Customers Pick Up Orders from Store
***********************************************

CS-Cart and Multi-Vendor allow you to create stores and pickup points and set the shipping rates and times depending on where you send the products. Customers will be able to select the store or pickup point where they want to collect their orders.

.. important::

    The rates and time of shipping to a specific store or pickup point are determined by their :doc:`rate areas </user_guide/shipping_and_taxes/locations/index>`.

#. Install the :doc:`Stores and Pickup Points </user_guide/addons/stores_and_pickup_points/index>` add-on.

#. Create stores/pickup points on the **Administration → Stores & pickup points** page.

   Make sure to switch to the **Pickup** tab and select the rate area there. The rate area will determine the rates and time of shipping to that store/pickup point.

   This tab also allows you to choose in which other rate areas the store should appear. That way you'll be able to offer pickup to the residents of nearby areas and not offer it in remote areas.

   .. image:: img/pickup_point_settings.png
       :align: center
       :alt: Select all the rate areas where the pickup point is supposed to appear at checkout.

#. :doc:`Add a shipping method </user_guide/shipping_and_taxes/shipping_methods/add_shipping_method>` with real-time rate calculation and **Pickup** as the processor. Make sure to do these two things:

   * Once you create the shipping method, switch to the **Configure** tab and make sure that all the stores and pickup points that must be available for this shipping method are selected.

   * Switch to the **Shipping time and rates** tab and specify the rates for those rate areas where pick-up from store must be available. If you don't specify a rate, then the shipping method won't appear for that rate area.

     .. hint::

         You can also make pickup free. It's done :doc:`just like for other shipping methods with manually-specified shipping rates </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_free_shipping>`.

     If you specify delivery time for a specific rate area, it will override the delivery time from the **General** tab of the shipping method editing page.

     .. image:: img/pickup_rates_and_time.png
         :align: center
         :alt: The rate areas where the shipping method is available are marked with the plus sign (+)

#. Check how the new shipping method works at the storefront.

.. meta::
   :description: CS-Cart and Multi-Vendor add-on to let customers select a store or pick-up point and collect orders from there
