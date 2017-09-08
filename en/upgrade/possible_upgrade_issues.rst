***************************************
The Upgrade Process and Possible Issues
***************************************

This article describes what is done during the upgrade process in CS-Cart and Multi-Vendor. It covers the problems that may arise at different stages of the upgrade, and what might cause those problems.

.. warning::

    This article is intended for server administrators. If you can't solve the problem by yourself, please contact `CS-Cart's technical support <https://helpdesk.cs-cart.com>`_.

.. contents::
   :local:
   :backlinks: none

===================
The Upgrade Process
===================

Here are the actions that are performed during the upgrade of CS-Cart or Multi-Vendor:

0. So-called **validators** check specific bottlenecks related to the upgrade process. For example:

   * The **collisions** validator checks whether or not the updated core files were changed.

   * The **permissions** validator checks if the file and directory permissions are correct.

   * The **restore** validator checks whether or not the backup of the store can be created.

   Validators are described as step 0 because different checks are performed during different steps of the upgrade.

#. The upgrade package is downloaded and unpacked.

#. The backup of files and database of the site is created.

#. The link for restoring the pre-upgrade site from backup is sent to the administrator's email.

   .. note::

       Administrators can choose to skip backup creation in two cases:

       * The upgrade is a Service Pack without any migrations. The ability to skip backup creation in such cases first appeared in version 4.6.1.

       * The :doc:`development mode </developer_guide/getting_started/configuring_cscart>` is enabled; but in that case we advise making the backup manually before the upgrade.

#. **Migrations** make changes to the database.

#. The files are copied from the upgrade package; the files that don't exist in the newer version of CS-Cart/Multi-Vendor are removed.

#. The languages from the updated PO files are installed.

#. The cache is cleared.

#. The information about the upgrade is saved to the database.

#. The permissions on PHP scrips in the root directory of the installation (**admin.php**, **api.php**, **index.php**) are set the way they were before the upgrades.

After this the upgrade is complete.

========================================
Possible Upgrade Issues and Their Causes
========================================

.. important::

    The information about many of problems described below is saved to the upgrade log. It is a **core_log.txt** file that will be created in the *var/upgrade* directory of the CS-Cart/Multi-Vendor installation when an upgrade is attempted.

-------------------
0. Validator Errors
-------------------

Validator errors usually occur before the actual upgrade begins; there is :ref:`an exception <saving-upgrade-info>`, but it occurs after the upgrade is performed. That's why there's no need to restore the site from backup in case of validator errors—solving the problem is enough.

++++++++++++++++++++++++++++++++++++++++
Validator "Restore" returned fail status
++++++++++++++++++++++++++++++++++++++++

Error message:

.. code-block:: none

    Validator "Restore" returned fail status

The **restore** validator checks whether or not the pre-upgrade version of the site can be restored from backup. If this error occurs, here are the possible causes:

* Wrong permissions on files and directories.

* The web server doesn't allow to run the restore-from-backup script. This script is created with the same permissions as specified in ``DEFAULT_FILE_PERMISSIONS`` in the **config.local.php** file.

  One of the ways to solve this problem is to change the permissions in the file to those that will allow to run the script. The necessary permissions depend on the settings of your server.

* **cURL**-related problems:

  * cURL isn't installed on the server.

  * сURL returns an empty response body.

  * The responses to cURL requests return errors.

  * Loopback connection is prohibited on the server, which leads to the following error:

    .. code-block:: none

        HTTP error: curl (56): Failure when receiving data from the peer

* The *upgrades* directory or the **source_restore.php** file in that directory is missing. If the file or directory is missing, you can take them from the installation archive of your current version of CS-Cart or Multi-Vendor.

  To get the archive with the necessary version, contact the technical support `via Help Desk <https://helpdesk.cs-cart.com>`_ and say which version of CS-Cart or Multi-Vendor you need. The support specialists will upload the archive to your **File Area**.

* The upgrade is performed on a test copy of the installation on a different server with the same domain name; the **hosts** file on the client's computer has an entry with the IP address of the test copy.

  In this case the copy tries to connect to the live store. There are 2 ways to solve the problem:

  * Make similar changes to the **hosts** file on the server with the test copy.

  * Use another temporary domain for the test copy.

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Package contains migrations that were not described in schema
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Error message:

.. code-block:: none

    Package contains migrations that were not described in schema or schema has links to missing migration files

The error may mean that:

