****************
Product Features
****************

URLs
====

*   http://example.com/api/**features**—refer to all product features. Supports ``GET`` and ``POST``.
*   http://example.com/api/**features/:id**—refer to a particular product feature. Supports ``GET``, ``PUT``, and ``DELETE``.
*   http://example.com/api/**products/:id/features**—refer to all features of a particular :doc:`product <products>`.

Pagination
==========

To get a specific number of features or list of features from a concrete page in a response, use pagination parameters:

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 20 30

    *   -   Pagination param
        -   Description
    *   -   page
        -   Shows features on a page with the defined number.
    *   -   items_per_page
        -   Shows N features, where N is a number defined in the parameter.

**Examples:**

*   *http://example.com/api/features?page=5*

Response is an array with 10 features from the 5th page (10 is the default value of the ``items_per_page`` parameter).

*   *http://example.com/api/features?items_per_page=20*

Response is an array with 20 features from the first page.

*   *http://example.com/api/features?page=5&items_per_page=20*

Response is an array with 20 features from the 5th page.

Fields
======

A product feature has a number of properties, represented by fields.

The full list of supported fields is given below (mandatory fields are marked with **\***).

.. note:: Any field not listed in the table below will be ignored if occurs in an API request JSON data.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 25 5 15

    *   -   Field name
        -   Description
        -   Default value
        -   Supported values
    *   -   company_id*
        -   Store or vendor to which the feature belongs.
        -   Default company ID
        -   Valid company ID
    *   -   description*
        -   Feature name
        -   ''
        -   string
    *   -   feature_type*
        -   Feature type
        -   —
        -   | ``C``—Check box: Single
            | ``M``—Check box: Multiple
            | ``S``—Select box: Text
            | ``N``—Select box: Number
            | ``E``—Select box: Brand/Manufacturer
            | ``T``—Others: Text
            | ``O``—Others: Number
            | ``D``—Others: Date
            | ``G``—group of features
    *   -   categories_path
        -   Categories to which the feature can be applied.
        -   ''
        -   Comma-separated string of category IDs
    *   -   comparison
        -   Determines whether to show this feature on a product comparison page or not.
        -   ``N``
        -   | ``Y``—yes
            | ``N``—no
    *   -   display_on_catalog
        -   Determines whether show this feature in the product catalog or not.
        -   ``N``
        -   | ``Y``—yes
            | ``N``—no
    *   -   display_on_product
        -   Determines whether to show this feature on a detailed product page or not.
        -   ``N``
        -   | ``Y``—yes
            | ``N``—no
    *   -   display_on_header
        -   Determines whether to show this feature under the product header or not.
        -   ``N``
        -   | ``Y``—yes
            | ``N``—no
    *   -   feature_id
        -   The unique ID of the feature.
        -   Set automatically
        -   integer
    *   -   full_description
        -   Feature description.
        -   ''
        -   string
    *   -   group_position
        -   Position in group.
        -   0
        -   integer
    *   -   parent_id
        -   ID of the parent group (``0`` if there is no parent group).
        -   0
        -   integer
    *   -   position
        -   The position of this feature in the feature list.
        -   0
        -   integer
    *   -   prefix
        -   The prefix of the feature name.
        -   ''
        -   string
    *   -   status
        -   Status
        -   ``A``
        -   | ``A``—active
            | ``D``—disabled
            | ``H``—hidden
    *   -   suffix
        -   The suffix of the feature name.
        -   ''
        -   string
    *   -   value
        -   Feature value
        -   —
        -   Value depending on the feature type.
    *   -   value_int
        -   Feature integer value.
        -   —
        -   integer
    *   -   variant_id (only for types with variants)
        -   ID of the selected variant.
        -   —
        -   integer
    *   -   variants (only for types with variants)
        -   Available feature value variants.
        -   —
        -   array with variant ID as key and variant data as value (content explained :ref:`below <product-feature-variants>`)


.. _product-feature-variants:

Product Feature Variants
------------------------

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 5 30 5 10

    *   -   Field name
        -   Description
        -   Default value
        -   Supported values
    *   -   description
        -   Variant description
        -   ''
        -   string
    *   -   feature_id
        -   ID of the feature the variant is assigned to.
        -   —
        -   integer
    *   -   feature_type
        -   Type of the feature the variant is assigned to.
        -   —
        -   Valid feature type (see above)
    *   -   image_pair
        -   ``Brand/Manufacturer`` only: Images
        -   NULL
        -   Valid :ref:`image pair <main-pair>`
    *   -   lang_code
        -   Language code
        -   Default language code
        -   Valid language code (see above)
    *   -   meta_description
        -   ``Brand/Manufacturer`` only: Meta description
        -   ''
        -   string
    *   -   meta_keywords
        -   ``Brand/Manufacturer`` only: Meta keywords
        -   ''
        -   string
    *   -   page_title
        -   ``Brand/Manufacturer`` only: Page title
        -   ''
        -   string
    *   -   position
        -   Variant position
        -   0
        -   integer
    *   -   selected
        -   ID of the selected variant
        -   Set automatically
        -   integer
    *   -   url
        -   ``Brand/Manufacturer`` only: URL
        -   ''
        -   string
    *   -   variant
        -   Variant name
        -   —
        -   string
    *   -   variant_id
        -   Variant ID
        -   Set automatically
        -   integer


