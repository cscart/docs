*************************
Vendor Data Premoderation
*************************

.. important::

    This add-on is available only in **Multi-Vendor**.

This add-on ensures that vendors don't add unwanted information or make unnoticed changes to their products and profiles. The add-on can hide new or modified products from customers until these products are reviewed by an administrator. Administrator can approve the products to make them visible on the storefront, or disapprove them. In that case, vendor will be able to make changes, and the product will be sent for approval again.

Marketplace administrators and vendors can easily check, which products require approval or were rejected. They are also notified when products require approval, get approved or rejected.

.. image:: img/vendor_data_premoderation.png
    :align: center
    :alt: A menu section for pending products that require approval.

============
Installation
============

The Vendor Data Premoderation add-on isn't installed by default. You can install it :doc:`like any other add-on that comes with Multi-Vendor </user_guide/addons/1manage_addons>`.

===============
Add-on Settings
===============

The settings of the add-on let you choose what data and what vendors are affected by premoderation.

* **Approval is required for newly created products**—if approval is required, then customers won't see vendor's new products until administrator approves them.

* **Approve product info updates**—if approval is required, then any change to vendor's existing products must be approved by the store administrator. Until then, unapproved products won't be visible to customers.

* **Approve vendor profile updates**—if approval is required, then any change to vendor's profile will need to be approved by store administrator. Until then, vendor will get the *Pending* status and won't appear to customers on the storefront.

Here are the possible values of these settings:

* *All vendors*—the changes made by any vendor will have to be checked before becoming visible.

* *Custom*—the :doc:`editing pages of vendors </user_guide/users/vendors/index>` will get a setting that determines whether or not this particular vendor's data requires premoderation in this case.

* *None*—the changes made by any vendor will be visible instantly.

================
Related Articles
================

* :doc:`/user_guide/users/vendors/product_approval`

.. meta::
   :description: How to hide vendor's products in Multi-Vendor ecommerce CMS until administrator checks and approves them?
