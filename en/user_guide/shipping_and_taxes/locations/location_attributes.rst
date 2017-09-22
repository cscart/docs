*******************
Location Properties
*******************

.. important::

    A customer is assigned to a location when all the **non-empty conditions** (as in, country, state, ZIP code, city, address) are met. Don't specify more conditions for a location than you have to: a customer can make a mistake or leave the fields empty.

=======
General
=======

* **Name**—the name of the location.

* **Status**—the status of the location: *Active* or *Disabled*.

.. image:: img/locations_general.png
    :align: center
    :alt: The "General" section of the location editing page in CS-Cart and Multi-Vendor.

=========
Countries
=========

The right box contains all available countries, and the left box contains the countries included in the location. To move items from one box to the other, use the twin horizontal arrows between the boxes. To select multiple items, press and hold **Ctrl** or **Shift** while selecting.

.. hint::

    Go to **Administration → Shipping & taxes → Countries** to :doc:`adjust the list of available countries <countries>`.

.. image:: img/locations_countries.png
    :align: center
    :alt: The "Countries" section of the location editing page in CS-Cart and Multi-Vendor.

======
States
======

The right box contains all available states, and the left box contains the states included in the location. To move items from one box to the other, use the twin horizontal arrows between the boxes. To select multiple items, press and hold **Ctrl** or **Shift** while selecting.

.. hint::

    Go to **Administration → Shipping & taxes → States** to :doc:`adjust the list of available states <states>`.

.. image:: img/locations_states.png
    :align: center
    :alt: The "States" section of the location editing page in CS-Cart and Multi-Vendor.

================
Zip/Postal Codes
================

The text box contains the ZIP/postal codes included in the location. Different entries must be separated by a paragraph break (i.e, each entry must be a separate line).

It is not necessary to specify the exact codes, you can use wildcards instead. Here is how they work:

* **?** = any single character (or a space). For example, **98?78** stands for *98078*, *98A78*, *98 78*, etc.

* ***** = any series of characters; for example, **12*** stands for *12345*, *128765*, *12 0AC1D9 B5*, etc.

.. image:: img/zip_postal_codes.png
    :align: center
    :alt: The "ZIP/Postal code" section of the location editing page in CS-Cart and Multi-Vendor.

======
Cities
======

The text box contains the cities included in the location. Different entries must be separated by a paragraph break (i.e, each entry must be a separate line).

It is not necessary to specify the full city name, you can use wildcards instead. Here is how they work:

* **?** = any single character (or a space).

* ***** = any series of characters.

For example:

* **New Y*** stands for *New York*, *New York City*, *New Yorkshire*, *New Year's Eve*,  and so on.

* **L?s*** stands for *Las Vegas*, *Los Angeles*, *Lisbon*, and so on.

.. image:: img/locations_sities.png
    :align: center
    :alt: The "Cities" section of the location editing page in CS-Cart and Multi-Vendor.

=========
Addresses
=========

The text box contains the addresses included in the location. Different entries must be separated by a paragraph break (i.e, each entry must be a separate line).

It is not necessary to specify the exact addresses, you can use wildcards instead. Here is how they work:

* **?** = any single character (or a space); for example **??? Street** stands for *Doe Street*, or *3rd Street*, and so on.

* ***** = any series of characters; for example, *** Street** stands for *1st Street*, *Random Street*, and so on.

.. image:: img/locations_addresses.png
    :align: center
    :alt: The "Addresses" section of the location editing page in CS-Cart and Multi-Vendor.
