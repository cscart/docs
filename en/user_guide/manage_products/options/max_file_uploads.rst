*************************************************************
Can't Upload More Than Some Specific Number of Images at Once
*************************************************************

If you cannot upload more than some specific number of images at once for product options or option combinations, then it may be because of a PHP setting that limits the number of files that can be uploaded at once. That setting is called **max_file_uploads**.

.. note

    You can find this setting in the **Core** section by following this link: *http://your_domain_name.com/admin.php?dispatch=tools.phpinfo*

The default value of **max_file_uploads** is **20**. It means that the administrator of the store can upload no more than twenty images at the same time for product options, and no more than ten images at the same time for option combinations (one additional thumbnail and one larger image).

To resolve the issue, increase the value of the **max_file_uploads** setting on your server.
