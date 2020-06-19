*****************************
How To: Get Clickatell API ID
*****************************

For the :doc:`/user_guide/addons/sms_notifications/index` add-on to work, you need the Clickatell API ID. To get it, do the following:

#. Go to the `Clickatell website <https://www.clickatell.com/>`_ and click **Sign Up** to create a new account. Check the link from your email to confirm the registration, then sign in.

#. Click **SMS** on the sidebar and choose **Configure SMS**.

   .. image:: img/configure_sms.png
       :align: center
       :alt: Configuring SMS notifications on Clickatell

#. Set up your test phones. Click the **Add test phones** button. 

#. Enter your test phone number in the opened window and click **Add phone**.

#. Now configure the SMS notifications. Press the **Create New Integration** button.

#. In a new window, on the **Details** tab, enter the name and description of the key. In the **API Type** field set **HTTP**.

   .. image:: img/create_new_integration_details.png
       :align: center
       :alt: Adding a name and description for the key on the Details tab
       
#. On the **Features** tab, in the **Messaging Type** section choose **One-way messaging**. You can choose any option in the **Delivery Type** field.

   .. image:: img/create_new_integration_features.png
       :align: center
       :alt: Choosing a Messaging Type and Delivery Type on the Features tab

#. On the **Settings** tab, turn **Enable message parts** on. This allows you to send messages longer than the normal character limit. Leave the rest of the options turned off.

   .. image:: img/create_new_integration_settings.png
       :align: center
       :alt: Turning on options on the Settings tab

#. You do not need to make any changes on the following tabs. Finish your configuration by pressing the **Finish** button.

#. Now you have the **API key**. Click it to see the details.

   .. image:: img/api_key_copy.png
       :align: center
       :alt: Copying API Key from Clickatell

#. In the new window, copy the **API key**. 

#. Open the settings of the **SMS notifications** add-on and paste the key value into the **API ID** field.

   .. image:: img/api_key_cs_cart.png
       :align: center
       :alt: Entering the API Key in the add-on settings

#. Click **Save**.