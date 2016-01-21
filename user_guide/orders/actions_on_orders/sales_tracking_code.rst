*********************************
How To: Add a Sales Tracking Code
*********************************

To add a tracking code to the Order landing page:

*   Create the following directories path in the root directory of your CS-Cart installation:
    *design/themes/[CUSTOMER_ACTIVE_THEME]/templates/addons/my_changes/hooks/checkout*, where *[CUSTOMER_ACTIVE_THEME]* is an active theme of your storefront.
*   Create the **order_confirmation.override.tpl** file in the *design/themes/[CUSTOMER_ACTIVE_THEME]/templates/addons/my_changes/hooks/checkout* directory with the necessary content.
*   Save the file.
*   Clean up the template cache. To get the instruction refer to `this article <http://docs.cs-cart.com/4.3.x/user_guide/look_and_feel/templates/changes_not_displayed.html>`_.
