*****************************************************************
500 Internal Server Error During CS-Cart Installation or After It
*****************************************************************

There are two possible reasons why the error appears.

==============================================
Reason 1. Incorrect File/Directory Permissions
==============================================

Some webservers do not allow executing PHP scripts with the permissions higher than 755 or 644. Change the permissions for your files and directories to 755 in order to resolve this issue.

To set up the permissions, complete the steps below:

* On a Unix-based server with terminal access, use the following command:

::

  chmod 755 index.php 

The command sets the 755 permissions for all CS-Cart scripts (at least, for **index.php** and **admin.php** located in the CS-Cart root directory, and for **index.php** located in the install directory). Use this command, if you get the mentioned **500 Internal Server Error** after the installation.

.. note:: 

    The **755** permissions mean **read, write and execute** permissions for the **file user**, and **read and write** permissions for the **user group** and **others**. :doc:`Learn more about permissions in CS-Cart documentation <../useful_info/permissions>`.

If you do not have terminal access to your server, change file access permissions using an FTP client. Most FTP clients have the **Change permissions** or **Change mode** functions, that you can use to set permissions. For more detailed instructions on how to set file permissions refer to your FTP client documentation.
 
.. note::

    Contact your hosting support team for information about proper permissions for PHP files and directories.

* On a WINDOWS-based server, set read permissions for the files and directories to the user with the IUSR account.

========================================================
Reason 2. The Web Server Doesn't Support Some Directives
========================================================

The second possible reason for Internal Server Error is that your web server does not support some directives of the CS-Cart .htaccess file.

To solve the problem, try renaming the **.htaccess** file located in the root directory of your CS-Cart installation. 

If renaming **.htaccess** helps, contact your server administrator. Send them the content of the CS-Cart **.htaccess** file and ask which directives are not supported on your server.
