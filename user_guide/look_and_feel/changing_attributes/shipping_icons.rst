******************************************************
How To: Display Shipping Method Icons on Checkout Page
******************************************************

.. warning::

    The changes suggested in this article may conflict with the add-ons that use the same hook.

=======================
Step 1. Override a Hook
=======================

1.1. In the root directory of your CS-Cart installation, create the following directory path: */design/themes/[CURRENT_THEME_NAME]/templates/addons/my_changes/hooks/checkout*.

   .. important ::

       Make sure that the **My changes** add-on is installed and activated in the **Add-ons → Manage add-ons** section of the Administration panel.

1.2. Depending on your version of CS-Cart/Multi-Vendor, download one of the **shipping_method.override.tpl** files:

     * :download:`For 4.3.5 <files/up_to_435/shipping_method.override.tpl>` (and for earlier versions)

     * :download:`For 4.3.6 <files/436/shipping_method.override.tpl>`

     * :download:`For 4.3.7 <files/437_and_up/shipping_method.override.tpl>` (and for newer versions)

1.3. Put the downloaded file into the directory that you created in step 1.1.

By default, the width and height of a shipping method icon equal 100. To change that, open the the **shipping_method.override.tpl** file and edit the values of ``image_width`` and ``image_height``.

--------------------------------
Compatibility with Other Add-ons
--------------------------------

If an add-on doesn't work properly after you apply these changes, it may be because it uses the same hook. In that case try to find **shipping_method.post.tpl** in */design/themes/[CURRENT_THEME_NAME]/templates/addons/[addon_name]/hooks/checkout*. If you find that file, copy its content to the end of **shipping_method.override.tpl** that you added to **My changes** in step 1.3.

====================================
Step 2. Upload Shipping Method Icons
====================================

2.1. In the Administration panel of your store, go to **Administration → Shipping & Taxes → Shipping Methods**.

2.2. Click the gear button of the necessary shipping method, and choose **Edit**.

2.3. Upload an image in the **Icon** section in the opened page.

2.4. Click **Save and close**.

Now icons should appear next to the names of shipping methods on the checkout page.

.. note ::

    If you followed all the instructions in the article and shippings icon haven't appeared, try :doc:`clearing the template cache. <../../../developer_guide/getting_started/cache_clearing>`

.. image:: img/shipping_icon.png
    :align: center
    :alt: Icon for shipping method at checkout in CS-Cart.
