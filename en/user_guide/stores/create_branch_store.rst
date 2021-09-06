***********************************
How To: Create a Branch Marketplace
***********************************

.. important::

    This article is about creating a storefront in Multi-Vendor Ultimate. There is :doc:`another article <create_additional_store>` for CS-Cart ultimate.

A storefront creation in Multi-Vendor produces a branch marketplace. This function is useful, for example, for making an independent division of the main marketplace, localized to the market of another region or country. A branch is also necessary when you need to display a new product niche in a separate storefront under the same brand.

To create a branch of the marketplace:

#. :doc:`Add a new storefront <create_new_store>` in the admin panel.

#. :doc:`Set up the storefront on the server </install/storefronts/index>`. Now you can :doc:`switch between storefronts and operation modes <switch_between_stores>`.

#. If the branch is for the market of another region or country, then set up :doc:`automatic redirection to a storefront created specifically for customer country <redirect_regional_customers_to_storefront>`.

#. Fill the new marketplace with:

   * Goods. In Multi-Vendor, products are displayed on those storefronts where the vendor of these products appears. Therefore, assign vendors whose products you want to appear in the branch marketplace to the new storefront on the *Vendors* tab of the storefront settings.

     Starting from the version 4.14.x, in Multi-Vendor a category is assigned either to all storefronts, or to a particular one. It is determined on the *General* tab of the category settings.

   * Payment and shipping methods. Payment and shipping methods can be either general for all storefronts or specific for a particular one. Assign a storefront affiliation on the *Storefronts* tab of the payment or shipping  settings.

#. Set :doc:`other settings <store_settings>` for language, currency, design, storefront display, customer actions, etc.
