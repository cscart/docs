***************************************************************
The Add to Cart Button Does Not Work After CS-Cart Installation
***************************************************************

If you encounter this problem, check **Error Console** of your browser. If there are some errors after you click the **Add to cart** button, follow the instructions below.

Check permissions for the **js** directory of your CS-Cart installation, as well as all subdirectories and files of **js**. They must have read permissions for JavaScript functions to work properly.

To set up the permissions, complete the steps below:

* On a Unix-based server with terminal access, use the following command:

::

  chmod -R 755 js

The command sets the **755** permissions for the directory, its subdirectories and all the files under these directories.

.. note:: 

    The **755** permissions mean **read, write and execute** permissions for the **user**, and **read and write** permissions for the **user group** and **others**. :doc:`Learn more about permissions in CS-Cart documentation <../useful_info/permissions>`.

If you do not have terminal access to your server, change file access permissions using an FTP client. Most FTP clients have the **Change permissions** or **Change mode** functions, that you can use to set permissions. For more detailed instructions on how to set file permissions refer to your FTP client documentation.
 
.. note::

    Contact your hosting support team for information about proper permissions for PHP files and directories.

* On a WINDOWS-based server, set read permissions for the files and directories to the user with the IUSR account.
