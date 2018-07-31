******************************
Backing Up a Store via Console
******************************

.. note::

    This functionality first appeared in CS-Cart and Multi-Vendor 4.8.2.

The backup of a CS-Cart or Multi-Vendor store can be made via console. This approach has 2 advantages:

#. You don't need to go to the admin panel, find the section in the menu and manualy specify the settings of a backup. You just prepare the command once and execute it in the console on your server whenever you need to make a backup.

#. The command can be added to `cron <https://ru.wikipedia.org/wiki/Cron>`_ or any other task scheduler. That way you'll be able to make backups automatically (for example, once a day).

Here's the command that makes a full backup of the store, with files and database:

.. code-block:: bash

    php /path/to/cart/admin.php --dispatch=datakeeper.backup -p --backup_database=Y --backup_files=Y --dbdump_tables=all --dbdump_data=Y --extra_folders[]=var/files --extra_folders[]=var/attachments --extra_folders[]=var/langs

.. note::

    Make sure to replace */path/to/cart* with the actual path to your CS-Cart or Multi-Vendor installation on the server.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 30

    *   -   Parameter
        -   Description
    *   -   p
        -   This parameter is necessary so that the controller (``dispatch=datakeeper.backup``) would accept all the other POST parameters.
    *   -   backup_database
        -   | Determines whether or not the database backup will be created.
            | ``Y``—yes.
            | ``N``—no.
    *   -   backup_files
        -   | Determines whether or not files will be backed up.
            | ``Y``—yes.
            | ``N``—no.
    *   -   dbdump_filename
        -   The name of an SQL file with the database backup. If the parameter isn't specified, the date of backup creation will be used as a name.
    *   -   dbdump_tables[]
        -   The array with tables that need to be backed up. If you want to back up all tables, then pass the ``all`` parameter.
    *   -   dbdump_schema
        -   | Determines whether or not to back up the database schema.
            | ``Y``—yes.
            | ``N``—no.
    *   -   dbdump_data
        -   | Determines whether or not to save the data from the database.
            | ``Y``—yes.
            | ``N``—no.
    *   -   extra_folders[]
        -   An array with non-standard directories (that don't exist in CS-Cart or Multi-Vendor by default) which need to be backed up. Specify the full path from the directory with your store's installation.
    *   -   compress (not required)
        -   The archive format. ZIP is used by default; if you want a TGZ archive, pass ``tgz``.
    *   -   pack_name (not required)
        -   The name of the archive with the backup of files and database. If you don't specify it, the default name will be used.

For example, here is the command that will back up the ``cscart_products`` table with all data, as well as the *var/langs* and *var/attachments* directories:

.. code-block:: bash

    php /path/to/cart/admin.php --dispatch=datakeeper.backup -p --backup_database=Y --backup_files=Y --dbdump_tables[]=cscart_products --dbdump_data=Y --extra_folders[]=var/langs --extra_folders[]=var/attachments
