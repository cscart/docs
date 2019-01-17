************************
How To: Remove Demo Data
************************

While you install CS-Cart or Multi-Vendor, you may tick the **Install demo data** checkbox. This will fill your store with examples of products, orders, banners, etc. Demo data lets you test the functionality and shows how your store or marketplace will look like once it's open for business. However, before you open your store to the public, you'll need to remove all the demo data that doesn't apply to your business.

**There are 2 main ways to remove demo data:**

* **Clean install.** This is the quickest way, but only if you are ok with losing any changes that have been made to your store up until this point.

* **Manual removal of demo data.** If you'd like to keep your changes, then manual removal is the best way. This article will tell you what sorts of demo data CS-Cart and Multi-Vendor have, and where to find it.

.. contents::
   :backlinks: none
   :local:

====================
Way 1. Clean Install
====================

This way will suit you **ONLY if:**

* You are ready to lose *all the changes* to your store: order history, customer accounts, products, categories, menus, images, design, and so on.

* You are (in contact with) the person who originally installed this CS-Cart/Multi-Vendor store before the decision to start fresh. That way you'll know whom to ask about the procedure described below (database credentials, server access, etc.).

---------------------

#. Make a backup of the database and files of your store. You can use :doc:`the built-in backup mechanism </user_guide/database/backup/create_database_backup>` or the tools that your server has.

#. Delete all the files and folders of your CS-Cart/Multi-Vendor installation on your server.

#. Delete the database that you used for your CS-Cart/Multi-Vendor installation.

   Even if you don't delete the database, you'll be able to use the same database name during installation. CS-Cart will tell you that the database isn't empty and ask if it can overwrite the tables. But this may not delete all the data of the previous installation, especially if you used third-party add-ons that created their own tables.

#. :doc:`Install CS-Cart/Multi-Vendor </install/index>` on the same server again. During installation, don't choose **Install demo data**.

#. After the installation you'll end up in the administration panel of an empty store. But there are still a few places to check for demo data:

   * :doc:`User groups </user_guide/users/user_groups/index>` (*Customers → User groups*): a couple of user groups will exist by default. Either delete them, or rename and configure them as you see fit.

   * :doc:`Banners </user_guide/look_and_feel/logos_banners_images/flash_banner>` (*Marketing → Banners*): the demo banners always exist on new installations. Delete them.

   * :doc:`Pages </user_guide/website/pages>` (*Website → Pages*): a few content pages that are linked in the header and footer of your site.

     You can either delete those pages, or replace the default content with your own. If you choose to delete the pages, then you'll also need to delete the links to them in the header and footer menus; we'll get to that soon.

   * :doc:`Vendors </user_guide/users/vendors/index>` (*Vendors → Vendors*, only in Multi-Vendor): a single example vendor (*Simtech*) will exist by default. Delete it.

   * :doc:`Payment methods </user_guide/payment_methods/index>` (*Administration → Payment methods*): there are a few default payment methods that won't automatically transfer the money to your account (that requires additional configuration on your part). That's why it's best to delete the default payment methods, and then add the ones you need.

   * :doc:`Shipping methods </user_guide/shipping_and_taxes/shipping_methods/index>` (*Administration → Shipping & taxes → Shipping methods*): there are a few default shipping methods. To make them show correct rates, you'll either need to set shipping rates for different places manually, or select one of the available real-time rate calculators. That's why we advise that you delete the default shipping methods and then set up the ones you need.

   * :doc:`Taxes </user_guide/shipping_and_taxes/taxes/set_up_tax>` (*Administration → Shipping & taxes → Taxes*): a single tax (VAT) exists by default. Either delete it, or configure it as you see fit. If you intend to use it, please make sure that the rates are correct.

   * :doc:`Menus </user_guide/look_and_feel/menus/index>` (*Design → Menus*): the menus leading to the basic content pages of your site. If you have deleted any of those pages, then go through the menus and delete the corresponding menu items as well. Make sure to check the *Main menu* and remove the links to demo categories there.

