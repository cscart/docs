***************************************************************************
How To: Display Different Payment Information for Different Payment Methods
***************************************************************************

*   Open the *design/themes/[CUSTOMER_ACTIVE_THEME]/templates/views/orders/components/payments* directory of your CS-Cart installation, where *[CUSTOMER_ACTIVE_THEME]* is an active theme of your storefront.
*   Create the **payment1.tpl** file with the following content:

.. code-block :: none

    {__("bank_details_1")}

*   In the Administration panel, go to **Administration → Languages → Translations**.
*   Click the **+** button and add a new language variable (e.g. *bank_details_1*) using the form in the popup window. Enter your banking details into the **Value** field (HTML tags are supported) and click the **Create** button.
*   Go to **Administration → Payment methods** and open the settings of the desired payment method, i.e. *Bank wire transfer1*. Or add a new payment method by clicking the **+** button.
*   Select **payment1.tpl** in the **Template** select box in the opened popup window.
*   Click the **Save** button to save the changes.
*   Repeat points 1 - 7 using another file name (i.e. *payment2.tpl*, *payment3.tpl* etc.) and another name for language variable (i.e. *bank_details_2*, *bank_details_3* etc.) for each payment method you need.
