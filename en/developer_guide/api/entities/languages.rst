*********
Languages
*********

An online store running on CS-Cart/Multi-Vendor supports multiple languages. You can manage the installed languages via REST API.

.. contents::
   :backlinks: none
   :local:

========================
List Installed Languages
========================

To get a list of installed languages, send a GET request to ``/api/languages/``::

  GET /api/languages/

This request returns the list of installed languages with their details.

----------
Pagination
----------

Add these parameters to the path to specify what number of stores will be returned in the response and how they will be organized:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Parameter
        -   Default value
        -   Description
    *   -   page
        -   1
        -   The response to ``GET /api/languages/`` is a page with a limited number of installed languages. This parameter determines the number of the page that will be sent in the response.
    *   -   items_per_page
        -   10
        -   Determines the number of languages on a page.

**Example:** ``GET /api/languages/?page=2&items_per_page=2``

Response is an array with the information about 2 languages from the 2nd page of the list of installed languages.

---------------
Response Format
---------------

Let’s make a test request::

  GET /api/languages/

If the request is successful, you’ll receive **HTTP/1.1 200 OK**. The response is JSON with the following data::

  {
   "languages": {
      "en": {
          "lang_id": "1",
          "lang_code": "en",
          "name": "English",
          "status": "A",
          "country_code": "US",
          "direction": "ltr"
      },
      "ru": {
          "lang_id": "2",
          "lang_code": "ru",
          "name": "Русский",
          "status": "A",
          "country_code": "RU",
          "direction": "ltr"
      }
   },
   "params": {
      "items_per_page": "10",
      "page": 1,
      "total_items": 2
   }
  }

=======================
Get a Specific Language
=======================

To get the details of a specific installed language, send a GET request to ``/api/languages/<lang_id>/``. For example::

  GET /api/languages/1/

---------------
Response Format
---------------

* The language exists: ``HTTP/1.1 200 OK`` and JSON with the language details::
    
    {
     "lang_id": "1",
     "lang_code": "en",
     "name": "English",
     "status": "A",
     "country_code": "US",
     "direction": "ltr"
    }

* The language doesn’t exist: **HTTP/1.1 404 Not Found**.

----------------
Language Details
----------------

The fields below represent various language details.

.. note::

    The CS-Cart/Multi-Vendor REST API always accepts and returns data as strings and arrays/objects. The **Values** column in the table merely shows what kind of data you can expect in the fields.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Field
        -   Values
        -   Description
    *   -   lang_id
        -   *integer*
        -   The unique identifier of the installed language.
    *   -   lang_code
        -   *string*
        -   The two-letter language code, for example, ``en``.
    *   -   name
        -   *string*
        -   The name of the language.
    *   -   status
        -   *string*
        -   | The status of the language:
            | ``A``—active
            | ``H``—hidden
            | ``D``—disabled
    *   -   country_code
        -   *string*
        -   The `ISO code of the country <https://countrycode.org/>`_ to which the language belongs. It determines the flag icon that will appear next to the language in the Administration panel and on the storefront.
    *   -   direction
        -   *string*
        -   | The writing direction of the language:
            | ``ltr``—left-to-right
            | ``rtl``—right-to-left

=================
Create a Language
=================

Send a POST request to ``/api/languages/``::

  POST /api/languages/

Pass the following fields with language details in the HTTP request body in accordance with the ``Content-Type``. Required fields are marked with *****.

* **lang_code***—the two-letter language code. It must be different from the ``lang_code`` of any other installed language.

  .. warning::
 
      Don’t use the ``lang_code`` of any of the languages that come with CS-Cart/Multi-Vendor, or that language will disappear from the list until you delete the language you created.

* **name***—the name of the language.

* **status**—the status of the language:

  * ``A``—active

  * ``H``—hidden

  * ``D``—disabled

* **country_code**—the `ISO code of the country <https://countrycode.org/>`_ to which the language belongs. It determines the flag icon that will appear next to the language in the Administration panel and on the storefront.

  .. note::

      Write ``country_code`` in capital letters.

* **from_lang_code**—the ``lang_code`` of the language from which you want to copy the :doc:`language variables <langvars>` and their values.

  If you don’t specify the ``lang_code``, then the language variables will be taken from ``CART_LANGUAGE``.

  .. hint::

      Sending a POST request to ``/api/languages/?sl=en`` will have the same effect as specifying ``"from_lang_code": "en"`` in the JSON.

------------
Example JSON
------------

::

  {
   "lang_code": "ts",
   "name": "Test",
   "status": "A",
   "country_code": "US",
   "from_lang_code": "en"
  }

---------------
Response Format
---------------

* The language has been created successfully: **HTTP/1.1 201 Created** and the ID of the language::

    {
     "lang_id": 3
    }

* The language couldn’t be created: **HTTP/1.1 400 Bad Request**.

=================
Update a Language
=================

To update the details of an installed language, send the PUT request to ``/api/languages/<lang_id>/``. For example::

  PUT /api/languages/3/

Pass the fields with the language details in the HTTP request body in accordance with the passed ``Content-Type``. The ``lang_code`` field is required.

------------
Example JSON
------------

::

  {
   "lang_code": "ts",
   "name": "Test2",
   "status": "H",
   "country_code": "RU"
  }

.. warning::

   Don’t change the ``lang_code`` field of the language via REST API. If you do that, all the language variables of that language will disappear until you change the ``lang_code`` back.

.. note::

    Write ``country_code`` in capital letters.

---------------
Response Format
---------------

* The language has been updated successfully: **HTTP/1.1 200 OK** and the ID of the language::
    
    {
     "lang_id": "3"
    }

* The language couldn’t be updated: **HTTP/1.1 400 Bad Request**.

* The language doesn’t exist: **HTTP/1.1 404 Not Found**.

=================
Delete a Language
=================

To delete a language, send the DELETE request to ``/api/languages/<lang_id>/``. For example::

  DELETE /api/languages/3/

This request will delete the language with ``lang_id=3``.

.. important::

    You can’t delete the language that is specified as the **Backend default language** under :doc:`Settings → Appearance <../../../user_guide/settings/appearance>`.

---------------
Response Format
---------------

* The language has been deleted successfully: **HTTP/1.1 204 No Content**.

* The language couldn’t be deleted: **HTTP/1.1 400 Bad Request**.

* The language doesn’t exist: **HTTP/1.1 404 Not Found**.
