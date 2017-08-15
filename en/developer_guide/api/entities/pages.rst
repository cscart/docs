*****
Pages
*****

.. important::

    This entity first appeared in **CS-Cart 4.3.5**.

====
URLs
====

*   http://example.com/api/2.0/**pages/** — refer to all pages. Supports ``GET`` and ``POST``.

*   http://example.com/api/2.0/**pages/:id** — refer to a particular page. Supports ``GET``, ``PUT``, and ``DELETE``.

========================
Pagination and Filtering
========================

Use the following parameters to find pages with specific properties and display them in a way you need.

==================  =================  ==========================================================
**Parameter**       **Default value**  **Description**
**page**            ``1``              Show all pages on the output page with the specified number.
**items_per_page**  ``10``             The number of pages displayed on the output page.
**sort_by**         ``position``       Sort pages by ``position``, ``name``, ``timestamp``, ``type``, ``multi_level``.
**sort_order**      ``desc``           Ascending or descending sorting order: ``asc`` or ``desc``.
**parent_id**                          Filter pages by the ID of the parent element.
**page_type**                          Filter pages by type. Possible values:

                                       ``T`` - page

                                       ``L`` - link

                                       ``F`` - form (only available with the Form Builder add-on)

                                       ``B`` - blog post (available only with the Blog add-on)
**simple**                             Add this parameter if you don’t want the response to include the content of the pages.
**q**                                  Full-text filtering.
**status**                             Filter pages by status. Possible values: 

                                       ``A`` - active 

                                       ``H`` - hidden

                                       ``D`` - disabled
**item_ids**                           Show only specific pages. Separate the IDs with commas.
**get_tree**                           Show pages as a tree. Values: ``true``, ``plain``.
==================  =================  ==========================================================

**Examples:**

*   *http://example.com/api/2.0/pages?page=5*

Response is an array with 10 pages from the 5th output page.

*   *http://example.com/api/2.0/pages?items_per_page=20*

Response is an array with 20 pages from the first page.

*   *http://example.com/api/2.0/pages?page=5&items_per_page=20*

Response is an array with 20 pages from the 5th page.

======
Fields
======

A page has a number of properties represented by fields. See the list of supported fields below (mandatory fields are marked with \*\).

