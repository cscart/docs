****************************************************************************************************
Smarty Error: Unable to Read Resource: index.tpl in /.../lib/templater/Smarty.class.php on Line 1095
****************************************************************************************************

The mentioned file may be missing or may have incorrect permissions.

To resolve the problem, follow these steps:

1. Open the *design/themes/<Your_Active_Theme>/templates* directory. **<Your_Active_Theme>** is the name of the folder with the active theme of your storefront, for example, **responsive**.

* If the **index.tpl** file exists in this directory, check the `permissions <http://docs.cs-cart.com/4.4.x/install/useful_info/permissions.html>`_ for this file. The file should have the **644** permissions; if it doesn't, change the permissions accordingly.

* If the **index.tpl** file is missing, copy it to this directory from the *var/themes_repository/basic/templates* directory of your CS-Cart installation.

.. note::

    If there is no **index.tpl** file in the *var/themes_repository/basic/templates* directory of your CS-Cart installation, it might mean that the distribution package used for this CS-Cart installation was not full. It could be corrupted when uploading the package to the server or downloading the package from the File area of Help Desk.
