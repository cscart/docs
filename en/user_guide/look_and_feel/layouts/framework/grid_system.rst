***********
Grid System
***********

.. warning::

    This article may no longer be relevant or up to date. Please :doc:`return to the main page of the section. <index>`

CS-Cart uses the intuitive and powerful `Bootstrap <http://getbootstrap.com/>`_ library that allows full-, custom-width, and responsive layouts. In CS-Cart the Bootstrap library is divided into two parts—the Bootstrap framework, and the Bootstrap grid. A storefront is provided with the Bootstrap grid only. So, it is impossible to apply all means of the Bootstrap framework to the storefront.

A layout in CS-Cart can have 12 or 16 columns. In the full-width layout the length of the columns is adapted to the width of the page. In custom-width layout the length of the columns is fixed and depends on the specified width of the page. And responsive layout is flexible and easily adapting for different screen sizes. It is very useful for displaying site content on the portable devices screens.

In CS-Cart, the root containers always occupy the full page length, i.e. all columns in the grid. The number of columns is defined through the container settings. It determines the possible dimensions of child containers. Their length cannot exceed the number of columns in the grid.
