*******************************************************
How To: Make Shipping Cost Depend on the Product Amount
*******************************************************

#. In the Administration panel, go to **Administration → Shipping & Taxes → Shipping methods**.

#. :doc:`Create a new shipping method </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/set_manual_shipping>` or click on the name of an existing one.

#. The shipping method editing page will open. Switch to the **Shipping charges** tab.

#. Select the :doc:`location </user_guide/shipping_and_taxes/locations/index>` for which you'd like to configure the shipping cost in the **Show rates for location** section. If you don't see this section, it means that you haven't created any locations.

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

   .. image:: img/amount.png
       :align: center
       :alt: Editing shipping method

   .. hint::

       To add more rates, click the **+** icon on the right; it appears when you hover a mouse pointer over an existing rate.

#. Click the **Save** button (or **Create**, if you're creating a new shipping method).
