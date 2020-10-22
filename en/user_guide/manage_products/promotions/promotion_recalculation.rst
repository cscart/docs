*********************************************************
How To: Disable Reapplying Promotions When Editing Orders
*********************************************************

.. note::

    New installations of CS-Cart/Multi-Vendor 4.5.1 are already configured to disable the reapplication of promotions. Only those who upgraded from earlier versions need to do it manually.

When you :doc:`edit an order </user_guide/orders/actions_on_orders/order_details>`, CS-Cart/Multi-Vendor reapplies :doc:`promotions <index>` to that order according to the current promotion rules:

* Disabled or non-existing promotions are removed from the order. 

* If the order is eligible for an active promotion that was created after the order had been placed, that promotion will be applied.

This behavior applies to all 4.x.x versions until 4.5.1. Starting with version 4.5.1, you can choose whether or not to reapply promotions when editing orders.

To disable reapplying promotions after you upgrade to version 4.5.1:

1. Go to the directory where your CS-Cart/Multi-Vendor is installed.

2. Open the **config.local.php** file.

3. Find the ``$config['tweaks']`` section in that file and add the following line there::

    'do_not_apply_promotions_on_order_update' => true,

   It should look like this among other lines::

     $config['tweaks'] = array (
         '...' => ...,
         '...' => ...,
         'do_not_apply_promotions_on_order_update' => true,
         '...' => ...,
         '...' => ...,
     );

4. Save your changes. After that, promotions won't be reapplied automatically when you edit an order. Old promotions will remain applied to the order.