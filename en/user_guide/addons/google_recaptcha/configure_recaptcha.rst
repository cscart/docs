*********************************************
How To: Set up Google reCAPTCHA in Your Store
*********************************************

#. Go to **Add-ons → Manage add-ons**.

#. The :doc:`Google reCAPTCHA <index>` add-on is installed by default, you just need to configure it. Find the add-on and click on its name in the list of add-ons.

   .. image:: img/google_recaptcha_addon.png
       :align: center
       :alt: The Google reCAPTCHA add-on in CS-Cart and Multi-Vendor.

#. A pop-up window will open.
     
   The **Google reCAPTCHA** add-on supports two reCAPTCHA versions: *reCAPTCHA v2: Checkbox* and *reCAPTCHA v3*. *reCAPTCHA v3* is available starting with version 4.12.1 of CS-Cart and Multi-Vendor. This reCAPTCHA version is invisible for customers and protects your store by working in the background. You can also use *reCAPTCHA v3* if there is no place for a *reCAPTCHA v2: Checkbox* widget on the page of your store.
   
   You can use both reCAPTCHA versions at the same time in the different places of your store, or you can use just one version—in this case you only have to configure it.
   
   .. note::
     
       Please note, that the *Site key* and *Secret* values for *reCAPTCHA v2: Checkbox* и *reCAPTCHA v3* are different. You have to get them for each reCAPTCHA version induvidually.
   
   * **reCAPTCHA v2 settings:**

     * **Site key**—one of the two required credentials; it is used to display the reCAPTCHA widget in your store.

     * **Secret**—one of the two required credentials; it authorizes communication between your store and the reCAPTCHA server to verify a user's response. For security purposes, Google asks not to tell your secret to anyone else.

       *Notes:*

       * You can get the site key and secret `here <https://www.google.com/recaptcha/admin>`_. You'll need to provide the domain name of your store; for more information, please refer to `this article by Google <https://developers.google.com/recaptcha/docs/domain_validation>`_.

       * If you use multiple storefronts in CS-Cart and want to use Google reCAPTCHA for all of them, then you will only need one site key and secret. Just specify multiple domains when setting up your site key and secret on the Google end.

       * If you :doc:`embed your store into a Facebook page </user_guide/look_and_feel/layouts/widget_mode/facebook_app>`, please specify ``widget.cart-services.com`` as one of the domains. Otherwise reCAPTCHA won't work in your embedded store.

     * **Theme**—the color of the reCAPTCHA widget in your store; you can choose either *Light*, or *Dark*. Please refer to `Google reCAPTCHA FAQ <https://developers.google.com/recaptcha/docs/faq#can-i-customize-the-recaptcha-widget>`_ to see what those two themes look like.

     * **Size**—the size of the reCAPTCHA widget in your store; you can choose between *Normal* and *Compact*. 

     * **Type**—the type of the CAPTCHA that a user must solve when it is necessary to confirm that the user is not a bot; you can choose between *Image* or *Audio*.
     
   * **reCAPTCHA v3 settings:**
   
     * **Site key**—one of the two required credentials.

     * **Secret**—one of the two required credentials; it authorizes communication between your store and the reCAPTCHA server to verify a user's response. For security purposes, Google asks not to tell your secret to anyone else.
             
     * **Required rating to pass the check**—set the value from *0.1* to *0.9*, where *0.1* is the simplest checking, and *0.9* is the highest level of tests. Higher required rating means that Google's checks will be more strict, and it might even consider some humans as bots.
     
   * **Antibot settings**—choose what kind of antibot protection you want to use in your store and where to use it. You can use *reCAPTCHA v2: Checkbox* и *reCAPTCHA v3* at the same time in the different forms.

     * **Do not use verification if user is logged in**—if you tick this checkbox, the customers who are logged in won't have to confirm that they are not bots. 

     * **Do not use verification after first valid answer**—if you tick this checkbox, a customer will have to confirm that he or she is not a bot only once per session. 

#. (optional) On the **Excluded countries** tab choose countries where Google reCAPTACHA will be disabled.

#. Click **Save**.

   .. image:: img/google_recaptcha_settings.png
       :align: center
       :alt: The settings of the Google reCAPTCHA add-on.
