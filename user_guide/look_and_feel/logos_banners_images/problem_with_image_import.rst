********************************
Images Are Not Imported from URL
********************************

The problem may be caused by the disabled URL file-access in your server configuration.

To check if URL file-access is enabled, do the following:

1. Create a test file called **test.php** with the following content in the CS-Cart root directory:

::

  <?php
  error_reporting(E_ALL);
  ini_set("display_errors", "on");
  $test = file_get_contents("http://www.your_domain.com/your_cscart_directory/store_closed.gif");
  echo $test;
  ?>

.. note::
 
    Replace **www.your_domain.com** with the name of your domain, **your_cscart_directory** with the name of the directory where CS-Cart is installed on your server; otherwise remove **your_cscart_directroy** from the link entirely. For example, if your store is available at *www.example.com*, then it will be *http://www.example.com/store_closed.gif*

    Do this both in the code above and in the URL below.

2. Open the file in a browser, using an URL like the one below:

::

  http://www.your_domain.com/your_cscart_directory/test.php

If you see an error, then the default PHP function **file_get_contents** does not work because URL file-access is disabled for your site.

Contact your hosting administrator regarding this problem and ask them to enable this function on your account.
