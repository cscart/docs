****************************
Secure Connection Has Failed
****************************

If you enabled secure connection under **Settings → Security** in the administration panel, you might get the following warning:

.. important::

    **Warning:** The secure connection check has failed. Please ensure that SSL certificate is installed on your server. Check out the Documentation article for more details.

Follow these steps to resolve the issue:

1. Check whether SSL certificate is installed on the server. The easiest way to do it is to make sure the same HTML page is accessible through HTTP and HTTPS. For example, try opening the **store_closed.html** file in the CS-Cart root directory in your browser. 

Use the 2 links below, replacing **www.your_store.com** with your domain name:

::

  http://www.your_store.com/store_closed.html
  https://www.your_store.com/store_closed.html


If the opened pages have the same content, it means that SSL certificate is installed on the server. If you see the **Not Found** error (404 page), but your browser indicates the page as viewed through a secure connection, then there is probably a separate secure directory on your server, and it does not point to the regular web root directory. 

If your server is Unix-based and the secure directory is on the same server as the **public_html** directory, there must be a symbolic link in the secure directory to **public_html**: that way you only need one CS-Cart installation on your server for both HTTP and HTTPS. 

If your server is Windows-based, or your secure directory is on a different server, it is required to copy all the files of the existing CS-Cart installation from the regular server to the secure one. **Don't make a new CS-Cart installation for that purpose.** Both CS-Cart installations must have access to the same MySQL database.

.. note::

    It is inconvenient to have 2 separate CS-Cart installations:

    * If you modify a file in one CS-Cart installation, you will have to apply the same file changes to the appropriate files of the second CS-Cart installation 

    * HTML catalog will be generated in the **catalog** directory of the 'secure' CS-Cart installation and it is required to move it to the 'insecure' catalog directory manually

    * The **Visual Editor** and **On-site live editing** features will affect only the themes of the 'secure' CS-Cart installation.

2. Check whether the host and directory where CS-Cart is installed on the secure server are set up in the **config.local.php** file located in the root CS-Cart directory. The section that defines HTTP and HTTPS hosts should look like the code below:

::

  // Host and directory where software is installed on non-secure server
  $config['http_host'] = 'YOUR_HTTP_DOMAIN';
  $config['http_path']= '/store';

  // Host and directory where software is installed on secure server
  $config['https_host'] = 'YOUR_HTTPS_DOMAIN';
  $config['https_path'] = '/your_secure_directory';

3. Check if there is proxy on your server. If your server uses proxy, please follow the instructions in the Step 2 :doc:`of this article <../../user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/realtime_shipping_and_payment_problem>`.

4. If everything is set up properly, but you still see the warning, then the problem is most likely caused by the specific way of determining secure connection on your server.

