********************************
Two-Factor Authentication by Duo 
********************************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000142" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    Keep your accounts safe with two-factor authentication by `Duo <https://duo.com/>`_.

    Our `Two-Factor Authentication by Duo <https://www.simtechdev.com/addons/site-management/two-factor-authentication-by-duo.html>`_ add-on integrates the service with your CS-Cart store to protect your users against credential theft attacks.

==================================
What is two-factor authentication?
==================================

    Two-factor authentication (2FA) strengthens access security by requiring two methods to verify your identity: by something you know (like a username and password) and something you have (like a smartphone or smartwatch).

    It is the most effective way to protect your store against remote attacks such as phishing, credential exploitation and other attempts to take over your account. 

    .. raw:: html

        <iframe width="560" height="315" src="https://www.youtube.com/embed/0mvCeNsTa1g" frameborder="0" allowfullscreen></iframe>

============
How it works
============

    Sign in to the store like you normally do by entering your username and password.

    .. fancybox:: img/DUO_Auth_012.png
        :alt: sign in with 2-Step Verification
        :width: 300px

    Then you'll be suggested to select one of the methods for the second step of authentication. 

    Let's select **Push notification**.

    .. fancybox:: img/DUO_Auth_013.png
        :alt: authentication codes
        :width: 560px

    Slide to view the push notification.

    .. fancybox:: img/DUO_Auth_015.png
        :alt: authentication codes
        :width: 300px

    Click **Approve**.

    .. fancybox:: img/DUO_Auth_016.png
        :alt: sign in with 2-Step Verification
        :width: 300px

    Your login request has been approved.

    .. fancybox:: img/DUO_Auth_017.png
        :alt: sign in with 2-Step Verification
        :width: 300px

    Authorization is successful.

    .. fancybox:: img/DUO_Auth_014.png
        :alt: sign in with 2-Step Verification

    You may want to watch a video explaining how the two-factor authentication protects your account.

    .. raw:: html

        <iframe width="560" height="315" src="https://www.youtube.com/embed/QLQHHScn0yA" frameborder="0" allowfullscreen></iframe>

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.3 and above, but only versions 4.11.x, 4.12.x and 4.13.x are supported.

    Don't know what archive to download to install the add-on? `Read here <https://www.simtechdev.com/docs/faq/index.html#what-archive-do-i-download>`_.

    .. attention::

        The PHP version should be at least 5.4.0.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <http://www.simtechdev.com/helpdesk>`_.

------------------------
Getting started with Duo
------------------------

=======================
Creating an application
=======================

    1. Sign up for a `Duo account <https://signup.duo.com/>`_.

    2. Log in to the `Duo Admin Panel <https://admin.duosecurity.com/login>`_ and navigate to **Applications**.

    3. Click **Protect an Application** and locate Auth API in the applications list. 

    4. Here's the created application:

    .. fancybox:: img/DUO_Auth_009.png
        :alt: Two-factor authentication add-on

=====================================================
Getting integration key, secret key, and API hostname
=====================================================

   Click on the application name to get your integration key, secret key, and API hostname. 

   You'll need these details to set up the add-on in the admin panel.

    .. fancybox:: img/DUO_Auth_010.png
        :alt: Two-factor authentication add-on

==========================
Downloading Duo Mobile app
==========================

    You will need to download an authentication app to start using Duo Authorization.

    Duo Mobile works with Apple iOS, Google Android, BlackBerry, Palm, Windows Phone 7, Windows Mobile 8.1 and 10, and J2ME/Symbian. 

    Download `Duo Mobile for iPhone <https://itunes.apple.com/us/app/duo-mobile/id422663827?mt=8>`_ from iTunes  or `Duo Mobile for Android <https://play.google.com/store/apps/details?id=com.duosecurity.duomobile&hl=en>`_ from Google Play.

    For more details, read `here <https://duo.com/product/trusted-users/two-factor-authentication/duo-mobile>`_.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the “Two-Factor Authentication by Duo” add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & Install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/DUO_Auth_001.png
        :alt: Two-factor authentication add-on

=====================
Setting up the add-on
=====================

    In the settings of the “Two-Factor Authentication by Duo” add-on, enter the details of your Duo account (see the `Getting integration key, secret key, and API hostname`_ section):

    .. fancybox:: img/DUO_Auth_002.png
        :alt: settings of the Two-factor authentication add-on

    After that enable two-factor authentication under **Settings - Security settings**:

    .. fancybox:: img/DUO_Auth_003.png
        :alt: enabling two-factor authentication

========================
Setting up authenticator
========================

    To set up authenticator for the administrator:

    1. Select the necessary admin under **Customers > Administrators**.

    2. Open its detailed page and switch to the **Two-factor authentication** tab. Click **Enroll**.

    .. fancybox:: img/DUO_Auth_004.png
        :alt: enabling two-factor authentication

    3. You will be taken to the Duo website to set up your account. Click **Start setup** and complete all the steps.

    .. fancybox:: img/DUO_Auth_005.png
        :alt: enabling two-factor authentication

    At the end of the setup process, you should get this notice:

    .. fancybox:: img/DUO_Auth_006.png
        :alt: enabling two-factor authentication
        :width: 653px

    4. Go back to the admin profile and click **check status**.

    .. fancybox:: img/DUO_Auth_007.png
        :alt: enabling two-factor authentication
        :width: 440px

    5. Test your integration by using one of the following methods: code from Duo mobile, push notification, or phone call.

    .. fancybox:: img/DUO_Auth_008.png
        :alt: enabling two-factor authentication

    6. Сlick **Save the changes**.

    .. tip ::

        You can disable Duo authentication for a particular admin by clicking the corresponding button:

            .. fancybox:: img/DUO_Auth_011.png
                :alt: enabling two-factor authentication