<div class="control-group {$no_hide_input_if_shared_product}">
    <label for="product_description_product" class="control-label cm-required">{__("name")}</label>
    <div class="controls">
        <input class="input-large" form="form" type="text" name="product_data[product]" id="product_description_product" size="55" value="{$product_data.product}" />
        {include file="buttons/update_for_all.tpl" display=$show_update_for_all object_id='product' name="update_all_vendors[product]"}
    </div>
</div>