****************************************************
Cannot Edit Template Files Using the Template Editor
****************************************************

If you can't edit template files using the **Template editor**, complete the following steps:

1. Check permissions for the *design* directory, all its subdirectories and files.

.. note:: 

    For you to be able to edit templates using the **Template editor**, permissions should be **writable**.

2. Set the writable permissions for the mentioned directories and files if they are not set.

* On a Unix-based server with terminal access, use the following command:

::

  chmod -R 777 design

The command sets the **777** permissions for the directory, its subdirectories and all the files under these directories.

.. note:: 

    The **777** permissions mean **read, write and execute** permissions for the **user**, **user group** and **others**. :doc:`Learn more about permissions in CS-Cart documentation <../../../install/useful_info/permissions>`.

If you do not have terminal access to your server, change file access permissions using an FTP client. Most FTP clients have the **Change permissions** or **Change mode** functions, that you can use to set the permissions described above. For more detailed instructions on how to set file permissions refer to your FTP client documentation.
 
.. note::

    Contact your hosting support team for information about proper permissions for PHP files and directories.

* On a WINDOWS-based server, give full permissions for the files and directories to the user with the IUSR account.
