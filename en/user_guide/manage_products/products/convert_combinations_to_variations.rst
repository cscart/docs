********************************************************
How To: Turn Option Combinations into Product Variations
********************************************************

.. note::

    Product variations first appeared in **CS-Cart & Multi-Vendor 4.6.1** as an alternative to option combinations. To create variations, you need to :doc:`install and enable the Product Variations add-on </user_guide/addons/product_variations/index>`. **The add-on is currently at the beta stage.**

After you install and enable the **Product Variations** add-on, you'll be able to choose the product's type when you create a product:

* *Simple products* can have :doc:`option combinations </user_guide/manage_products/options/option_combinations>`.

* *Configurable products* can have :doc:`variations <product_variations>`.

If your store existed before version 4.6.1, then it already has products. After you upgrade to version 4.6.1, all those products will be considered *simple*. However, if you want to take advantage of :doc:`the new opportunities provided by product variations <simple_versus_configurable>`, you'll be able to convert a simple product and its option combinations into a configurable product and its variations.

To turn a simple product into configurable:

#. Go to **Products → Products** in the Administration panel of your store.

#. Click the name of a simple product for which you'd like to create variations.

#. The editing page of the product will open. Click the **gear** button in the upper right part of the page and choose **Convert to configurable product**. Confirm your decision.

   .. warning::

       You won't be able to turn a configurable product back into a simple one, unless you restore the database from a backup or re-create the product and its option combinations manually.

   .. image:: img/convert_to_configurable_product.png
       :align: center
       :alt: Click "Convert to configurable product" to replace option combinations with product variations.

   After that a simple product will become configurable. The option combinations of that product will turn into variations automatically, with the :doc:`allowed and forbidden option combinations </user_guide/manage_products/options/exceptions>` of the product being considered:

   * If a product has allowed combinations, then variations will be generated only from these combinations.

   * If a product has forbidden combinations, then variations won't be generated from these combinations.
