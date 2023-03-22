**********************
Remove Products
**********************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000310" class="btn buy-now__btn">Buy now</a>
    </div>

.. contents::
    :local:
    :depth: 3

--------
Overview
--------

“Remove Products” add-on allows to quickly and effortlessly delete all products from the store/marketplace. The removal process is launched by pressing only one button. The described functions can be granted to users included in a certain usergroup. Beside removal of all products the add-on provides an ability to delete product under the search results only.

Despite the add-on name, it is also compatible with Ultimate edition of CS-Cart 

========
Features
========

 * Adds “Remove all products“ and “Remove found products“ buttons on a Products page of the Admin Panel

 * Adds “Remove all products“ and “Remove found products“ buttons on a Vendor Products page of the Admin Panel

 * Adds “Remove all products“ and “Remove found products“ buttons on a Vendor Products page of the Vendor Panel

 * Adds “Remove all products“ and “Remove found products“ buttons on a Vendor Products page 

 * Adds a new “Bulk product removal“ privilege for Administrators and Vendors. By default, this privilege is available for Administrators and restricted for Vendors

 * Provides an ability to delete products by the click of the one button.

=============
Compatibility
=============

    The add-on is compatible with Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/latest/cscart_addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

===========
Limitations
===========

Can view only option is not included in Bulk product removal privilege.

====
Demo
====

    Check out the Enhanced Filters add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="https://remove-vendor-products.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

--------------------
Managing admin panel
--------------------

Remove all products and Remove found products buttons will be available for Administrators group on a Products page immediately after the add-on is successfully installed: 

.. fancybox:: img/rvp1.png
    :alt: Remove all products and Remove found products buttons

In order to disable the privilege, open Customer → User groups page → Administrator page and select No access option in Bulk product removal privilege settings:

.. fancybox:: img/rvp2.png
    :alt: Vendor Privileges

After that the buttons will be unavailable for selected usergroup:

.. fancybox:: img/rvp3.png
    :alt: Vendor Restrictions

In order to delete all product, press Remove all products button. The pop-up window will require confirmation of the deleting process and will suggest creating the backup file.

.. important:: **The add-on is not creating backup file!** In order to create it, press Cancel button, use standard back up tools and proceed the removal process again.  

In order to remove particular products (i.e. that included into the search result), press Remove found products. Confirmation pop-up window will appear immediately after.

.. note:: Without previous searching of the products, pressing Remove found product button will launch the **all** products removing process. 

In order to remove vendor’s products from Multivendor Admin Panel, open vendor’s products page and press Remove Products or Remove found products buttons, wich will be available when the relative privilege is active: 

.. fancybox:: img/rvp5.png
    :alt:  Multivendor Admin Panel

.. note:: Buttons will be unavailable if vendor has no products.
  
    .. fancybox:: img/rvp6.png
        :alt: No products page 

In order to grant vendor the ability to delete his own products, the Bulk product pemoval privilege must be activated in Vendor usergroup privilege settings:

.. fancybox:: img/rvp7.png
    :alt: Bulk product removal

.. note:: Activate standard Vendor Privileges add-on to add privileges to vendor. 
  
    .. fancybox:: img/rvp8.png
        :alt: Buttons on the Vendor Panel