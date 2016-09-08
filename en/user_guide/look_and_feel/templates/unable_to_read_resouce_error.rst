****************************************************************************************************
Smarty Error: Unable to Read Resource: index.tpl in /.../lib/templater/Smarty.class.php on Line 1095
****************************************************************************************************

The following error:

.. warning::

    Smarty Error: Unable to Read Resource: index.tpl in /.../lib/templater/Smarty.class.php on Line 1095

may occur if **index.tpl** is missing or has incorrect permissions.

To resolve the problem, open the *design/themes/[CUSTOMERY_ACTIVE_THEME]/templates* directory of your CS-Cart installation.

.. hint::

   Always replace **[CUSTOMER_ACTIVE_THEME]** with the name of the folder with the active theme of your storefront, for example, **responsive**.

* If the **index.tpl** file exists in this directory, check the `permissions <../../../install/useful_info/permissions.html>`_ for this file. The file should have the **644** permissions; if it doesn't, change the permissions accordingly.

* If the **index.tpl** file is missing, copy it to this directory from the *var/themes_repository/[CUSTOMER_ACTIVE_THEME]/templates* directory of your CS-Cart installation.

  * If there is no **index.tpl** file in the *var/themes_repository/[CUSTOMER_ACTIVE_THEME]/templates* directory of your CS-Cart installation, it might mean that the distribution package used for this CS-Cart installation was not full. Redownload the same version of CS-Cart and use the file from there.

.. note::

    The file might also be missing because the archive got corrupted when it was downloaded from CS-Cart website or uploaded to your server.
