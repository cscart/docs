*******************************************************
How To: Make Shipping Cost Depend on the Product Amount
*******************************************************

#. In the Administration panel, go to **Administration → Shipping & Taxes → Shipping methods**.

#. :doc:`Create a new shipping method with manual rate calculation </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>` or click on the name of an existing one.

#. The shipping method editing page will open. Switch to the **Shipping time and rates** tab.

#. Select the :doc:`rate area </user_guide/shipping_and_taxes/locations/index>` for which you'd like to configure the shipping cost. If you don't see the choice of rate areas, it means that you only have one.

#. Configure the **Items dependencies** section as follows:

   .. list-table::
       :widths: 10 10 10
       :header-rows: 1

       *   -   Product quantity 
           -   Rate value
           -   Type
       *   -   More than 0 item(s)
           -   0
           -   Absolute ($)
       *   -   More than 5 item(s)
           -   10
           -   Absolute ($)

   .. hint::

       To add more rates, click the **+** icon on the right; it appears when you hover a mouse pointer over an existing rate.

#. Click the **Save** button (or **Create**, if you're creating a new shipping method).

.. meta::
   :description: How to set shipping rates that depend on the amount of ordered products in CS-Cart or Multi-Vendor?
