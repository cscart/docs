****************
Database Backups
****************

This section deals with database backups: here you can learn how to create them and restore them. It may be a good idea to make periodic database backups—that way you can always roll back to the previous state of the store, if something goes wrong.

.. note::

    It takes more than backing up a database to have a store backed up: some information, like images, is stored in various folders of your CS-Cart/Multi-Vendor installation. However, there is a setting that allows you to include files in the backup. 

.. toctree::
    :maxdepth: 4
    :titlesonly:
    :glob:

    create_database_backup
    restore_database_backup
    backup_via_console
