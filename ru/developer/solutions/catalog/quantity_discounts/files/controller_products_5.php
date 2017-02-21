/**
 * Gets full product data by its id
 *
 * @param int $product_id Product ID
 * @param mixed $auth Array with authorization data
 * @param string $lang_code 2 letters language code
 * @param string $field_list List of fields for retrieving
 * @param boolean $get_add_pairs Get additional images
 * @param boolean $get_main_pair Get main images
 * @param boolean $get_taxes Get taxes
 * @param boolean $get_qty_discounts Get quantity discounts
 * @param boolean $preview Is product previewed by admin
 * @param boolean $features Get product features
 * @param boolean $skip_company_condition Skip company condition and retrieve product data for displayin on other store page. (Works only in ULT)
 * @return mixed Array with product data
 */
function fn_get_product_data($product_id, &$auth, $lang_code = CART_LANGUAGE, $field_list = '', $get_add_pairs = true, $get_main_pair = true, $get_taxes = true, $get_qty_discounts = false, $preview = false, $features = true, $skip_company_condition = false, $feature_variants_selected_only = false)
