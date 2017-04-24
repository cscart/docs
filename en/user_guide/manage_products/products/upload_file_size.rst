********************************************
How To: Change Maximum Size of Uploaded File
********************************************

To change the maximum size of a file that you can upload:

#. Go to the  root directory on your server.

#. Find and open the **php.ini** file.

#. Replace the following string:

   .. code-block:: none

       upload_max_filesize = 2M

   (2M stands for 2Mb)

   with this one:

   .. code-block:: none

       upload_max_filesize = 30M

#. Save your changes.

   .. note::

       If **php.ini** doesn't exist in the root directory of your server, you can create this file and add the line mentioned above. If adding this file doesn't help, it may be because this file isn't supported. In that case contact your hosting provider to set the maximum allowed size for the files uploaded to the server.
