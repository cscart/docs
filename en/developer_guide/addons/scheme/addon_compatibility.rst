*************************************************************
Set Compatibility with CS-Cart Version and Server Environment
*************************************************************

:ref:`During add-on installation <install-addon-process>` a check is performed to find out if the add-on is compatible with the CS-Cart/Multi-Vendor version, as well as PHP versions and extensions. This information is stored in the ``<compatibility>`` section of :doc:`addon.xml <scheme3.0_structure>`.

=========================================
Compatibility with CS-Cart & Multi-Vendor
=========================================

--------
Versions
--------

This is how you specify the compatibility of your add-on with specific versions of CS-Cart/Multi-Vendor:

.. code-block:: xml

    <compatibility>
        <core_version>
            <min>4.3.2</min>
            <max>4.3.6</max>
        </core_version>
    </compatibility>

.. note::

    You don’t have to specify both ``<min>`` and ``<max>``. They stand for the earliest and the latest supported versions respectively. 

If you try to install this add-on on version 4.3.7, you’ll get the following error:

.. warning::

    **Error:** Version of your cart (4.3.7) is not supported. Minimal: 4.3.2. Maximal: 4.3.6.

----------------------------------
Editions (CS-Cart or Multi-Vendor)
----------------------------------

There are two editions: CS-Cart (ULTIMATE) and Multi-Vendor (MULTIVENDOR). You can specify either of them, or both.

* **One edition:**

  .. code-block:: xml

      <compatibility>
          <core_edition>MULTIVENDOR</core_edition>
      </compatibility>

* **Multiple editions:**

  .. code-block:: xml

      <compatibility>
          <core_edition>MULTIVENDOR,ULTIMATE</core_edition>
      </compatibility>

If you specify ``MULTIVENDOR`` in **addon.xml** and try to install the add-on on CS-Cart, you’ll see the following error:

.. warning::

    **Error:** Edition of your cart (ULTIMATE) is not supported. Required: MULTIVENDOR.

=====================================
Compatibility with Server Environment
=====================================

------------
PHP Versions
------------
You can specify the minimum and maximum supported PHP version:

.. code-block:: xml

    <compatibility>
        <php_version>
            <min>5.6.6</min>
            <max>7.1.1</max>
        </php_version>
    </compatibility>

.. note::

    You don’t have to specify both ``<min>`` and ``<max>``. They stand for the earliest and the latest supported PHP versions respectively. 

If you try to install this add-on on a server with version 5.5.9, you’ll get the following error:

.. warning::

    **Error:** PHP version (5.5.9-1ubuntu4.14) is not supported. Minimal: 5.6.1. Maximal: 7.1.1.

--------------
PHP Extensions
--------------

You can specify the required and conflicting PHP extensions for your add-on.

* **Required extension:**

  .. code-block:: xml

      <compatibility>
          <php_extensions>
              <gd>
                  <supported>Y</supported>
              </gd>
          </php_extensions>
      </compatibility>

  If the required PHP extension (in our case it’s **gd**) is not installed, you’ll see an error:

  .. warning::

      **Error:** The gd extension should be installed on your server for correct add-on operation.

* **Specific version of a required extension:**

  .. code-block:: xml

      <compatibility>
          <php_extensions>
              <json>
                  <min>3.0</min>
                  <max>4.0</max>
              </json>
          </php_extensions>
      </compatibility>

  .. note::
 
      In this case you don’t have to add ``<supported>Y</supported>``.

  If the PHP extension version is different from the required versions, you’ll see an error:

  .. warning::

      **Error:** The json version (1.3.2) is not supported by the add-on. Minimal: 3.0. Maximal: 4.0.

* **Conflicting extension:**

  .. code-block:: xml

      <compatibility>
          <php_extensions>
              <gd>
                  <supported>N</supported>
              </gd>
          </php_extensions>
      </compatibility>
    
  If the conflicting PHP extension (in our case it’s gd) is installed, you’ll see an error:

  .. warning::

      **Error:** The gd extension should be removed from your server for correct add-on operation.


