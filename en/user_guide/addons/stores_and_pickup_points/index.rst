************************
Stores and Pickup Points
************************

.. note::

    This add-on first appeared in version 4.10.1. It replaced the old :doc:`/user_guide/addons/store_locator/index` add-on.

.. contents::
   :backlinks: none
   :local:

=============
Functionality
=============

#. Show the addresses of your store and pickup points on the map to customers.

   .. note::

       The map isn't required. It will appear if you configure the :doc:`/user_guide/addons/maps_and_geolocation/index` add-on.

   .. image:: /user_guide/addons/maps_and_geolocation/img/map_of_stores.png
       :align: center
       :alt: Pickup points can appear as a list or on the map.

#. :doc:`Create a "Pick up from store" shipping method </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/pickup>` and let customers choose where they want to pick up the product. The shipping rates and time depend on :doc:`rate areas </user_guide/shipping_and_taxes/locations/index>`.

#. Show the list of cities where you have a store/pickup point in the **Customer geolocation** block of the :doc:`Maps and Geolocation </user_guide/addons/maps_and_geolocation/index>` add-on. Customers will be able to select the city from the list.

#. Show the map with the selected pickup point in the order-related documents: invoice and packing slip.

=============
Configuration
=============

#. Install the **Stores and Pickup Points** add-on :doc:`just like any other add-on </user_guide/addons/1manage_addons>`. Click the name of the installed add-on to open its settings:

   * **Show map in order-related documents**—if you enable this setting, the invoice and packing slip will include a map with the selected pickup point.

     .. important::

         This setting affects only :doc:`the old email template mode </user_guide/look_and_feel/documents/enable_document_editor>`. Usually the new email template mode is selected, and the address of the pickup point is displayed there by default.

   * **Use list of cities instead of a map**—if you enable this setting, the **Customer geolocation** block will show the list of pre-defined cities instead of a map with city search.

     The list of cities will be generated automatically and will include all the cities where your stores and pickup points are. That way a customer can easily find out which cities have your branch offices.

#. :doc:`Create stores and pickup points, and configure the "Pick up from store" shipping method. </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/pickup>`

.. meta::
   :description: CS-Cart and Multi-Vendor add-on to let customers select a store and pick up orders from there
