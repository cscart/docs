**********************************************************
How to Adapt an Add-on to Work with Responsive Admin Panel
**********************************************************

Clients asked us for a way to manage a CS-Cart store from mobile devices. That's why we introduced the **Responsive Admin Panel [Beta]** add-on in version 4.7.3. If your third-party add-on somehow changes the Administration panel, then the instruction below will help adapt your add-on.

.. important::

    Currently the responsive design of the Administration panel is introduced as an add-on that isn't installed by default. That way developers will have time to adapt their add-ons. Eventually the responsive design of the Administration panel will become a part of CS-Cart core.

============
Main Changes
============

* **Styles are now split into separate files** located in the *css/tygh* directory. The **styles.less** file is used as an index and simply imports **.less** files into itself. The *css/tygh* directory also has subdirectories with styles:

  * *icons/* — styles that describe icons and pictograms.

  * *modals/* — styles related to pop-ups and modal windows.

  * *navbars/* — styles of the navigation and mobile menu of the admin panel.

  * *pages/* — special styles for specific pages of the admin panel.

  * *responsive/* — styles with media queries.

    .. note::

        We plan to abandon the practice of having media queries in a separate file. That's why in the future we'll move the styles from *responsive/* to corresponding files.

  * *ui_base/* — styles of the basic interface components (isolated components).

  * *utils/* — utility styles and the styles of complex interface components.

* **The config.less file was added** (it is located next to **styles.less**). We gradually move LESS variables to **config.less** and create new variables there. Use this file to find out which variables there are.

* **A new function for checking the width of the screen in JS.** Version 4.7.3 has a new global function called ``matchScreenSize()``.

===========================
What Elements Are Affected?
===========================

* **Tables.** Adapting the add-ons to the new responsive admin panel is mostly about adjusting tables.

* **Titles.** Now the first part of the title of a page or a pop-up window will be hidden on mobile devices.

* **Sidebar.** The sidebar is hidden by default on mobile devices, and will appear on the side when necessary. If your add-on had a custom sidebar design, it would have to be adapted as well.

* **Mobile menu.** The menu is responsive too; you don't need to do anything, backward compatibility is preserved.

========================
How the Adaptation Works
========================

---------------
Titles of Pages
---------------

Let's assume we have a product editing page titled *Editing product: My Product*. On mobile devices the title must be *My Product*. We remove the first part of the title that describes the action performed on the page. To implement these adaptive titles:

#. Find the title of the page in the template. It is specified when **mainbox.tpl** is included::

     {include file="common/mainbox.tpl"  title=$title ... }

#. You can keep ``$title`` (the title of the page) for backward compatibility, but you must add two new variables to get the behavior described above. These variables are::

     {include file="common/mainbox.tpl" 
        title_start=$title_start
        title_end=$title_end ... }

   It works like this::

     $title_start = "Edit product"
     $title_end = "My Product"

------------------------
Titles of Pop-Up Windows
------------------------

The actions are the same as for pages. The only difference is that the pop-up window is included in::

  {include file="common/popupbox.tpl" ... }

------
Tables
------

Here is a non-responsive table before adaptation:

.. code-block:: html

   <table width="100%" class="table table-middle">
      <thead>
          <tr>
              <th>Column1</th>
              <th>Column2</th>
          </tr>
      </thead>
      <!-- body below -->
      <tr>
          <td>Content1</td>
          <td>Content2</td>
      </tr>
   </table>

Let's make it responsive. To do this:

#. Wrap the table in a wrapper that adds the necessary behavior:

   .. code-block:: html

      <div class="table-responsive-wrapper">
        <table> <!-- Table Content --> </table>
      </div>

#. Add the ``table-responsive`` class to the ``<table>`` tag:

   .. code-block:: html

      <div class="table-responsive-wrapper">
        <table class="... table-responsive">
          <!-- Table Content -->
        </table>
      </div>

#. Add the ``data-th`` data attribute to the table cells (that attribute means their heading):

   .. code-block:: html

      <td data-th="Column title">...</td>

#. As a result, you'll get a responsive table:

   .. code-block:: html

      <div class="table-responsive-wrapper">
         <table width="100%" class="table table-middle table-responsive">
             <thead>
                 <tr>
                     <th>Column1 (will hide on mobile devices)</th>
                     <th>Column2</th>
                     <th>Column3</th>
                 </tr>
             </thead>
             <!-- body below -->
             <tr>
                 <td class="nowrap left mobile-hide">Content1</td>
                 <td class="nowrap" data-th="Column2">Content2</td>
                 <td class="nowrap right" data-th="Column3">Content3</td>
             </tr>
         </table>
      </div>

-----------------------
New Function in core.js
-----------------------

Version 4.7.3 has a new function ``$.matchScreenSize`` in **core.js** for checking the current screen width. It works as follows:

.. code-block:: js

   if ($.matchScreenSize(['xs', 'xs-large'])) { ... } 

In this example *true* will be returned if the ``<body>`` tag has one of the following classes: ``'screen--xs'`` or ``'screen--xs-large'``.

Here is the list of available selectors:

.. code-block:: js

   'screen--xs':       [0, 350],
   'screen--xs-large': [350, 480],
   'screen--sm':       [481, 768],
   'screen--sm-large': [768, 1024],
   'screen--md':       [1024, 1280],
   'screen--md-large': [1280, 1440],
   'screen--lg':       [1440, 1920],
   'screen--uhd':      [1920, 9999]
