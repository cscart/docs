***********************************
Dynamic Objects—dynamic_objects.php
***********************************

Any object that can have different content and statuses for blocks on its detailed page is considered a **dynamic object** in the block manager.

There are 5 default types of dynamic objects: **Products**, **Pages**, **Categories**, **Vendors**, and **News**.

.. important::

    **Vendors** are available only in **Multi-Vendor**.

========================
Why Use Dynamic Objects?
========================

Let’s use **Products** as an example: other dynamic objects work the same way.

If you change the content of the block on the product editing page, it will only save for that product. When you edit the content of the block, below you will see, where the content has been changed. You will also see an additional checkbox, that you can tick to apply your changed content globally.

If you enable or disable the block on the editing page of the product, the state of the block will only be saved for that product.

In the block manager, when you edit any block at the location with ``dispatch=products.view``, you can use the **Status** tab to enable/disable the block for specific products, even if it is disabled or enabled globally.

============================
How Do Dynamic Objects Work?
============================

A dynamic object is created automatically, when you describe the object in **dynamic_objects.php**. You can add any new object to the dynamic_objects schema. 
Here’s the description of products:

::

  array(
      // The name of the dynamic object; the name will be used as object_type
      'products' => array (
          // The editing page of the dynamic object; this is the page where the Block tabs should show up in the admin panel.
          'admin_dispatch' => 'products.update',
          // The address of the page in the customer zone and the block control pane, where you can work with the dynamic object.
          'customer_dispatch' => 'products.view',
          // A key from the $_REQUEST array, that defines the identifier of the object.
          'key' => 'product_id',
          // The settings of the picker that will be used in the administration area of the store.
          'picker' => 'pickers/products/picker.tpl',
          'picker_params' => array (
              'type' => 'links',
          ),
      ),
  )

When a customer requests a page with ``dispatch=products.view``, the store determines that the page belongs to the **products** dynamic object and looks for a ``product_id`` in the parameters that were passed to the script. If there is a ``product_id``, all the data to generate the page will be requested through the blocks API, the type and identifier specified.

If the key parameter or the type of the block couldn’t be determined by the ``dispatch``, the data will be generated with global parameters, and without a dynamic object.
