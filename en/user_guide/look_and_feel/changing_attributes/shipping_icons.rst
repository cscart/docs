******************************************************
How To: Display Shipping Method Icons on Checkout Page
******************************************************

.. warning::

    The changes suggested in this article may conflict with the add-ons that use the same hook. 

.. important::

    The code and the file provided in this article work only in **CS-Cart/Multi-Vendor 4.3.7 and newer versions**. To find instructions for older versions, please refer to `this article. <http://docs.cs-cart.com/4.3.x/user_guide/look_and_feel/changing_attributes/shipping_icons.html>`_

=======================
Step 1. Override a Hook
=======================

1.1. In the root directory of your CS-Cart installation, create the following directory path: */design/themes/[CURRENT_THEME_NAME]/templates/addons/my_changes/hooks/checkout*.

     .. important ::

         Make sure that the **My changes** add-on is installed and activated in the **Add-ons → Manage add-ons** section of the Administration panel.

1.2. In this directory create the **shipping_method.override.tpl** file with the following content:

     .. code-block:: html+smarty
   
         {assign var="shipping_image_pair" value=$shipping.shipping_id|fn_get_image_pairs:shipping:M}

         <p class="ty-shipping-options__method">
             <input type="radio" class="ty-valign" id="sh_{$group_key}_{$shipping.shipping_id}" name="shipping_ids[{$group_key}]" value="{$shipping.shipping_id}" onclick="fn_calculate_total_shipping_cost();" {$checked} />
             <label for="sh_{$group_key}_{$shipping.shipping_id}" class="ty-valign">
                 {if $shipping_image_pair}
                     {include file="common/image.tpl" obj_id=$shipping_id images=$shipping_image_pair image_width=100 image_height=100}
                 {/if}
                 {$shipping.shipping} {$delivery_time} - {$rate nofilter}
             </label>
         </p>
         {if $shipping.description}
             <div class="ty-checkout__shipping-tips">
                 <p>{$shipping.description nofilter}</p>
             </div>
         {/if}

As an alternative, you can :download:`download this file <files/shipping_method.override.tpl>` and put it into the directory you created in step 1.1.

.. note::

    In this example the shipping method icon width is 100 and its height is 100 too. If you want to define another width and height, type your own numbers for the ``image_width`` and ``image_height`` parameters.

--------------------------------
Compatibility with Other Add-ons
--------------------------------

If an add-on doesn't work properly after you apply these changes, it may be because it uses the same hook. In that case try to find **shipping_method.post.tpl** in */design/themes/[CURRENT_THEME_NAME]/templates/addons/[addon_name]/hooks/checkout*. If you find that file, copy its content to the end of the **shipping_method.override.tpl** file from step 1.

====================================
Step 2. Upload Shipping Method Icons
====================================

2.1. In the Administration panel of your store, go to **Administration → Shipping & Taxes → Shipping Methods**.

2.2. Click the gear button of the necessary shipping method, and choose **Edit**.

2.3. Upload an image in the **Icon** section in the opened page.

2.4. Click **Save and close**.

Now icons should appear next to the names of shipping methods on the checkout page.

.. note ::

    If you followed all the instructions in the article, and the shipping icons haven’t appeared, try :doc:`clearing the template cache. <../../../developer_guide/getting_started/cache_clearing>`

.. image:: img/shipping_icon.png
    :align: center
    :alt: Icon for shipping method at checkout in CS-Cart.
