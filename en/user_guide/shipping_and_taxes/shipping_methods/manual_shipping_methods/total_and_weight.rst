***********************************************************
How To: Make Shipping Cost Depend on Order Total and Weight
***********************************************************

To set up a shipping cost that depends on order total and weight:

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

   .. hint::

       To add more rates, click the **+** icon on the right; it appears when you hover a mouse pointer over an existing rate.

#. Configure the **Cost dependencies** section as follows:

   .. list-table::
       :widths: 10 10 10
       :header-rows: 1

       *   -   Products weight 
           -   Rate value
           -   Type
       *   -   More than 0 lbs
           -   2
           -   Absolute ($)
       *   -   More than 100 lbs
           -   3
           -   Absolute ($)

   .. note::

       Make sure to specify the weight when you :doc:`add or edit products </user_guide/manage_products/products/add_product>`.

#. Click **Save** (or **Create**, if you're adding a new shipping method).

   In this case the shipping rates from the **Cost dependencies** and **Weight dependencies** sections will apply together. Here are some examples of how the shipping cost will be calculated:

   * The order total is below $50, and the order weight is less than 100 lbs: **$25 + $2**.

   * The order total is below $50, and the order weight exceeds 100 lbs: **$25 + $3**.

   * The order total exceeds $50, and the order weight is less than 100 lbs: **$20 + $2**.

   * The order total exceeds $50, and the order weight exceeds 100 lbs: **$20 + $3**.

.. meta::
   :description: How to set shipping rates that depend on order total and weight in CS-Cart or Multi-Vendor?
