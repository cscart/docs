******************************************************
Administrator Does Not Get Order Notifications E-mails
******************************************************

*   Check whether the **Notify orders department** check box is enabled for the desired order status on the `Order statuses <http://docs.cs-cart.com/4.3.x/user_guide/orders/order_statuses/set_status.html>`_ page. It should be enabled in order to send the notifications to the store administrator.
*   Check whether the administrator e-mail is set up:

    *   In the Administration panel, go to **Settings → Company**.
    *   Make sure that the administrator e-mail address is entered in the **Order department e-mail address** field on the opened page.
*   Click on the **E-mails** link on the left and check what method of sending e-mails you use.

If **PHP mail** is selected in the **Method of sending e-mails** select box, check whether standard PHP mail function works properly on your site:

*   Create a **mail.php** file in the root directory of your CS-Cart installation.
*   Enter the following content there:

.. code-block :: none

    <?php

    $to      = 'order@domain.com';
    $subject = 'the subject';
    $message = 'hello';
    $headers = 'From: your_email@domain.com' . "\r\n" .
     'X-Mailer: PHP/' . phpversion();

    $result = mail($to, $subject, $message, $headers);
    print $result;

    ?>

where *order@domain.com* is the e-mail entered in the **Order department e-mail address** field. And *your_email@domain.com* is the value of the **From** field in the test email. We recommend that it should be the e-mail of the **Order department** too as CS-Cart inserts it in the **From** fields while sending order notifications. Moreover, many hosting companies reject emails if the value of the **From** field is from some other domain or invalid.

*   Save the file.
*   Launch this script by opening the following link: *http://www.your_domain.com/your_cscart_directory/mail.php*, where replace *your_domain.com* with the name of your domain, *your_cscart_directory* with the name of the directory where CS-Cart is installed on your server as seen from the Web, e.g *shop* (if applicable). This test script sends an e-mail from the *order@domain.com* e-mail address to *your_email@domain.com*.

    *   If you see **1** as a result of launching the script that means that the e-mail was sent properly and standard PHP function works correctly on your server. If the recipient entered in the script did not get the sent e-mail, there may be a few reasons for it. Probably there are some mail server settings that block the letter from receiving.

    Here are some of these reasons:

	    *   Recipient's address is incorrect.
	    *   Recipient's mailbox is full.
	    *   Recipient hasn't entered in the last 3 months.
	    *   Message size exceeds the fixed maximum message size that is defined on a server.
	    *   The letter is rejected as spam so it could be either put into the *Spam* mail section or simply blocked.
	    *   Sender host is in a server black list.

    Please contact your mail server administrator about it.

    *   If you get **0**, it means that the standard PHP function does not work on your server. Contact your server administrator in this case.

If **SMTP server** is selected in the **Method of sending e-mails** select box:

*   Make sure that you entered the correct information under the **SMTP server settings** section.
*   Contact your server administrator about the problem with your SMTP server.