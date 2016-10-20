*****************************************
How To: Allow Customers to Become Vendors
*****************************************

.. important::

    **Vendors** are available only in **Multi-Vendor**.

=====================================================
Step 1. Allow Customers to Apply for a Vendor Account
=====================================================

1.1. In the Administration panel, go to **Settings → Vendors**.

1.2. Tick the **Allow users to apply for vendor account** checkbox.

1.3. Tick the **Automatically create the administrator account for the new approved vendor. (If the "Allow users to apply for vendor account" setting is enabled)** checkbox.

1.4. If you want users to accept your terms and conditions before they can apply for a vendor account, tick the **Applying vendors must agree to the terms & conditions** checkbox.

     .. note::

         The text of the terms and conditions is stored the language variable called ``vendor_terms_n_conditions_content``. :doc:`Learn how to work with language variables. <../../look_and_feel/languages/translate>`

.. image:: img/settings_vendors.png
    :align: center
    :alt: If you allow users to apply for vendor accounts, you can also make them accept terms and conditions.

1.5. Click the **Save** button.

==============================================
Step 2. Provide a Link to the Application Form
==============================================

After you complete **Step 1**, the vendor application form will be available via a URL like *http://example.com/index.php?dispatch=companies.apply_for_vendor*. You'll only need to replace *http://example.com* with the actual URL of your store.

But there are other ways to make customers aware of the vendor application form. For example, Multi-Vendor demo data includes the **Quick Links** menu with the **Become a seller** link.

.. image:: img/apply_for_vendor.png
    :align: center
    :alt: A registered customer can apply for a vendor account using a link in the menu.

You can create your own menu item that would lead to the application form. The menu item must have the following URL: ``dispatch=companies.apply_for_vendor``.

.. hint::

    :doc:`This article <../../look_and_feel/menus/index>` describes working with menus and menu items in more detail.

After the customer fills out the form and clicks **Submit**, the administrator of the store can activate the newly created vendor account.

.. image:: img/vendors_application_form.png
    :align: center
    :alt: A customer has to fill in the form to apply for a vendor account.

===============================
Step 3. Approve the Application
===============================

3.1. Go to **Vendors → Vendors**.

3.2. Find the vendor account you want to activate.

   .. hint::

       The vendor accounts that haven't been activated or disabled yet have the **New** status. 

3.3. Change the status of the desired account to **Active**.

   .. hint::

       :doc:`Learn more about vendor statuses <vendor_statuses>` in the corresponding article of the documentation.

.. image:: img/change_vendor_status.png
    :align: center
    :alt: Find the vendor account you want to activate and change its status from New to Active.
