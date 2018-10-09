****************************************************************
How To: Allow Vendors to Edit Layouts and Styles of Their Stores
****************************************************************

.. note::

    This functionality is available only in Multi-Vendor Plus.

=========================================================
How Store Owners Allow Vendors to Edit Styles and Layouts
=========================================================

#. Go to **Settings → Vendors** in the Administration panel of your store.

#. Tick the following checkboxes:

   * **Allow vendors to edit layouts**—this will allow vendors to edit :doc:`layout pages </user_guide/look_and_feel/layouts/layout_pages/index>`.

   * **Allow vendors to manage styles of the theme**—this will allow vendors to use :doc:`the Theme Editor </user_guide/look_and_feel/themes/theme_editor>`.

#. Click the **Save** button in the top right part of the page.

   .. note::

       If a vendor's administrator belongs to :doc:`a user group </user_guide/users/user_groups/index>`, that group needs to have the following privileges from the **Look and Feel** section: *Edit blocks*, *Manage design*, *Manage themes*.

   .. image:: img/edit_layouts_and_styles.png
       :align: center
       :alt: Go to Settings → Vendors to determine whether or not vendors should be able to edit layouts and styles.

=======================
How Vendors Edit Styles
=======================

#. Log in to the Multi-Vendor Administration panel as a vendor.

#. Go to **Design → Themes** and click the **Theme editor** button.

   .. image:: img/vendor_access_theme_editor.png
       :align: center
       :alt: Go to Design → Themes and click the Theme Editor button.

#. You'll be taken to your page on the storefront, and you'll be able to make changes using :doc:`the Theme Editor </user_guide/look_and_feel/themes/theme_editor>`. The changes you make will affect your microstore (if you have one), your products, and your pages, including the page with the information about the vendor.

   .. note::

       Vendors don't have access to the **General** and **Logos** sections of the theme editor.

#. Once you've made the changes, click **Save**.

   .. image:: img/vendor_theme_editor.png
       :align: center
       :alt: The theme editor allows vendors to customize their products, pages, and microstore.

========================
How Vendors Edit Layouts
========================

#. Log in to the Multi-Vendor Administration panel as a vendor.

#. Go to **Design → Layouts**.

   .. image:: img/vendor_access_layouts.png
       :align: center
       :alt: Go to Design → Layouts to edit the layout pages.

#. The tabs you see represent the :doc:`layout pages </user_guide/look_and_feel/layouts/layout_pages/index>` that a vendor can edit. Vendors don't have access to :doc:`all containers </user_guide/look_and_feel/layouts/framework/index>`, only to **Content**.

#. Click the **Set custom configuration** link. By default, the blocks in the container are organized just as the store owner configured it. But now you are able to add, configure, and remove blocks and grids. The changes are saved automatically.

#. If you want to revert the layout page to the original look, click the **Use default block configuration** link.

   .. warning::

       This will make the layout page look as the store owner configured it; any changes you made to the layout page will be lost.

   .. image:: img/vendor_layout.png
       :align: center
       :alt: Using the default configuration will undo all the changes you made to the layout page.
