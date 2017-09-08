**************************
Shipping Method Properties
**************************

=======
General
=======

* **Name**—the name of the shipping method as it appears on the storefront.

* **Store**—the storefront to which the shipping method belongs.

* **Icon**—an image to represent the shipping method.

  You can upload an icon from your computer, find it on the server, or provide a URL to the image. Make sure to enter the alternative text that'll appear when the icon is missing or can't be displayed. Specifying alternative texts is good for `SEO <https://en.wikipedia.org/wiki/Search_engine_optimization>`_.

  Images must be of one of the following formats only: JPEG, GIF, PNG. The maximum size of an uploaded image depends on your server configuration. As a rule, it should not exceed 2 MB.

  .. note::

      Shipping method icons appear on the storefront in a special block with the **Shipping methods** content type. Make sure to create such a block in **Design → Layouts**.

* **Delivery time**—the time it takes to deliver an order. This info is displayed on the storefront, so that customers could decide if the delivery time meets their requirements.

* **Weight limit**—the minimum and maximum weight of the order that can be delivered via this method.

* **Rate calculation**—the way how the shipping cost will be calculated: 

  * **Manual** calculation is based on the tables with charges and rates that you define in the **Shipping charges** tab on the shipping method editing page.

  * **Realtime** calculation is based on the rates that your store receives from the carrier who will deliver the order. The rates are received in real time at the moment when the order is being placed.

    .. note::

        Carrier-specific settings are defined in the **Configure** tab.

* **Shipping service**—the shipping service provider/carrier that will be in charge of delivering the order. This select box is available only if rate calculation is set to *Realtime*.

* **Test**—click the **Calculate shipping cost** link to see a special form to test the selected real-time shipping rate estimation service. Test estimation considers the weight that you specify in the form, as well as the company address (**Settings → Company**) and default customer address (**Settings → General → Default location**).

* **Taxes**—the tax rates that apply to the shipping method.

* **User groups**—the :doc:`user groups </user_guide/users/user_groups/index>`, the members of which can choose this shipping method at checkout.

* **Status**—the status of the shipping method: *Active* or *Disabled*.

=========
Configure
=========

This tab appears only if you have selected *real time rate calculation* on the **General** tab. Here you should specify the settings of the selected shipping service. Such settings vary depending on the shipping service provider. So, if you do not know how to configure it, please refer to the carrier's help pages and :doc:`our documentation </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/index>`.

================
Shipping Charges
================

The rates that you define here are used to calculate the shipping cost, regardless of whether you use real-time shipping rate estimation or not. 

If you receive rates from a shipping service provider in real time, the charges from this section will be simply added to the received rates. You can use this to compensate for your actual expenses if they exceed the values returned by the carrier (e.g., packing, insurance, etc.)

The rates can depend on the product cost, weight or quantity. Rates can also differ depending on the customer's :doc:`location </user_guide/shipping_and_taxes/locations/index>`, when table-based rate calculation is used.

.. image:: img/shipping_charges.png
    :align: center
    :alt: Shipping charges in CS-Cart.

* **Product Cost/Weight/Quantity**—the minimum value when the rate must apply.

* **Rate Value**—the shipping rate itself.

* **Type**—the type of the rate: an absolute value or a percentage added to the product cost.

=====
Share
=====

Other storefronts that share this shipping method. :doc:`Learn more about sharing objects. </user_guide/stores/sharing>`
