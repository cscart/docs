**************************************
E-mails Are Not Sent to Gmail Accounts
**************************************

To use SMTP server for sending letters to Gmail accounts, follow the steps below:

1. In the administration panel, go to **Settings → E-mails**.

2. Select the **via SMTP server** variant in the **Method of sending e-mails** select box.

3. Complete the fields in the **SMTP server settings** section. Please note that you should enter the SMTP host name with port, e.g. **smtp.gmail.com:465**.

4. In the **Use Encrypted Connection** select box choose **SSL**.

5. Tick the **Use SMTP authentication** checkbox.

6. Click the **Save** button.

If the e-mails are not sent after applying the previous changes, check whether PHP is configured with ssl socket transport support.

7. Create the **mail.php** file in the root directory of the CS-Cart installation with the following content:

::

  <?php
  error_reporting(E_ALL ^ E_NOTICE);
  ini_set("display_errors", "on");

  $host = 'smtp.gmail.com';
  $port = '465';
  $tval ='30';

  $test = fsockopen('ssl://' . $host, $port, $errno, $errstr, $tval); 
  if ($test == true){
  print("OK");}
  else
  {
  print $test;
  }
  ?>

This code attemts to connect to the Gmail SMTP server.

8. Open this file using the link like *http://www.you_domain.com/mail.php*
where **www.you_domain.com** is the store address.

9. If you see a blank page with the **OK** text, then PHP is configured with ssl socket transport support. 

If PHP is configured without  ssl socket transport support, you will see the error like this:

::

  Warning: fsockopen() [function.fsockopen]: unable to connect to ssl://smtp.gmail.com:465 (Unable to find the socket transport "ssl" - did you forget to enable it when you configured PHP?)

In that case contact your server administrator and ask them to enable ssl socket transport support on your server.

