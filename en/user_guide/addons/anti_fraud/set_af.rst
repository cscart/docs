********************************
How To: Set up Anti Fraud Add-on
********************************

*	:doc:`Get the license key <../anti_fraud/maxmid_key>` at `MaxMind <https://www.maxmind.com/en/home>`_.

.. note ::

	CS-Cart is integrated with **minFraud** service that **MaxMind** offers. You are able to read about all features of this service `here <http://www.maxmind.com/app/ccv_overview>`_.

*   In the Administration panel, go to **Add-ons → Manage add-ons**.
*   Switch to the **Browse all available add-ons** tab and find the **Anti fraud** add-on. Click the **Install** button.

.. note ::

    If you have it installed, make sure that its status is *Active* in the **Installed add-ons** tab.

*   Click the **gear** button next to the add-on and choose **Settings**.
*   In the opened window enter your :doc:`Maxmind license key <../anti_fraud/maxmid_key>` and define the desired parameters in the following fields:

    *   **Safe distance (km)** —  Maximum number of kilometers between the billing address that the user provides and the physical location of his/her IP-address. If the detected distance fits into this value, the order will be considered non-fraudulent. According to the service, a large distance increases the risk factor.
    *   **Max order total** — Maximum order subtotal to qualify the order as a safe one. If exceeded, the order subtotal is considered to be too large, and thus suspicious. According to the service, a large order subtotal increases the risk factor.
    *   **Maximum risk factor (1...100)** — Decimal fraction or an integer within 1 to 100 representing the maximum risk factor. The greater the value, the higher the possibility of a fraud. If the risk factor returned by the screening service exceeds the maximum value, the order is placed with the status *Open* even if the transaction has been successfully processed by a payment system. The store administrator is supposed to review such an order, and manually change its status to *Processed* or *Failed*. The recommended maximum risk factor is 25.

.. image:: img/anti_fraud.png
	:align: center
	:alt: Anti Fraud settings