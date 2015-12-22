************************************
About File and Directory Permissions
************************************

===================
General Information
===================

Permissions define who is allowed to perform certain actions on files and directories. Unix-based operating systems allow you to set permissions for every file or directory. Other operating systems (Windows, etc.) also support permissions, but most hosting servers run on Unix-based operating systems. That's why we will focus on the Unix-based systems in this article.

When CS-Cart is hosted on a Unix-based server, its every single file and directory has a set of permissions associated with it.

================================
Actions on Files and Directories
================================

There are three basic actions that can be performed on files or directories:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 23 27

    *   -   Action
        -   For files
        -   For directories
    *   -   Read
        -   View the content of the file.
        -   View the content of the directory.
    *   -   Write
        -   Change the file.
        -   Create and delete files in the directory.
    *   -   Execute
        -   Run a file, if it is a program or script.
        -   Open the directory and access the files in it.

==============
Types of Users
==============

There are three types of users that can perform actions on files:

* The **owner** of the file

* Anyone in the **group** that the file belongs to

* **Others** (everyone else)

In most cases, permissions are represented by a set of three digits, for example 755 or 666. The first digit determines the file owner's permissions, the second digit determines the group's permissions, and the third digit determines the permissions of others. 

Each value corresponds to a certain combination of the **read**, **write** and **execute** permissions. For more information, `read about the numeric notation of file permissions <https://en.wikipedia.org/w/index.php?title=File_system_permissions&action=view&section=8#Numeric_notation>`_.

====================
Checking Permissions
====================

To check the permissions:

* On a Unix-based server with terminal access, use the following command:

::

  ls -l

This will give you permissions for all the files and directories in the current directory. You will see something like this:

::

    -rw-r--r--  2011-12-12 11:06 index.php

**-rw-r--r--** means that the mentioned file can be read and written by the user, but the group and everyone else can only read the file.

* If you do not have terminal access to your server, you can use an FTP client. FTP clients usually called File attributes.

===================
Setting Permissions
===================

To set up permissions:

* On a Unix-based server with terminal access, use the **chmod** command to change the permissions for a file or directory:

::

  chmod 755 file_name

The command above sets up permissions that will allow the file owner to modify the **file_name** file, and all other users will be able to read or run this file.

To set up the permissions for the directory, its subdirectories and all the files inside these subdirectories, use the following command:

::

  chmod -R 755 directory_name

* If you do not have terminal access to your server, use an FTP client. Most of them have options like **Change permissions** or **Change mode functions**. For more detailed instructions on setting file permissions, refer to your FTP client documentation.

* On a Windows-based server, you need to set up the permissions for the files and directories for the user with the IUSR account.

=======================
Permissions for CS-Cart
=======================

Most of CS-Cart files should have the 644 permissions, and all directories must be set to 755. When you install CS-Cart, the **var**, **images**, and **design** directories, and all their subdirectories and files should have the **777** permissions. This is required to allow CS-Cart to upload files to these directories for routine operations. 

As for the **config.local.php** file, it must have the **666** permissions.
Once the installation is complete, it is strongly recommended to change the access permissions for the files as advised below.

::

  chmod 644 config.local.php
  chmod 644 design/.htaccess images/.htaccess
  chmod 644 var/.htaccess var/themes_repository/.htaccess
  chmod 644 design/index.php images/index.php
  chmod 644 var/index.php var/themes_repository/index.php

The permission behavior is affected by the **umask** functions that sets default permissions for all new files and directories. `Learn more about Umask at Wikipedia <http://en.wikipedia.org/wiki/Umask>`_. 
