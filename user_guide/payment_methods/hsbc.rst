********************************
How To: Set up CS-Cart with HSBC
********************************

To set up CS-Cart with HSBC account:

*   In the Administration panel, go to **Administration > Payment methods**.
*   Click the **+** button on the right.
*   In the opened window:

    *   In the **Name** field enter *HSBC*.
    *   In the **Processor** select box select *HSBC*.
    *   If necessary, specify other fields and upload an icon.

*   Open the **Configure** tab in the same window in order to view the HSBC settings section.
*   Fill in the following fields:

    *   **Client ID** — your Client ID, a number between 0 and 999999999, or a valid Client alias of the form *UK12345678CUR*. The alias name is case sensitive.
    *   **CPI Hash Key** — the Hash Key you can get on the HSBC site.
    *   **Currency** — the currency in your HSBC account. If it does not match the base currency in your CS-Cart settings, please contact CS-Cart support team.
    *   **Test/Live mode** — select *Live*. In order to use the *Test* mode you need to get additional account.

*   Click the **Create** button to save the changes.

.. image:: img/hsbc.png
    :align: center
    :alt: HSBC

.. important::

	In order to use HSBC as a payment method on your site, the *exec* standard PHP function must be enabled on your site.

	Attention for UNIX users: Please make sure you have appropriate permissions for the *payments* directory located in the *app* directory of your CS-Cart installation.

	If the *Error in hash generation* message is displayed on the payment site try to upload this :download:`file <files/libstdc++-libc6.2-2.so.3>` to the *app/payments/hsbc_files/lib/lin* directory on the server.

	If the *The transaction failed because of invalid input data* message is displayed on the checkout page try to call HSBC support team and ask them to switch your account to live. Basically you have to configure first in test mode rather than live.