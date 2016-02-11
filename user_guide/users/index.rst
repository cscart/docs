*****
Users
*****

Manage user accounts that are registered at your store and configure related settings at the **Customers** section of your administration panel.

A **user account** is a record in the store database that identifies a *registered user* and associates the user with the related data: order statistics, personal info, subscriptions, etc. User accounts also serve to control the activity and privileges of the store users.

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    */index

==================
User Account Types
==================

CS-Cart has the following types of user accounts:

* **Administrator**—can access both the storefront and the administration panel and manage and/or view the store contents and configuration.

* **Customer**—can access the storefront and buy products in your store. Although the storefront is normally available to non-registered users as well, registered users are supposed to enjoy greater privileges. Besides, even registered users with a customer account may have different opportunities depending on the user group that they belong to (requires commercial license).

* **Supplier**—cannot access the storefront or the administration panel. Supplier accounts are used in the database to flag products that belong to third-party providers.
 
When in the **Administrators**, **Customers**, and **Suppliers** sections, use the search form to the right of the list to display only those records, that satisfy a certain criterion or a combination of multiple criteria. Use the **Advanced search** to expand the form and access more filtering criteria. If you filter accounts against a particular search pattern regularly (e.g., to list users from a certain country), you will find it convenient to save the pattern and add it to the list of predefined patterns appearing in the top right corner.

.. image:: img/users_saved_search.png
    :align: center
    :alt: Use the Advanced search and save your search patterns to optimize your workflow.

=============
Quick Actions
=============

When you search through the list of users with your mouse pointer, the **gear buttons** appear near the user statuses. Under this button you can find a drop-down list of quick actions, that can be done with the accounts. The set of applicable actions depends on the type of the account.

.. image:: img/users_actions.png
    :align: center
    :alt: Use the gear button to see what you can do with an account.

* **View all orders**—shows all the orders placed by the user.

* **Act on behalf of**—takes you to the storefront as if you are logged in as the selected user.

* **Points** (requires commercial license)—shows the customer's reward points log.

* **Edit**—allows you to the edit the user account.

* **Delete**—permanently deletes the user account.

.. warning::

   Account deletion can't be undone without restoring a database backup. We recommend to disable accounts, not to delete them.

* **View supplier products**—takes you to the list of products by this supplier

================================
Enable and Disable User Accounts
================================

Availability of a user account is controlled through the account status. To enable or disable an account, change its status to **Active** or **Disabled**, respectively—click on the current status and select the new status from the list.

=============
Adding a user
=============

You can add user accounts of the following types:

* administrator

* customer

* supplier

To add a new user, click the **+** button in top right corner of a page. This will open a form with the user account details.

The exact set of fields may vary depending on the account type and the profile configuration, which is managed in the **Profile fields** section.

.. note::

    A user's shipping address and billing address can be different from each other.

After the new account is created, click the **gear** button and choose **Edit** to configure additional parameters (requires commercial license).

* specify the customer's age on the **Add-ons** tab.

* assign the account to one of the available user groups on the **User groups** tab.

A user's membership in a user group is managed by the statuses:

* **Active**—user belongs to the group.

* **Pending**—user has applied for the groups and is waiting for approval.

* **Available**—group is available for application.

* **Declined**—user's application was declined.
