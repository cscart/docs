*********
TPL Hooks
*********

TPL or template hooks are parts of a template enclosed in the tags:

	.. code-block:: smarty

	    {hook name="section:hook_name"}
	    ...
	    {/hook}

that can be supplemented or completely redefined by any add-on.

What a TPL Hook Looks Like in a Template
========================================

This is an example of a template hook from the file *skins/basic/admin/views/order_management/totals.tpl*:

	.. code-block:: smarty

	    {hook name="order_management:product_info"}
		   {if $cp.product_code}
			  <p>{$lang.sku}:&nbsp;{$cp.product_code}</p>
		   {/if}
	    {/hook}

 
When TPL Hooks Are Used
=======================

TPL hooks are used to show additional data in an existing template. For example, if an add-on collects some data that should be shown in the store administration panel in a separate block, this block can be added using a TPL hook.

.. Such a use case is described in the :doc:`Advanced Add-on Tutorial <>`. (add a link)

How to Use a TPL Hook
=====================
Unlike PHP hooks, template hooks should not be declared explicitly. A proper file naming and placing will do the trick.

The naming algorithm is as follows:

*skins/[skin name]/[admin|customer]/addons/[addon id]/hooks/[template name]/[hook name].[pre|post].tpl*

.. Then again, an example of practical usage of a TPL hook is given in the :doc:`Advanced Add-on Tutorial <>`. (add a link)