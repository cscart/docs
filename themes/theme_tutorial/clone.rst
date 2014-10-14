***************
Cloning a theme
***************

To create a new theme, first of all clone a basic CS-Cart theme.

To clone a theme, go to the *design/themes* directory of your CS-Cart installation and make a copy of a directory containing a basic theme. In our example it is the *responsive* directory. Rename the copied directory to *tutorial_theme*, for example.

Theme information is stored in the *manifest.json* file.

Open the newly created *tutorial_theme* directory and find the *manifest.json* file there. In the **title** field write *Tutorial theme*. In the **description** field write something like *Tutorial Theme especially designed for this tutorial*.

The paths to a theme logo and favicon are also defined in the *manifest.json* file.

Go to the following directories to replace a logo and favicon for the new theme: *tutorial_theme/media/images* (a logo - *cart.png*) and *tutorial_theme/media/images/icons* (a favicon - *favicon.ico*).

.. code-block:: none

	manifest.json
	{
    	"title": "Tutorial theme",
    	"description": "Tutorial Theme especially designed for this tutorials.",
    	"logo": "media/images/cart.png",
    	"developer": "Simtech",
    	"favicon": "media/images/icons/favicon.ico",
    	"parent_theme": "responsive"
	}

Save the file.

After cloning a theme and adding its information you should activate it in the administration panel.

To do it, go to the **Design > Themes** section and click **Activate** on the **Tutorial theme: Modern** style.

