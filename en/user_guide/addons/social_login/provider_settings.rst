**********************************************************************************
How To: Allow Customers to Sign In to Your Store with Accounts from Other Services
**********************************************************************************

Customers can use social networks and other services to sign in to your store. We will refer to all these services as *"social login providers"*. CS-Cart already has a few providers by default, but you'll need to add and configure them on the **Website → Social login** page.

Every added provider has a status: *Active* or *Disabled*. Once a provider is active and configured properly, customers will be able to select it when signing in to their account or registering a new one. If you disable a provider, you preserve its settings, but prevent it from being shown to customers on the storefront.

.. important::

    The **Social login** section will appear under **Website** only if you activate **Social login** under **Add-ons → Manage add-ons**.

==================================
How to Configure Various Providers
==================================

When you select a provider, additional settings will appear. Follow the instructions below to set up a provider.

------
Google
------

.. note::

    Due to `Google+ API shutdown <https://developers.google.com/+/api-shutdown?hl=en>`_, you'll need CS-Cart or Multi-Vendor 4.9.2 SP4 or newer. These versions implement sign-in via Gmail without Google+ API.

#. Create a project in the `Google API Console <https://console.developers.google.com/project>`_.

#. Go to the `Credentials <https://console.developers.google.com/apis/credentials>`_ page and create **OAuth Client ID** for a *Web application*.

   .. important::

       At this step, take the link from the Google provider settings in CS-Cart and put it as the **Authorized redirect URI** for your application on the Google side.

   .. image:: img/social_login_google.png
       :align: center
       :alt: Creating Google API credentials for signing into a CS-Cart store via Gmail.

#. Once you create the credentials, you'll see **Client ID** and **Client secret**. Copy them to the Google provider settings on the CS-Cart end and save your changes. After that, customers should be able to sign in with their Gmail accounts.

--------
Facebook
--------

#. Register at the `Facebook for Developers <https://developers.facebook.com/apps>`_ portal.

#. Go to `My Apps <https://developers.facebook.com/apps/>`_ and add a new app. Use the same name for the app as for your store—customers will see the app name when they try to sign in via Facebook, so the store name will look natural there.

#. Find and add the **Facebook Login** product to your application. You may get an offer to set it up once you create the application, or on the dashboard; or you can just use the **Products** section.

#. Open the settings of the **Facebook Login** product. You'll need to specify the value for the **Valid OAuth Redirect URIs** setting—copy it from the Facebook provider settings in the CS-Cart admin panel, then save your changes on the Facebook end.

#. Go to the basic settings of your Facebook application. Copy the **App ID** and **App Secret** and paste them into the corresponding fields of the Facebook provider in CS-Cart. Save your changes on the CS-Cart end.

   .. important::

       At this point, *your* Facebook account should be able to sign in to the store. But the application is still in development, so your customers won't be able to sign in via Facebook yet.

#. To let customers sign in via Facebook, switch your application to live mode. Facebook may require additional actions before you do that (such as providing a link to your privacy policy).

   .. image:: img/social_login_facebook.png
       :align: center
       :alt: Creating an application to make sign-in via Facebook work in a CS-Cart store.

------
PayPal
------

* **ID**—the App ID given to you after the creating an application at PayPal.

* **Secret key**—the secret key given to you after creating an application at PayPal.

* **Use seamless checkout**—tick this checkbox to allow customers seamlessly checkout with PayPal without the need to log in to PayPal again. `Learn more about seamless checkout <https://developer.paypal.com/docs/integration/direct/identity/seamless-checkout/>`_ at Paypal Developer Portal.

* **Test mode**—tick this checkbox, if you want the PayPal payments functionality work in test mode.

* **Callback URL**—the URL that PayPal will use for the callback in case of successful authorization.

-------
Twitter
-------

* **ID**—the consumer key given to you after creating an application at `Twitter.com <https://dev.twitter.com/apps>`_.

* **Secret key**—the secret key given to you after creating an application at `Twitter.com <https://dev.twitter.com/apps>`_.

* **Callback URL**—the URL that Twitter will use for the callback in case of successful authorization.

`Learn more about Twitter integration <https://hybridauth.github.io/hybridauth/userguide/IDProvider_info_Twitter.html>`_ in HybridAuth User Guide.

-----
Yahoo
-----

* **ID**—the ID given to you after creating an application at `Yahoo.com <https://login.yahoo.com/config/login_verify2?.src=devnet&.done=http%3A%2F%2Fdeveloper.apps.yahoo.com%2Fdashboard%2FcreateKey.html>`_.

* **Secret key**—the secret key given to you after creating an application at `Yahoo.com <https://login.yahoo.com/config/login_verify2?.src=devnet&.done=http%3A%2F%2Fdeveloper.apps.yahoo.com%2Fdashboard%2FcreateKey.html>`_.

`Learn more about Yahoo integration <https://hybridauth.github.io/hybridauth/userguide/IDProvider_info_Yahoo.html>`_ in HybridAuth User Guide.

----
Live
----

* **ID**—the App ID given to you after the creating an application at Live.

* **Secret key**—the secret key given to you after creating an application at Live.

--------
LinkedIn
--------

* **ID**—the consumer key given to you after the creating an application at `LinkedIn.com <https://www.linkedin.com/uas/login?session_redirect=http%3A%2F%2Fwww%2Elinkedin%2Ecom%2FpostLogin%3Fsession_rikey%3Dfpu_41blh0jL5hJkp1eZZ9sPHEr45YEUV4Y9mIsCRy6PInlq-z1MZ80P05D13_1UL8q9F6xC0pCVI-QRVkVsI6WC2zNeWCBXYHa%26l%3Dhttps%253A%252F%252Fwww%252Elinkedin%252Ecom%252Fsecure%252Fdeveloper%26id%3D0%26b%3D959a9590-bca1-4fa1-8e52-6a663be18db3%26h%3DeWBL%26m%3DGET>`_.

* **Secret key**—the secret key given to you after creating an application at `LinkedIn.com <https://www.linkedin.com/uas/login?session_redirect=http%3A%2F%2Fwww%2Elinkedin%2Ecom%2FpostLogin%3Fsession_rikey%3Dfpu_41blh0jL5hJkp1eZZ9sPHEr45YEUV4Y9mIsCRy6PInlq-z1MZ80P05D13_1UL8q9F6xC0pCVI-QRVkVsI6WC2zNeWCBXYHa%26l%3Dhttps%253A%252F%252Fwww%252Elinkedin%252Ecom%252Fsecure%252Fdeveloper%26id%3D0%26b%3D959a9590-bca1-4fa1-8e52-6a663be18db3%26h%3DeWBL%26m%3DGET>`_.

`Learn more about LinkedIn integration <https://hybridauth.github.io/hybridauth/userguide/IDProvider_info_LinkedIn.html>`_ in HybridAuth User Guide.

----------
Foursquare
----------

* **ID**—the App ID given to you after creating an application at Foursquare.

* **Secret key**—the secret key given to you after creating an application at Foursquare.

`Learn more about Foursquare integration <https://hybridauth.github.io/hybridauth/userguide/IDProvider_info_Foursquare.html>`_ in HybridAuth User Guide.
