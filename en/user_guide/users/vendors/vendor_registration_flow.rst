****************************************************
How To: Manage Vendor Onboarding on the Marketplace
****************************************************

.. important::

    This functionality is available only in **Multi-Vendor**.

The administrator can quickly change the access level of the new vendors to the marketplace. Depending on the chosen scenario, vendors after registration will either immediately work in the marketplace, or will have limited access, or won't work at all until the administrator approves them.

To set up access for new vendors:

#. Go to the **Marketplace setup wizard**.

#. On the **Vendors** tab, select one of three three scenarios that define the work of new vendors.

.. contents::
   :backlinks: none
   :local:

=========================
Scenarios for New Vendors
=========================

The setup wizard speeds up manual setup. Vendor :doc:`statuses </user_guide/users/vendors/vendor_statuses>`, values of the setting in the :doc:`/user_guide/addons/vendor_data_premoderation/index` add-on and the of vendor setting in the admin panel changes by selecting a scenario.

.. image:: img/vendor_registration_flow.png
    :align: center
    :alt: Interaction Scenarios for New vendors And the Store.


After the appropriate settings will be applied, you can always change vendor onboarding via the **Marketplace setup wizard** or manually.

Scenario 1.  Immediate Full Access to Admin Panel and Storefront
================================================================

.. list-table::
    :header-rows: 1
    :widths: 25 35

    *   -   Vendor
        -   Administrator
    *   -   * Gets access to the Vendor panel.
            * Appears on the storefront.
            * Gets the *"Active"* status.
            * Immediately owes the vendor plan fee.
        -   * The addon is installed and activated.
            * The "Approval of newly-created vendors" setting in the addon is set to *"Isn't required"*.
            * The "Review new vendors before granting access to the admin panel" setting on the *Settings → Vendors* page is disabled.

Scenario 2. Immediate Access to Admin Panel, Approval for Storefront
====================================================================

.. list-table::
    :header-rows: 1
    :widths: 25 35

    *   -   Vendor
        -   Administrator
    *   -   * Gets access to the Vendor panel.
            * Won't appear on the storefront until the administartor's approval.
            * Gets the *"Pending"* status.
            * Owes the vendor plan fee after approval and getting the *"Active"* status
        -   * Vendor data premoderation addon is installed and activated.
            * The "Approval of newly-created vendors" setting in the addon is set to *"Required for all vendors"*.
            * The "Review new vendors before granting access to the admin panel" setting on the *Settings → Vendors* page is disabled.

Scenario 3. Approval for Access to Admin Panel And Storefront
=============================================================

.. list-table::
    :header-rows: 1
    :widths: 25 35

    *   -   Vendor
        -   Administrator
    *   -   * Won't get access to the admin panel until the administartor's approval.
            * Won't appear on the storefront until the administartor's approval.
            * Gets the *"New"* status.
            * Owes the vendor plan fee after approval and getting the *"Active"* status
        -   * Vendor data premoderation addon—the status doesn't change;
            * The "Approval of newly-created vendors" setting in the addon is set to *"Isn't required"*.
            * The "Review new vendors before granting access to the admin panel" setting on the *Settings → Vendors* page is enabled.