***************************
Add-on Management Processes
***************************

This article describes what happens when an add-on is installed, uninstalled, activated or deactivated.

============================
Building the List of Add-ons
============================

The list of add-ons is available in the CS-Cart & Multi-Vendor Administration panel under **Add-ons → Manage add-ons**. This is how this list is built:

1. The preliminary list of add-ons is generated. Every sub-folder of *app/addons* is considered an add-on at this point.

2. An attempt is made to load *app/addons/[addon]/addon.xml* from every folder. 

   The add-on is ignored if **addon.xml** couldn’t be loaded or parsed. XML parsing errors for **addon.xml** will appear in error notification.

3. The names for the remaining add-ons are retrieved. If your **addon.xml** uses :doc:`scheme 3.0 <scheme/scheme3.0_structure>`, the name of the add-on will be taken from *var/langs/[lang_code]/addons/[addon].po*.

4. The data of the installed add-ons retrieved from the database and added to the list. So, if an add-on is already installed, its name and description won’t change.

.. _install-addon-process:

====================
Installing an Add-on
====================

1. The ``?:addons`` table is checked to make sure there is no entry for the add-on.

2. The add-on scheme is loaded from **addon.xml**.

3. If the add-on is marked as ``unmanaged``, it won’t appear on the add-on list in the Administration panel. It can only be the installed can via console.

4. To enable the automatic loading of the add-on’s classes, the folder of the add-on is added to ``Tygh::$app['class_loader']``.

5. :doc:`Compatibility <scheme/addon_compatibility>` is checked.

   .. note::

       If the add-on is incompatible with the server environment or your version of CS-Cart/Multi-Vendor, an error is displayed and the installation is aborted.

6. :doc:`Dependencies <scheme/addon_dependencies>` on other add-ons are checked.

   .. note::

       Conflicting add-ons aren’t checked at this point. They will be checked during add-on activation.

7. The functions from the ``<functions>`` section of **addon.xml** with the ``for="before_install"`` condition are executed.

   .. note::

       If executing a function results in a database error, the add-on installation in aborted, and the add-on is :ref:`uninstalled <uninstall-addon-process>`.

8. An entry is created in ``Registry::set('addons.' . $addon)``. Only the ``disabled`` status and add-on’s priority are recorded there.

9. The queries from the ``<queries>`` section of **addon.xml** with the ``for="install"`` condition are executed.

   .. note::

       If a database error occurs, the add-on installation in aborted, and the add-on is :ref:`uninstalled <uninstall-addon-process>`.

10. The settings of the add-on specified in the ``<settings>`` section of **addon.xml** are created in the database.

    .. note::

        If a database error occurs, the add-on installation in aborted, and the add-on is :ref:`uninstalled <uninstall-addon-process>`.

11. Entries in the ``?:addons`` and ``?:addon_descriptions`` tables are created. The add-on has the *Disabled* status for the time being.

12. The language variables are installed from the PO file.

13. The templates are copied from *var/themes_repository* to *design/themes*.

14. The values of the add-on’s settings are recorded in ``Registry::set('addons.' . $addon)`` and in ``Registry::set('settings.' . $addon, $settings)``.

15. The values of the language variables for the English language are saved to the ``?:original_values`` table.

16. The product tabs are installed from *[theme]/templates/addons/[addon]/blocks/product_tabs*.

17. The functions from the ``<functions>`` section of **addon.xml** with the ``for="install"`` condition are executed.

    .. note::

        If a database error occurs, the add-on installation in aborted, and the add-on is :ref:`uninstalled <uninstall-addon-process>`.

18. If the **addon.xml** has the add-on status as *Active*, the add-on is :ref:`activated <activate-addon-process>`.

    .. note::

        Even if the add-on activation is aborted, the installation will continue. However, the addon will remain disabled by default in that case.

19. Layout is imported: *app/addons/[addon]/layouts.xml*.

20. The cache is cleared.

