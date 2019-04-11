***************************************************
How To: Make Shipping Cost Dependent on Order Total
***************************************************

#. In the Administration panel, go to **Administration → Shipping & taxes → Shipping methods**.

#. :doc:`Create a new shipping method with manual rate calculation </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>` or click on the name of an existing one.

#. The shipping method editing page will open. Switch to the **Shipping time and rates** tab.

#. Select the :doc:`rate area </user_guide/shipping_and_taxes/locations/index>` for which you'd like to configure the shipping cost. If you don't see the choice of rate areas, it means that you only have one.

#. Configure the **Cost dependencies** section as follows:

   .. list-table::
       :widths: 10 10 10
       :header-rows: 1

       *   -   Products cost 
           -   Rate value
           -   Type
       *   -   More than $0.00
           -   25
           -   Absolute ($)
       *   -   More than $50.00
           -   20
           -   Absolute ($)

   .. note::

       In this case if the order total is between $0 and $50, the shipping cost will be $25, and if the order total exceeds $50, the shipping cost will be $20.

#. Click the **Save** button (or **Create**, if you're creating a new shipping method).

.. meta::
   :description: How to set shipping rates that depend on the sum of purchase in CS-Cart or Multi-Vendor?
