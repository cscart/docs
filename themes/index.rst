*****************
Theme Development
*****************

Glossary
********

*	**CSS styles** - `Cascading Style Sheets <http://en.wikipedia.org/wiki/Cascading_Style_Sheets>`_
*	**Styles** (ex. presets) - CSS attribute values related to CSS styles. These values can be changed with the **Visual editor**.
*	**Visual editor** (ex. Theme editor) - tool that helps to change certain design elements appearance.
*	**Templates** - template files (*.tpl*) based on the Smarty templater.
*	**Media** -  images, icons, fonts.
*	**Layout** -  contents and the layout scheme of the customer area blocks.
*	**Location** - defines the certain page appearance.
*	**Container** - area of the **Layout** for adding grids. There are 4 container types: top panel, header, content, and footer.
*	**Grid** -  a grid element. 

Theme structure
***************

A theme contains the set of files defining the store appearance. It consists of templates, CSS styles, media content, layout scheme, and the customer area blocks content. Also, a theme can contain the so called **Styles**.

.. image:: img/themes.png
    :align: center
    :alt: Themes

Themes in CS-Cart are stored in the *design/themes/* directory. In CS-Cart version 4.2 the **Responsive** theme is the default.

A theme structure consists of 6 directories and 2 service files: 

	*	The **Layout** directory - contains the appearance structure *.xml* files. Further you can read more about Layout.

	*	The **Styles** directory - contains files including *.less* variables and the Visual Editor elements structure.

	*	The **Templates** directory - contains templates (the *.tpl* files).

	*	The **CSS** directory - contains the theme styles in the *.less* and *.css* files.

	*	The **Media** directory - contains fonts, icons, and images for a theme.

	*	The **customer_screenshot.png** image - the theme preview. It is shown in the *Design > Themes* section of the administration panel.

	*	The **manifest.json** file - contains the theme information.

manifest.json
*************

This file contains the main theme information and has the following components:

	*	``title`` - the theme name that is used in the *Design > Themes* section of the administration panel in the theme information and header.
	*	``description`` - short theme description.
	*	``theme`` - path to a site logo. It is better to keep a logo in the theme *media/images* directory.
	*	``developer`` - company name. If there is an individual developer, write his name. This information is shown in the *Design > Themes* section of the administration panel in the theme information.
	*	``favicon`` - path to a theme favicon. It is better to keep a favicon in the theme *media/images/icons* directory.
	*	``parent_theme`` - parent theme name. If you develop a theme based on the Responsive theme, write *responsive*. If you define something different in this field or leave it empty, add-on templates will not be uploaded for the theme.

Your theme must inherit from one of two built-in themes: Basic or Responsive. You must set one of these in the ``parent_theme`` param.
Select the parent theme based on your needs: if you are developing a responsive theme, set ``parent_theme`` to ``responsive``, if you are developing a fixed-width theme, set ``parent_theme`` to ``basic``.

It is not necessary to use all the theme files when creating a new theme. When installing a theme, all the necessary files are copied from the default theme. The ``parent_theme`` parameter in the **manifest.json** file defines a theme from which files are taken.

.. note::

	If there is no such parameter in the **manifest.json** file (in old themes based on the Basic theme), the default theme is defined by the ``$config['base_theme']`` setting. By default it has the *basic* value. That is why for the themes based on Responsive it is necessary to define this parameter.

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    *