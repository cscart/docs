***********
Blog Add-on
***********

==============
Blog Structure
==============

.. code-block:: none

    Root level
        | Blog 1
            | Post 1
            | Post 2
            ...
        | Blog 2
            | Post 3
            | Post 4
            ...
        ...

* **Blog**—a post that uses the root level as its parent page.

* **Post**—a post that uses a blog as its parent page.

========================================
Recent Posts Block—Templates and Content
========================================

The block shows posts sorted by the creation time in descending order.

---------------------------------
Blog: Recent Posts (and Scroller)
---------------------------------

The content of the block depends on the page a customer visits:

* Any other page that is not the blog page—recent posts.

* The blog page—blog posts 

  .. list-table::
      :header-rows: 1
      :widths: 10 10

      *   -   Page 
          -   Content
      *   -   Blog 1
          -   Post 1, Post 2
      *   -   Blog 2
          -   Post 3, Post 4

* The post page—posts that have the same parent page as the browsed post.

  .. list-table::
      :header-rows: 1
      :widths: 10 10

      *   -   Page 
          -   Content
      *   -   Post 1
          -   Post 1, Post 2
      *   -   Post 3
          -   Post 3, Post 4

----------------
Blog: Text Links
----------------

The block shows the recent posts with the date of creation.

**View all** button redirects to a blog or a post that is specified in the parent page of the block.

============
Known Issues
============

--------------------------------------------------------
The Recent Posts block is empty when the post is browsed 
--------------------------------------------------------

It happens when all posts are stored in the root level:

.. code-block:: none

    Root level
        | Post 1
        | Post 2
        | Post 3
        | Post 4

You need to create a blog and specify it as a parent page for posts.

------------------------------------------------------------
The template "Blog: text links" doesn't show View all button
------------------------------------------------------------

It happens if the root level is set as a parent page.

Instead you need to choose a blog or a post in the block settings.
