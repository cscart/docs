**********************
Account Merge
**********************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000151" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local:
    :depth: 2

--------
Overview
--------

    Occasionally, you may find duplicate customer accounts in your customer list. Fortunately, the `Account Merge <https://www.simtechdev.com/addons/site-management/customer-account-merge.html>`_ add-on makes it easy to identify and then merge these duplicate customer accounts. It combines all orders, reward points, assigned user groups of two customers into one account and then deletes the other.

    Merging accounts is helpful in the following cases:

    1. **If a customer has two similar accounts** (with different emails) and wishes to combine them into a single account. You can merge customers on the customer list page.

    .. fancybox:: img/Customer-account-merge-001.png
        :alt: merging customers

    Both customers will get an email notification:

    .. fancybox:: img/Customer-account-merge-008.png
        :alt: merging customers
        :width: 600px

    2. **If a customer places an order as a guest and then registers with the same email** in the store. In this case, the add-on will check the user's email in the system, and if the email exists, the system will auto assign that order to the existing email. This will help keep orders in a single place for the admin.

    .. fancybox:: img/Customer-account-merge-005.png
        :alt: merging customers

    Once the guest and registered customer are merged, a corresponding note will be left.

    .. fancybox:: img/Customer-account-merge-006.png
        :alt: merging customers

    The information about merging customers and orders, deleting customers is recorded in the logs (Administration > Logs).

    .. fancybox:: img/Customer-account-merge-007.png
        :alt: merging customers

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us via email cart-addons@cscart.com now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Account Merge add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Customer-account-merge-installation.png
        :alt: Account Merge add-on for CS-Cart

=================
Merging customers
=================

    When you are merging customers, there will be one **primary customer** and one **secondary customer**.

    The account of the **primary customer** will be kept.

    Any orders, reward points, assigned user groups of the **secondary customer** will be transferred to the primary customer, then the secondary customer's record will be deleted.

    1. Go to **Customers > Customers**.

    2. Pick a primary customer to merge, click the gear button next to it and click **Merge customers**.

    .. fancybox:: img/Customer-account-merge-001.png
        :alt: merging customers

    3. Click the **Select customers** button and select the secondary customer (that will be merged into another customer).

    .. fancybox:: img/Customer-account-merge-002.png
        :alt: merging customers

    4. Click **Merge**.

    .. fancybox:: img/Customer-account-merge-003.png
        :alt: merging customers

    .. attention::

        Once you click **Merge** the account being merged will be deleted.

    Done! Two customer accounts have been merged successfully. 

    You can see the merged customers and their orders in the profile of the primary customer in the **Add-ons** tab.

    .. fancybox:: img/Customer-account-merge-004.png
        :alt: merging customers

    Clicking on the customer ID will open the secondary customer information.

    .. fancybox:: img/Customer-account-merge-009.png
        :alt: merging customers
        :width: 438px