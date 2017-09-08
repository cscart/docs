******************************************************************
How To: Offer Free Shipping When Order Total Exceeds Certain Value
******************************************************************

#. In the Administration panel, go to **Administration → Shipping & taxes → Shipping methods**.

#. :doc:`Create a new shipping method </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>` or click on the name of an existing one.

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
           -   25
           -   Absolute ($)
       *   -   More than $200.00
           -   0
           -   Absolute ($)

#. Click the **Save** button (or **Create**, if you're creating a new shipping method).

   .. important::

       The shipping method will be free only for the location for which you configure it this way, and only if you don't have any rates specified in the **Weight dependencies** or **Items dependencies** section.

   .. image:: img/free_shipping.png
       :align: center
       :alt: Free shipping for specific order total in CS-Cart and Multi-Vendor.
