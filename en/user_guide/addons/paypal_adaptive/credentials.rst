****************************************************
How To: Get Credentials for PayPal Adaptive Payments
****************************************************

When you :doc:`create a payment method that uses PayPal Adaptive Payments </user_guide/payment_methods/paypal_adaptive_payments>`, you'll need to get API username, API password, Signature, and Application ID from the PayPal website.

.. note::

    You can also refer to `PayPal Developer documentation <https://developer.paypal.com/docs/classic/lifecycle/goingLive/>`_ to learn more about getting these credentials. Please note that you'll need credentials for an NVP/SOAP API app.

=============================================
Getting API username, API password, Signature
=============================================

#. Sign in to your PayPal Business account on `the PayPal website <https://www.paypal.com/>`_.

#. Open the settings of your profile.

   .. image:: img/paypal_profile_and_settings.png
       :align: center
       :alt: Click the profile icon on the PayPal page.

#. Select the **My selling tools** section on the left. Find **API access** on the list of settings and click the **Update** link to the right of it.

   .. image:: img/paypal_api_access.png
       :align: center
       :alt: Go to "My selling tools" section and update API access settings.

#. A new page will open. While on that page, click **Request API credentials**.

   .. image:: img/request_api_credentials.png
       :align: center
       :alt: Go to "My selling tools" section and update API access settings.

#. Choose **Request API signature** and submit your request.

   .. image:: img/request_api_signature.png
       :align: center
       :alt: Choosing between API signature and certificate.

#. You'll be able to see your API username, API password, and signature by clicking the **Show** links next to them.

   .. image:: img/list_of_credentials.png
       :align: center
       :alt: Viewing your PayPal API credentials.

.. _paypal-adaptive-app:

======================
Getting Application ID
======================

To get application ID, please contact your PayPal manager. The decision whether or not to provide the application ID is up to PayPal.

.. meta::
   :description: Looking how to get credentials to configure PayPal Adaptive Payments in Multi-Vendor software? This instruction will help.
