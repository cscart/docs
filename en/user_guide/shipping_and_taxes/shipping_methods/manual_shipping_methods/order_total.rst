***************************************************
How To: Make Shipping Cost Dependent on Order Total
***************************************************

#. In the Administration panel, go to **Administration → Shipping & taxes → Shipping methods**.

#. :doc:`Create a new shipping method </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>` or click on the name of an existing one.

#. The shipping method editing page will open. Switch to the **Shipping charges** tab.

#. Select the :doc:`location </user_guide/shipping_and_taxes/locations/index>` for which you'd like to configure the shipping cost in the **Show rates for location** section. If you don't see this section, it means that you haven't created any locations.

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

   .. image:: img/order_total.png
       :align: center
       :alt: Changing shipping cost depending on the order total in CS-Cart and Multi-Vendor.

   .. note::

       In this case if the order total is between $0 and $50, the shipping cost will be $25, and if the order total exceeds $50, the shipping cost will be $20.

#. Click the **Save** button (or **Create**, if you're creating a new shipping method).
