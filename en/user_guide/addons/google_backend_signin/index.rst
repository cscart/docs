***************************
Back-End Sign-In via Google
***************************

.. note::

    This add-on first appeared in CS-Cart/Multi-Vendor 4.9.1. It doesn't affect vendors in Multi-Vendor, only marketplace administrators.

The **Back-End Sign-In via Google** add-on changes the way how administrators access the admin panel: instead of entering an email address and a password, they select the Gmail email address associated with their account and are simply redirected to the admin panel (assuming they have signed in to their Google account).

This approach achieves 2 goals:

* **Make the lives of your admins easier:** they will only need to remember one password (from their Google account) and know the URL of the administration panel.

* **Make your store more secure:** Google offers `2-step verification <https://www.google.com/landing/2step/>`_ that makes it much harder to get unauthorized access to the email account and, by extension, to the admin panel of your store.

  .. important::

      Before you :doc:`set up the add-on <settings>`, make sure that all your administrators have Gmail email addresses. An administrator's account will be accessible only if it is associated with a Google email address, and the administrator has access to that address.

  .. image:: img/google_backend_signin_process.png
      :align: center
      :alt: Signing in to the admin panel via Google.

================
Related Articles
================

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    *
