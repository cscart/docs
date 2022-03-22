******************************
Integration with Zapier [Beta]
******************************

In CS-Cart 4.15.1, we have added an add-on that allows you to connect your store with a `Zapier platform <https://platform.zapier.com/quickstart/introduction>`_. Zapier allows you to integrate apps and services into workflows. This means that if you have a Zapier integration, you can embed an app that is missing in CS-Cart. When you link processes in the store to the work of other applications, you automate current tasks and save your time.

Set the rules for managing and exchanging data between the store and applications. These rules are called **Zaps**.

A Zap consists of one **trigger** (an event in CS-Cart or another app) and any number of **actions** set by the trigger. For example, creation of an order can be the trigger, meanwhile an action is sending an email about a new order and filling in a Google Sheet with order data.

.. note::

    Zapier provides `several plans <https://zapier.com/app/billing/plans>`_, including a free one. The price sets the number of created Zaps, Multi-step Zaps—the number of events that are activated by one trigger, etc.

.. contents::
   :backlinks: none
   :local:

============================================
How To: Set Up Store Integration with Zapier
============================================

#. Open the admin panel of your CS-Cart store, go to **Add-ons → Manage Add-ons** and make sure the **Integration with Zapier** add-on is installed and activated.

#. Go to the **Customers → Administrators** page. In the list of users, find the root administrator and open the profile page by clicking on their name. Give the administrator access to the API on the *API access* tab.

   .. note::

       Only the root administrator has access to the API. The root administrator account is automatically created during the installation of CS-Cart or Multi-Vendor. 

       Advanced versions of CS-Cart Multi-Vendor allow you to manage the API not only through the root administrator. For example, you can :doc:`create a user group and assign the necessary rights to it </user_guide/users/administrators/admin_group>`. Then add an administrator to the group to interact with the API and allow them to manage the API key.

   .. image:: img/add_connection.png
       :align: right
       :scale: 40 %
       :alt: Fields to fill in for access to Zapier.

#. Copy the existing API key. If you do not have a key, then generate a new one on the *API access* tab and copy it.

#. `Open your Zapier dashboard <https://zapier.com/app/dashboard>`_.
 
#. In the left side menu, click `My Apps <https://zapier.com/app/connections>`_ and choose **CS-Cart** as a custom integration: **Custom integrations → CS-Cart**.

#. Click the **Add connection** button and fill in the fields in the opened window:

   - **Username**—email address of the administrator who owns the API key.

   - **Password**—API key for store access. Paste the copied data.

   - **Base URL**—the full URL of the store without a slash at the end.

#. After entering the data, allow Zapier access to your store by clicking **Yes, continue**.

.. _zapier-connection-cs-cart:

8. Done! Now the *Connections* tab contains a note with your connection, like *CS-Cart (1.0.0) #1*.

9. Check if there is a connection. Open the menu next to the connection name and select **Test connection**.

   .. image:: img/list_of_connections.png
       :alt: Connection with CS-Cart in the list of connections.

========================================================================
How To: Integrate CS-Cart with a Service of Your Choice (Creating a Zap)
========================================================================

Follow these steps to automate the process that link the store with an app of your choice:

#. Activate the **Integration with Zapier add-on** in the admin panel and connect your store to Zapier.

#. In the Zapier dashboard, set up a **trigger**—an event that will launch your Zap.

   To do this, first select the app where the event will occur, then select the event itself.

   .. note::

      Select CS-Cart as the app if you want the trigger to be an event in the store, for example, a new vendor registration. Choose another app, like Google Sheets, to trigger actions when new rows appear in your sheet.

#. Set up an **action**—an event that the **Zap** performs after it starts.

   This step also includes selecting an app and setting up what will happen in that app.

   .. note::

      If you select CS-Cart as the application, then the trigger will produce changes in the store, for example, creating a new order .

#. Your **Zap** is ready.

   Now you can apply filters to add additional conditions for triggering the **action**. If you want to see the work of the created Zap, transfer the existing data from one app to another.

==========================
An Example of Creating Zap
==========================

Let's consider in detail how you can automate workflows via the example.

