*****************************
No Shipping Options Displayed
*****************************

If the following message:

.. important::

	Unfortunately no shipping options are available for your location. Please contact us and we will see about delivering to you.

is displayed in the **Select shipping method** section on the **Checkout** page:

*   Check the location settings in your store. To do it, in the Administration panel, go to **Administration → Shipping&Taxes → Locations**. Click on the name of the desired location. Check whether the address selected in the **Shipping** section on the **Checkout** page in the storefront is included in the location.
*   If you set up a manual shipping method follow `this article <http://docs.cs-cart.com/4.3.x/user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/shipping_not_displayed.html>`_.
*   If you set up a realtime shipping method follow `this <http://docs.cs-cart.com/4.3.x/user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/not_displayed.html>`_ article.
*   If the **Suppliers** functionality is enabled in your CS-Cart, check whether it is set up properly by using the instructions `here <http://docs.cs-cart.com/4.3.x/user_guide/users/suppliers/configure_suppliers.html>`_.

If the **Select shipping method** section is not displayed on the **Checkout** page at all:

*   Check whether the **Disable shipping option** is disabled:

    *	Go to the **Settings → General** section.
    *   Check whether the **Disable shipping** option is disabled in the **Users/cart** section.

*   Check whether the **Free shipping** option is disabled for the products you are trying to order:

    *	Go to the **Products → Products** section.
    *   Find the necessary product and click on its link.
    *   Open the **Shipping Properties**  tab and check whether the **Free shipping option** is disabled for the product.