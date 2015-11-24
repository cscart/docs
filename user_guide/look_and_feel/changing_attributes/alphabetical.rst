*******************************************************
How To: Display Wishlist Products in Alphabetical Order
*******************************************************

To do this for the storefront:

*   Open the **fn.cart.php** file located in the *app/functions* directory of your CS-Cart installation.
*   Find and replace the following part of code there:

.. code-block :: none

    $_prods = db_get_hash_array("SELECT * FROM ?:user_session_products WHERE" . $condition, 'item_id');

with this one:

.. code-block :: none

    $_prods = ($type == 'C') ? db_get_hash_array("SELECT * FROM ?:user_session_products WHERE user_id = ?i AND type = ?s AND user_type = ?s AND item_type IN (?a)", 'item_id', $user_id, $type, $user_type, $item_types) : db_get_hash_array("SELECT *, ?:product_descriptions.product FROM ?:user_session_products LEFT JOIN ?:product_descriptions ON ?:user_session_products.product_id = ?:product_descriptions.product_id AND ?:product_descriptions.lang_code = ?s WHERE ?:user_session_products.user_id = ?i AND ?:user_session_products.type = ?s AND ?:user_session_products.user_type = ?s AND ?:user_session_products.item_type IN (?a) ORDER BY ?:product_descriptions.product", 'item_id', CART_LANGUAGE, $user_id, $type, $user_type, $item_types);

*   Save the file.

.. note ::

	In order to see the changes you will need to re-log in to the store.