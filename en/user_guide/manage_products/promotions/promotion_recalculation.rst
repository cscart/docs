***********************************************************
How To: Disable Promotion Recalculation When Editing Orders
***********************************************************

.. important::

    The instructions from this article apply only to **CS-Cart/Multi-Vendor 4.5.1 and newer versions**.

When you :doc:`edit an order </user_guide/orders/actions_on_orders/order_details>`, CS-Cart/Multi-Vendor recalculates :doc:`promotions <index>` for that order according to the current promotion rules. This behavior applies to all 4.x.x versions until 4.5.1.

Starting with CS-Cart/Multi-Vendor 4.5.1, you can choose whether or not to allow automatic promotion recalculation during order editing. This behavior is determined by the **config.local.php** file located in the directory where your store is installed. 

============================
When You Install a New 4.5.1
============================

When you install CS-Cart/Multi-Vendor 4.5.1 or a newer version, its **config.local.php** will already include this tweak::

  'do_not_apply_promotions_on_order_update' => true,

It means that promotions won't be recalculated automatically when you edit an order. Old promotions will remain in the order as they were.

=========================
When You Upgrade to 4.5.1
=========================

When you upgrade to CS-Cart/Multi-Vendor 4.5.1 from an earlier version, the **config.local.php** won't include the tweak. This is done to make sure that the behavior wouldn't change during the upgrade without you knowing about it.

Promotions will still be recalculated automatically: disabled or non-existing promotions will be removed from the order. If the order is eligible for a promotion that was added after the order was originally placed, that promotion will be applied to the order during editing.

To disable automatic promotion recalculation, open **config.local.php** and copy the tweak from above to the ``$config['tweaks']`` section. Here is how it should look among other tweaks::

  $config['tweaks'] = array (
      '...' => ...,
      'do_not_apply_promotions_on_order_update' => true,
      '...' => ...,
  );
