***************************************************
How To: Get Credentials for Stripe Connect Payments
***************************************************

When you :doc:`create a payment method that uses Stripe Connect Payments </user_guide/payment_methods/stripe_connect>`, you’ll need to get Client ID, Publishable key, and Secret key from the Stripe website. In turn you’ll have to copy the value of the **Redirect URIs** field from Multi-Vendor to the field with the same name on the Stripe dashboard.

.. note::

    You can also refer to `Stripe documentation <https://stripe.com/docs/connect/quickstart>`_ to learn more about getting these credentials.

===========================================
Getting Client ID and Defining Redirect URI
===========================================

#. Log in to your Stripe account or create a new one at `the Stripe website <https://stripe.com/>`_.

   .. image:: img/stripe_create_account.png
       :align: center
       :alt: The Stripe website.

#. Select **Settings** on the sidebar of the Stripe dashboard.

   .. image:: img/stripe_dashboard_connect.png
       :align: center
       :alt: The Stripe dashboard.

#. A new page will open. Go to **Settings** in the **Connect** section.

   .. image:: img/stripe_connect_settings.png
       :align: center
       :alt: The Connect page.

#. On the **Settings** page find the **Integration** section and copy the **Live mode client ID**.

   .. image:: img/stripe_client_id.png
       :align: center
       :alt: Stripe client ID.

#. Paste this ID to the corresponding field of the Stripe Connect payment method settings.

   .. image:: img/stripe_cscart_client_id.png
       :align: center
       :alt: Stripe client ID in Multi-Vendor.

#. Copy both Redirect URIs from the Stripe Connect payment method settings in Multi-Vendor, go back to the Stripe dashboard and insert the URIs into the corresponding field.

   .. image:: img/stripe_сscart_redirect_uri.png
       :align: center
       :alt: Stripe redirect URI.

   .. image:: img/stripe_redirect_uri.png
       :align: center
       :alt: Stripe redirect URI.
      
======================================
Getting Publishable Key and Secret Key
======================================

#. Choose **Settings** and then select **API keys** on the sidebar of the Stripe dashboard.

   .. image:: img/stripe_api.png
       :align: center
       :alt: Stripe API section.

#. On the **API keys** page find the **Publishable key** and **Secret key** fields and copy their values.

   .. image:: img/stripe_keys.png
       :align: center
       :alt: Publishable key and Secret key.

#. Paste these keys into the corresponding fields of the Stripe Connect payment method settings.

   .. image:: img/stripe_cscart_keys.png
       :align: center
       :alt: Publishable key and Secret key in Multi-Vendor.
