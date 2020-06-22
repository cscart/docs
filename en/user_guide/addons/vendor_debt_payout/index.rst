************************
Vendor-to-Admin Payments
************************

.. important::

    This add-on replaced the Vendor Debt Payout add-on in Multi-Vendor 4.12.1.

By default, all the money from orders in Multi-Vendor goes to the marketplace owner and then splits between vendors. For more information, please check :doc:`the article about money flow in Multi-Vendor and how to control it </user_guide/users/vendors/workflow>`. 

The marketplace owner earns money on commissions and vendor plan fees. But what if a vendor doesn't get orders? Or  the marketplace owner charges him for some service, and the vendor can’t to pay in time? This is how the vendor may become a debtor. 

Previously, marketplace owners had to deal with debtors manually or use the Vendor Debt Payout add-on. In new versions of Multi-Vendor, the Vendor-to-Admin Payments add-on was created to completely replace the old add-on.

Features
========

The Vendor-to-Admin Payments add-on is the main tool to deal with debtors.

* In the :doc:`vendor plan </user_guide/addons/vendor_plans>` settings, the marketplace owner can set the minimum allowed balance for each vendor. It can be positive, negative, or zero. When the vendor's balance goes below this value, the grace period starts. It is a period of time for the vendor to pay off his debt before various restrictions apply. If the vendor does not pay off his debt during the grace period, he gets suspended.

  .. image:: img/plan_settings.png
      :align: center
      :alt: Configure minimum allowed balance and grace period in vendor plans settings

* Even without the add-on, the marketplace owner can manually set the status of any vendor to Suspended on the **Vendors** page. Products of the suspended vendor (so as the vendor himself) are automatically hidden from the storefront. 

  The Vendor-to-Admin Payments add-on lets the marketplace owner decide what the **Suspended** status does. It can:

  * Hide the debtor and his products from the storefront.

  * Block the debtor's admin panel  — in this case, the only option left is to pay off the debt.

  * Do both things, or nothing at all.
  
  .. image:: img/admin_panel_blocked.png
      :align: center
      :alt: Message about the blocked admin panel and Pay the fees button

  These measures can encourage vendors to pay off their debts. All restrictions will be removed automatically once the debt is paid.

* The add-on adds many different notifications. For example, it notifies the vendor or the marketplace owner:

  * when the minimum allowed balance is reached;

  * a few days before the vendor is suspended;

  * when the vendor is suspended;

  * when the suspended vendor is disabled.

  You can find the links to notification settings in the add-on settings. The notification settings are also available in **Administration** → **Notifications**.

* The add-on allows you to automatically disable the suspended vendors. A disabled vendor loses access to his account, and he is not able to pay off his debt anymore. Disabling the debtors helps the marketplace owner to get rid of the "dead" accounts.

  .. image:: img/access_restricted.png
      :align: center
      :alt: Access to a vendor's account denied
      
* Once a week the owner receives a report which contains current information about debts and debtors' accounts.

.. note::
    
    **In short**: The Vendor-to-Admin Payments add-on allows you to work with debtors automatically. In addition to being able to hide the debtor's products, the marketplace owner can block the debtor's admin panel. If the debt is not paid for a long time, the suspended vendor may be disabled.


Related articles
================
    
.. toctree::
    :titlesonly:
    :glob:

    configure
    what_changed 