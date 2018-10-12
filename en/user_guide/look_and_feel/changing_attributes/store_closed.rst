*****************************
How To: Close Your Storefront
*****************************

There are times when you don't want anyone to access your store: for example, you're working on some changes and don't want the customers or search engines to see the work in progress.

.. note::

   The store is also closed automatically :doc:`during the upgrade </upgrade/upgrade_process>`. You will need to open it after the upgrade is completed.

.. image:: img/store_closed_02.png
    :align: center
    :alt: Closed storefront

=======================================
How To: Close the Storefront in CS-Cart
=======================================

#. In the Administration panel, go to **Administration → Stores**.

#. Change the status of the storefront from *ON* to *OFF*.

   Note that the lock icon will appear in the upper left part of the page, next to the name of the storefront. The icon will change depending on how many storefronts you have, and which of them are closed. If all the storefronts are closed (or if you have selected a closed storefront in the drop-down list), then the color of the top menu in the Administration panel will change. That way it's easier to notice that the storefront is closed.

   .. image:: img/cscart_closing_store.png
       :align: center
       :alt: How to close the storefront in CS-Cart.

#. You can view the storefront even if it is closed. Go to **Settings → General**, select the storefront in the upper left corner of the page, fill in the **Access key to temporarily closed store** field, and click **Save**.

   For example, if the storefront is available at *http://example.com* and you entered *secret* in the access key field, you will be able to access the closed storefront by the following URL: *http://www.example.com/index.php?store_access_key=secret*.

============================================
How To: Close the Storefront in Multi-Vendor
============================================

#. In the Administration panel, go to **Settings → General**.

#. Tick the **Close storefront** checkbox.

#. Fill in in the **Access key to temporarily closed store** field.

   For example, if the storefront is available at *http://example.com* and you entered *secret* in the access key field, you will be able to access the closed storefront by the following URL: *http://www.example.com/index.php?store_access_key=secret*.

#. Click the **Save** button.

   .. image:: img/store_closed.png
       :align: center
       :alt: Tick the Close Storefront checkbox under Settings → General, then specify your access key to be able to view the closed store.
