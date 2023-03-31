***********************************
Auth by Google
***********************************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000116" class="btn buy-now__btn">Buy now</a>
    </div>


 
.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    Add an extra layer of protection to your account with 2-Step Verification by Google, also known as Two-Factor Authentication.

    .. fancybox:: img/GoogleAuthenticatorAddon-cover.png
        :alt: Two-Factor Authentication for CS-Cart

    Two-step verification uses both your password and an extra security code to verify your identity whenever you sign in to your account. If someone else tries to access your account, even if they can guess your password, they still won’t be able to get in without using two-step verification.

    .. attention::

        For correct performance of the add-on make sure that the time on your server is correct. Contact your system administrator or our technical support team if you need help.

    Two-step authentication is one of the best ways to prevent unauthorized access to your account. Follow the directions below to know how to do it.

============
How it works
============

    Sign in to the store like you normally do by entering your username and password.

    .. fancybox:: img/Two-factor_auth_006.png
        :alt: sign in with 2-Step Verification
        :width: 300px

    Then you'll be asked to enter a verification code, which you'll get from the Google Authenticator app.

    .. fancybox:: img/m_2nd.png
        :alt: authentication codes
        :width: 300px

    Enter the code into the corresponding field.

    .. fancybox:: img/Two-factor_auth_007.png
        :alt: sign in with 2-Step Verification
        :width: 300px

    Authorization is successful.

    .. fancybox:: img/Two-factor_auth_008.png
        :alt: sign in with 2-Step Verification

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us via email cart-addons@cscart.com now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “Two-factor authentication” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & Install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Two-factor_auth_001.png
        :alt: Two-factor authentication add-on

=====================
Setting up the add-on
=====================

    In the settings of the “Two-factor authentication” add-on, enter a name for the application:

    .. fancybox:: img/Two-factor_auth_002.png
        :alt: settings of the Two-factor authentication add-on

    After that enable two-factor authentication (Settings - Security settings):

    .. fancybox:: img/Two-factor_auth_003.png
        :alt: enabling two-factor authentication

========================
Setting up authenticator
========================

    Follow these steps to set up two-factor authentication for administrators:

    1. Get the Authenticator Application from `Google Play <https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2>`_.
    
    2. Install the app and begin setting up your account.

    .. fancybox:: img/m_start.png
        :alt: setting up authenticator
        :width: 300px

    3. Choose 'Scan a barcode'.

    .. fancybox:: img/m_scan.png
        :alt: setting up authenticator
        :width: 300px

    Scan the bar code from the admin's profile editing page in the **Two-factor authentication** tab by pointing your camera at the QR code on your computer screen.

    .. fancybox:: img/Two-factor_auth_004.png
        :alt: enabling two-factor authentication

    4. Get your authentication code. Choose the code that corresponds to the application name specified in the add-on's settings.

    .. fancybox:: img/m_2nd.png
        :alt: authentication codes
        :width: 300px

    5. Enter the code in the field:

    .. fancybox:: img/Two-factor_auth_005.png
        :alt: enabling two-factor authentication

    6. Click **Save changes**.

    7. The authentication is setup.

    .. fancybox:: img/a_success.png
        :alt: enabling two-factor authentication