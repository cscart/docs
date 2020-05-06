********************************
How To: Install CS-Cart on XAMPP
********************************

First of all, you need to install XAMPP—an environment for PHP development (see :doc:`How To: Install XAMPP </install/windows/xampp/index>`). After that follow the instructions below:

#. Download the latest version of `CS-Cart <https://www.cs-cart.com/download-cs-cart.html>`_ or `Multi-Vendor <https://www.cs-cart.com/download-multivendor.html>`_.. 

   .. image:: img/cscart_en.png
       :alt: Downloading CS-Cart from the official website

#. Open the *htdocs* folder of your XAMPP installation (by default it's *C:\\xampp\\htdocs*) and create a *cscart* folder there.

   .. image:: img/cscart_folder_en.png
       :alt: Creating a folder for CS-Cart

#. Extract the CS-Cart archive into a folder. To do the extraction right click on the archive, open the archiver menu, and then select **extract to "cscart_v4.x.x\"**

   .. image:: img/extraction_en.png
       :alt: Extracting the CS-Cart archive

#. Copy files from the archive to the *cscart* folder (in our case it's *C:\\xampp\\htdocs\\cscart*)

   .. image:: img/copy_data_ru_2.png
       :alt: Copying files

#. Launch the XAMPP Control Panel.

   .. image:: img/xampp_control_panel.png
       :alt: XAMPP Control Panel

#. Before installing CS-Cart you need to create a database. To create a database, open the browser and enter *localhost/phpmyadmin* in the address bar. On the opened page click **New**. Enter a name for the new database. By default, **root** is set as the user for all new databases, and that user doesn't have a password.

   .. image:: img/create_db.png
       :alt: Creating a database

#. Enter *localhost/cscart* in the address bar of the browser and click **[install]** to start the installation process. Follow the instructions of the installer to finish the process.

   .. image:: img/cscart_install.png
       :alt: Starting the CS-Cart installation

   .. important::

       Some of the PHP extensions :doc:`required by CS-Cart </install/system_requirements>` (for example, ``curl``, ``sockets``, ``soap``) might be disabled in XAMPP by default. To enable them, go to the **php.ini** file of your XAMPP installation, remove the ``;`` symbol at the beginning of the lines with the required extensions, then save your changes and restart XAMPP.
In this article we used CS-Cart as an example. Steps for Multi-Vendor installation are the same.

.. meta::
   :description: How to test CS-Cart and Multi-Vendor online stores on XAMPP on Windows without a server?
