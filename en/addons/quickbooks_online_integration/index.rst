*****************************
QuickBooks Online
*****************************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/quickbooks-online-integration.html" class="btn buy-now__btn">Buy now</a>
    </div>

.. contents::
    :local: 
    :depth: 2

--------
Overview
--------
    Quickbooks online is a cloud accounting service developed by the authors of the most popular solution for the small business accounting in the USA. Quickbooks plays a big part in conducting e-commerce and more than 30 millions users all over the  world proves its effectiveness. 

    The QBO Integration add-on is meant for synchronization of products, orders and users with the QBO service.

    Tasks carried out by the add-on:

    1. Transferring to QBO the new client data, update of the client data that already are present in QBO.
    2. Transferring to QBO the new order data, update of the order data that already are present in QBO.
    3. Transferring to QBO the new product data, update of the product data that already are present in QBO.

    Tasks that are NOT carried out by the add-on:

    1. Exporting the pack of customers/orders to QBO
    2. Data transferring from QBO to CS-Cart and possible information duplication due to lack of two-way synchronization

    The add-on is based on the QuickBooks `PHP SDK <https://github.com/intuit/QuickBooks-V3-PHP-SDK>`_

----------------------------
Creation of QBO Test Account
----------------------------
    Check the work of Quickbooks Online System and add-on by creating a Quickbooks test account:

    1. Register test account on `Quickbooks website <https://quickbooks.intuit.com/online/advanced/free-trial/>`_.
    2. Oserve the QBO pricing policy `here <https://quickbooks.intuit.com/pricing>`_.

    .. note::
        **Simple start** rate plan is not relevant as it doesn't include an inventory support

    .. fancybox:: img/QBO13.png
            :alt: Test account registration

    3. Fill in the nesserary fields and perform the primary settings to create the QBO test account. 


------------------------------------------
Creation of the new QBO developers account
------------------------------------------

============================
Create the Developer account
============================
    1. Create the new account. 
    2. On `Inuit homepage <https://developer.intuit.com/app/developer/homepage>`_ the suggestion to create the QBO developer account will appear. 
    3. Open the Dashboard and create an app.

        .. fancybox:: img/QBO1.png
          :alt: Inuit dashboard

    4. In order to use the production application,  all conditions from Dashboard->Production->Keys & OAths must be fulfilled.

        .. fancybox:: img/QBO2.png
         :alt: Production Keys requirements 

    5. Confirm your e-mail.  Click the “Resend Verification Email” then open the Sign in & security page. Click the Verify button in the Email address field.

        .. fancybox:: img/QBO3.png
          :alt: Confirm e-mail

    When all conditions are complete, Client ID and Client Secret will be available for production.

        .. fancybox:: img/QBO4.png
          :alt: Keys and OAth

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us via email cart-addons@cscart.com now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install Quickbooks Integration add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

    When the Developer Account is created and the add-on is installed, the necessary settings are available. 

    1. Open the Website tab on the cs-cart admin panel and click on QuickBooks Online connection.
    
    .. fancybox:: img/QBO15.png
        :alt: Website tab 

    2. In the Connection Settings tab insert the following data:

     2.1 Client ID from QBO Developers (Dashboard->{app}->Production-> Keys & OAuth)
     
     2.2 Client Secret From QBO Developers (Dashboard->{app}->Production-> Keys & OAuth)
     
     2.3 Accounting Base URL

     .. fancybox:: img/QBO5.png
          :alt: Base URL

     2.4 QBO ID for better interaction with the product (the products are written off incorrectly from the storage if the QBO Code is used)

    3. Copy the Redirect URL from the Token tab and insert it into Production > Keys & OAuth :: Redirect URIs

     .. fancybox:: img/QBO6.png
            :alt: Redirect URIs

    4. Then acquire the token manually (Token tab)

     .. fancybox:: img/QBO7.png
          :alt: Getting Token

    As the steps above are successfully completed, the Token tab in cs-cart admin panel should look like this:

      .. fancybox:: img/QBO8.png
          :alt: Token   

    .. note::
        Set up the cron to get the new tokens automatically as the tokes is valid for 60 minutes only (such Cron is present in the add-on settings)


    5. Check the connection with QBO (Test connection) prior to getting the accounts.

    6. Then acquire the QBO accounts on the Queue tab.
    
     .. fancybox:: img/QBO9.png
          :alt: Queue tab

    7. Insert the Accounts, Payment methods, Taxes data on the Default accounts tab.

        7.1 Create the new QBO account if necessary.

         .. fancybox:: img/QBO10.png
             :alt: Accounting tab
             
         .. fancybox:: img/QBO11.png
             :alt: Creating account
             
        7.2 Create the QBO account of the particular type for it to appear in the list to select if none.

         .. fancybox:: img/QBO12.png
             :alt: Particular type

         7.2.1 Default Inventory Asset Account - create the new one, if necessary (at QBO Accounting > Chart of accounts)

		If necessary, than:
		
		Account Type = Other Current Asset
		
		Detail type = Inventory

         7.2.2 Default Income Account - create the new one, if necessary

		If necessary, than:
		
		Account Type = Income
		
		Detail type = Sales Of Product Incomes

         7.2.3 Default Expense Account - create the new one if necessary (at QBO Accounting > Chart of accounts)

		If necessary, than:
        
		Account Type = Cost of Product Sold
		
		Detail type = Supplies & Materials - COGS
    
    After that all new users, products and paid invoices will be added to the line (it can be set up by cron or started manually (dispatch=qbo.read_queue))
    
    .. note:: 
        Beside the token update cron, the line reading cron can also be set up (cron is located in the add-on setting)

    In order to allow vendors to conduct QuickBooks Online settings, the relative access must be provided via Vendors Priveleges add-on.

    .. fancybox:: img/QBO14.png
        :alt: Vendors Access 