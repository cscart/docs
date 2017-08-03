**********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.6.2
**********************************************

==============
Common Changes
==============

#. `rus_taxes` - a new add-on was implemented to provide common tools for compliance with the Russian Federal Law 54. The add-on provides a service `Tygh::$app['addons.rus_taxes.receipt_factory']`, which creates a sales receipt based on the order data. You can use this service for creating receipts in your add-on.

#. `Tygh\Addons\RusOnlineCashRegister\ReceiptFactory` has been removed, please use `Tygh::$app['addons.rus_taxes.receipt_factory']`

============
Hook Changes
============

---------
New Hooks
---------

#. This hook is executed after the license agreements of the files of downloadable products are retrieved. The hook allows you to modify the list of license agreements::

     fn_set_hook('cart_agreements', $cart, $agreements);

#. This hook is executed after a file of a downloadable product is added or updated. The hook allows you to perform additional actions::

    fn_set_hook('update_product_file_post', $product_file, $file_id, $lang_code)

#. This hook is executed after the condition for the query has been formed. The hook allows you to modify the condition for the query::

    fn_set_hook('get_company_condition_post', $db_field, $add_and, $company_id, $show_admin, $force_condition_for_area_c, $cond)

#. This hook is executed after the list of items in the receipt is retrieved from the order. The hook allows you to modify the list of items in the receipt::

    fn_set_hook('create_receipt_from_order', $this, $order, $currency, $allocate_discount_by_unit, $items);

#. This hook is executed after the receipt has been generated from the order data. The hook allows you to modify the receipt::

    fn_set_hook('create_receipt_from_order_post', $this, $order, $currency, $allocate_discount_by_unit, $receipt);

#. This hook is executed after the data for a refund via Yandex.Checkout is prepared. The hook allows you to modify the order data::

    fn_set_hook('yandex_checkpoint_get_refunded_order', $order_info, $receipt);

-------------
Changed Hooks
-------------

```php
// old:
fn_set_hook('yandex_checkpoint_build_refunded_order_post', $refund_data, $order_info, $refunded_order_info);

// new:
fn_set_hook('yandex_checkpoint_build_refunded_order_post', $refund_data, $order_info, $currency, $receipt);
```

-------------
Removed Hooks
-------------

* `fn_set_hook('yandex_checkpoint_get_receipt_after_items', $order, $currency, $extra, $items);`
* `fn_set_hook('yandex_checkpoint_get_receipt_post', $order, $currency, $extra, $receipt);`
* `fn_set_hook('yandex_checkpoint_apply_discounts', $order, $apply_discount_remainder, $order_cost, $discount);`
* `fn_set_hook('yandex_checkpoint_apply_discounts_after_order', $order, $apply_discount_remainder, $order_cost, $discount, $discount_remainder);`

==============
Core Functions
==============

-------------
New Functions
-------------

#. Provides editable settings' edition types::

    Settings::getEditableSettingsEditionTypes($use_access_level = true)

#. Prepares the array of data of the product that is being changed in cart or in the order, and returns the template of the product with the product data. The function is used only in controllers::

    fn_get_data_of_changed_product($params, $auth, $mode)

#. Gets the data about the product's stock and options based on the passed data of the product that is being changed in cart or in the order. The function is used only in controllers::

    fn_get_additional_product_data($product_data, $auth)

#. Updates the image of the product in the product list template. The function is used only in controllers::

    fn_update_product_image_in_template($params)

#. Gets the product data depending on the newly-selected options, and records the data in the $cart session array. The function is used only in controllers::

    fn_get_product_options_data($cart_products, $cart)

#. Changes the product data in the $cart array. The function is used only in controllers::

    fn_change_product_data_in_cart($cart_products, $cart)

-----------------
Changed Functions
-----------------

```php
// old:
function fn_yandex_checkpoint_get_receipt($order, $currency, $extra = array())

// new:
function fn_yandex_checkpoint_get_receipt($order, $currency)
```

```php
// old:
function fn_sdek_get_product_data($sdek_products, $data_product, $order_info, $shipment_id, $amount, $symbol_grams)

// new:
function fn_sdek_get_product_data($sdek_products, $data_product, $order_info, $shipment_id, $amount, $symbol_grams, ReceiptItem $receipt_item)
```

-----------------
Removed Functions
-----------------

* `Tygh\Enum\YandexCheckpointVatTypes::getForPriceExcluded`
* `Tygh\Enum\YandexCheckpointVatTypes::getForPriceIncluded`
* `Tygh\Enum\YandexCheckpointVatTypes::getWithDescriptions`
* `fn_get_yandex_checkpoint_tax_type`
* `fn_yandex_checkpoint_apply_taxes`
* `fn_yandex_checkpoint_build_refunded_order`
* `fn_yandex_checkpoint_apply_discounts`
