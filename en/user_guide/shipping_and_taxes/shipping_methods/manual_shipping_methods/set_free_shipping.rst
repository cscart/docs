*************************************
How To: Set up a Free Shipping Method
*************************************

#. In the Administration panel, go to **Administration → Shipping & Taxes → Shipping methods**.

#. :doc:`Create a new shipping method </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>` or click on the name of an existing one.

   .. important::

       Set the **Rate calculation** of this method to *Manual*.

#. The shipping method editing page will open. Switch to the **Shipping charges** tab.

#. Select the :doc:`location </user_guide/shipping_and_taxes/locations/index>` for which you'd like to offer free shipping in the **Show rates for location** section. If you don't see this section, it means that you haven't created any locations.

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

   .. image:: img/free_shipping_method.png
       :align: center
       :alt: Configuring a free shipping method in CS-Cart or Multi-Vendor.

   .. important::

       Make sure that there are no charges defined in the **Weight dependencies** and **Items dependencies** sections for this shipping method.

#. Click the **Save** button (or **Create**, if you're creating a new shipping method).


