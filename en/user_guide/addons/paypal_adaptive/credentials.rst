****************************************************
How To: Get Credentials for PayPal Adaptive Payments
****************************************************

When you :doc:`create a payment method that uses PayPal Adaptive Payments </user_guide/payment_methods/paypal_adaptive_payments>`, you'll need to get API username, API password, Signature, and Application ID from the PayPal website.

.. note::

    You can also refer to `PayPal Developer documentation <https://developer.paypal.com/docs/classic/lifecycle/goingLive/>`_ to learn more about getting these credentials. Please note that you'll need credentials for an NVP/SOAP API app.

=============================================
Getting API username, API password, Signature
=============================================

#. Log in to your PayPal Business account on `the PayPal website <https://www.paypal.com/>`_.

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

.. important::

    PayPal announced that `PayPal-Apps.com will be permanently unavailable starting December 1, 2017 <https://www.paypal-community.com/t5/Adaptive-Payments-Accounts/PayPal-Apps-com-will-be-permanently-unavailable-starting/m-p/1357320>`_. The description below will be out of date. Until an alternative PayPal solution for marketplaces is implemented in Multi-Vendor, please contact our technical support `via Help Desk <https://helpdesk.cs-cart.com>`_ to start using PayPal Adaptive Payments.

#. Log in to the `PayPal Developer website <https://developer.paypal.com/>`_ using the credentials of the PayPal account registered to the application owner.

#. Go to the `My Applications <https://developer.paypal.com/developer/applications/>`_ page.

#. Go to the **NVP/SOAP API apps** section and click **Manage NVP/SOAP API apps**.

   .. image:: img/paypal_manage_apps.png
       :align: center
       :alt: Managing your PayPal NVP/SOAP API apps.

#. A new page will open. Click the **New application** button there.

   .. image:: img/paypal_application.png
       :align: center
       :alt: Applying for an Application ID.

#. The application form will appear. Start filling it in.

#. When you reach the **Services used by app** step:

   * Tick the **Basic Payments** checkbox and all its checkboxes, except for **Implicit Send Money** and **Refunds or Chargebacks**.

     .. image:: img/paypal_basic_payments.png
          :align: center
          :alt: Selecting which functionality of Basic Payments your store will use.

   * Tick the **Chained Payments** checkbox and select **Instant** payments to secondary receivers. When answering who pays the fees, select either **Each receiver** or **Primary receiver**; the add-on doesn't support the **Secondary receiver** variant.

     .. image:: img/paypal_chained_payments.png
          :align: center
          :alt: Selecting how Chained Payments will be handled.

#. Fill in the remaining fields in the form and click **Submit app**.
