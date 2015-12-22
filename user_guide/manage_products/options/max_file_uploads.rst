*************************************************************
Can't Upload More Than Some Specific Number of Images at Once
*************************************************************

If you cannot upload more than some specific number of images at once for product options or product options combinations, your version of PHP may have a feature that sets a limit on the number of files that can be uploaded at once. That feature is called **max_file_uploads**.

.. note

    You can find this feature in the **PHP Core** section by following this link: http://your_domain_name.com/admin.php?dispatch=tools.phpinfo

The defailt value of the **max_file_uploads** field is **20**. It means that the administrator of the store can upload no more than twenty images at the same time for product options, and no more than ten images at the same time for product options combinations (one additional thumbnail and one larger pop-up image of additional thumbnail).

To resolve the issue, increase the value of the **max_file_uploads** setting on your server.
