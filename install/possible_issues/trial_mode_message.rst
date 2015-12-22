*******************************
Your Store Is in the Trial Mode
*******************************

If CS-Cart cannot receive a confirmation from our server, that you use a CS-Cart installation legally, you'll see a pop-up window in the administration panel of your store:

.. note::

    Your store is in the Trial mode.
    When the 30-day trial period is over, the Free mode will be activated automatically.
    In order to keep the full access to all features after the trial period is over and permanently dismiss this message, purchase a license and activate the Full mode.

To resolve the issue, follow the instructions:

1. Check if you have specified a correct license number on the **Settings → Licensing** mode page in your CS-Cart admin panel.

2. If correct data is specified on this page and the message still appears, try logging out from your CS-Cart admin panel, clearing the browser cache (usually you can do it by pressing **Ctrl+R**) and logging in to the admin panel again.

.. note::

    Please make sure that the **allow_url_fopen** PHP configuration directive is enabled on your server. This directive allows proper operation of the **file_get_contents** function, so that you can receive the response from our server, confirming that you use a CS-Cart installation legally.

3. If the previous steps haven't solved the issue, submit a ticket on the **Communication** page in our `Help Desk <http://cs-cart.com/helpdesk>`_ and provide temporary FTP access to your server for us to investigate the problem.