#. :doc:`Change the meta data </user_guide/look_and_feel/changing_attributes/edit_meta_tags>` of the **Homepage** layout page. By default, the meta data uses information about CS-Cart. Replace it with your own.

#. Now you have a clean installation of CS-Cart or Multi-Vendor without demo data.

==================================
Way 2. Manual Removal of Demo Data
==================================

If you already added your products and categories, payment and shipping methods, color schemes, etc., and you don't want to lose these changes, then removing demo data manually is better than reinstalling CS-Cart or Multi-Vendor. Below you'll find the list of demo data, and what you can do with it.

------
Orders
------

Demo orders won't be of any use in a live store. They only distract managers from real orders and interfere with statistics. To delete :doc:`orders </user_guide/orders/index>`:

#. Go to **Orders → View orders**.

#. Choose to display as many orders per page as possible.

#. Select all the orders on the page.

#. Delete the selected orders in bulk.

#. Repeat this procedure if there are more orders that need to be deleted.

   .. important::

       We assume that at this point all orders are still demo orders, because the store isn't open for business yet. If your store is already accepting orders, then you'd have to go through the order list and find the earliest non-demo order. Delete any orders which are older.

-----------------------
Products and Categories
-----------------------

First decide what to do with :doc:`products </user_guide/manage_products/products/index>` and :doc:`categories </user_guide/manage_products/categories/index>`.

* If you have already added the products that you're planning to sell, and the demo products haven't been removed yet, then:

  #. Go to **Products → Products**.

  #. Choose to display as many products per page as possible.

  #. Select all the products on the page.

  #. Delete the selected products in bulk.

  #. Repeat the procedure if there are more products that need to be deleted.

     .. note::

         This is a safer way that gives you more control—as you go through the list, you'll be able to unselect the products you want to keep, before deleting the rest.

* If you only have demo products and categories, and you aren't planning to use them, then it will be faster to delete categories:

  #. Go to **Products → Categories**.

  #. Select all the categories and delete them in bulk. What happens next depends on whether you have CS-Cart or Multi-Vendor:

     * In CS-Cart, when a product's *last remaining category* is deleted, the will end up in the special category called *Trash*. That special category is created automatically. Once you delete the *Trash* category, all the "orphaned" products will be deleted with it.

     * In Multi-Vendor, when a product's *first category* is deleted, the product will be deleted with it, no extra actions required.

----------------------------------------
Products: Features, Filters, and Options
----------------------------------------

#. :doc:`Features </user_guide/manage_products/features/index>` are product properties that are specific to a product or a type of products (for example, brand, color, size). If you aren't planning to use the default features, then go to **Products → Features** and delete them.

   .. hint::

       The fastest way is to delete feature groups. This will delete all the features belonging to those groups as well.

#. :doc:`Filters </user_guide/manage_products/filters/index>` allow customers to find products with specific properties and feature values. As you delete features, the filters by those features will be deleted automatically. But even you have deleted all features, your store can still have filters (for example, by product price or availability in stock). Go to **Products → Filters** and check if there are any filters that you want to delete.

#. :doc:`Global options </user_guide/manage_products/options/global_options>` allow customers to make a choice on the product page, affecting the product price. A good example of option would be *gift wrap* or *extended warranty*. Go to **Products → Options** to see the list of global options. If you aren't planning to use the demo options, then delete them.

   .. note::

      Deleting global options won't affect the options that you created on the product editing page. However, it will remove the option from a products, if you added the option to the product as a link.

-------------------------
Customers and User Groups
-------------------------

#. The demo data has one or multiple :doc:`customer accounts </user_guide/users/customers/index>`. To prevent them from mixing up with your real customers, go to **Customers → Customers**, then find and delete the accounts with emails that end with ``@example.com``.

#. A few :doc:`user groups </user_guide/users/user_groups/index>` will exist in demo data by default. Go to **Customers → User groups**, and either delete them, or rename and configure them as you see fit.

-------------------------------------------
Marketing: Promotions, Newsletters, Banners
-------------------------------------------

