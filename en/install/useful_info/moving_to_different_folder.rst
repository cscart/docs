***************************************************************
How To: Move Your Store to Another Directory on the Same Server
***************************************************************

To move your store to another directory on the same server, complete the steps below:

1. Open the Administration panel of your store.

2. Under **Administration →  Stores**, choose a store, and replace the **Storefront URL** value with the new one.

   .. note::

       **Skip step 2** if you use **Multi-Vendor**.

3. Move all the files of your store to the new directory on the server.

4. In this directory, open the **config.local.php** file.

5. Find the following part of the code::

    // Host and directory where the store is installed on no-secure server
    $config['http_host'] = 'www.your_domain.com';
    $config['http_path'] = '/your_store_directory';

    // Host and directory where the store is installed on secure server
    $config['https_host'] = 'www.your_domain.com';
    $config['https_path'] = '/your_store_directory';

6. Replace **your_store_directory** with the name of the directory where you moved the files of your store.

7. Save the file.

8. If :doc:`the SEO add-on <../../user_guide/addons/seo/index>` is enabled, open the **.htaccess** file located in the root directory of your store.

9. Find the following line of code there::

     # RewriteBase /subdirectory

10. Replace the line with the following one::

      RewriteBase /subdirectory

    .. important::

        Remember to replace **/subdirectory** with the directory path to which you have moved the files of your store. For example, if your store URL was *http://www.your_domain.com/store*, and you changed it to *http://www.your_domain.com/new_collection/shop*, the path will be **/new_collection/shop**.

    If you move your store to the web root directory, the line of code above should look like this:: 

      RewriteBase /

11. Save the file.

12. Clear the cache before starting to work with your store.

    .. hint::

        To clear the cache via the Administration panel, go to **Administration → Storage → Clear cache**. If you can't access the Administration panel, clear the cache manually by deleting the *var/cache* directory of your store.

.. meta::
   :description: Moving CS-Cart or Multi-Vendor installation to another folder on the same server: a step-by-step guide.
