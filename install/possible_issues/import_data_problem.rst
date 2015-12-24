***********************************************
Problem with Importing Data during Installation
***********************************************

The problem is most likely caused by the connection time limit to your MySQL server.

If the connection time limit to your MySQL server is 30 seconds, follow these steps:

1. Go to the root directory of your CS-Cart installation.

2. Open the **config.php** file.

3. Find the following line of the code:

::

  define('INSTALL_DB_EXECUTION', SECONDS_IN_HOUR); // 1 hour

4. Replace **SECONDS_IN_HOUR** with **29**. 

5. Save the file. This change makes the connection to MySQL to be established every 29 seconds.

6. Try to install CS-Cart.
