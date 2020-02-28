************
Client Tiers
************

.. important::

    This functionality is available in our B2B products.

Encourage your customers to spend more by offering them additional benefits. The **Client Tiers** add-on automatically assigns and removes a customer's :doc:`user group </user_guide/users/user_groups/index>` depending on the spendings. Members of a user group can get access to exclusive promotions, shipping methods, payment methods, and even products.

=============
Functionality
=============

Each user group gets a new setting: **Required spendings**. If a customer spends that amount of money within a certain period, then the customer will automatically get that user group. You can set the period in the add-on's settings.

If the customer :doc:`represents an organization </user_guide/addons/organizations_and_representatives/index>`, then his or her order will contribute to the organization's tier. All representatives of an organization have the same tier.

.. important::

    A client can only be in one tier (automatically assigned user group) at a time. Please make sure that the required spendings for each tier are different.

.. image:: img/required_spendings.png
    :align: center
    :alt: A user group gets assigned automatically, depending on the required spendings.

============
Installation
============

The Client Tiers add-on can be installed :doc:`like any other add-on that comes with CS-Cart </user_guide/addons/1manage_addons>`.

During installation, the add-on will automatically create a few user groups and promotions. You can tailor them to your needs or delete them.

===============
Add-on Settings
===============

* **Reporting period**—determines the period that CS-Cart will take into account while checking if a customer is eligible for a tier.

* **Options to upgrade customer tier**—determines when a customer can get to the next tier: either only after a tier check, or after paying for an order as well.

* **Tier check can downgrade customer's tier**—determines if a customer's tier can decrease if he or she hasn't met the tier requirements in the latest reporting period.

* **Tier check**—run the check manually at any time, or automate the process with a command that you need to add to CRON (after replacing the path with your own)::

    php /path/to/cart/admin.php -p --dispatch=client_tiers.recalculate

  .. important::

      Tier check is the only way to downgrade a customer's tier automatically, and only if you allow downgrades.

  .. image:: img/settings.png
      :align: center
      :alt: The settings of the Client Tiers add-on in CS-Cart B2B softwate.

.. meta::
   :description: An add-on for automatically moving clients between user groups in CS-Cart B2B ecommerce software.
