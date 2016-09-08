********************************************
Images Are Not Uploaded or Imported from URL
********************************************

This problem may occur if URL file-access is disabled in your server configuration. Here's how you can check whether or not URL file-access is enabled:

1. Create a file called **test.php** with the following content:

   .. code-block :: none

       <?php
       error_reporting(-1); // report all the errors
       ini_set("display_errors", "on");
       $page_contents = file_get_contents("http://www.your_domain.com/your_cscart_directory/store_closed.html");
       echo '<pre>';
       echo htmlspecialchars($page_contents); // output the page source code instead of the page itself
       echo '</pre>';
       ?>

   .. note::

        Replace ``www.your_domain.com`` with the name of your domain, and ``your_cscart_directory`` with the name of the directory where CS-Cart is installed on your server. 

   For example, if your store is available at **www.example.com/store**, replace ``your_cscart_directory`` with ``store``. If your store is available directly at **www.example.com**, leave ``your_cscart_directory`` out of the code above and the link below.

2. Upload **test.php** to the root directory of your CS-Cart installation.
    
3. Try to open this file in a browser by entering the following URL: *http://www.your_domain.com/your_cscart_directory/test.php*.

   * If you see the content of **store_closed.html**, then URL file-access is enabled.

     If you still experience problems with importing images from URL, please contact our technical support via `HelpDesk <https://www.cs-cart.com/helpdesk>`_.

   * If you see an error, then URL file-access is disabled for your site.

     In this case the default PHP function ``file_get_contents`` does not work. Please contact your hosting administrator regarding this problem and ask them to enable this function on your account.
