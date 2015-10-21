********************************************
How To: Change Maximum Size of Uploaded File
********************************************

To change the maximum size of a file:

In the *php.ini* file of the root directory on your server, replace the following string:

.. code-block:: none

	upload_max_filesize = 2M

(2M stands for 2Mb)

with this one:

.. code-block:: none

	upload_max_filesize = 30M

If there is no such file, you can create it. If it is not supported there, you should contact your hosting provider to set the maximum size available for the files uploaded to the server.
