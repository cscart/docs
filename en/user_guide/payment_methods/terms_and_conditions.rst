**************************************************************
How To: Add Pop-Up Window for Terms and Conditions on Checkout
**************************************************************

To add the "Terms and Conditions" link to the Checkout page, follow these steps:

1. In the root directory of your CS-Cart installation, create the following directories path:
*design/themes/[CUSTOMER_ACTIVE_THEME]/templates/addons/my_changes/hooks/checkout*. **[CUSTOMER_ACTIVE_THEME]** is the name of the folder with the active theme of your storefront, for example, **responsive**.

.. note ::

	Make sure that the **My changes** add-on is installed and activated in the **Add-ons → Manage add-ons** section of the Administration panel.

2. In the *design/themes/<Your_Active_Theme>/templates/addons/my_changes/hooks/checkout* directory, create the **terms_and_conditions.override.tpl** file with the following content:

::

  <div class="cm-field-container">
      <label for="id_accept_terms{$suffix}" class="cm-check-agreement"><input type="checkbox" id="id_accept_terms{$suffix}" name="accept_terms" value="Y" class="cm-agreement checkbox" {if $iframe_mode}onclick="fn_check_agreements('{$suffix}');"{/if} />{__("terms_and_conditions_you_accept")}</label>

      <a data-ca-target-id="term_dialog" class="cm-dialog-opener">{__("terms_and_conditions")}</a>
  </div>

  <div id="term_dialog" class="hidden">
      <p>TEXT</p>
  </div>

3. Replace **TEXT** with your text for the **Terms and conditions** page.

4. Save the file.

5. Open the administration panel of your store and go to **Administration → Languages → Translations**.

6. In the top right corner of the page, click the **+** button.

7. Enter *terms_and_conditions_you_accept* into the **Language Variable** field.

8. Enter *By checking this check box, you accept the* the into the **Value** field.

9. Clone this item.

10. Change the second language variable name to **terms_and_conditions**.

11. Change the second language variable value to *Terms and Conditions*.

12. Click the **Create** button.

.. important:: 

    To display the *By checking this checkbox, you accept the Terms and Conditions* checkbox on the **Checkout** page, you must tick the **Ask customers to agree with terms & conditions during checkout** option in the administration panel under **Settings → Checkout** and click **Save**.
