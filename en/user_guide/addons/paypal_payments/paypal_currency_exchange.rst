************************
PayPal Currency Exchange
************************

The PayPal Payments Add-on allows to send PayPal invoices in alternative currencies, not only in a primary one. This may come in handy if:

* the seller's PayPal account operates in a currency that differs from the primary currency of the store;

* there's a PayPal requirement to process payment in a different currency. For example, payments between Russian residents must be processed in rubles.

================================
Setting up the Currency Exchange
================================

The desired currency can be specified on the settings' page of the payment system. There you will see the list of currencies supported by the payments system.

You will be able to choose only currencies that have already been added to the store. To convert money one currency into another you will need to know the exchange rate of the currency against the primary one. 

=================
Adding a Currency
=================

To unlock the desired currency in the PayPal settings, first, you will need to add it to the store (**Administration → Currencies**).

Requirements:

* Specify the **Code**. It must be equal to the three-digit currency code of `the ISO 4217 standard <https://ru.wikipedia.org/wiki/ISO_4217>`_.

* Specify the **Rate** against the primary currency.

==================
Payment Processing
==================

-----------------------------------------------------------
If an order and a payments system have different currencies
-----------------------------------------------------------

The payments system will receive the order total in a currency specified in the payments system settings. The sum conversion will be processed according to the rate specified in the currency settings.

The payments systems that accept not only the total but, the products list, shippings, and taxes will receive the order total only. This is related to the conversion risks that can influence the total sum resulting in the payment rejection due to the input data checking by the payments system.


**Here's the example:**

* Order summary:

  * Product 1: 211 rubles.

  * Product 2: 487 rubles.

* Order total: 698 rubles.

* The payments system works in USD.

* The exchange rate: 1 USD = 63 RUB (0.0158).

**The result:**

* Order summary:

  * Product 1: 3.33 $.

  * Product 2: 7.69 $.

* The total sum of the products: 11.02 $.

* The order total with conversion: 11.03 $.

**As a result we lost 0.01 $.**

So, if the currencies of the order and of the payments system are different, only one sum will be sent—the order total sum. This is done to avoid the conversion problems like the one we stated previously.

--------------------------------------------------------
If an order and a payments system have the same currency
--------------------------------------------------------

In this case the order total sums stay the same.

============
Known Issues
============

* PayPal converts currencies automatically.
   If a customer doesn't have an account with the currency required by an invoice, PayPal will automatically convert the currencies using its own exchange rate to process the payment. This rate might differ from the store rate and as a result the customer will lose 1%-2% of the purchase.

* If store invoices are issued in the currency that isn't specified in the PayPal account, then the Open status will be applied to an order until a seller will confirm the payment on PayPal.
