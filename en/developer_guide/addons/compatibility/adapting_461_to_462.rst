**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.6.2
**********************************************

=========
New Hooks
=========

#. This hook is executed after the license agreements of the files of downloadable products are retrieved. The hook allows you to modify the list of license agreements::

     fn_set_hook('cart_agreements', $cart, $agreements);

#. This hook is executed after a file of a downloadable product is added or updated. The hook allows you to perform additional actions::

    fn_set_hook('update_product_file_post', $product_file, $file_id, $lang_code) 
