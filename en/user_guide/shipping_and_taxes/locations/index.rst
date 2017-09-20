*********
Locations
*********

The **Administration → Shipping & taxes → Locations** page allows you to manage the locations that your store ships to. A location is a combination of parameters that represent a geographical area. Locations are used to calculate shipping rates and tax charges.

.. important::

    If the customer's address doesn't match any existing location (or if the shipping methods don't have rates for the customer's location), then the following message will appear during shipping method selection: *Sorry, it seems that we have no shipping options available for your location. Please check your shipping address and contact us if everything is okay. We'll see what we can do about it.*

.. hint::

    **Default location (all countries)** applies to the customers who don't belong to any of the locations that exist in your store. Create a shipping method called *Discuss with manager* and make it free for the default location. That way a customer from anywhere be able to place an order (unless that customer belongs to a non-default location without shipping methods).

.. image:: img/locations.png
    :align: center
    :alt: Locations serve for calculation of taxes and shipping rates in CS-Cart and Multi-Vendor.

===============
In This Section
===============

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    location_attributes
    countries
    states
    set_location
    country_location