Example Usage
=============

GET /features/
--------------

.. code-block:: bash

    curl -X GET 'http://example.com/api/features'

This example request returns the list of product features with their properties.

GET /features/:id/
------------------

.. code-block:: bash

    curl -X GET 'http://example.com/api/features/14'

This example request returns the properties of the product feature with ``feature_id=14``.

POST /features/
---------------

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

If you successfully create a feature, you will receive **HTTP/1.1 201 Created**.
 
If the feature couldn’t be created, you will receive **HTTP/1.1 400 Bad Request**.

**Required fields:** *company_id*, *description*, *feature_type*

**Available fields:** *company_id*, *feature_type*, *parent_id*, *display_on_product*, *display_on_catalog*, *display_on_header*, *description*, *lang_code*, *prefix*, *suffix*, *categories_path*, *full_description*, *status*, *comparison*, *position*, *variants*

.. important::

    Currently you can't set the *image_pair* for a product feature via REST API.
 
.. code-block:: bash

    curl --header 'Content-type: application/json' -X POST 'http://example.com/api/features' --data-binary '{"company_id":"1", "feature_type":"C", "description":"Handmade", "status":"A"}'

This example request creates a new checkbox feature called **Handmade** in the store with the ``company_id=1``. The status of this product feature is set to *Active*.

In the response you receive the ID of the feature.

.. code-block:: bash

    {feature_id: 22}

PUT /features/:id/
------------------

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

**Required fields:** *company_id*, *description*, *feature_type*

**Available fields:** *company_id*, *feature_type*, *parent_id*, *display_on_product*, *display_on_catalog*, *display_on_header*, *description*, *lang_code*, *prefix*, *suffix*, *categories_path*, *full_description*, *status*, *comparison*, *position*, *variants*

.. important::

    Currently you can't set the *image_pair* for a product feature via REST API.

.. code-block:: bash

    curl --header 'Content-type: application/json' -X PUT 'http://example.com/api/features/22' --data-binary '{"company_id":"1", "feature_type":"S", "comparison":"Y", "variants":[{"variant": "Unique"}, {"variant": "Mass-produced"}]}'

This example request turns the feature with ``feature_id=22`` (**Handmade** in our case) into a *Select Box: Text* feature and creates 2 new variants for it: *Unique* and *Mass-produced*. The request also makes this feature appear on the product comparison page.

To update an already existing variant, add its **variant_id** to the array:

.. hint::

    Learn the variant IDs of a feature with **GET /features/:id**.

.. code-block:: bash

    curl --header 'Content-type: application/json' -X PUT 'http://example.com/api/features/22' --data-binary '{"company_id":"1", "feature_type":"S", "variants":[{"variant_id":"150", "variant":"Unique"}, {"variant_id":"151", "variant":"Mass-produced"}]}'

This example request updates the variants of the the feature with ``feature_id=22`` (**Handmade** in our case)

.. warning::

    Be sure to send all the feature variants in the array—the variants that you don't send will be lost.

In the response you receive the ID of the feature.

.. code-block:: bash

    {feature_id: 22}

DELETE /features/:id/
---------------------

If you successfully delete a product feature, you will receive **HTTP/1.1 204 No Content**.

If the product feature couldn’t be deleted, you will receive **HTTP/1.1 400 Bad Request**.

If the product feature doesn’t exist, you will receive **HTTP/1.1 404 Not Found**.

.. code-block:: bash

    curl -X DELETE 'http://example.com/api/features/22'

This example request deletes the product feature with the ``feature_id=22``.

Working with the Features of a Product
======================================

Learn a Product's Features
--------------------------

To get the features of a product use the following method:

.. code-block:: bash

    curl -X GET 'http://example.com/api/products/14/features'

This example request returns the list of features of a product with ``product_id=14``.

Create a Product with a Feature
-------------------------------

Suppose we have a product feature of the **Other: Text** type with ``feature_id=23``.

Let's specify the value of this feature as we create a new product with ``POST /products/``.

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

.. code-block:: bash

    curl --header 'Content-type: application/json' -X POST 'http://example.com/api/products' --data-binary '{"product": "New Product", "category_ids": "223", "main_category": "223", "price": "10", "status": "A", "product_features": {"23": {"feature_type": "T", "value": "Test"}}}'

This example request creates a new product with the value of the feature set to *Test*. 

If you successfully create a product, you will receive the ID of the product the in the response.

.. code-block:: bash

    {product_id: 250}

Update a Product's Feature
--------------------------

Update a feature of a product using ``PUT /products/:id/``.

Send the data in the body of the HTTP request. The data should comply with the ``content-type``.

.. code-block:: bash

    curl --header 'Content-type: application/json' -X PUT 'http://example.com/api/products/250' --data-binary {"product_features": {"23": {"feature_type": "T", "value": "Feature updated"}}}

This example request updates the product with ``product_id=250``. It sets the value of the text feature with ``feature_id=23`` to *Feature updated*.

In the response you receive the ID of the product.

.. code-block:: bash

    {product_id: 250}

