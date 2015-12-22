**********************************************************************
How To: Set How Long A Cart Stores Products, that Haven't Been Ordered
**********************************************************************

By default, a stores stores the products, that haven't been ordered, for 2 weeks.

To change how long that period is, complete the following steps:

1. Go to the root directory of your CS-Cart installation.

2. Open the **config.php** file.

3. Find the following part of the code:

::

  // Sessions storage live time
  define('SESSIONS_STORAGE_ALIVE_TIME',  SECONDS_IN_DAY * 7 * 2); // 2 weeks

4. Replace it with this code:

::

  // Sessions storage live time
  define('SESSIONS_STORAGE_ALIVE_TIME',  SECONDS_IN_DAY * 7 * NUMBER_OF_WEEKS);

.. note::

    Replace **NUMBER_OF_WEEKS** with the required number of weeks.

5. Save the file.
