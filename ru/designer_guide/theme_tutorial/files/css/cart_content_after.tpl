 <div id="sw_dropdown_{$dropdown_id}" class="ty-dropdown-box__title cm-combination">
    <a href="{"checkout.cart"|fn_url}">
        {hook name="checkout:dropdown_title"}
            {if $smarty.session.cart.amount}
                <span class="ty-minicart-title"><i class="tt-icon-bag"></i><span class="ty-minicart-title__amount">{$smarty.session.cart.amount}</span></span>
                <span class="ty-minicart-title__price">{include file="common/price.tpl" value=$smarty.session.cart.display_subtotal}</span>
            {else}
                <span class="ty-minicart-title empty-cart"><i class="tt-icon-bag"></i></span>
            {/if}
        {/hook}
    </a>
</div>