* The upgrade package couldn't be downloaded or extracted and needs to be redownloaded. This problem can be caused by the lack of hard drive space.

* The previous upgrade wasn't successful (the migrations didn't apply). In that case it's best to restore the previous version from the backup and contact `CS-Cart's technical support <https://helpdesk.cs-cart.com>`_.

* The actual version of CS-Cart/Multi-Vendor that you use doesn't match the version specified in the **config.php** file. If you're sure that there was no problem with migrations, just change the version in **config.php**.

++++++++++++++++++++++++++++++++++
Validator "0" returned fail status
++++++++++++++++++++++++++++++++++

The upgrade log has an error like this:

.. code-block:: none

    There was a problem creating the schema table: Invalid default value for 'end_time'

The problem occurs in older versions when ``NO_ZERO_DATE`` mode is enabled in MySQL. The problem was solved starting with 4.4.х.

+++++++++++++++++++++++++++++++++++++++++++++++++++++++
Upgrade is impossible due to file integrity check error
+++++++++++++++++++++++++++++++++++++++++++++++++++++++

Error message:

.. code-block:: none

    Upgrade is impossible due to file integrity check error. Please contact the technical support team

When a file integrity check error occurs, it's best to contact `CS-Cart's technical support <https://helpdesk.cs-cart.com>`_.

+++++++++++++++++++++++++++++++++++++++
Validator "Backup" returned fail status
+++++++++++++++++++++++++++++++++++++++

Error message:

.. code-block:: none

    Validator "Backup" returned fail status

The error means that the backup wasn't created. The problem could be caused by the lack of hard drive space.

-----------------------------------------------------
1. The Upgrade Package Wasn't Downloaded or Extracted
-----------------------------------------------------

If the upgrade package can't be downloaded, then more often than not you'll find the reason in the upgrade log. Here are some of the possible reasons:
    
* URL-file access (the ``allow_url_fopen`` directive) is disabled on your server, so the ``file_get_contents`` function doesn't work. *This reason isn't logged.*

* There isn't enough free hard drive space. *This reason isn't logged.*

* The URL of the Upgrade Center is wrong or is missing in the **config.php** file. It should be this:

  .. code-block:: php

      $config['updates_server'] = 'http://updates.cs-cart.com';

* The proxy settings that prevent the download of the upgrade are specified on the **Settings → General** page.

* The permissions on the *var/upgrades* directory to which the upgrade files are supposed to be downloaded are wrong.

If the upgrade package can't be unpacked, here are the possible reasons:

* The **ZipArchive** extension is disabled on the server. *This reason isn't logged*, but you'll be able to see the warning on the **Administration → Backup/Restore** page.

* There isn't enough free hard drive space. *This reason isn't logged.*

----------------------------
2. The Backup Wasn't Created
----------------------------

If the backup of the site isn't created, this could be caused by the following reasons:
    
* The timeouts are too low on the server. The problem could be caused by the limited execution time for PHP scripts (we recommend setting ``max_execution time`` to at least *3600*) or by FastCGI and MySQL settings.

  .. hint::

      To find out whether the upgrade is still going on, check the browser tab. If the loading animation is displayed on the tab, it means that the upgrade is still working.

* There are files with non-latin symbols in their names (most often those are style names) — in that case you'll see a detailed error message. To solve the problem, rename the files appropriately and run the upgrade again.

  To rename a style, open it in :doc:`the Theme Editor </user_guide/look_and_feel/themes/theme_editor>`, duplicate the style and specify an appropriate name. After that select the duplicate style and delete the original style.

* The database has non-standard tables (for example, from third-party add-ons) with forbidden symbols in table names — in this case there won't be an error message. The problem is solved by renaming the tables `in accordance with MySQL requirements <https://dev.mysql.com/doc/refman/5.7/en/identifiers.html>`_: use only latin characters, numbers, underscore, and the $ symbol in the names.

* The ``Validator "Backup" returned fail status`` error; it most likely means that there isn't enough free hard drive space. *This reason isn't logged.*

-----------------------------------------
3. The Email to Administrator Wasn't Sent
-----------------------------------------

The upgrade won't start if it isn't possible to send an email with the restore-from-backup link to the administrator's email address. Most of the possible reasons are described :doc:`in a separate article </user_guide/orders/actions_on_orders/notifications>`. The problem can also occur if the site administrator's email address isn't specified on the **Settings → Company** page. Either way, the upgrade log will contain a record about the error.

