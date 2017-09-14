***********************************
Shipping-Related Product Properties
***********************************

When you :doc:`edit products </user_guide/manage_products/products/add_product>`, you can switch to the **Shipping Properties** tab. It contains parameters that are used for more precise shipping rate calculation for a product.

==================
List of Properties
==================

* **Weight**—the weight of one product item. It is used for calculating the shipping cost. Products with zero weight are treated as if they had the minimal non-zero weight.

  .. hint::

      You can change the weight measurement unit on the **Settings → General** page.

  .. image:: img/weight_measurement_unit.png
      :align: center
      :alt: Weight measurement unit settings in CS-Cart.

* **Free shipping**—this product won't be taken into account during shipping rate calculation, but only if :doc:`the shipping method </user_guide/shipping_and_taxes/shipping_methods/add_shipping_method>` has the **Use for free shipping** checkbox ticked.

* **Shipping freight**—the cost of shipping one item of this product in the primary currency of your store. This cost will be added to the calculated shipping rate.

* **Items in a box**—the minimum and maximum number of items that can be shipped in one box. Enter a non-zero value and specify the dimensions of the box below.

  .. note::

      If you don't split products into boxes and ship each item individually, use *1 — 1*.

* **Box length, Box width, Box height**—the size of one box that can hold the number of items specified above.

=================================
How to Change Shipping Properties
=================================

* **For a particular product:** :ref:`edit the product <products-add-simple>`; you'll find the necessary settings on the **Shipping Properties** tab.

* **For multiple products at once:**

  * :ref:`Use bulk product editing <products-bulk-editing>` and alter the properties listed above.

  * :ref:`Import the necessary properties in a CSV file <products-csv-import>`:

    .. list-table::
        :header-rows: 1
        :stub-columns: 1
        :widths: 30 30 30

        *   -   Field name
            -   Description
            -   Value

        *   -   Product code
            -   A required field for identifying the product.
            -   The code of the updated product.

        *   -   Language
            -   The language; this field is required. 
            -   ``en``, ``de``, etc.

        *   -   Weight
            -   The weight of a product item
            -   ``0.25``

        *   -   Shipping freight
            -   The cost of shipping one product item.
            -   ``50.00``

        *   -   Free shipping
            -   Determines whether or not this product can be shipped for free.
            -   ``N`` or ``Y``

        *   -   Box size
            -   The dimensions of the box.
            -   ``length:20;width:30;height:3``

        *   -   Items in box
            -   The number of items in one box.
            -   ``min:1;max:1``

    .. note::

        We recommend configuring a few products manually first, and then exporting them to a CSV file. That way you'll have an example which you'll be able to use to edit entries for other products.

    .. important::

        Products are identified by code. For the import and export to work properly, specify a unique **CODE** for each product.

    .. image:: img/shipping_properties_csv.png
        :align: center
        :alt: The product's shipping properties in a CSV file.
