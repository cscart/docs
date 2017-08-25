****************************************************
Administrator Does Not Get Order Notification Emails
****************************************************

If the administrator doesn't receive emails with order notifications, here's what can be done:

==================
Check The Settings
==================

#. Go to **Administration → Order statuses** and make sure that the **Notify orders department** checkbox is ticked for the :doc:`order statuses </user_guide/orders/order_statuses/set_status>` that the administrators should be informed about.

#. Go to **Settings → Company** and make sure that the administrator e-mail address is entered in the **Order department e-mail address** field.

===========================
Check if Emails Can be Sent
===========================

#. Go to **Settings → E-mails**. 

#. Your further actions depend on which **Method of sending e-mails** you have selected.

---------------------
Via PHP mail Function
---------------------

Check whether the standard PHP ``mail`` function works properly on your server:

#. Create a **mail.php** file in the root directory of your CS-Cart installation.

#. Enter the following content there:

   .. code-block :: php

       <?php

       $to      = 'order@domain.com';
       $subject = 'the subject';
       $message = 'hello';
       $headers = 'From: your_email@domain.com' . "\r\n" .
        'X-Mailer: PHP/' . phpversion();

       $result = mail($to, $subject, $message, $headers);
       print $result;

       ?>

   * Replace *order@domain.com* with the e-mail from the **Order department e-mail address** field.

   * The test email will have *your_email@domain.com* as the value of the **From** field. 

     We recommend that you use the email of the order department here as well, as CS-Cart inserts it in the **From** fields while sending order notifications. Moreover, many hosting companies reject emails if the value of the **From** field is from some other domain or invalid.

#. Save the file.

#. Run this script by opening the following link: *http://www.your_domain.com/your_cscart_directory/mail.php*. 

   Replace *your_domain.com* with the name of your domain, and *your_cscart_directory* with the name of the directory where CS-Cart is installed on your server as seen from the Web (if applicable). For example:

   * *http://example.com/mail.php* (if your store is available directly at *http://example.com*)

   * *http://example.com/store/mail.php* (if your store is available at *http://example.com/store*)

   The script will attempt to send an e-mail from the *order@domain.com* to *your_email@domain.com*.

#. Check the results.

   * If you see **1** as a result of running the script, it means that the e-mail was sent properly, and the standard ``mail`` PHP function works correctly on your server. If the email wasn't received, please contact your mail server administrator to determine the cause of the problem and solve it. Here are some possible causes:

     * The recipient's address is incorrect.

     * The recipient's inbox is full.

     * The recipient hasn't checked the inbox in the last 3 months.

     * The message size exceeded the fixed maximum message size that was defined on the server.

     * The email got rejected as spam and was put into the *Spam* mail section or simply blocked.

     * The sender host is in the server's black list.

     

   * If you see **0** as a result of running the script, it means that the standard ``mail`` PHP function does not work on your server. Contact your server administrator in this case.

---------------
Via SMTP Server
---------------

#. Make sure that you entered the correct information in the **Settings → E-mails → SMTP server settings** section.

#. Contact your server administrator about the problem with your SMTP server.