.. note::

    Any field not listed in the table below will be ignored if occurs in an API request JSON data.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 20 10 20

    *   -   Field name
        -   Description
        -   Available for methods
        -   Supported values
    *   -   page_type*
        -   Type of the page.
        -   | ``GET``
            | ``POST``
        -   | One of the following strings:
            | ``T`` - page 
            | ``L`` - link 
            | ``F`` - form (available only with the Form Builder add-on)
            | ``B`` - blog post (available only with the Blog add-on)
    *   -   page*
        -   Name of the page.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   string
    *   -   page_id
        -   ID of the page.
        -   | ``GET``
        -   integer
    *   -   company_id
        -   ID of the company.
        -   | ``GET``
        -   integer
    *   -   parent_id
        -   ID of the parent page.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   integer
    *   -   id_path
        -   Path to the page ID; may include the IDs of the parent pages.
        -   | ``GET``
        -   A string with one page ID or multiple IDs separated by slashes, e.g. ``30/2``.
    *   -   status 
        -   Status of the page.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   | ``A`` - active
            | ``H`` - hidden
            | ``D`` - disabled
    *   -   timestamp
        -   Creation timestamp.
        -   | ``GET``
            | ``PUT``
        -   A valid timestamp in seconds
    *   -   usergroup_ids
        -   User groups that can view the page.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   A string of user group IDs separated by commas.
    *   -   localization
        -   Localizations this page is available for
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   A string of localization IDs separated by commas
    *   -   new_window (only available for links)
        -   Determines if the link opens in a new window.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   | ``0`` - no
            | ``1`` - yes
    *   -   use_avail_period
        -   Determines if the page is only available for a limited time.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   | ``Y`` - the page is available for a limited time
            | ``N`` - the page is always available
    *   -   avail_from_timestamp
        -   The beginning of the page’s availability period.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   A valid timestamp in seconds
    *   -   avail_till_timestamp
        -   The end of the page’s availability period
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   A valid timestamp in seconds
    *   -   lang_code
        -   Language code.
        -   | ``GET``
        -   A string with a valid language code like ``en``
    *   -   description
        -   Content of the page.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   string
    *   -   meta_keywords
        -   Keywords from the page’s meta data.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   string
    *   -   meta_description
        -   Description from the page’s meta data.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   string
    *   -   page_title
        -   Title from the page’s meta data.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   string
    *   -   link (only for links)
        -   Page URL of the link.
        -   | ``GET``
            | ``POST``
            | ``PUT``
        -   string
    *   -   seo_name
        -   A SEO name of the page.
        -   | ``GET``
            | ``POST``
            | ``PUT```
        -   string
    *   -   seo_path
        -   The SEO names of parent pages
        -   | ``GET``
        -   string
    *   -   level
        -   Level of the page.
        -   | ``GET``
        -   integer
    *   -   tags
        -   An array that contains the tags of the page.
        -   | ``GET``
        -   array
    *   -   main_pair (only for blog pages)
        -   The information about the full image and thumbnail pair.
        -   | ``GET``
        -   object
    *   -   spoiler (only for blog pages)
        -   The part of the blog post, that appears on the blog home page. The ``<!--CUT-->`` tag below this part separates it from the rest of the post.
        -   | ``GET``
        -   string
    *   -   author (only for blog pages)
        -   The name of author of the page.
        -   | ``GET``
        -   string

=============
Example Usage
=============

-----------
GET /pages/
-----------

.. code-block:: bash

    curl -X GET 'http://example.com/api/2.0/pages'

This example request returns the list of pages with their properties.

--------------
GET /pages/:id
--------------

.. code-block:: bash

    curl -X GET 'http://example.com/api/2.0/pages/1'

This example request returns the properties of the page with the ``page_id=1``.

------------
POST /pages/
------------

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

If you successfully create a page, you will receive **HTTP/1.1 201 Created**.
 
If the page couldn’t be created, you will receive **HTTP/1.1 400 Bad Request**.

**Required fields:** *page_type**, *page*

**Available fields:** *page_type*, *page*, *parent_id*, *status*, *position*, *usergroup_ids*, *localization*, *new window* (for links only), *use_avail_period*, *avail_from_timestamp*, *avail_till_timestamp*, *description*, *meta_keywords*,  *meta_description*, *page_title*, *link* (only for links), *seo_name*
 
.. code-block:: bash

    curl --header 'Content-type: text/plain' -X POST 'http://example.com/api/2.0/pages' --data-binary 'page_type=T&page=Test Page&status=H&description=<p>This is a test page to see how the API works.</p>'

This example request creates a new *hidden page* called *Test Page* with the following piece of text on it: *“This is a test page to see how the API works.”* The text uses the *<p></p>* html tags.

In the response you receive the ID of the page.

.. code-block:: bash

    {page_id: 226}

---------------
PUT /pages/:id/
---------------

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

**Available fields:** *page*, *parent_id*, *status*, *position*, *timestamp*, *usergroup_ids*, *localization*, *new window* (for links only)*, *use_avail_period*, *avail_from_timestamp*, *avail_till_timestamp*, *description*, *meta_keywords*,  *meta_description*, *page_title*, *link* (only for links), *seo_name*

.. code-block:: bash

    curl --header 'Content-type: text/plain' -X PUT 'http://example.com/api/2.0/pages/226' --data-binary 'status=A'

This example request sets the **status** of the page with ``page_id=226`` to *Active*.  

In the response you receive the ID of the page.

.. code-block:: bash

    {page_id: 226}

-----------------
DELETE /pages/:id
-----------------

If you successfully delete a page, you will receive **HTTP/1.1 204 No Content**.

If the page couldn’t be deleted, you will receive **HTTP/1.1 400 Bad Request**.

If the page doesn’t exist, you will receive **HTTP/1.1 404 Not Found**.

.. code-block:: bash

    curl -X DELETE 'http://example.com/api/2.0/pages/226'

This example request deletes the page with the ``page_id=226``.








