*********
Dashboard
*********

Here you can see some information about search engines: name, API key, and its status, as well as the date of last update and resync.

Manual indexation
*****************

Under the hood, search results are received from Searchanise in real-time. However, Searchanise does not retrieve data from your store database at the moment when the shoppers type in their requests as this would load the database server and significantly slow down the performance. Instead, Searchanise keeps a snapshot of the store products on its servers, and returns search results based on this snapshot. Such data includes the product description, price, features, and images/thumbnails.

The add-on tracks any changes in the products catalog and automatically syncs then with Searchanise. Usually, it takes two or three minutes to complete.

However, you can force to synchronize data by clicking the **Force re-indexation** button.

.. image:: img/searchanise_05.png
    :align: center
    :alt: Search engines

This is rather a time-consuming operation that is unnecessary in most cases. Manual syncing is required only when the product catalog has been updated in an unconventional manner. For example, directly in the MySQL database or as a result of custom programming.

In this panel there is the Searchanise tweeter feed. You can follow Searchanise tweeter clicking the **Follow** button.