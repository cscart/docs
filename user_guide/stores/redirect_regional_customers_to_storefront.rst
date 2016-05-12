********************************************************************
How To: Redirect Customers from Specific Regions to the Right Stores
********************************************************************

.. note::

    **Tutorial Difficulty: 1 / 3**

You can redirect customers to a separate store created for a particular region. Let's assume that you have two stores:

* one for the UK and Canada;

* the other for Australia and New Zealand.

Let's make sure the visitors from those countries get to the right store.

1. In the CS-Cart Administration panel, go to **Administration → Stores**.

2. Click the name of the store you want to edit. Let's edit the store for the UK and Canada first.

3. Switch to the **Regions** tab.

4. Tick the **Redirect visitors of this store to the one that has countries to which the visitors' IP addresses belong defined** checkbox.

.. hint::

    If you leave the checkbox unticked, people won't be redirected from this store to any other store automatically, even if you have another dedicated store for their country.

5. Choose the countries from the list. In our case that's *Canada* and *United Kingdom (Great Britain)*.

6. Click **Save**.

.. image:: img/first_storefront.png
    :align: center
    :alt: Select the countries associated with this storefront and choose whether you want to allow redirecting customers from this storefront.

Now visitors will be redirected to this store from your other stores, but only if both of the following conditions are met: 

   * The IP address of the visitor is associated with one of the chosen countries.

   * The store opened by the visitor supports redirecting to other stores.

7. Configure your other stores according to steps 1 - 6, but choose other countries. In our case it's *Australia* and *New Zealand*.

   .. note::

       CS-Cart imposes no limitations on the set of countries and regions that you can assign to a store. If you assign a country to two or more stores, the customers will be redirected to the first store you assigned this country to.

Congratulations! Now the visitors from the chosen countries will be redirected to the appropriate stores. 

.. image:: img/second_storefront.png
    :align: center
    :alt: You can create multiple storefronts for specific countries or groups of countries, then redirect customers to the right storefront.
