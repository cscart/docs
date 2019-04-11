*************************************
How To: Set up a Free Shipping Method
*************************************

#. In the Administration panel, go to **Administration → Shipping & Taxes → Shipping methods**.

#. :doc:`Create a new shipping method </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>` or click on the name of an existing one.

   .. important::

       Set the **Rate calculation** of this method to *Manual*.

#. The shipping method editing page will open. Switch to the **Shipping time and rates** tab.

#. Select the :doc:`rate area </user_guide/shipping_and_taxes/locations/index>` for which you'd like to offer free shipping. If you don't see this section, it means that you haven't created any locations.  If you don't see the choice of rate areas, it means that you only have one.

#. Configure the **Cost dependencies** section as follows:

   .. list-table::
       :widths: 10 10 10
       :header-rows: 1

       *   -   Products cost 
           -   Rate value
           -   Type
       *   -   More than $0.00
           -   0
           -   Absolute ($)
       *   -   More than $0.01
           -   0
           -   Absolute ($)

   .. important::

       Make sure that there are no charges defined in the **Weight dependencies** and **Items dependencies** sections for this shipping method.

#. Click the **Save** button (or **Create**, if you're creating a new shipping method).

.. meta::
   :description: How to create a shipping method that is always free in CS-Cart or Multi-Vendor?
