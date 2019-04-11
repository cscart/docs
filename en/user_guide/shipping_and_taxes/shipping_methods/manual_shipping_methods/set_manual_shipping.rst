***************************************
How To: Set Up a Manual Shipping Method
***************************************

To set up a manual shipping method with pre-determined rates depending on a rate area:

#. In the Administration panel, :doc:`create the necessary rate areas </user_guide/shipping_and_taxes/locations/set_location>`.

#. Go to **Administration → Shipping & taxes → Shipping methods**.

#. Add a new shipping method by clicking the **+** button in the upper right part of the page, or choose an existing one by clicking on its name.

#. Set **Rate calculation** to *Manual*.

   .. image:: img/manual_shipping.png
       :align: center
       :alt: Creating a shipping method with pre-determined rates in CS-Cart.

#. Switch to the **Shipping charges** tab.

#. Select the :doc:`rate area </user_guide/shipping_and_taxes/locations/index>` for which you'd like to specify rates.

#. Specify the rates for the shipping method. The rates are separated into 3 sections and can depend on:

   * :doc:`Order total </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/order_total>`

   * :doc:`Weight of the items in the order </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/total_and_weight>`

   * :doc:`Quantity of the items in the order </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/product_amount>`

   .. note::

       The rates within each section are not summed up. Let's use **Cost dependencies** as an example: if you specify the **Rate value** of *20* for the **More than $0** condition, and you want a rate of 30 for orders with the total greater than $50, then the **More than $50** condition should have the **Rate value** of *30*, and not *10*.

#. Select other rate areas and set the desired shipping rates for them.

#. Click the **Save** button (or **Create**, if you're adding a new shipping method).

   .. image:: img/dependencies.png
       :align: center
       :alt: Configuring shipping charges in CS-Cart and Multi-Vendor.

.. meta::
   :description: Configuring a shipping method with custom manually-specified shipping rates in CS-Cart or Multi-Vendor.
