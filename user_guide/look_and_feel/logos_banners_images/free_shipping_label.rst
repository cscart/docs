***********************************************************
How To: Display Free Shipping Label on Product Details Page
***********************************************************

To display an appropriate label on a product details page when it has the **Free shipping** option enabled:

*   In the root directory of your CS-Cart installation, create the following directories path:
    *design/themes/[CUSTOMER_ACTIVE_THEME]/templates/addons/my_changes/hooks/products*, where [CUSTOMER_ACTIVE_THEME] is an active theme of your storefront.

    .. important ::

        Make sure that the **My changes** add-on is installed and activated in the **Add-ons → Manage add-ons** section of the Administration panel.

*   In the created CS-Cart directory, create the **view_main_info.post.tpl** file with the following content:

If you want to display a text label, use this code:

.. code-block:: none

    {if $product.free_shipping == 'Y'}
        <script type="text/javascript">
            $('<div class="free-shipping-label">Free shipping</div>').insertAfter('.price-wrap');
        </script>
    {/if}

If you want to display an image, use this one instead:

.. code-block:: none

    {if $product.free_shipping == 'Y'}
        <script type="text/javascript">
            $('<div class="free-shipping-label"><img src="{$images_dir}/addons/my_changes/free_shipping_label.png"/></div>').insertAfter('.price-wrap');
        </script>
    {/if}

In this case, the image file name should be **free_shipping_label.png**. Upload the image to the *design/themes/[CUSTOMER_ACTIVE_THEME]/media/images/addons/my_changes* directory of your CS-Cart installation, where [CUSTOMER_ACTIVE_THEME] is an active theme of your storefront. 

.. note ::

    If the applied changes are not displayed, try clearing the template cache. To do it, in the Administration panel of your store, go to **Administration → Storage → Clear cache**.