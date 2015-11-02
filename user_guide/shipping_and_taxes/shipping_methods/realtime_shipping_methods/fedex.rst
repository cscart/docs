*********************************
How To: Set up CS-Cart with FedEx
*********************************

*   In the Administration panel, go to **Administration > Shipping & Taxes > Shipping methods**.
*   Create a shipping method or choose the existent one.
*   Click on the name of a shipping method to modify it.
*   Select *Realtime* in the **Rate calculation** field, select *FedEx* in the **Carrier** field, and *FedEx 2nd day* in the **Shipping service** field.

.. image:: img/fedex_01.png
    :align: center
    :alt: FedEx

*   Open the **Configure** tab.
*   Fill your FedEx credentials in the **Authentication key**, **Authentication password**, **Account number**, and **Meter number** fields. For testing purposes select the *Your packaging* value in **Package type**, the *Regular pickup* value in **Drop Off Type**, and enter *10* in each **Width (inches)**, **Height (inches)**, and **Length (inches)** fields.
*	Click the **Save** button to save the changes.

.. image:: img/fedex_01.png
    :align: center
    :alt: Configure

.. note::

	Only some specific requests for retrieving shipping costs work properly if the **Test mode** option is enabled.

*   Open the **General** tab, click the **Calculate shipping cost** link, enter the desired value into the **Weight (lbs)** input field, and click the **Test** button to make a test calculation of shipping charges.

.. important::

	Use real recipient and sender addresses for testing (FedEx uses address verification system).

	Sender address = company address, that you are able to edit on the **Settings: Company** page in your Administration panel.
	Recipient address = customer shipping address. In case of testing shipping charges in the Administration panel the address defined under the **Default location** section on the **Settings: General** page is used as a customer address.

*   Open the **Shipping charges** tab and define shipping charges which will be added to the ones returned by real-time shipping service if it is needed.
*	Click the **Save** button to save the changes.