#. The default :doc:`promotions </user_guide/manage_products/promotions/index>` probably won't suit your business. That's why we advise going to **Marketing → Promotions**, deleting the default promotions and adding your own.

#. The demo data also includes a :doc:`newsletter </user_guide/addons/newsletters/index>`. Go to **Marketing → Newsletters → Newsletters** and delete it (or edit the newsletter to suit your needs).

   Also, check **Marketing → Newsletters → Mailing lists**. Mailing lists allow you to divide customer email addresses into groups, depending on what newsletters they want to receive. Customers can add their email address to a mailing list at checkout or on their profile page. The demo data includes one such empty list. Delete it, rename it, or leave it as is.

#. A few :doc:`banners </user_guide/look_and_feel/logos_banners_images/flash_banner>` always exist on new installations, regardless of whether or not the demo data has been installed. Go to **Marketing → Banners** and delete any banners that you won't need.

----------------------------------------------
Website: Blog, Pages, Tags, Comments & Reviews
----------------------------------------------

#. The default :doc:`blog </user_guide/addons/blog/index>` posts aren't of any use to a live store. Go to **Website → Blog**, select all the posts and delete them in bulk.

#. The default :doc:`pages </user_guide/website/pages>` are more useful: most of them are already referenced in the header or footer menus. So, instead of deleting the pages, you may want to rewrite them to match the specifics of your store. To do that, go to **Website → Pages**.

   .. note::

       If you delete demo pages, make sure to delete the links to them in the header and footer menus. We'll describe that step below.

#. The demo data includes some :doc:`product tags </user_guide/addons/tags/tags>`. If you don't want to use a tag, you can delete it on the **Website → Tags** page, and it will be removed from all products.

#. To give a better idea how a CS-Cart or Multi-Vendor store can look like, the demo data includes :doc:`reviews </user_guide/addons/comments_and_reviews/index>` for the demo products and the store itself. Go to **Website → Comments and reviews** and delete the comments and reviews on all tabs.

------------------------
Vendors and Vendor Plans
------------------------

.. note::

    This section applies only to Multi-Vendor.

#. There won't be any use for demo :doc:`vendors </user_guide/users/vendors/index>`. Go to **Vendors → Vendors**, search for vendors whose emails that end with ``@example.com`` or ``example.org``, and delete them.

   This will automatically delete the administrators of those vendors.

#. The demo data also includes a few pre-configured :doc:`vendor plans </user_guide/addons/vendor_plans/index>`. Go to the **Vendors → Vendor plans** page and either delete them and create your own, or adjust the terms of those plans as you see fit.

---------------------------------------------------------------
Administration: Payment and Shipping Methods, Taxes, Currencies
---------------------------------------------------------------

#. The demo data includes a few default :doc:`payment methods </user_guide/payment_methods/index>` that won't automatically transfer the money to your account (that requires additional configuration).

   That's why it's best to delete them and set up your own payment methods. To do that, go to **Administration → Payment methods**.

#. The demo data also includes several :doc:`shipping methods </user_guide/shipping_and_taxes/shipping_methods/index>`. Delete those you don't need, and add or configure the rest.

   You'll either need to set shipping rates manually, or select one of the real-time shipping rate calculators. To do that, go to **Administration → Shipping & taxes → Shipping methods**.

#. By default, one :doc:`tax </user_guide/shipping_and_taxes/taxes/set_up_tax>` (VAT) exists in CS-Cart. Go to **Administration → Shipping & taxes → Taxes** and either delete it, or configure it as you see fit. If you intend to use it, please make sure that the rates are correct.

#. The demo data includes several :doc:`currencies </user_guide/currencies/index>`. Go to **Administration → Currencies** and delete or disable the ones you aren't planning to use.

-------------
Design: Menus
-------------

If you deleted some default pages and categories, you'll need to adjust the :doc:`menus </user_guide/look_and_feel/menus/index>`: some menu items may no longer be necessary. To do that, go to **Design → Menus** and check if you need any of those menus and menu items. Make sure to check the *Main menu*—it contains links to demo categories.
