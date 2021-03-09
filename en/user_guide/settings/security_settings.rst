*****************
Security Settings
*****************

Use this section to adjust the settings related to your store's security:

* **Enable secure connection for the storefront**—if you enable this setting, then the storefront will work through the HTTPS protocol. This requires an SSL certificate to be installed on your server.

* **Enable secure connection in the administration panel**—if you enable this setting, the Administration panel will work through the HTTPS protocol. This requires an SSL certificate to be installed on your server.

.. hint:: Settings applied to all accounts.

    * **Minimum password length**—the minimum number of characters in password.

    * **Password must contain both letters and numbers**—if you enable this setting, the system will require password to contain both letters and numbers. This improves password strength and provides additional protection against guessing the password and brute-force attacks.

    * **Password validity period in days (0 - unlimited)**—the number of days before password expires and the user has to change the password. If you don't want passwords to expire, set the value of this field to *0* (zero).

* **Force administrators to change password on the first login**—if you enable this setting, store administrators will have to change their passwords once they log in to the Administration panel for the first time.

* **Access key to cron script which sends e-mail notifications of password change**—the key to access the cron script that reminds the store administrator to change the password. To activate the script, open the following link in your web browser::

    http://www.example.com/admin.php?dispatch=profiles.password_reminder&cron_password=access_key 

  Replace ``www.example.com`` with your domain, and ``access_key`` with the key you enter in this field.
