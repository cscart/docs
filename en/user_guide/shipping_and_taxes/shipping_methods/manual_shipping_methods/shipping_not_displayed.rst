********************************************
If a Manual Shipping Method is Not Displayed
********************************************

If a :doc:`manual shipping method </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>` doesn't appear at checkout, follow these steps to find out the reason:

#. In the Administration panel, go to **Administration → Shipping & taxes → Locations** and check whether a :doc:`location </user_guide/shipping_and_taxes/locations/set_location>` is set up properly.

   * Check whether geographic areas (states or countries) of locations do not intersect with each other.

   * Check whether the states (if they exist) are selected on the location editing page.

#. Go to **Administration → Shipping & taxes → Shipping methods** and choose the desired shipping method. Switch to the **Shipping rates** tab and check the rates have been specified for the customer's location.

   .. image:: img/rates.png
       :align: center
       :alt: Rates for location

#. If you use Multi-Vendor, make sure that the shipping method is available to the vendor (or vendors): 

   * Go to **Vendors → Vendors**.

   * Click the name of the vendor.

   * Switch to the **Shipping methods** tab.

   * Tick the checkboxes of the shipping methods you want to make available for the vendor.

   * Click **Save and close**.

   .. note::

       Vendor-specific shipping methods do not appear on this list. Usually, :doc:`vendor's administrators </user_guide/users/vendors/index>` create them for their vendor. In the Administration panel these methods have the name of the vendor written under their names.

   .. image:: img/vendor_shipping_method.png
       :align: center
       :alt: A vendor may or may not support certain shipping method.
