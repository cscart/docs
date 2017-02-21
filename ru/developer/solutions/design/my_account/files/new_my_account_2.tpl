{** block-description:my_block_track_orders **}

<div class="ty-account-info__orders updates-wrapper track-orders" id="track_orders_block_{$block.snapping_id}">
    <form action="{""|fn_url}" method="get" class="cm-ajax cm-ajax-full-render" name="track_order_quick">
        <input type="hidden" name="result_ids" value="track_orders_block_*" />
        <input type="hidden" name="return_url" value="{$smarty.request.return_url|default:$config.current_url}" />

        <div class="ty-account-info__orders-txt">{__("track_my_order")}</div>

        <div class="ty-account-info__orders-input ty-control-group ty-input-append">
            <label for="track_order_item{$block.snapping_id}" class="cm-required hidden">{__("track_my_order")}</label>
            <input type="text" size="20" class="ty-input-text cm-hint" id="track_order_item{$block.snapping_id}" name="track_data" value="{__("order_id")}{if !$auth.user_id}/{__("email")}{/if}" />
            {include file="buttons/go.tpl" but_name="orders.track_request" alt=__("go")}
            {include file="common/image_verification.tpl" option="use_for_track_orders" align="left" sidebox=true}
        </div>
    </form>
<!--track_orders_block_{$block.snapping_id}--></div>
