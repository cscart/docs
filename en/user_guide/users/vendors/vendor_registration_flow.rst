****************************************************
How To: Manage Vendor Onboarding on the Marketplace
****************************************************

.. important::

    This functionality is available only in **Multi-Vendor**.
    
CS-Cart Multi-Vendor allows you to configure seller onboarding as you see fit. Depending on the settings, new sellers either immediately get access to the marketplace (full or limited), or have to wait until an administrator approves them. The guide below will help you set up these different scenarios of seller onboarding.


.. contents::
   :backlinks: none
   :local:


Scenario 1.  Immediate Full Access to Admin Panel and Storefront
================================================================

In this scenario, new sellers appear on the storefront (and get the *Active* status). They can start selling the moment they :doc:`sign up for an account </user_guide/users/vendors/allow_customers_to_apply_for_vendor_account>`, and immediately owe you a fee :doc:`as per their chosen plan </user_guide/addons/vendor_plans/index>`.

How to configure this scenario:

#. Make sure that the **Vendor Data Premoderation** add-on is installed and active.
#. Set the “Approval of newly-created vendors” in that add-on's settings to *"Isn't required"*.
#. Disable the "Review new vendors before granting access to the admin panel" setting on the *Settings → General → Vendors* page.



Scenario 2. Immediate Access to Admin Panel, Approval for Storefront
====================================================================

In this scenario, new sellers won't appear on the storefront until the administartor's approval (and get the *Pending* status), but they do get access to the Vendor panel. After the administrator approves the vendor, they owe the vendor plan fee and get the *"Active"* status. 

How to configure this scenario:

#. Make sure that the **Vendor Data Premoderation** add-on is installed and active.
#. Set the "Approval of newly-created vendors" setting in the addon to *"Required for all vendors"*.
#. Disable the "Review new vendors before granting access to the admin panel" setting on the *Settings → General → Vendors* page.



Scenario 3. Approval for Access to Admin Panel and Storefront
=============================================================

In this scenario, new sellers won't get access to the admin panel until the administartor's approval and won't appear on the storefront either, and get a *New* status. After the administrator's approval, they owe the vendor plan fee and get the *Active* status. 

How to configure this scenario:

#. Make sure that the **Vendor Data Premoderation** add-on is installed and active.
#. Set the "Approval of newly-created vendors" in the Vendor data premoderation addon's settings to *"Required for all vendors"*.
#. Set the "Approval of newly-created vendors" setting in the Vendor data premoderation addon to *"Isn't required"*.
#. Enable the "Review new vendors before granting access to the admin panel" setting on the *Settings → General → Vendors* page.
