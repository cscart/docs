****************************************************
How To: Manage Vendor Onboarding on the Marketplace
****************************************************

.. important::

    This functionality is available only in **Multi-Vendor**.
    
In this article, we explore different vendor onboarding scenarios in CS-Cart Multi-Vendor. Depending on the chosen settings, vendors after registration will either immediately work in the marketplace, or will have limited access, or won't work at all until the administrator approves them.


.. contents::
   :backlinks: none
   :local:

=========================
Scenarios for New Vendors
=========================


There are various settings that can be adjusted to tailor the vendor onboarding process for different scenarios:
 
* Vendor :doc:`statuses </user_guide/users/vendors/vendor_statuses>`.
* The values of the settings in the :doc:`/user_guide/addons/vendor_data_premoderation/index` add-on.
* The vendor setting in the admin panel. 



Scenario 1.  Immediate Full Access to Admin Panel and Storefront
================================================================

.. list-table::
    :header-rows: 1
    :widths: 25 35

    *   -   Setting results
        -   What to set up
    *   -   * Vendor gets access to the Vendor panel.
            * Vendor appears on the storefront.
            * Vendor gets the *"Active"* status.
            * Vendor immediately owes the vendor plan fee.
        -   * Vendor data premoderation add-on is installed and activated.
            * The "Approval of newly-created vendors" setting in the addon is set to *"Isn't required"*.
            * The "Review new vendors before granting access to the admin panel" setting on the *Settings → General → Vendors* page is disabled.

Scenario 2. Immediate Access to Admin Panel, Approval for Storefront
====================================================================

.. list-table::
    :header-rows: 1
    :widths: 25 35

    *   -   Setting results
        -   What to set up
    *   -   * Vendor gets access to the Vendor panel.
            * Vendor won't appear on the storefront until the administartor's approval.
            * Vendor gets the *"Pending"* status.
            * Vendor owes the vendor plan fee after approval and getting the *"Active"* status
        -   * Vendor data premoderation addon is installed and activated.
            * The "Approval of newly-created vendors" setting in the addon is set to *"Required for all vendors"*.
            * The "Review new vendors before granting access to the admin panel" setting on the *Settings → General → Vendors* page is disabled.

Scenario 3. Approval for Access to Admin Panel and Storefront
=============================================================

.. list-table::
    :header-rows: 1
    :widths: 25 35

    *   -   Setting results
        -   What to set up
    *   -   * Vendor won't get access to the admin panel until the administartor's approval.
            * Vendor won't appear on the storefront until the administartor's approval.
            * Vendor gets the *"New"* status.
            * Owes the vendor plan fee after approval and getting the *"Active"* status
        -   * Vendor data premoderation addon—"Approval of newly-created vendors" is set to *"Required for all vendors"*.
            * The "Approval of newly-created vendors" setting in the addon is set to *"Isn't required"*.
            * The "Review new vendors before granting access to the admin panel" setting on the *Settings → General → Vendors* page is enabled.
