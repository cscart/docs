*****************************
How To: Set up UPS in CS-Cart
*****************************

#. In the Administration panel, go to **Settings → Shipping methods**.

#. Find the **UPS 3day Select** shipping method (it exists in CS-Cart by default).

#. Make sure that the **Status** of this method is set to *Active*.

#. Click on the name of this shipping method to open the editing page.

   .. image:: img/ups_01.png
       :align: center
       :alt: Setting up UPS shipping method in CS-Cart and Multi-Vendor.

#. Set **Rate calculation** to *UPS*, and choose *UPS USA: 3 Day Select* as **Shipping service**.

#. Click the **Save** button to save the changes.

#. Switch to the **Configure** tab.

#. Enter your UPS credentials in the **UPS App client ID** and **UPS App client secret**. 

To get them, `register an app in your UPS account <https://developer.ups.com/apps>`_. 
Log in and create an application, subscribe to API products, and obtain your **client ID** and **client secret** to transact with the APIs. Refer to `this guide from UPS to get started <https://developer.ups.com/get-started?loc=en_US>`_. 
For testing purposes, use the following settings:

* **Pickup type**: *Daily pickup*

* **Package type**: *Package*

* **Width**, **Height**, and **Length**: *10*

.. note::
    Only some specific requests for retrieving shipping costs work properly if the *Test* mode option is enabled.

#. Click the **Save** button to save the changes.

   .. image:: img/ups_02.png
       :align: center
       :alt: The settings of a UPS shipping method in CS-Cart and Multi-Vendor.

#. Go to the **Test rate calculation** tab, enter the necessary value into the **Weight (lbs)** input field, and click the **Recalculate rates** button, to make a test calculation of shipping charges.

   .. important::

       Use real recipient and sender addresses for testing (UPS uses address verification system).

       Sender address = company address, that you are able to edit on the **Settings → General → Company** page in your Administration panel.

       Recipient address = customer shipping address. In case of testing shipping charges in the Administration panel the address defined under the **Default location** section on the **Settings → General → Checkout** page is used as a customer address.

#. (optional) Switch to the **Shipping time and rates** tab and define shipping charges which will be added to the ones returned by UPS.

#. Click the **Save** button to save the changes.

   .. important::

       In order to use UPS real-time shipping calculations, there must be `PHP's Curl support <http://php.net/manual/en/book.curl.php>`_ on your server. Check whether there is PHP's CURL support installed on your server.
