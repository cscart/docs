*********************************
How To: Add a Sales Tracking Code
*********************************

To add a tracking code to the Order landing page:

#. Create the following path in the root directory of your CS-Cart installation:
    
   *design/themes/[CUSTOMER_ACTIVE_THEME]/templates/addons/my_changes/hooks/checkout*

   * Replace ``[CUSTOMER_ACTIVE_THEME]`` with the folder name of the theme that is currently active on the storefront.

#. Create the **order_confirmation.override.tpl** file with the necessary content in *design/themes/[CUSTOMER_ACTIVE_THEME]/templates/addons/my_changes/hooks/checkout*.

#. Save the file.

#. In the Administration panel, go to **Add-ons → Manage add-ons** and make sure that the **My changes** add-on is active.

#. Clean up the template cache. To get the instruction, refer to :doc:`this article </user_guide/look_and_feel/templates/changes_not_displayed>`.
