******
Emails
******

The settings in this section determine how CS-Cart or Multi-Vendor will send email messages and notifications.

* **Send vendor emails from marketplace email addresses** (this setting exists only in Multi-Vendor, starting with version 4.7.3)—if you tick this checkbox, then email notifications (for example, about order status changes) will be sent from the email address of the marketplace rather than from the email addresses of vendors.

  This setting comes in handy when you use SMTP server for sending emails, and it has a strict configuration that doesn't allow sending messages from vendors' email addresses.

* **Method of sending e-mails**—determines the means through which your store will send e-mails. The three available options are:

  * *Via an external SMTP server*;

  * *Via the PHP mail() function*;

  * *Via Sendmail (a popular email routing facility)*.

  If you want to use an external *SMTP server*, specify connection details. If you want to use *Sendmail*, specify the absolute path to the executable file. If you choose to use the *PHP mail()* function, emails will be sent directly from the script.

  .. note::

      Starting with **CS-Cart 4.6.1**, you can specify different SMTP server settings :doc:`for each storefront </user_guide/stores/index>`: just choose the storefront in the top left corner of the page, enter the settings, and click **Save**.