---------------------
4. Migration Problems
---------------------

These problems can be caused by non-standard structure of the database or by an error in a migration. As a result, the occurring SQL errors will appear in the upgrade log.

If you experience problems with migrations, we recommend restoring the store from pre-upgrade backup and contacting `CS-Cart's technical support <https://helpdesk.cs-cart.com>`_.

-------------------------------------------
5. Problems with Copying and Deleting Files
-------------------------------------------

Problems at this stage can occur if the timeouts are too low on the server. The problem could be caused by the limited execution time for PHP scripts (we recommend setting ``max_execution time`` to at least *3600*) or by FastCGI and MySQL settings.

.. hint::

    To find out whether the upgrade is still going on, check the browser tab. If the loading animation is displayed on the tab, it means that the upgrade is still working.

**If the upgrade stops at this step, we recommend restoring the site from the pre-upgrade backup.**

-----------------------
6. Installing Languages
-----------------------

Problems at this stage can occur if the timeouts are too low on the server. The problem could be caused by the limited execution time for PHP scripts (we recommend setting ``max_execution time`` to at least *3600*) or by FastCGI and MySQL settings.

.. hint::

    To find out whether the upgrade is still going on, check the browser tab. If the loading animation is displayed on the tab, it means that the upgrade is still working.

**If the upgrade stops at this step, we recommend restoring the site from the pre-upgrade backup.**

---------------------
7. Clearing the Cache
---------------------

Problems at this stage can occur if the timeouts are too low on the server. The problem could be caused by the limited execution time for PHP scripts (we recommend setting ``max_execution time`` to at least *3600*) or by FastCGI and MySQL settings.

.. hint::

    To find out whether the upgrade is still going on, check the browser tab. If the loading animation is displayed on the tab, it means that the upgrade is still working.

**At this stage the upgrade itself has already been completed.** If necessary, you can :doc:`clear the cache manually </developer_guide/getting_started/cache_clearing>`.

.. _saving-upgrade-info:

---------------------------------------
8. Saving Information about the Upgrade
---------------------------------------

When the information about the upgrade is saved to the database, problems can occur due  to the following reasons:

* The timeouts are too low on the server. The problem could be caused by the limited execution time for PHP scripts (we recommend setting ``max_execution time`` to at least *3600*) or by FastCGI and MySQL settings.

  .. hint::

      To find out whether the upgrade is still going on, check the browser tab. If the loading animation is displayed on the tab, it means that the upgrade is still working.

* There is no information about the upgrade package. The upgrade is completed properly, but the following message appears:

  .. code-block:: none

      Validator "0" returned fail status

  An SQL error is recorded to the upgrade log:

  .. code-block:: none

      Caught an exception: Tygh\Exceptions\DatabaseException: Column 'type' cannot be null <b>(1048)</b><p>INSERT INTO cscart_installed_upgrades (`type`, `name`, `timestamp`, `description`, `conflicts`) VALUES (NULL, NULL, 1504536222, NULL, 'a:0:{}')</p> in /path/to/store/app/Tygh/Database/Connection.php:1118

  In this case go to **Administration → Upgrade center**, click the gear button, and choose **Refresh available upgrades**. Otherwise the upgrade that you already installed may appear on the list of available upgrades.

---------------------------------------------------
9. Problem with Changing Permissions on PHP Scripts
---------------------------------------------------

Sometimes during the upgrade the ``chmod`` can't be executed. That command is used to set the permissions on PHP scripts in the root directory of a CS-Cart and Multi-Vendor installation as they were before the upgrade. 

The problem usually manifests as an entry in the upgrade log: other than that, the upgrade is completed, and the store works properly. However, if you experience a problem right after the upgrade, it's a good idea to check the ownership and permissions of the following files:  **admin.php** (:doc:`it should have a different name </install/security>`), **api.php**, and **index.php**. 

=================================
Possible Issues after the Upgrade
=================================

-----------------------------------------------
The Store Is Temporarily Closed for Maintenance
-----------------------------------------------

During the upgrade the store is always :doc:`closed </user_guide/look_and_feel/changing_attributes/store_closed>`. This is done to let you check if everything is alright in the store before your customers see it. Here's what you should do:

* Check the most important pages: product pages, contact information, checkout page, etc.

* Place a test order on behalf of a test customer.

* Check the data in the Administration panel (such as information about products, orders).

After that you can open your store for customers.
