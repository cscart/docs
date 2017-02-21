*****************************************
Some Options Do Not Function in the Store
*****************************************

Some servers use `the Suhosin extension <https://en.wikipedia.org/wiki/Suhosin>`_ for protection. However, it can cause some problems—check whether your server uses **Suhosin**, if you encounter any of the following problems:

* Some pages are not accessible.

* The cart is emptied when changing from HTTP to HTTPS.

* The users are logged out when changing from HTTP to HTTPS.

* The **Add to cart** button does not work.

* There are problems with the template area and with adding categories, etc.

* The **Upgrade Center** does not work correctly.

.. note::

   There are other problems that may be caused by **Suhosin**: even if your problem isn't listed above, check if your server uses **Suhosin**.

You can check whether your server uses **Suhosin** on the PHP information page:

* Open your store's administration panel and go to **Administration → Logs**.

* Click the **gear button** and choose **PHP information** from the drop-down menu.
  This will open the page with the PHP settings of your server.

* Search for **suhosin**.

If you find any records with this word, it means that your server is protected by the **Suhosin** extension. Contact your server administrator and ask them to disable the **Suhosin** extension for your account.


