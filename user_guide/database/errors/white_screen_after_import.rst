*************************************************************
White Screen after Importing/Exporting/Making Database Backup
*************************************************************

The problem may occur if your store has a lot of products and categories, or if the store database is too large. It takes lots of resources for the store to work correctly under such conditions. The time it takes to load the store depends on the server settings. 

You might want to increase some values of your PHP configuration: check the values of the **memory_limit**, **post_max_size**, **max_execution_time** and **default_socket_timeout** parameters of your PHP configuration:

 * In the administration panel, go to **Administration > Logs**.

 * Click the **gear button** and choose PHP information from the drop-down menu. A new page that displays the result of phpinfo PHP function will open.

 * Search for the **default_socket_timeout**, **post_max_size**, **memory_limit** and **max_execution_time** variables. Check the values below - your values shouldn't be smaller than the following ones:

::

  memory_limit - 256Mb;
  post_max_size - 32Mb;
  default_socket_timeout - 300sec;
  max_execution_time - 600sec.

If these values of your PHP configuration are smaller than above, ask your server administrator to increase the values to the ones specified.

If the provided information does not help you, please contact CS-Cart support team.
