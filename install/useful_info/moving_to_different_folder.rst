*************************************************************************
How To: Move CS-Cart Installation to Another Directory on the Same Server
*************************************************************************

To move your CS-Cart installation to another directory on the same server, complete the steps below:

1. Open the administration panel of your store.

2. Under **Administration →  Stores**, choose a store, and replace the **Storefront URL** value with the new one.

3. Move all CS-Cart files to the new directory on the server.

4. In this directory, open the **config.local.php** file.

5. Find the following part of the code:

::

  // Host and directory where cs-cart is installed on no-secure server
  $config['http_host'] = 'www.your_domain.com';
  $config['http_path'] = '/your_cscart_directory';

  // Host and directory where cs-cart is installed on secure server
  $config['https_host'] = 'www.your_domain.com';
  $config['https_path'] = '/your_cscart_directory';

6. Replace **your_cscart_directory** with the name of the directory where you moved CS-Cart files.

7. Save the file.

8. If :doc:`the SEO add-on <../../user_guide/addons/seo/index>` is enabled, open the **.htaccess** file located in the root directory of your CS-Cart installation.

9. Find the following line of code there:

::

  # RewriteBase /subdirectory

10. Replace the line with the following one:

::

  RewriteBase /subdirectory

.. important::

    Remember to replace **/subdirectory** with the directory path to which you have moved CS-Cart files. For example, if your store URL was *http://www.your_domain.com/store*, and you changed it to *http://www.your_domain.com/new_collection/shop*, the path will be **/new_collection/shop**.

If you move your CS-Cart installation to the web root directory, the line of code above should look like this: 

::

  RewriteBase /

11. Save the file.

12. Do not forget to clean the cache before starting to work with your store.

.. hint::

    To clear the cache, open the administration panel and go to **Administration → Storage → Clear cache**.
