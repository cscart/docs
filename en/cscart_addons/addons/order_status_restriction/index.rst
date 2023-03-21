*************************
Order Status Restrictions
*************************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000289" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local:
    :depth: 2


--------
Overview
--------
	The brand new Order Status Restrictions add-on allows its user to monitor and switch between order statuses. By adding the change order status workflow, the add-on helps to enhance the security of the shipping operations, take control of your fee and monitor shipping chains of your vendors! 

		.. fancybox:: img/Order_restriction.png
	 		:alt: Order restriction addon

	 	.. fancybox:: img/Order_restriction2.png
	 		:alt: Workflow

	 	.. fancybox:: img/Order_restriction3.png
	 		:alt: Vendor Monitoring board

========
Features
========
	Installation of the add-on adds the following features:

	1. Change order status limits:

		a. on the order list page;
		b. on the order editing page;
		c. on the view order page;
		d. while importing the order;
		
	2. Change order status workflow for limits managing.
	3. Select only the allowed statuses. The order status will not change while importing if such status is restricted.

	.. note:: The change from/to the “Incomplete” status is also limited according to the rules of the add-on.

=============
Compatibility
=============

	The add-on is compatible with Multi-Vendor 4.10 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 7.2. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here https://docs.cs-cart.com/latest/cscart_addons/compatibility/index.html`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Order Status Restriction add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="https://order-status-restriction.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

	.. note:: The Add-on has no proprietary settings!

==============
Access Setting
==============
	
	The add-on provides flexible access settings. In particular, the access to view and edit the change status workflow, and also allow changing the status avoiding the scheme.

	Access settings are performed independently for each user group in  “Customers“ → “User Groups“ tab. The access settings are located in the “Order“ paragraph and titled as “Change order status workflow“.

	.. fancybox:: img/Access_setting.png
		:alt: Access Setting 

	The access “can view only” is granted to the Vendor’s administrator by default. It means that the change order status workflow is available in “Can view only” for this user group.  

	.. fancybox:: img/Access_setting2.png
		:alt: "Can view only" window

	The change of the vendor’s administrator access level is available after activation of the “Vendor Privileges” add-on (the add-on is available in the Multivendor Ultimate edition).

================
User Insructions
================
	
	The list of available for changing statuses remains the same after the installation of the add-on. Therefore, it is necessary to setup the change order status workflow first. Such setup can be performed by system administrator. In case the other user group needs the access to change and/or view the workflow it could be granted in the user group access settings (further information in “Access Settings”).

	The Change Order Status Workflow is located on the main menu of the administration tab in “Administration“ → “Statuses“ → “Order status workflow“. The other way “Administration”→”Order Status Workflow” can be used if the paragraph “Statuses” is unavailable. 

	.. fancybox:: img/Instructions.png
		:alt: Workflow location

	The Order status workflow interface has o form of table, where the first row and column contains the title of the status. Cells with markers are located on the crossing of the row and column. Marking allows to change a status in the column (vertical) to the status in the row (horizontal). The relevant help text appears when the cursor is pointed on the mark.

	.. fancybox:: img/Workflow.png
		:alt: Workflow

	Workflow settings need to be saved after carried out. Activated changes can be seen in the order interface where the status can be changed.

	.. note:: System administrator possesses the permanent access to change the order status.