21. The demo data is installed. This happens only if the add-on is installed along with CS-Cart/Multi-Vendor, and the **Install demo data** checkbox was ticked.

    .. note::

        If a database error occurs at this step, the add-on installation in aborted, and the add-on is :ref:`uninstalled <uninstall-addon-process>`.

.. _uninstall-addon-process:

======================
Uninstalling an Add-on
======================

1. If the add-on is marked as ``unmanaged``, it won’t appear on the add-on list in the Administration panel. It can only be the uninstalled can via console.

2. A check is performed to find add-ons that depend on this add-on. If such add-ons are found, the uninstalling procedure will be aborted, and a message will appear:

   .. important::

       **Warning:** The add-on cannot be uninstalled because the following add-ons depend on it: [addons].

3. The functions from the ``<functions>`` section of **addon.xml** with the ``for="uninstall"`` condition are executed.

4. The entries are removed from the ``?:addons`` and ``?:addon_descriptions`` tables.

5. The add-on’s settings are removed.

6. The add-on’s language variables are removed.

7. The queries from the ``<queries>`` section of **addon.xml** with the ``for="uninstall"`` condition are executed.

8. The add-on’s product tabs are removed.

9. The add-on’s templates are removed from *design/themes*.

10. The add-on’s layouts are reverted.

11. The ``Registry::get('addons.' . $addon_name)`` is cleared.

12. The add-on’s hooks are removed from the registered hook list ``Registry::get('hooks')``.

13. The cache is cleared.

.. _activate-addon-process:

====================
Activating an Add-on
====================

1. The scheme of the add-on is loaded from **addon.xml**.

2. If the add-on is marked as ``unmanaged``, it won’t appear on the add-on list in the Administration panel. It can only be the activated can via console.

3. The following hook is executed::

     fn_set_hook('update_addon_status_pre', $addon, $status, $show_notification, $on_install, $allow_unmanaged, $old_status, $scheme);

4. All the active add-ons are checked to find out if the add-on is marked as a conflict for any of them.

   .. note::

       If a conflicting add-on is found, a warning will appear and the activation will be aborted.

5. A check is performed to find out if the following function exists:

   .. code-block:: php

       fn_settings_actions_addons_[addon]()

   If the function exists, it is summoned with the following arguments: ``($new_status, $old_status, $on_install)``.

6. All the add-ons marked as conflicts for this add-on are checked to find out if they are disabled.

   .. note::

       If any conflicting add-on is active, a warning will appear and the activation will be aborted.

7. The value of the **status** field in the ``?:addons`` table is changed to **A** for this add-on.
 
8. A check is performed to find out if the following function exists:

   .. code-block:: php

       fn_settings_actions_addons_post_[addon]()

   If the function exists, it is summoned with the following arguments: ``($new_status)``.

9. The statuses of the product tabs are updated: the ``product_tabs`` of the add-on are enabled.

10. The **A** status is recorded to ``Registry::set('addons.[addon].status')``.

.. _deactivate-addon-process:

======================
Deactivating an Add-on
======================

1. The scheme of the add-on is loaded from **addon.xml**.

2. If the add-on is marked as ``unmanaged``, it won’t appear on the add-on list in the Administration panel. It can only be the deactivated can via console.

3. The following hook is executed::

     fn_set_hook('update_addon_status_pre', $addon, $status, $show_notification, $on_install, $allow_unmanaged, $old_status, $scheme);

4. A check is performed to find out if the following function exists:

   .. code-block:: php

       fn_settings_actions_addons_[addon]()

   If the function exists, it is summoned with the following arguments: ``($new_status, $old_status, $on_install)``.

5. The value of the **status** field in the ``?:addons`` table is changed to **D** for this add-on.

6. A check is performed to find out if the following function exists:

   .. code-block:: php

       fn_settings_actions_addons_post_[addon]()

   If the function exists, it is summoned with the following arguments: ``($new_status)``.

7. The statuses of the product tabs are updated: the ``product_tabs`` of the add-on are disabled.

8. The **D** status is recorded to ``Registry::set('addons.[addon].status')``.
