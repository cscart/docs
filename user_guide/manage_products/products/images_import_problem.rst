********************************************
Images Are Not Uploaded or Imported From URL
********************************************

The problem may be caused by that URL file-access is disabled in your server configuration.

In order to check it do the following:

*   Create a test file (*test.php*) with the following content in the root directory of your CS-Cart installation:

.. code-block :: none

    <?php
    error_reporting(E_ALL);
    ini_set("display_errors", "on");
    $test = file_get_contents("http://www.your_domain.com/your_cscart_directory/store_closed.gif");
    echo $test;
    ?>

where replace *your_domain.com* with the name of your domain, *your_cscart_directory* with the name of the directory where CS-Cart is installed on your server as seen from the Web, e.g *shop* (if applicable).
    
*	Try to launch this file in a browser: *http://www.your_domain.com/your_cscart_directory/test.php*

	Where replace *your_domain.com* with the name of your domain, *your_cscart_directory* with the name of the directory where CS-Cart is installed on your server as seen from the Web, e.g shop (if applicable).

If an error is displayed it means that the default PHP function ``file_get_contents`` does not work because URL file-access is disabled for your site.

Contact your hosting administrator regarding this problem and ask him to enable this function on your account.
