*************************************
How To: Change Authentication Timeout
*************************************

By default, the authentication timeout is 2 hours: once this period expires, you will be logged out automatically.

To change the authentication timeout, complete the following steps:

1. Go to the root directory of your CS-Cart installation.

2. Open the **config.php** file.

3. Find the following part of the code:

::

  // Session live time
  define('SESSION_ALIVE_TIME', SECONDS_IN_HOUR * 2); // 2 hours

4. Replace it with this code:

::

  // Session live time
  define('SESSION_ALIVE_TIME', TIMEOUT_IN_SECONDS);

.. note::

    Replace **TIMEOUT_IN_SECONDS** with the desired timeout.

5. Save the file.
