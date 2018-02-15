*********************************************
How To: Reverse the Word Order of Breadcrumbs
*********************************************

*   In the *design/themes/[YOUR_ACTIVE_THEME]/templates/common* directory of your CS-Cart installation, open the **breadcrumbs.tpl** file.
*   Replace all its code with this one:

.. code-block:: none

    <div id="breadcrumbs_{$block.block_id}">

    {if $breadcrumbs && $breadcrumbs|@sizeof > 1}
    	<div class="breadcrumbs clearfix">
    		{strip}
    			{section loop=$breadcrumbs name="bc" step=-1}
    				{if !$smarty.section.bc.first}
    					<i class="icon-right-open-thin"></i>
    					<span class="ty-breadcrumbs__slash">/</span>
    				{/if}		
    				{if $breadcrumbs[bc].link}
    					<a href="{$breadcrumbs[bc].link|fn_url}"{if $additional_class} class="{$additional_class}"{/if}{if $bc.nofollow} rel="nofollow"{/if}>{$breadcrumbs[bc].title|strip_tags|escape:"html" nofilter}</a>
    				{else}
    					<span>{$breadcrumbs[bc].title|strip_tags|escape:"html" nofilter}&nbsp;</span>
    				{/if}
    			{/section}
    		{/strip}
    	</div>
    {/if}

    <!--breadcrumbs_{$block.block_id}--></div>

*   Save the file.

.. note ::

	If you have made changes in a template but they are not displayed, please try clearing the template cache. In order to do it, in the Administration panel of your store go to **Administration → Storage → Clear cache**.
