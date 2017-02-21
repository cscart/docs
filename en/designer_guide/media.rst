***********
Media files
***********

All media files in CS-Cart (i.e. images, fonts, flash) are stored in the following directory:

*design/themes/your_theme_name/media*

There is a separate images directory for e-mails:

*design/themes/your_theme_name/mail/media*

Directory structure
*******************

*	**images**

	*	**addons** - all images extended by your add-on are stored in the *addons/your_addon_name/* directory.
	*	**lib** -  images added by side libraries (jqueryui, for example).
	*	**icons** - icons and gif animation (spinner or pointers, for example).
	*	**patterns** - background images added with the Theme Editor.

*	**fonts** - icon fonts (see more information below).

.. _iconfonts:

Icon Fonts
**********

Icon fonts are widely used in CS-Cart. Icon font - a font every symbol of which is an icon.
Comparing with raster icons such approach has a number of benefits:

*	Icon fonts are displayed legible on all devices screens (including retina).
*	Icons are uploaded as one font file.
*	It is possible to choose icon size and color.
*	It is possible to apply modern CSS styles to an icon: shadows, transformations, and animation.

To make working with icons simple the `Icomoon <https://icomoon.io/>`_ service is used in CS-Cart. Further we will describe how to add and edit icons.

*	Go to `www.icomoon.io <https://icomoon.io/>`_.
*	Run the application clicking **IcoMoon App**.
*	Choose the desired icons and click the **Font** button below.

.. image:: img/icomoon.png
    :align: center
    :alt: Icomoon

*	Click the **Download** button below to download an archive.
*	Unpack an archive to the following directory of your CS-Cart installation: *design/themes/your_theme_name/media*.
*	Copy the contents of the *icomoon/fonts* directory to the *design/themes/your_theme_name/media/fonts* directory.
*	Rename the **style.css** in the *icomoon* directory to the **custom_icons.less** file and copy it to *design/themes/your_theme_name/css/tygh*.
*	Include the **custon_icons.less** file in the **styles.less** file with the ``@import`` directive:

.. code-block:: none

	@import "custom_icons.less";

*	Change the paths to the fonts and class names in the *tygh/custom_icons.less* file, if needed.

*	Now, to use these icons in your text, you just have to create the html element of this type: ``<i class="icon-user"></i>`` in the desired part of the text, where ``icon-user`` is the corresponding icon class.
