***
CSS
***

LESS
****

Layout styles in CS-Cart are based on LESS. LESS is the CSS preprocessor that enlarges its possibilities. More information about LESS you can read at the official site: `http://lesscss.org/features/ <http://lesscss.org/features/>`_.

Not all the LESS possibilities are used in CS-Cart. Further we will describe what features are in use and why.

Variables
=========

This functionality gives an opportunity to create variables and use them to define property values in several places.

**Example:**

.. code-block:: none

	@price: #343434;

LESS variables in CS-Cart are related to the **Styles** concept (see the **Styles and Visual Editor** section further in this guide).

In the *design/themes/THEME_NAME/styles/data* directory of your CS-Cart installation there are the *less* files that contain the LESS variables related to Visual Editor (where THEME_NAME is the name of your theme). 

These values can be edited in a file or received with the Visual Editor after saving a style.

Values of the variables in the *.less* file of this directory can be edited only in the given file. For example, if the ``@price`` variable is defined in the **styles.less** file as well, this value will not work, because the variables values of the *.../styles/data/.less* file are included in the last turn.

Mixins
======

Mixins allow to include all the class properties in another class just including the class name as one of the properties value. This is like using variables but in regard to whole classes.

Mixins can behave like functions and take arguments as shown in the following example:

.. code-block:: none

	rounded-corners (@radius: 5px) {
 	border-radius: @radius;
 	-webkit-border-radius: @radius;
 	-moz-border-radius: @radius;
	}

	#header {
 	.rounded-corners;
	}
	#footer {
 	.rounded-corners(10px);
	}

The set of mixins from Bootstrap 2.3 is used in CS-Cart. They are stored in the **mixins.less** file that you can find in the *design/themes/responsive/css/tygh* directory. In this file there are the **utility** mixins and **component** mixins.

*	**Utility mixins** - simple mixins for specific usage.

*	**Component mixins**  - complex mixins that are used to form the grid.

Mixins allow to write less rules and are used for properties that have prefixs in browsers.


Operations
==========

With this functionality it is possible to use mathematical operations in rules: summation, subtraction, multiplication, and division.

Example:

.. code-block:: none

	width: (900 / @columns)px;


Functions
=========

LESS contains a set of functions for working with color, mathematical functions, functions for working with strings.

Operations that are used in Cs-cart:

*	``lighten(@color, 10%)`` - returns the color that is 10% lighter than the current color.

*	``darken(@color, 10%)`` - returns the color that is 10% darker than the current color.

These operations are related to Styles and Visual Editor. With one base color it is possible to change colors of other elements by making base color lighter or darker.

*	``percentage(0.5)`` - converts value to percents. Used while creating grid and columns.


Nested rules
============

With this functionality it is possible to inclose one rules in another. Nested rules are not often used in CS-Cart, as it complicates the rule working with developer tools in browsers. When looking for nested rules copied from developer tools, it is necessary to take into account a parent rule.

Other LESS possibilities you can learn at the official site: `http://lesscss.org/features/ <http://lesscss.org/features/>`_

Pay attention that not all of them work in CS-Cart.


Directories and files structure
*******************************

The path to a theme *css* directory is *design/themes/THEME_NAME*.

*	The *css/addons* directory - add-on styles.

*	The *css/lib* directory - side developers styles. There are the jquery library styles.

*	The *css/tygh* directory - supporting styles.

    *	*css/tygh/reset.less* - styles reset. `Normalize.css <https://github.com/necolas/normalize.css>`_ is used.
    *	*css/tygh/print.less* - styles for print.
    *	*ss/flags.less* - styles for showing countries flags.
    *	*css/design_mode.less* - styles that are used in templates and translation mode.
    *	*css/theme_editor.less* - styles that are used in Visual Editor.
    *	*css/grid.css* - language variables and mixins that are used to form the grid for the fixed layout.
    *	*css/mixins.less* - set of LESS mixins.

Styles that are used for the responsive layout:

*   *css/responsive-utilities.less* - bootstrap classes that are used to display or hide content for different screen resolutions.
*   *css/responsive.less* - styles that are used for different screen resolutions.

The main file is *styles.less*. It contains theme styles. Files that are stored in *css/tygh* are included in *styles.less* with the ``@import`` operator.

Style files (css and less) including order
******************************************

*	All the css files are included through *hooks: pre* (that are added by an add-on).

*	All the css files are included in the order as they are defined in the file: *design/themes/basic/templates/common/styles.tpl*

*	All the css files are included through *hooks: post* (that are added by an add-on).

*	All the less files are included through *hooks: pre* (that are added by an add-on).

*	All the less files are included in the order as they are defined in the file: *design/themes/basic/templates/common/styles.tpl*

*	All the less files are included through *hooks: post* (that are added by an add-on).

*	All the inline styles that are added to the *design/themes/basic/templates/common/styles.tpl* template with the ``<style></style>`` tag.

*	The preset less file is included.

*	All the styles added to the **Custom CSS** field in a Visual Editor.

Hooks including styles are processed in the order that is defined by *priority*.

All files are gathered in one css. This is done to cut the number of requests.

There is one inconvenience in searching for the style because of gathering all files in one - it is impossible to find the file and the line where a style is situated when using the dev tools.
