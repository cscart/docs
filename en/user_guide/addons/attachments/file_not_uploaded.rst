******************************
If the File Cannot Be Uploaded
******************************

*   `Check permissions <http://docs.cs-cart.com/4.4.x/install/useful_info/permissions.html>`_ for the uploading file. It should have *readable* permissions for all users. Set up the correct permissions if needed.
*   `Check permissions <http://docs.cs-cart.com/4.4.x/install/useful_info/permissions.html>`_ for the *var/attachments* directory of your CS-Cart installation. It should have *writable* permissions for all users. Set up the correct permissions if needed.
*   Check the maximum size of the uploaded file on your server:

    *   In the Administration panel, go to **Administration → Logs**.
    *   Click the **gear** button and choose **PHP information** from the drop-down menu. A new page that displays the result of **phpinfo** PHP function will open.
    *   Search for the ``upload_max_filesize`` variable. The value of this variable defines the maximum size of the file which can be uploaded through PHP script on your server.

    .. note ::

        For example, 5M means 5 Mb.

If the ``upload_max_filesize`` value is less than the size of the file you would like to upload:

*   Replace the following line of the code in the **php.ini** file in the root directory on your server:

.. code-block :: none 

    upload_max_filesize = 5M

with this one:

.. code-block :: none

    upload_max_filesize = 30M

*   Save the file. If you do not have this file you can create it.

.. important ::

	**php.ini** files are not supported on some servers. In this case contact your server administrator and ask him to increase the value of the ``upload_max_filesize`` PHP variable for your account.
