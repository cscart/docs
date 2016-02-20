******************************************
How To: Set up CS-Cart with SagePay Direct
******************************************

*   In the Administration panel, go to **Administration → Payment methods**.
*   Click the **+** button on the right.
*   In the opened window:

    *   In the **Name** field type *SagePay Direct*.
    *   In the **Processor** select box select *SagePay Direct*.
    *   If necessary, specify other fields and upload an icon.

*   Open the **Configure** tab in the same window to view the SagePay Direct settings.

.. image:: img/sagepay.png
    :align: center
    :alt: SagePay

*   Fill in the following fields:

    *   **Store name** — enter the store name.
    *   **Order prefix** — any prefix you want invoice IDs to have on SagePay site (optional field) (for instance, *mycart*). Using the prefix allows to prevent duplicate invoice IDs in case you use the same SagePay Direct account for accepting payment from several websites.
    *   **Transaction type** — select the AUTHENTICATE option.
    *   **Currency** — the currency in your SagePay Direct account. If it does not match the base currency in your CS-Cart settings, please contact CS-Cart support team.
    *   **Test/Live mode** — set it to *Test* while testing the credit card processing through this payment gateway.

*   Click the **Create** button to save the changes.