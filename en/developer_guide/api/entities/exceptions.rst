*************************
Product Option Exceptions
*************************

You can use exceptions to make specific combinations of :doc:`product options <options>` that the customers won’t be able to select. For example, if you sell a T-shirt in various colors and sizes, you can make a certain color unavailable for a specific size.

Exceptions are somewhat similar to :doc:`option combinations <combinations>`—they both include the ``combination`` object with variants of different options.

.. important::

    Only the options that have variants can be a part of an exception. This includes options of the following types: *Checkbox*, *Select box*, and *Radiogroup*. 

There are two types of exceptions:

* **Forbidden**—customers won’t be able to select the combinations of option variants specified in the ``combination`` object.
 
* **Allowed**—customers will be able to select ONLY the combinations of option variants specified in the ``combination`` object.

The type of the exception is determined by the :doc:`product <products>` that the exception is associated with. A product has a field called ``exceptions_type``, that can have either *A* (allowed) or *F* (forbidden) as its value.

.. note::

    *F* (forbidden) is the default value of the ``exceptions_type`` field of the product.

.. contents::
   :backlinks: none
   :local:

============================
List Exceptions of a Product
============================

To get all the exceptions of a specific product, send a GET request to ``/api/exceptions/?product_id=:id``. For example::

  GET /api/exceptions/?product_id=12

If the request is successful, you’ll receive **HTTP/1.1 200 OK** and JSON with all the exceptions of the specified product::
 
  [
   {
    "exception_id": "1",
    "product_id": "12",
    "combination": {
         "3": "12",
         "4": "17",
         "17": "-1"
    }
   },
   {
    "exception_id": "4",
    "product_id": "12",
    "combination": {
          "3": "13",
          "4": "17",
          "17": "-2"
    }
   },
   {
    "exception_id": "5",
    "product_id": "12",
    "combination": {
          "3": "16",
          "4": "-1",
          "17": "-2"
    }
   }
  ]

========================
Get a Specific Exception
========================

To get the details of a specific exception, send a GET request to ``/api/exceptions/<exception_id>``. For example::

  GET /api/exceptions/1

If the request is successful, you’ll receive **HTTP/1.1 200 OK** and JSON with the details of the exception.

----------------- 
Exception Details
-----------------

The fields below represent various details of an exception.

.. note::

    The CS-Cart/Multi-Vendor REST API always accepts and returns data as strings and arrays/objects. The **Values** column in the table merely shows what kind of data you can expect in the fields.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Field
        -   Values
        -   Description
    *   -   exception_id
        -   *integer*
        -   A unique identifier of the exception.
    *   -   product_id
        -   *integer*
        -   A unique identifier of the product that the exception is associated with.
    *   -   combination
        -   *object*
        -   The options and their variants that comprise the exception.


----------------------------------
Negative Values as Option Variants
----------------------------------

Option variants of the exceptions can have a negative value in the ``combination`` object:

* ``-1``—any variant of this option can be selected.
* ``-2``—no variant of this option can be selected.

**For example:**

::

  {
   "exception_id": "5",
   "product_id": "12",
   "combination": {
         "3": "16",
         "4": "-1",
         "17": "-2"
   }
  }

This is an exception for the product with ``product_id=12``. Let’s assume that:

* the product we’re talking about is a T-shirt;

* the exception is of the **Forbidden** type; 

* option 3 is *Size*, and variant 16 is *XXL*;

* option 4 is *Color*;

* option 17 is a *checkbox*.

Then the checkbox will be grayed out and won’t be considered when a customer selects the *XXL* size for any color.

===================  
Create an Exception
===================

To create an exception, send a POST request to ``/api/exceptions/``.

Pass the fields with the exception details in the HTTP request body in accordance with the passed ``Content-Type``. Required fields are marked with *****:

* **product_id***—the unique identifier of the product that the exception is associated with.

* **combination**—the options and variants that comprise the exception.

  .. important::

      The options you specify in the ``combination`` object should have the *Checkbox*, *Select box*, or *Radiogroup* type and be available for the product.

**Example JSON:**

::

  {
   "product_id": "12",
   "combination": {
         "3": "-1",
         "4": "19",
         "17": "61"
   }
  }

This request creates a new exception for the product with ``product_id=12``. This exception describes the following combination of variants:

* Any variant of option 3

* Variant 19 of option 4

* Variant 61 of option 17

If the option exception is created successfully, you will receive **HTTP/1.1 201 Created** and the exception ID in the response::

  {
   "exception_id": "10"
  }

If the exception couldn’t be created, you will receive **HTTP/1.1 400 Bad Request**.

===================
Update an Exception
===================

To update an existing exception, send the PUT request to ``/api/exceptions/<exception_id>/``. For example::

  PUT /api/exceptions/10

Pass the fields with exception details in the HTTP request body in accordance with the passed ``Content-Type``. None of the fields are required.

**Example JSON:**

::

  {
   "combination": {
         "3": "-1",
         "4": "18",
         "17": "60"
   }
  }

This request changes the option variants of the exception.

.. important::

    When you update the ``combination`` object, specify the variants of all the options that comprise the exception. If you don’t include an option in the object, it won’t be a part of the exception.

===================
Delete an Exception
===================

To delete an exception, send the DELETE request to ``/api/exceptions/<exception_id>?product_id=:id``.

.. note::

    Product ID is specified to check if the user has permission to delete this exception.

::

  DELETE /api/exceptions/10?product_id=12

This request deletes the specified exception of the product.

**Possible responses:**

* **HTTP/1.1 204 No Content**—the exception has been deleted successfully.

* **HTTP/1.1 400 Bad Request**—the exception couldn’t be deleted.

* **HTTP/1.1 404 Not Found**—the exception doesn’t exist.
