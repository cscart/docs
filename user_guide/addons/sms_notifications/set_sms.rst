*******************************************
How To: Set up the SMS Notifications Add-on
*******************************************

*	In the Administration panel, go to **Add-ons → Manage add-ons**.
*	Enable the **SMS notifications** add-on (change its status to *Active*). If you do not see this add-on in the **Installed add-ons** tab, switch to the **Browse all available add-ons** tab and click the **Install** button near the **SMS notifications** add-on.
*	Click on the name of the add-on.

*	Fill in the following fields:

	*   **Phone number** — phone number to which all sms notifications will be sent.
	*   Clickatell settings:

	    *   **Username** — Username registered for the Clickatell account.
	    *   **API ID** — Unique API ID assigned during registration.
	    *   **Password** — Password to access your Clickatell account.
	    *   **Use Unicode** — Select to send SMS in the Unicode format.
	    *   **Split long sms into several parts** — Select whether to split long SMS into shorter parts to avoid possible loss of informations.

*	Configure the options in the **Send SMS if** and **SMS content** sections:

	*	Send SMS if:

		*	**New order has been placed** – Select to receive notifications about new orders.
		*	**New customer has been registered** – Select to receive notifications about newly registered customers.
		*	**Product quantity is less than zero** – Select to receive notifications about out-of-stock products.
		*	**Only send when order total amount is more than** – Minimum order subtotal to notify of.
		*	**Only send for these shipping methods** – Select shipping methods that must be used in an order so that you receive a notification.

	*	SMS content

		*	**Add payment info** – If selected, payment details are included in the notifications.
		*	**Add customers e-mail** – If selected, customers' email addresses are included in the notification.

*	Click the **Save** button.


.. note ::

	If you do not receive SMS notifications, please refer to :doc:`this article <../sms_notifications/sms_not_sent>`.