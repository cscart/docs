***********************************
How To: Install CS-Cart Using XAMPP
***********************************

First of all you need to install XAMPP - PHP development environment (:doc:`How To: Install XAMPP Distribution — XAMPP </install/windows/xampp/index>`).

#. Download the latest version of CS-Cart from the official website `www.cs-cart.com <https://www.cs-cart.com/download-cs-cart.html>`_.

   .. image:: img/cscart_en.png
       :alt: Downloading CS-Cart from the official website

#. In XAMPP installation open the *htdocs* folder (by default *C:\\xampp\\htdocs*) and create a *cscart* folder.

   .. image:: img/cscart_folder_ru.png
       :alt: Creating a folder for CS-Cart

#. Extract the CS-Cart archive into a folder. To do the extraction right click on the archive, open the archiver menu, and then select **extract to "cscart_v4.x.x\"**

   .. image:: img/extraction_en.png
       :alt: Extracting the CS-Cart archive

#. Copy files from the archive to the *cscart* folder (by default *C:\\xampp\\htdocs\\cscart*)

   .. image:: img/copy_data_ru_2.png
       :alt: Copying files

#. Launch the XAMPP Control Panel.

   .. image:: img/xampp_control_panel.png
       :alt: XAMPP Control Panel

#. Before installing CS-Cart you need to create a database. To create a database open the browser and enter *localhost/phpmyadmin* in the address line. On the opened page click **New**. Make up a name for a new database. By default **root** is set as the user for all new databases. Also **root** doesn't have a password.

   .. image:: img/create_db.png
       :alt: Creating a database

#. Enter *localhost/cscart* in the address line of the browser and click **[install]** to launch the installation process. Follow the instructions to finish the process

   .. image:: img/cscart_install.png
       :alt: Starting the CS-Cart installation
