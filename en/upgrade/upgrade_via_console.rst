**************************
Upgrading via Command Line
**************************

.. note::

    The ability to upgrade CS-Cart or Multi-Vendor via console first appeared in version 4.4.3.

The command line can help to automate the upgrade process. The command works just like the Upgrade center, but offers more flexibility.

The ability to upgrade CS-Cart or Multi-Vendor via console is mainly intended for developers and experienced server administrators—some options of the upgrade command may break your store, if you use those options carelessly.

.. contents::
   :backlinks: none
   :local:

=========================
About the Upgrade Command
=========================

-----
Usage
-----

1. Access the server where your CS-Cart or Multi-Vendor store is installed. Either you use the server’s own Terminal, or connect to the server via SSH.

   .. note::

       The PHP on the server must work in the ``cli`` mode and have the extensions specified in :doc:`CS-Cart system requirements </install/system_requirements>`.

2. Go to the directory where your store is installed::

     cd /cscart/install/dir
 
3. Run the command::

     php admin.php --dispatch=upgrade_center.console upgrade

   Here is what this command means:

   * ``php admin.php`` runs the backend entry script. Please note that :doc:`we recommend renaming admin.php </install/security>` immediately after the installation for security reasons. That’s why the name of the file in your command can and should be different from this example.

   * ``--dispatch=upgrade_center.console`` is the path to the controller that handles the execution of commands.

   * ``upgrade`` is the name of the command for upgrading the store.

---------
Arguments
---------

* ``id``—the identifier of the upgrade. To upgrade CS-Cart or Multi-Vendor, use ``core``. To upgrade an add-on, use its ``<id>`` from :doc:`addon.xml </developer_guide/addons/addon_scheme>`.

  .. note::

      An add-on can be upgraded separately from the core only if :doc:`a separate upgrade package </upgrade/upgrade_addon>` was created for that add-on.

-------
Options
-------

* ``--no-backup``—do not back up the files and the database of the store during the upgrade. This option is useful when you have already made a backup manually.

* ``--skip-validator``—skip the specified validator from the upgrade package during the upgrade. Use the validator’s name (for example, ``collisions`` or ``permissions``) as a value of this option. To ignore all validators, use ``*``. The option can be specified multiple times, for example::

    --skip-validator=collisions --skip-validator=permissions

  .. warning::

      Don’t skip a validator unless you don’t know what problems this could lead to. You can't skip the ``restore`` validator—if the result of checking that validator is negative, the upgrade process will be stopped.

  Validators can either simply provide information, or require some input from a user. For example, the ``collisions`` validator ensures that the upgraded files weren’t modified. Skipping this validator means that all :doc:`modifications done directly to the core files </developer_guide/getting_started/guidelines>` will be lost.

  The ``permissions`` validator checks :doc:`file permissions </install/useful_info/permissions>`. As a rule, you don’t skip this validator: the files without ``write`` permissions won’t be updated, and it may break the functionality of the store.

  The number and content of validators is not set in stone and can change depending on a version or the type of the upgrade.

* ``--help``—do not run the actual upgrade; display the instructions on how to use the command instead.

* ``--quiet``—do not provide any output to console.

* ``--no-interaction``—disable the interactive mode.

  .. note::

      By default, the command runs in interactive mode. It means that the command will ask you to enter missing parameters and confirm some actions, when necessary.

--------
Examples
--------

::

  php admin.php --dispatch=upgrade_center.console upgrade

Run an upgrade without specifying the ``id`` of the upgrade and any options. You will be asked what upgrade to install and whether or not a backup should be created. If something doesn’t go as planned, you will be asked to confirm that you want to continue the upgrade.

---------------------------------------------------------

::

  php admin.php --dispatch=upgrade_center.console upgrade core

Run use a specific upgrade (``core`` in this case). You will only be asked whether or not to create a backup. If something doesn’t go as planned, you will be asked to confirm that you want to continue the upgrade.

---------------------------------------------------------

::

  php admin.php --dispatch=upgrade_center.console upgrade core --no-backup

Run a specific upgrade (``core`` in this case) without creating a backup. If something doesn’t go as planned, you will be asked to confirm that you want to continue the upgrade.

---------------------------------------------------------

::

  php admin.php --dispatch=upgrade_center.console upgrade core --no-backup --skip-validator=collisions

Run a specific upgrade (``core`` in this case) and without creating a backup. The ``collisions`` validator will be ignored. If something doesn’t go as planned, you will be asked to confirm that you want to continue the upgrade. However, you won’t be asked for confirmation in case when the result of checking the ``collisions`` is negative.

---------------------------------------------------------

::

  php admin.php --dispatch=upgrade_center.console upgrade core --no-backup --skip-validator=*

Run a specific upgrade (``core`` in this case) and without creating a backup. All validators will be ignored. If something doesn’t go as planned, you will be asked to confirm that you want to continue the upgrade. However, you won’t be asked for confirmation in case when the result of checking any validator is negative.

---------------------------------------------------------

::

  php admin.php --dispatch=upgrade_center.console upgrade core --skip-validator=* --no-interaction

Run a specific upgrade (``core`` in this case) and without creating a backup. All validators will be ignored, and the interactive mode will be disabled. It means that the command won’t ask for missing parameters and confirmation of any actions.

=======================================
Required File and Directory Permissions
=======================================

Before you try to upgrade your store via console, make sure that file and directory permissions are configured properly. Let’s assume that we use Apache with ``mod_php`` as your web server, and that SSH access is available. We have 2 users:

* The user who runs Apache. Usually it’s ``www-data`` with the ``www-data`` group.

* The SSH user, for example, ``dev`` with the ``dev`` group.

In this case:

* User ``dev`` must be the owner of all the files of the store.

* User ``dev`` must be added to the ``www-data`` group.

* Generally, the **file permissions** must be set to *644*, and **directory permissions** must be set to *755*.

* The **design**, **images**, and **var** folders are the exception to that rule, as web server must be able to edit them and their content. These 3 folders and all their subfolders must have *777* permissions.

  All the files in these folders and their subfolders must have *666* permissions. However, **.htaccess** files in these folders must have *644* permissions.

::

  app (755 dev:dev)
      ...
      functions (755 dev:dev)
          ...
          fn.common.php (644 dev:dev)
          fn.control.php (644 dev:dev)
          ...
  design (777 dev:dev)
      .htaccess (644 dev:dev)
      backend (777 dev:dev)
          ...
          templates (777 dev:dev)
              ...
              views (777 dev:dev)
              index.tpl (666 dev:dev)
              ...
          ...
      ...
  var (777 dev:dev)
      .htaccess (644 dev:dev)
      upgrade (777 dev:dev)
      ...
