*********
Framework
*********

Root containers
***************

As illustrated in `Look and Feel → Layouts <http://docs.cs-cart.com/4.3.x/user_guide/look_and_feel/layouts/index.html>`_, the basic storefront framework consists of four horizontal containers referred to as **root containers**. This basic frame is the same for all layout pages.

.. important::

	Root containers cannot be added or removed.

Moreover, the top panel, header and footer containers of the `default layout page <http://docs.cs-cart.com/4.3.x/user_guide/look_and_feel/layouts/layout_pages/index.html>`_ are inherited by other layout pages. This means that the changes that you make to these two areas automatically apply to all layout pages.

Each root container is associate with a particular area of the storefront page - header, main content area, or footer. However, root containers themselves do not generate the corresponding parts of the storefront pages. In fact, they only accommodate and form boundaries for multiple smaller containers referred to as **child containers**.

.. note::

	Although a root container may consist of zero child containers, you are supposed to include at least one.

Child containers
****************

Child containers ensure a more detailed and sophisticated layout of the storefront paged. Multiple child containers with certain sizes, positions, and styles can be nested inside a root container or inside other child containers. And each such container may include one or more blocks - boxes with information of certain type.

Both the root and child containers are fixed to the `storefront grid system used in CS-Cart <http://docs.cs-cart.com/4.3.x/user_guide/look_and_feel/layouts/framework/grid_system.html>`_.

To create a child container:

*	Click the **+** icon on the container that will be the parent on the new container and select **Add Grid**.
	It opens a form with the new container attributes.
*	Specify the new `container attributes <http://docs.cs-cart.com/4.3.x/user_guide/look_and_feel/layouts/framework/container_properties.html>`_.
*	Click **Create** when finished. 

In this section
***************

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    *
