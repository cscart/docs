*******************************
How To: Set up FedEx in CS-Cart
*******************************

#. In the Administration panel, go to **Administration → Shipping & taxes → Shipping methods**.

#. Create a shipping method with the **+** button in the upper right part of the page, or choose an existing one by clicking on its name.

#. Set **Rate calculation** to *Realtime*, select *FedEx* as **Carrier**, and choose *FedEx 2nd day* as the **Shipping service**.

   .. image:: img/fedex_01.png
       :align: center
       :alt: Fedex in CS-Cart

#. Switch to the **Configure** tab.

#. Enter your FedEx credentials in the **Authentication key**, **Authentication password**, **Account number**, and **Meter number** fields. For testing purposes, use the following settings:

   * **Package type**: *Your packaging*

   * **Drop Off Type**: *Regular pickup*

   * **Width (inches)**, **Height (inches)**, and **Length (inches)**: *10*

#. Click the **Save** button to save the changes (or **Create**, if you're adding a new shipping method).

   .. image:: img/fedex_02.png
       :align: center
       :alt: The "Configure" tab of a FedEx shipping method in CS-Cart and Multi-Vendor.

   .. note::

       Only some specific requests for retrieving shipping costs work properly if the **Test mode** option is enabled.

#. Return to the **General** tab, click the **Calculate shipping cost** link, enter the desired value into the **Weight (lbs)** input field, and click the **Test** button to make a test calculation of shipping charges.

   .. important::

       Use real recipient and sender addresses for testing (FedEx uses address verification system).

       Sender address = company address, that you are able to edit on the **Settings → Company** page in your Administration panel.

       Recipient address = customer shipping address. In case of testing shipping charges in the Administration panel the address defined under the **Default location** section on the **Settings → General** page is used as a customer address.

#. (optional) Switch to the **Shipping charges** tab and define shipping charges which will be added to the ones returned by FedEx.

#. Click the **Save** button to save the changes.
