********************************************
How To: Export Your Subscribers to MailChimp
********************************************

The **Email marketing** add-on allows to export subscribers from the CS-Cart store to your account on `MailChimp <http://mailchimp.com/>`_.

To start export:

*   First of all you should log-in into your **MailChimp** `administration panel <https://login.mailchimp.com/>`_. If you have no account on MailChimp, `create it <https://login.mailchimp.com/signup?>`_.
*   If you have no lists on MailChimp yet, go to the **Lists** section and create one.

.. image:: img/mailchimp_01.png
	:align: center
	:alt: MailChimp admin panel

*   To connect your store to MailChimp, generate an **API Key** as discribed `here <http://kb.mailchimp.com/article/where-can-i-find-my-api-key/>`_.
*   After that, log in to your **CS-Cart** administration panel and go to **Add-ons > Manage Add-ons**.
*   Activate the **Email marketing** add-on and open its settings.
*   In the **General** tab choose **MailChimp** in the **Integration provider** field and choose other prefernces:

    *   **Newsletter checkbox on checkout** - Allow users to subscribe for newsletters on checkout.
    *   **Double opt-in** - If enabled, when subscribing a user will receive a letter suggesting to confirm subscription.
    *   **Send a welcome letter with the unsubscribe link** - The user will receive a letter to the specified email that will contain the unsubscribe link. Using this link he/she will be be able to refuse receiving newsletters.

*   Open the **MailChimp** tab, enter your **API Key** and click **Save**.
*   Choose the desired list from MailChimp in the **List** section.

.. image:: img/mailchimp_02.png
	:align: center
	:alt: Email marketing add-on

*   Save your changes.

Now all the subscribers in CS-Cart will be synchronized with your account on MailChimp. All new subscribers will be authomatically added to the selected list in the MailChimp administration panel.