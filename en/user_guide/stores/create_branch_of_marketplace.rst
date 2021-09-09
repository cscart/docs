**************************************
How To: Create a Branch of Marketplace
**************************************

.. important::

    This article is about creating a storefront in Multi-Vendor Ultimate. There is :doc:`another article <create_additional_store>` for CS-Cart Ultimate.

A storefront creation in Multi-Vendor allows you to create a branch of marketplace. This function is useful for making an independent division of the main marketplace, tailored to the market of another region or country, or for a new product niche.

To create a branch of the marketplace:

#. :doc:`Add a new storefront <create_new_store>` in the admin panel.

#. :doc:`Set up the storefront on the server </install/storefronts/index>`. Now you can :doc:`switch between storefronts <switch_between_stores>`.

   .. image:: img/switch_modes.png
       :align: center
       :alt: Select the storefront you want to edit from the list in the upper left corner of the admin panel.

#. If the new storefront is for the market of another region or country, then set up :doc:`an automatic redirection to the storefront created specifically for customer country <redirect_regional_customers_to_storefront>`.

#. Fill the new marketplace with:

   * Products. In Multi-Vendor, a product is shown on those storefronts where the vendor of this product appears. Therefore, if you want a vendor's product to appear in the branch of marketplace, assign this vendor to the new storefront on the *Vendors* tab of the storefront settings.

     In Multi-Vendor, a category is assigned either to all storefronts, or to a particular one. It is determined on the *General* tab of the category settings.

   * Payment and shipping methods. Payment and shipping methods can be either general for all storefronts or specific for a particular one. Assign this affiliation on the *Storefronts* tab of the payment or shipping method settings.

#. Configure :doc:`other settings <store_settings>` for language, currency, design, storefront appearance, customer actions, etc.
