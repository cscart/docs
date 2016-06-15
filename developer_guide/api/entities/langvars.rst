********
Langvars
********

Most of the texts in CS-Cart/Multi-Vendor are stored in **language variables** (or **langvars** for short). That way different :doc:`languages <languages>` can have different texts.

.. contents::
   :backlinks: none
   :local:

=================
List All Langvars
=================

* **For the default language:** send a GET request to ``/api/langvars/``::

    GET /api/langvars/

  .. important::

      The default language is the **Backend default language** under :doc:`Settings → Appearance <../../../user_guide/settings/appearance>`.

* **For a specific language:** send a GET request to ``/api/languages/<lang_id>/langvars/``::

    GET /api/languages/1/langvars/

  or::

    GET /api/langvars/?sl=en

This request returns the list of language variables with their names and values.

----------
Pagination
----------

Add these parameters to the path to specify what number of language variables will be returned in the response and how they will be organized:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Parameter
        -   Default value
        -   Description
    *   -   page
        -   1
        -   The response to ``GET /api/langvars/`` is a page with a limited number of language variables. This parameter determines the number of the page that will be sent in the response.
    *   -   items_per_page
        -   10
        -   Determines the number of language variables on a page.

**Example:** ``GET /api/langvars/?page=2&items_per_page=2``

Response is an array with the information about 2 language variables from the 2nd page of the list.

---------------
Response Format
---------------

Let’s make a test request::

  GET /api/languages/1/langvars

If the request is successful, you’ll receive **HTTP/1.1 200 OK**. The response is JSON with the following data::

  {
   "langvars": [
      {
       "value": "Enable support of fraud notification",
       "name": "2co_enable_fraud_verification"
      },
      {
       "value": "Status for orders with failed fraud review",
       "name": "2co_fraud_fail"
      },
      {
       "value": "Status for orders waiting for fraud review",
       "name": "2co_fraud_wait"
      },
      {
       "value": "3-D Secure",
       "name": "3d_secure"
      },
      {
       "value": "The 404 Not Found error message",
       "name": "404"
      },
      {
       "value": "Absolute",
       "name": "absolute"
      },
      {
       "value": "Accept",
       "name": "accept"
      },
      {
       "value": "Accept products",
       "name": "accept_products"
      },
      {
       "value": "Access denied",
       "name": "access_denied"
      },
      {
       "value": "You don't have permission to access the page.",
       "name": "access_denied_text"
      }
   ],
   "params": {
      "page": 1,
      "items_per_page": "10",
      "total_items": "4673"
   }
  }

======================
Get a Specific Langvar
======================

* **For the default language:** send a GET request to ``/api/langvars/<name>``::

    GET /api/langvars/access_denied

  .. important::

      The default language is the **Backend default language** under :doc:`Settings → Appearance <../../../user_guide/settings/appearance>`.

* **For the specific language:** send a GET request to ``/api/languages/<lang_id>/langvars/<name>``::

    GET /api/languages/1/langvars/access_denied/

  or::

    GET /api/langvars/access_denied/?sl=en

---------------
Response Format
---------------

**HTTP/1.1 200 OK** and JSON with the details of the language variable::
    
  {
   "lang_code": "en",
   "name": "access_denied",
   "value": "Access denied"
  }

---------------
Langvar Details
---------------

The fields below represent various language details.

.. note::

    The CS-Cart/Multi-Vendor REST API always accepts and returns data as strings and arrays. The **Values** column in the table merely shows what kind of data you can expect in the fields.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Field
        -   Values
        -   Description
    *   -   lang_code
        -   *string*
        -   The two-letter language code, for example, ``en``.
    *   -   name
        -   *string*
        -   The name of the language variable.
    *   -   value
        -   *string*
        -   The value of the language variable for the language with the specified ``lang_code``.

================
Create a Langvar
================

* **For the default language:** send a POST request to ``/api/langvars/``::

    POST /api/langvars/

  .. important::

    The default language is the **Backend default language** under :doc:`Settings → Appearance <../../../user_guide/settings/appearance>`.

* **For the specific language:** send a POST request to ``/api/languages/<lang_id>/langvars/``::

    POST /api/languages/1/langvars/

  or::

    POST /api/langvars/?sl=en

Pass the following fields with language details in the HTTP request body in accordance with the ``Content-Type``. Required fields are marked with *****.

* **name***—the internal name of the language variable in CS-Cart/Multi-Vendor. This is the name you use when you want to get the details of the language variable via REST API.

  .. note::

      Use numbers, underscores, and lowercase letters of the `ISO basic Latin alphabet <https://en.wikipedia.org/wiki/ISO_basic_Latin_alphabet>` in the name of the language variable. 

* **value**—the value of the language variable. This is the actual text that people see on the storefront or in the Administration panel.

------------
Example JSON
------------

::

  {
   "name": "test_variable",
   "value": "This is the text that will appear instead of the language variable for the specified language."
  }

---------------
Response Format
---------------

* The language variable has been created successfully: **HTTP/1.1 201 Created** and the name of the language variable::

    {
     "name": "test_variable"
    }

* The language variable couldn’t be created: **HTTP/1.1 400 Bad Request**.

================
Update a Langvar
================

To update the details of the language variable, send a PUT request to ``/api/languages/<lang_id>/langvars/<name>``. For example::

  PUT /api/languages/1/langvars/test_variable/

or::

  PUT /api/langvars/test_variable/?sl=en

Pass the value of the language variable in the HTTP request body in accordance with the passed ``Content-Type``.

------------
Example JSON
------------

::

  {
   "value": "This is the changed text of the language variable."
  }

---------------
Response Format
---------------

* The language variable has been created: **HTTP/1.1 200 OK** and the ID of the language::

   {
    "name": "test_variable"
   }

  .. note::

      If the language variable doesn’t exist, it will be created.

* The language variable couldn’t be created: **HTTP/1.1 400 Bad Request**.

================
Delete a Langvar
================

To delete a language variable, send a DELETE request to ``/api/langvars/<name>``. For example::

  DELETE /api/langvars/test_variable/

This request will delete the language variable with ``name=test_variable``.

.. warning::

    The language variable will be deleted for all languages.

---------------
Response Format
---------------

* The language variable has been deleted successfully: **HTTP/1.1 204 No Content**.

* The language variable couldn’t be deleted: **HTTP/1.1 400 Bad Request**.

* The language variable doesn’t exist: **HTTP/1.1 404 Not Found**.

