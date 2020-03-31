*****************************
How To: Close Your Storefront
*****************************

There are times when you don't want anyone to access your store: for example, you're working on some changes and don't want the customers or search engines to see the work in progress.

.. important::

   The store is also closed automatically :doc:`during the upgrade </upgrade/upgrade_process>`. You will need to open it after the upgrade is completed.

.. image:: img/store_closed_02.png
    :align: center
    :alt: Closed storefront

Here is how to close the storefront:

#. In the Administration panel, go to **Administration → Stores**.

#. Change the status of the storefront from *ON* to *OFF*.

   If you have only one storefront, the color of the top menu in the admin panel will change instantly. When you have multiple storefronts, then the color will change only when you select a closed storefront and work with it. This helps to see whether or not the selected storefront is closed.

   .. image:: img/cscart_closing_store.png
       :align: center
       :alt: How to close the storefront in CS-Cart.

#. You can view the storefront even if it is closed. Go to **Administrations → Stores** and open the editing page of a storefront. Fill in the **Access key to temporarily closed store** field, and click **Save**.

   For example, if the storefront is available at *http://example.com* and you entered *secret* in the access key field, you will be able to access the closed storefront by the following URL: *http://example.com/index.php?store_access_key=secret*
