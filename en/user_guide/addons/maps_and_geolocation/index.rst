********************
Maps and Geolocation
********************

.. note::

    This add-on first appeared in version 4.10.1.

.. contents::
   :backlinks: none
   :local:

=============
Functionality
=============

#. Maps by Google or Yandex on the following pages:

   * checkout

   * customer profile

   * order details

   * list of stores and pickup points :doc:`from the corresponding add-on </user_guide/addons/stores_and_pickup_points/index>`

   .. image:: img/map_of_stores.png
       :align: center
       :alt: Yandex map doesn't require an API key, but will stop working for the rest of the day if you go over the daily limit of requests.

#. Automatic detection of the customer's city, and the ability to for the customer to choose a different city via the **Customer location** :doc:`block </user_guide/look_and_feel/layouts/blocks/index>`. The determined or selected city (along with country and state) will be used at checkout.

#. (optional) Location-dependent estimation of shipping rates and time on a product page.

   .. image:: img/shipping_estimation.png
       :align: center
       :alt: The availability of shipping methods depends on customer's location and is determined automatically.

=============
Configuration
=============

The **Maps and Geolocation** add-on is installed :doc:`like any other add-on </user_guide/addons/1manage_addons>`. Once the add-on is installed, click the add-on’s name to open its settings:

* **Provider** determines the third-party service that your store uses for maps and geolocation:

  * **Google** is selected by default. However, for maps and geolocation to work, you'll need to `set up an API key at the Google website <https://cloud.google.com/maps-platform/>`_.

    .. note::

        You'll need to select projects **Maps** and **Places**, or manually enable *Geocoding API*, *Places API*, *Maps JavaScript API*, *Geolocation API*, and *Maps Static API*.

  * **Yandex** can be chosen instead of Google. It won't require an API key, unless you use `the paid version of the API <https://tech.yandex.com/maps/commercial/>`_.

  When you get an API key, just add it to the corresponding tab of the add-on's settings and save the changes.

* **Show shipping cost and time on product pages** does what it says: if you enable it, product pages will contain the time and rate estimations for the shipping methods available for the customer's location.
