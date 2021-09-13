**********************************
How To: Create an Additional Store
**********************************

.. important::

    This article is about creating a storefront in CS-Cart Ultimate. There is :doc:`another article <create_branch_of_marketplace>` for Multi-Vendor Ultimate.

Storefronts in CS-Cart allow you to enter new markets. They are useful when you want to tailor a part of your business to a specific audience, country, region, or product niche.

To create an additional store:

#. :doc:`Add a new storefront <create_new_store>` in the admin panel.

#. :doc:`Set up the storefront on the server </install/storefronts/index>`. Now you can :doc:`switch between storefronts <switch_between_stores>`.

   .. image:: img/switch_modes.png
       :align: center
       :alt: Select the storefront you want to edit from the list in the upper left corner of the admin panel.

#. If the new storefront is for the market of another country, then for new customers set up :doc:`a redirect to the storefront tailored to their country <global_entry_point>`.

#. Fill the created storefront with:

   * Products. :doc:`Create new products </user_guide/manage_products/products/add_product>` or :doc:`use existing ones <sharing>` by assigning new categories to the product.

     In CS-Cart, categories determine the storefronts to which a product belong. Accordingly, product affiliation to the category determines the product's availability on the storefront. Even though :doc:`one product can be shared among several storefronts <many_stores_one_catalog>`, such properties as price, description, discounts and some others can be different on different storefronts.

   * Payment and shipping methods. :doc:`Create new payment </user_guide/payment_methods/adding_payment>` and :doc:`shipping methods </user_guide/shipping_and_taxes/shipping_methods/add_shipping_method>` or use existing ones by changing the settings on the *Storefronts* tab of the payment or shipping method.

#. Configure :doc:`other settings <store_settings>` for language, currency, design, storefront appearance, customer actions, etc.