*Imagine that you are looking for vendors for your wallpaper marketplace. To do this, you are going to an exhibition of interior decoration. There you meet potential vendors who are ready to sell their products on your marketplace. You have recorded their contacts and necessary information in a Google Sheet. Now you need to transfer this data from the Sheet to CS-Cart.*

You can save time on routine processes by integrating with Zapier and creating Zaps. Let's create a Zap that will add a new customer to the store when a new row is added to the Google Sheet.

#. `Sign up <https://zapier.com/sign-up/>`_ or `login <https://zapier.com/app/login>`_ to your Zapier account and click the **Create Zap** button.

#. Сreate a **Trigger Event**.
    #. Select an app and an event. Then click **Continue**.

       **App event**—*Google Sheets*;

       **Trigger event**—*new Spreadsheet row*.

    #. **Choose account**. The account that the Google Sheet is associated with.

    #. **Set up trigger**. Select the **spreadsheet** where you entered the vendor data. Also select a **worksheet**—new records from this sheet will fire the trigger. Click **Continue**.

    #. **Test trigger**. If everything was configured correctly, you will see the data from your Google Sheets.

#. Create an **Action Event**.
    #. Select an app and an event.  Then click **Continue**.

       **App event**—*CS-Cart*;

       **Action event**—*Create User*.
   
    #. Choose account. :ref:`The connection that was created when setting up the store integration with Zapier <zapier-connection-cs-cart>`. Click **Continue**.

    #. **Set up action**. :ref:`Customize user data fields according to Google Sheets <zapier-spreadsheet_requirements>`.

    #. **Test action**. If everything was configured correctly, then a new customer will be created on the marketplace based on the data from the spreadsheet.

#. **Turn on Zap**.

Your Zap is ready! Now data about new users in Google Sheets will be automatically transferred to your store.

You can also create Zaps for other triggers and events.

.. image:: img/finished_zap.png
    :alt: Finished Zap with customized actions and triggers.

.. _zapier-spreadsheet_requirements:

Document Requirements
---------------------

Connect an existing Google Sheet or create a new one. To set up integration, your Google Sheet should contain:

* Column names;

  First row in Google Sheet with column names. In this case, your doc should contain next columns: E-mail, User type (administrator, buyer); Company id (ID of the store or vendor to which the user belongs); User status﻿

* At least one line with detailed information about the user.

  Add at least one line to the file with user data from your store. This is necessary to test the correct setting of the Zap.

  *The example of Google Sheet*

  .. image:: img/example_speadsheet.png
      :alt: Screenshot of the table with the vendor names in the Google Sheets.

==========================================================================
What Events in CS-Cart Can Be Used to Connect with Other Apps and Services
==========================================================================

When you create a Zap, you set up triggers and actions. You can set events in your store to be the reason (trigger) for other events appearing. You can also make the store to be the place where events take place after the trigger fires. Only a few actions in the store can be built into this chain.

When choosing CS-Cart as an app, the following events can be triggers and actions:

.. list-table:: 
   :widths: 4 4 3 5
   :header-rows: 1

   * - 
     - Trigger
     - 
     - Action
   * - If CS-Cart launch a
     - * new call request;
       * new order;
       * order payment;
       * new product;
       * new shipment;
       * new user;
       * new vendor,
     - .. figure:: img/arrow.png
              :align: left
              :scale: 60%
              :alt: Arrow right.
     - Choose what happens after the store event is triggered. These can be events in CS-Cart or another app.

.. list-table:: 
   :widths: 6 3 3 6
   :header-rows: 1

   * - 
     - Trigger
     - 
     - Action
   * - If a trigger fired in CS-Cart or in another application, then
     - .. figure:: img/arrow.png
              :align: left
              :scale: 60%
              :alt: Arrow right.
     - a store performs
     - * creating a call request;
       * creating an order;
       * creating a product;
       * updating a product;
       * creating a shipment;
       * creating a user;
       * updating a user;
       * creating a vendor.

.. meta::
   :description: How to track inventory at multiple stores and warehouses in CS-Cart and Multi-Vendor and show it to customers?

