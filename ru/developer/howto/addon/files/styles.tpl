{styles use_scheme=true reflect_less=$reflect_less}
{hook name="index:styles"}

    {style src="styles.less"}
    {style src="tygh/responsive.less"}
    
    {* Translation mode *}
    {if $runtime.customization_mode.translation || $runtime.customization_mode.design}
        {style src="tygh/design_mode.less"}
    {/if}

    {* Theme editor mode *}
    {if $runtime.customization_mode.theme_editor}
        {style src="tygh/theme_editor.less"}
    {/if}
{/hook}
{/styles}