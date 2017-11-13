*********************************************
How To: Set up Google reCAPTCHA in Your Store
*********************************************

#. Go to **Add-ons → Manage add-ons**.

#. The :doc:`Google reCAPTCHA <index>` add-on is installed by default, you just need to configure it. Find the add-on and click on its name in the list of add-ons.

   .. image:: img/google_recaptcha_addon.png
       :align: center
       :alt: The Google reCAPTCHA add-on in CS-Cart and Multi-Vendor.

#. A pop-up window will open. Specify the add-on's settings there:

   * **Site key**—one of the two required credentials; it is used to display the reCAPTCHA widget in your store.

   * **Secret**—one of the two required credentials; it authorizes communication between your store and the reCAPTCHA server to verify a user's response. For security purposes, Google asks to keep the **secret** safe.

   .. note::

       To get **site key** and **secret**, go to `https://www.google.com/recaptcha/admin <https://www.google.com/recaptcha/admin>`_. You'll need to provide the domain name of your store; for more information, please refer to `this article by Google <https://developers.google.com/recaptcha/docs/domain_validation>`_.

   .. important::

       If you :doc:`embed your store into a Facebook page </user_guide/look_and_feel/layouts/widget_mode/facebook_app>`, please specify ``widget.cart-services.com`` as one of the domains. Otherwise reCAPTCHA won't work in your embedded store.

   * **Theme**—the color of the reCAPTCHA widget in your store; you can choose either *Light*, or *Dark*. Please refer to `Google reCAPTCHA FAQ <https://developers.google.com/recaptcha/docs/faq#can-i-customize-the-recaptcha-widget>`_ to see what those two themes look like.

   * **Size**—the size of the reCAPTCHA widget in your store; you can choose between *Normal* and *Compact*. 

   * **Type**—the type of the CAPTCHA that a user must solve when it is necessary to confirm that the user is not a bot; you can choose between *Image* or *Audio*.

   * **Use for**—the places where CAPTCHA will appear; tick a checkbox corresponding to a place to make CAPTCHA appear there.

   * **Do not use verification if user is logged in**—if you tick this checkbox, the customers who are logged in won't have to confirm that they are not bots. 

   * **Do not use verification after first valid answer**—if you tick this checkbox, a customer will have to confirm that he or she is not a bot only once per session. 

#. Click **Save**. Now CAPTCHA tests should behave according to the settings and appear in the places you specified.

   .. image:: img/google_recaptcha_settings.png
       :align: center
       :alt: The settings of the Google reCAPTCHA add-on.
