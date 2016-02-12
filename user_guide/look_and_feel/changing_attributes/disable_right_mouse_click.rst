***************************************************
How To: Disable Right Mouse Click to Protect Images
***************************************************

Most browsers allow users to copy any image from a web page by clicking on the image with the right mouse button and choosing the corresponding action from the list. If you don't want the visitors of your store to copy and save images, you can disable the right mouse click in your store.

.. note::

    Disabling the right mouse click doesn't guarantee full protection of your images, it simply creates an additional deterrent. There are many other ways to copy an image from a web page. For example, a visitor can simply save the web page, and all images on that page will be saved on the visitor's computer.

To disable the right mouse click in your store, complete the following steps:

* Go to the */design/themes/<Your Active Theme>/templates* directory of your CS-Cart installation.

.. note::

    Remember to replace **<Your Active Theme>** in the path with the name of the folder with your current theme, for example, **responsive**.

* Open the **index.tpl** file.

* Find this line:

.. code-block:: html

    <body>

* Replace it with this line:

.. code-block:: html

    <body oncontextmenu="return false">

* Save the file.

.. note::

    If the change doesn't work, try clearing the cache of your store: remove the **cache** directory located in the **var** directory of your CS-Cart installation.