********************************************
How To: Set the Right-to-left Text Direction
********************************************

1. Open the **index.tpl** file located in the *design/themes/[CUSTOMER_ACTIVE_THEME]/templates* directory of your CS-Cart installation, where [CUSTOMER_ACTIVE_THEME] is an active theme of your storefront.
2. Find the following lines in the code:

.. code-block :: none

    <!DOCTYPE html>
    <html lang="{$smarty.const.CART_LANGUAGE}">

3. Add the following code after them:

.. code-block :: none

    {if $smarty.const.CART_LANGUAGE == "[YOUR_LANGUAGE_CODE]"}
    <html dir="rtl" lang="{$smarty.const.CART_LANGUAGE}">
    {else}
    <html lang="{$smarty.const.CART_LANGUAGE}">
    {/if}

4. Replace [YOUR_LANGUAGE_CODE] with the language code for which the right-to-left text direction should be active.

5. Save the file.

.. important ::

	The right-to-left text direction will not be active on all the pages and not for all text content, it will work only for the base text content and only in case a customer selects the language in the storefront, which is written in the **index.tpl** file.

	In order to make the full right-to-left language direction support on your site, some additional code modifications will be required. You can find more info `here <http://codex.wordpress.org/Right_to_Left_Language_Support>`_ or order our Custom Development service.
