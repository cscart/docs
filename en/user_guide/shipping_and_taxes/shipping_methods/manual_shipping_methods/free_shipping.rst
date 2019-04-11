******************************************************************
How To: Offer Free Shipping When Order Total Exceeds Certain Value
******************************************************************

#. In the Administration panel, go to **Administration → Shipping & taxes → Shipping methods**.

#. :doc:`Create a new shipping method with manual rate calculation </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>` or click on the name of an existing one.

#. The shipping method editing page will open. Switch to the **Shipping time and rates** tab.

#. Select the :doc:`rate area </user_guide/shipping_and_taxes/locations/index>` for which you'd like to offer free shipping. If you don't see the rate area selection, it means that you haven't created any rate areas and have only one of them.

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
       *   -   More than $200.00
           -   0
           -   Absolute ($)

#. Click the **Save** button (or **Create**, if you're creating a new shipping method).

   .. important::

       The shipping method will be free only for the rate area for which you configure it this way, and only if you don't have any rates specified in the **Weight dependencies** or **Items dependencies** section.

.. meta::
   :description: How to take no charge for a shipping method with custom manual rates in CS-Cart or Multi-Vendor?
