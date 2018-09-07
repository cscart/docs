*********************************************
How To: Configure Back-End Sign-In via Google
*********************************************

.. note::

    This functionality first appeared in CS-Cart/Multi-Vendor 4.9.1. It doesn't affect vendors in Multi-Vendor, only marketplace administrators.

If you want your administrators to sign in to the admin panel via their Google accounts and without any passwords, you'll need to configure a project at Google Cloud and link it to your store via an add-on. The article describes how to do it.

=========================
Step 1. Set Up the Add-on
=========================

#. Go to **Add-ons → Manage add-ons** in the administration panel of your store.

#. Switch to the **Browse all available add-ons** tab.

#. Install the **Back-End Sign-In via Google** add-on.

#. Click the name of the newly-installed add-on to open its settings. You'll need to do 2 things there:

   * Take the authorized redirect URI from the add-on settings and put it into your Google Cloud project.

   * Fill in 2 fields in the add-on settings with the data from your Google Cloud project (we'll describe how to do it in Step 2):

     * Client ID

     * Client secret

   .. image:: img/google_backend_signin_addon.png
       :align: center
       :alt: The settings of the Google Back-End Sign-In add-on.

=====================================
Step 2. Create a Google Cloud Project
=====================================

#. Go to the `cloud resource manager <https://console.cloud.google.com/cloud-resource-manager>`_ at Google Cloud Platform.

#. Click **CREATE PROJECT**.

   .. image:: img/google_cloud_create_project.png
       :align: center
       :alt: Creating a Google Cloud project.

#. Enter the project name (for example, you can name it after your company) and create the project.

#. Go to the `page for creating credentials <https://console.cloud.google.com/apis/credentials>`_. Make sure that the name of the newly-created project is selected in the upper left part of the page.

#. Click **Create credentials** and choose *OAuth client ID*.

#. Provide the necessary information:

   * **Application type**—choose *Web Application*.

   * **Name**—use the default one or enter any other name.

   * **Authorized redirect URIs**—enter the value from the **Back-End Sign-In via Google** add-on in CS-Cart.

   .. image:: img/google_cloud_oauth.png
       :align: center
       :alt: Creating a Google Cloud project.

   Once you create the credentials, you should be able to see the *Client ID* and *Client secret* of the project. But there's one more thing to configure on the Google side.

#. Return to the `Google Cloud Platform Dashboard <https://console.cloud.google.com/apis/dashboard>`_.

#. Go to **ENABLE APIS AND SERVICES**, find the **Social** section, click **Google+ API**, and choose **Enable**.

   .. image:: img/google_cloud_dashboard.png
       :align: center
       :alt: Creating a Google Cloud project.

#. Return to the `page for creating credentials <https://console.cloud.google.com/apis/credentials>`_ again and select the credentials you created. Copy *Client ID* and *Client secret* and paste them into the settings of the **Back-End Sign-In via Google** add-on in the administration panel of your store.

#. Click **Save and test sign-in**. If everything is configured properly, you'll see the window for choosing your email address.

   .. warning::

       Once you configure the add-on, only administrators with Gmail email addresses will be able to sign in to the Administration panel. If your administrators have non-Google email addresses, they won't be able to sign in.
