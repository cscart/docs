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

This is an example of a template hook from the *design/backend/templates/views/order_management/components/totals.tpl* file:

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

* Administration panel: *design/backend/templates/addons/[addon id]/hooks/[template name]/[hook name].[pre|post|override].tpl*

* Customer area: *design/themes/[theme name]/templates/addons/[addon id]/hooks/[template name]/[hook name].[pre|post|override].tpl*

.. Then again, an example of practical usage of a TPL hook is given in the :doc:`Advanced Add-on Tutorial <>`. (add a link)

How to override a template
==========================

It is possible to fully override a template in an add-on. To do it:

* Go to *design/backend/templates/addons/[addon id]* (for the administration panel) or *design/themes/[theme name]/templates/addons/[addon id]* (for the customer area) and create the *overrides* directory there.

* In this *overrides* directory create a template with the path identical to the path that it had relatively to the *templates* directory.

For example, the *design/backend/templates/addons/[addon id]/overrides/views/index/index.tpl* file will fully override the following template: *design/backend/templates/views/index/index.tpl*
