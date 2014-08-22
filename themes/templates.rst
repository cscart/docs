*********
Templates
*********

Templator
*********

Cs-cart uses the **Smarty 3** template engine. It allows to separate presentation and application code. More information about how it works you can read at the `http://www.smarty.net/ <http://www.smarty.net/>`_ site.

`This <http://www.smarty.net/docs/en/smarty.for.designers.tpl>`_ chapter will be particulary interesting for the developers. There you will find out what constructions can be used in templates.

Templates structure
*******************

Templates are stored in the theme *templates* directory. It has the following structure:

*	The **addons** directory - add-ons templates. :ref:`Further <templates-addons>` you can read more information.

*	The **blocks** directory - templates used in the Layout and in block settings. These are *template* and *wrapper* that can be defined for a block. :ref:`Further <templates-blocks>` you can read more information.

*	The **buttons** directory - buttons templates. Templates are sorted according to the buttons role.

*	The **common** directory - templates with the common functionality for different pages.

	For example, templates for breadcrumbs, calendar, or pagination.

*	The **pickers** directory - templates of the dialogs with the ability of adding products and categories.

*	The **views** directory - templates for the controllers. :ref:`Further <templates-views>` you can read more information.

*	The **404.tpl** file - a template for the 404 page.

*	The **demo_theme_selector.tpl** file - a template for the **Visual editor**.

*	The **index.tpl** file - the main template file. It contains:

	*	*DOCTYPE* - the required element. Using *<!DOCTYPE html>* is recommended.
	*	Title - page title.
	*	Connection of the *meta.tpl* file.
	*	Connection of the *common/styles.tpl* file.
	*	Connection of the *common/scripts.tpl* file.
	*	Connection of Visual editor, demo panel, translate and template mode, if they are active.

*	The *meta.tpl* file - site meta information: description, keywords, viewport, etc.

.. _templates-addons:

Add-on templates
****************

Templates for the add-ons are stored in the *templates/addons* directory.

Add-on templates structure
++++++++++++++++++++++++++

*	The **blocks** directory - add-on blocks templates. You can choose the desired template in block settings.

In the *blocks/product_tabs* directory add-on templates for product tabs are stored.

*	The **hooks** directory - templates that use hooks.

*	The **views** directory - templates that are added in a page.

In the add-on directory there also can be other directories and files that are necessary for the add-on correct work. Such as the **providers** directory in the **Social Buttons** add-on.

.. _templates-blocks:

Blocks templates
****************

Blocks templates are stored in the *templates/blocks* directory. Depending on a block role different templates can be applied to it. Template applications are defined in the *app/schemas/block_manager/blocks.php* file.

For example, for the categories block:

	*'templates' => 'blocks/categories'*

That means that it is possible to apply all templates from the *blocks/categories* directory.

File name depends on the language variable that is formed as follows:

*	If the file code has the following part: *{\ *\ *\ block-description:name_of_template \ *\ *\ }*, then the **name_of_template** name is used.

*	If there is no such construction in the file, the language variable is formed based on the template file name.

.. _templates-views:

Views templates
***************

The `Model-View-Controller <http://en.wikipedia.org/wiki/Model-view-controller>`_ (MVC) architectural pattern is used in CS-Cart.

The *views* directory contains templates for site pages. Directories that are placed in the *views* directory define controllers to be addressed to.

Files that are stored in directories define mode.

Also there are the *components* directories inside the directories that define controllers.
Templates that are stored there perform additional functionality that is added with the help of **include** in files.

Lets see how to define a template that is used on the following page: */index.php?dispatch=categories.view&category_id=166*

*	**categories** - controller that is referred to for receiving data. We need the category data, so, we take the *categories* directory in the *views* directory.

*	**view** - defines what we have to do. In this example we need to show products belonging to the category. So, we need the *view.tpl* file.

*	**category_id** - id of the category that we want to show.