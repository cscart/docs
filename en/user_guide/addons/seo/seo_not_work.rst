********************
If SEO Does Not Work
********************

If links do not work when the :doc:`/user_guide/addons/seo/index` add-on is enabled:

* Check whether there is the default CS-Cart **.htaccess** file in the root CS-Cart directory.

* Make sure that your server supports the commands in **.htaccess** files:

  #. Open the **.htaccess** file located in the root directory of CS-Cart installation, and replace this line of the code:

     .. code-block :: none

         DirectoryIndex index.html index.php

     with the following one:

     .. code-block :: none

         DirectoryIndex store_closed.html index.php

  #. Save the file.
  
  #. Open your storefront (the URL should be *http://www.your_domain.com/your_cscart_directory/*; replace *your_domain.com* with the name of your domain, then replace *your_cscart_directory* with the name of the directory on your server where CS-Cart is installed). If you see the **store closed** page, it means that commands in **.htaccess** files are supported on your server. If you do not see this page, contact your server administrator.

* SEO uses the **mod_rewrite** Apache module of your server. Check whether this module is installed on the server:

  #. Log in to the administration panel of your store and go to **Administration → Logs**. 
  
  #. Click the gear button and choose **PHP information** from the drop-down menu. A new page that displays the result of the **phpinfo** PHP function will open.
  
  #. Search for **mod_rewrite** on the page. If this module is installed on your server, it should be found in the **Loaded Modules** section. If you could not find this module, contact your server administrator.
  
* If CS-Cart is installed not in the web root directory, modify the **.htaccess** file located in the root CS-Cart directory and replace there the following line of the code:

  .. code-block :: none

      # RewriteBase /

  with this one:

  .. code-block :: none

      RewriteBase /your_cscart_directory

  where *your_cscart_directory* is the directory path relative to the web root directory.

If you checked the mentioned things and everything was okay, submit a ticket in our `Customer Help Desk <https://helpdesk.cs-cart.com/index.php?dispatch=auth.login_form>`_ and provide a temporary FTP access to your server for us to investigate the problem.
