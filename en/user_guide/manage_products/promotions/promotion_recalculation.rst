*********************************************************
How To: Disable Reapplying Promotions When Editing Orders
*********************************************************

To disable reapplying promotions after when :doc:`editing orders </user_guide/orders/actions_on_orders/order_details>`:

#. Go to the directory where your CS-Cart/Multi-Vendor is installed.

#. Open the **config.local.php** file.

#. Find the ``$config['tweaks']`` section in that file and add the following line there::

       'do_not_apply_promotions_on_order_update' => true,

   It should look like this among other lines::

       $config['tweaks'] = array (
           '...' => ...,
           '...' => ...,
           'do_not_apply_promotions_on_order_update' => true,
           '...' => ...,
           '...' => ...,
       );

#. Save your changes. After that, promotions won't be reapplied automatically when you edit an order. Old promotions will remain applied to the order.
