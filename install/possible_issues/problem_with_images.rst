****************************************************************
Problems with Displaying Images When or After Installing CS-Cart
****************************************************************

If some elements such as images, files, etc. are not displayed, this may be caused by wrong permissions.

1. Make sure the **var**, **images**, **design** directories and all their files and subdirectories have the **777** permissions, and the **config.local.php** file has **666**. All these objects are located in the root CS-Cart directory.

2. If the permissions are different, set them to those mentioned above:

* On a Unix-based server with the terminal access to it use the following commands: 

::

  chmod 666 config.local.php
  chmod -R 777 images
  chmod -R 777 design
  chmod -R 777 var

The fist command sets the **666** permissions for **config.local.php**.

The remaining commands set the **777** permissions for the *images*, *design*, and *var* directories, their subdirectories and all the files under these directories.

.. note:: 

    The **666** permissions mean **read and write** permissions, for the **user**, **user group**, and **others**. The **777** permissions mean **read, write and execute** permissions for the **user**, **user group**, and **others**. :doc:`Learn more about permissions in CS-Cart documentation <../useful_info/permissions>`.

If you do not have terminal access to your server, change file access permissions using an FTP client. Most FTP clients have the **Change permissions** or **Change mode** functions, that you can use to set the permissions described above. For more detailed instructions on how to set file permissions refer to your FTP client documentation.
 
.. note::

    Contact your hosting support team for information about proper permissions for PHP files and directories.

* On a WINDOWS-based server, give full permissions for the files and directories to the user with the IUSR account.

3. Try renaming the **var/themes_repository/.htaccess** and **var/.htaccess** files into **var/themes_repository/.htaccess1** and **var/.htaccess1**. If this solves the issue and the images are displayed properly after that, then **.htaccess** files do not work on your server. Contact your server administrator and ask them about this problem.
