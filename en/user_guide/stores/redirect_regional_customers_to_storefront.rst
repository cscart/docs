*************************************************************************
How To: Redirect Customers from Specific Regions to the Right Storefronts
*************************************************************************

You can redirect customers to a separate storefront for a particular region. Let's assume that you have two storefronts:

* One storefront is for the UK and Canada.

* The other storefront is for Australia and New Zealand.

Let's make sure the visitors from those countries get to the right storefront.

#. Go to **Administration → Stores** (in CS-Cart) or **Administration → Storefronts** (in Multi-Vendor).

#. Click the name of the storefront you want to edit. Let's edit the storefront for the UK and Canada first.

#. Switch to the **Regions** tab.

#. Tick the **Redirect visitors of this store to the one that has countries to which the visitors' IP addresses belong defined** checkbox.

   .. hint::

       If you leave the checkbox unticked, people won't be redirected from this storefront automatically, even if you have another dedicated storefront for their country.

#. Choose the countries from the list. In our case that's *Canada* and *United Kingdom (Great Britain)*.

#. Click **Save**.

   .. image:: img/first_storefront.png
       :align: center
       :alt: Select the countries associated with this storefront and choose whether you want to allow redirecting customers from this storefront.

   Now visitors will be redirected to this storefront from your other storefronts, but only if both of the following conditions are met: 

   * The IP address of the visitor is associated with one of the chosen countries.

   * The storefront opened by the visitor supports redirecting to other storefronts.

#. Configure your other storefronts according to steps 1 - 6, but choose other countries. In our case it's *Australia* and *New Zealand*.

   .. note::

       If you assign a country to two or more storefronts, customers from that country will be redirected to the first storefront you assigned this country to.

   Congratulations! Now the visitors from the chosen countries will be redirected to the appropriate stores.

   .. image:: img/second_storefront.png
       :align: center
       :alt: You can create multiple storefronts for specific countries or groups of countries, then redirect customers to the right storefront.

.. important::
    For geoocation, we use GeoLite2 databases created by MaxMind, available from `https://www.maxmind.com <https://www.maxmind.com/>`_.

.. meta::
   :description: How to redirect customers to specific storefront for their country in CS-Cart online store or Multi-Vendor marketplace?
