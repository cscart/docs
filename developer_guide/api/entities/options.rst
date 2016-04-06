*******
Options
*******

Products in CS-Cart and Multi-Vendor can have **options**—additional properties that customers may select when buying a product. For example, for clothes that would be color, size, optional accessories, etc.

=========================
View Options of a Product
=========================

To view the options of a specific product, send a GET request to ``/api/options/?product_id=:id``. For example::

  GET /api/options/?product_id=12

If the request is successful, you’ll receive **HTTP/1.1 200 OK** and JSON with the options of the product.

---------------
Response Format
---------------

::

  {
   "3": {
     "option_id": "3",
     "product_id": "12",
     "company_id": "1",
     "option_type": "S",
     "inventory": "Y",
     "regexp": "",
     "required": "N",
     "multiupload": "N",
     "allowed_extensions": "",
     "max_file_size": "0",
     "missing_variants_handling": "M",
     "status": "A",
     "position": "20",
     "value": "",
     "option_name": "Size",
     "option_text": "Size",
     "description": "",
     "inner_hint": "",
     "incorrect_message": "",
     "comment": "",
     "variants": {
       "12": {
         "variant_id": "12",
         "option_id": "3",
         "position": "10",
         "modifier": "0.000",
         "modifier_type": "A",
         "weight_modifier": "0.000",
         "weight_modifier_type": "A",
         "point_modifier": "0.000",
         "point_modifier_type": "A",
         "variant_name": "Small",
         "image_pair": []
       },
       "13": {
         "variant_id": "13",
         "option_id": "3",
         "position": "20",
         "modifier": "0.000",
         "modifier_type": "A",
         "weight_modifier": "0.000",
         "weight_modifier_type": "A",
         "point_modifier": "0.000",
         "point_modifier_type": "A",
         "variant_name": "Medium",
         "image_pair": []
       },
       "14": {
         "variant_id": "14",
         "option_id": "3",
         "position": "30",
         "modifier": "0.000",
         "modifier_type": "A",
         "weight_modifier": "0.000",
         "weight_modifier_type": "A",
         "point_modifier": "0.000",
         "point_modifier_type": "A",
         "variant_name": "Large",
         "image_pair": []
       },
       "15": {
         "variant_id": "15",
         "option_id": "3",
         "position": "40",
         "modifier": "0.000",
         "modifier_type": "A",
         "weight_modifier": "0.000",
         "weight_modifier_type": "A",
         "point_modifier": "0.000",
         "point_modifier_type": "A",
         "variant_name": "X Large",
         "image_pair": []
       },
       "16": {
         "variant_id": "16",
         "option_id": "3",
         "position": "50",
         "modifier": "0.000",
         "modifier_type": "A",
         "weight_modifier": "0.000",
         "weight_modifier_type": "A",
         "point_modifier": "0.000",
         "point_modifier_type": "A",
         "variant_name": "XX Large",
         "image_pair": []
       }
     }
   },
   "4": {
     "option_id": "4",
     "product_id": "12",
     "company_id": "1",
     "option_type": "S",
     "inventory": "Y",
     "regexp": "",
     "required": "N",
     "multiupload": "N",
     "allowed_extensions": "",
     "max_file_size": "0",
     "missing_variants_handling": "M",
     "status": "A",
     "position": "0",
     "value": "",
     "option_name": "Color",
     "option_text": "",
     "description": "",
     "inner_hint": "",
     "incorrect_message": "",
     "comment": "",
     "variants": {
       "17": {
         "variant_id": "17",
         "option_id": "4",
         "position": "0",
         "modifier": "0.000",
         "modifier_type": "A",
         "weight_modifier": "0.000",
         "weight_modifier_type": "A",
         "point_modifier": "0.000",
         "point_modifier_type": "A",
         "variant_name": "Black/White/White",
         "image_pair": {
            "pair_id": "805",
            "image_id": "861",
            "detailed_id": "0",
            "position": "0",
            "icon": {
               "image_path": "http://localhost/images/variant_image/0/173283_01.jpg",
               "alt": "",
               "image_x": "500",
               "image_y": "500",
               "http_image_path": "http://localhost/images/variant_image/0/173283_01.jpg",
               "https_image_path": "https://localhost/images/variant_image/0/173283_01.jpg",
               "absolute_path": "/var/www/html/images/variant_image/0/173283_01.jpg",
               "relative_path": "variant_image/0/173283_01.jpg"
            }
         }
   },
       "18": {
         "variant_id": "18",
         "option_id": "4",
         "position": "0",
         "modifier": "0.000",
         "modifier_type": "A",
         "weight_modifier": "0.000",
         "weight_modifier_type": "A",
         "point_modifier": "0.000",
         "point_modifier_type": "A",
         "variant_name": "Dark Navy/White/White",
         "image_pair": {
            "pair_id": "806",
            "image_id": "862",
            "detailed_id": "0",
            "position": "0",
            "icon": {
               "image_path": "http://localhost/images/variant_image/0/242265_01.jpg",
               "alt": "",
               "image_x": "500",
               "image_y": "500",
               "http_image_path": "http://localhost/images/variant_image/0/242265_01.jpg",
               "https_image_path": "https://localhost/images/variant_image/0/242265_01.jpg",
               "absolute_path": "/var/www/html/images/variant_image/0/242265_01.jpg",
               "relative_path": "variant_image/0/242265_01.jpg"
            }
         }
       },
       "19": {
         "variant_id": "19",
         "option_id": "4",
         "position": "0",
         "modifier": "0.000",
         "modifier_type": "A",
         "weight_modifier": "0.000",
         "weight_modifier_type": "A",
         "point_modifier": "0.000",
         "point_modifier_type": "A",
         "variant_name": "White/Prime Green",
         "image_pair": {
            "pair_id": "807",
            "image_id": "863",
            "detailed_id": "0",
            "position": "0",
            "icon": {
               "image_path": "http://localhost/images/variant_image/0/X29580_01.jpg",
               "alt": "",
               "image_x": "500",
               "image_y": "500",
               "http_image_path": "http://localhost/images/variant_image/0/X29580_01.jpg",
               "https_image_path": "https://localhost/images/variant_image/0/X29580_01.jpg",
               "absolute_path": "/var/www/html/images/variant_image/0/X29580_01.jpg",
               "relative_path": "variant_image/0/X29580_01.jpg"
            }
         }
       }
     }
   }
  }

======================
View a Specific Option
======================

To view a specific option, send a GET request to ``/api/options/<option_id>``. For example::

  GET /api/options/3

If the request is successful, you’ll receive **HTTP/1.1 200 OK** and JSON with the details of the option. 

--------------
Option Details
--------------

The fields below represent various option details.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Field
        -   Values
        -   Description
    *   -   option_id
        -   *integer*
        -   A unique identifier of the option.
    *   -   product_id
        -   *integer*
        -   A unique identifier of the product that the option is associated with.
    *   -   company_id
        -   *integer*
        -   ID of the associated storefront (in CS-Cart) or vendor (in Multi-Vendor).
    *   -   option_type
        -   *string*
        -   | The type of the option:
            | ``S``—select box
            | ``R``—radiogroup
            | ``C``—checkbox
            | ``I``—text (one line)
            | ``T``—text area
            | ``F``—file
    *   -   inventory
        -   | ``Y``—yes
            | ``N``—no
        -   If enabled, the option is taken into account when forming the product inventory.
    *   -   regexp
        -   *string*
        -   | If the option type is *Text* or *Text area*, you can use `regular expressions <https://en.wikipedia.org/wiki/Regular_expression>`_ to limit what users can enter in the field.
            |
            | **Note:** If the ``incorrect_message`` field is empty, the check for regular expressions won’t run.
    *   -   required
        -   | ``Y``—yes
            | ``N``—no
        -   If an option is required, customers won’t be able to add a product to cart without specifying this option. For example, if a checkbox has ``required=Y``, a customer must tick it before adding the product to cart.
    *   -   multiupload
        -   | ``Y``—yes
            | ``N``—no
        -   If the option type is *File*, you can choose whether to allow customers to upload multiple files.
    *   -   allowed_extensions
        -   string
        -   If the option type is *File*, you can specify the allowed extensions separated by commas (e.g. ``jpg,bmp,gif,pdf``).
    *   -   max_file_size
        -   *integer*
        -   The maximum size of the uploaded files (in kilobytes).
    *   -   missing_variants_handling
        -   *string*
        -   | If the option type is *Select box* or *Radiogroup*, you can specify the variants of the option that customers can choose from. This field determines what to do when the administrator didn’t create variants for the option.
            | 
            | ``M``—display a message next to the option name. By default the message is “N/A”
            | ``H``—hide this option
    *   -   status
        -   *string*
        -   | The status of the option:
            | ``A``—active
            | ``D``—disabled
    *   -   position
        -   integer
        -   This parameter determines the position of the option among other options. The lower this number, the higher the option appears on the list of options in the Administration panel.
    *   -   value
        -   string
        -   The number of the option variant or the text entered in the field of *Text* or *Text area* option by the customers.
    *   -   option_name
        -   *string*
        -   The name of the option.
    *   -   description
        -   *string*
        -   If you fill in this field, the **?** icon (tooltip) will appear near the option name on the product page. When you hover your mouse over the icon, you’ll see the description text.
    *   -   inner_hint
        -   *string*
        -   A hint that appears in the field of a *Text* or *Text area* option. It tells the customers what they should enter in the field. The hint doesn’t serve as a default value.
    *   -   incorrect_message
        -   *string*
        -   If you use ``regexp`` for *Text* or *Text area* options, this message appears when the entered text doesn’t conform to the regular expression.
    *   -   comment
        -   *string*
        -   The text that appears below the option on the storefront.
    *   -   variants
        -   *array*
        -   An array with option variants. Available for the options of the *Select box* or *Radiogroup* type. An option of the *Checkbox* type has 2 variants by default.

---------------
Option Variants
---------------

A *Selectbox* or *Radiogroup* option can have different variants for the customer to choose from. These variants appear in the ``variants`` array.

.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 5 30

    *   -   Field
        -   Values
        -   Description
    *   -   variant_id
        -   *integer*
        -   A unique identifier of the option variant.
    *   -   option_id
        -   *integer*
        -   The ID of the option that the variant is associated with.
    *   -   position
        -   *integer*
        -   The position of the variant among other variants. The lower this number, the higher the variant appears on the list of variants in the Administration panel.
    *   -   modifier
        -   *float*
        -   The price modifier of the option variant.
    *   -   modifier_type
        -   *string*
        -   | The type of the price modifier:
            | ``A``—absolute: change product price by a fixed amount in the store’s primary currency
            | ``P``—percentage: change product price by certain percentage
    *   -   weight_modifier
        -   *float*
        -   The weight modifier of the option variant.
    *   -   weight_modifier_type
        -   *string*
        -   | The type of the weight modifier:
            | ``A``—absolute: change product weight by a fixed amount in the store’s weight measurement units
            | ``P``—percentage: change product weight of a product by certain percentage
    *   -   point_modifier
        -   *float*
        -   | The reward point modifier of the option variant.
            |
            | The :doc:`Reward Points <../../../user_guide/addons/reward_points/index>` add-on allows your customers to earn points for purchasing products. These points can later be used to pay for other products.
    *   -   point_modifier_type
        -   *string*
        -   | The type of the reward point modifier:
            | ``A``—absolute: change the number of points by a fixed amount
            | ``P``—percentage: change the number of points by certain percentage
    *   -   variant_name
        -   *string*
        -   The name of the option variant.
    *   -   image_pair
        -   *array*
        -   The array with the information about the image of the option variant.

================
Create an Option
================

To create an option, send a POST request to ``/api/options/``.

Pass the fields with the option details in the HTTP request body in accordance with the passed ``Content-Type``. Required fields are marked with *****:

* **product_id***—the unique identifier of the product that the option is associated with.

* **option_name***—the name of the option.

* **option_type**—the type of the option:

  * ``S``—select box
  * ``R``—radiogroup
  * ``C``—checkbox
  * ``I``—text (one line)
  * ``T``—text area
  * ``F``—file

  .. note::

      If you don’t specify ``option_type`` in the POST request, it will be set to ``S`` by default.

* **required**—determines if customers must specify this option before they can add the product to cart. Pass ``Y`` for “Yes” and ``N`` for “No”.

* **inventory**—determines if the option is taken into account when forming the product inventory. Pass ``Y`` for *Yes* and ``N`` for *No*.

* Any other fields that apply to the option of a particular type.

**Example JSON:**

::

  {
    "product_id": "12",
    "option_name": "Packaging",
    "option_type": "R",
    "required": "Y",
    "inventory": "N",
    "variants": {
        "1": {
          "variant_name": "None"
         }, 
        "2": {
          "variant_name": "Gift wrap",
          "modifier_type":"A",
          "modifier":"5"        
        }
    }
  }

This request creates a new option for the product with ``product_id=12``:

* The option is called *Packaging*.

* It has the *Radiogroup* type.
 
* It has 2 variants:

  * **None**—doesn’t change the price of the product.

  * **Gift wrap**—increases the price of the product by $5 (if the primary currency of your store is U.S. dollar).

If the option is created successfully, you will receive **HTTP/1.1 201 Created** and the option ID in the response::

  {
   "option_id": 27
  }

==============
Edit an Option
==============

To edit an existing option, send the PUT request to ``/api/options/<option_id>/``. For example::

  PUT /api/options/27

Pass the fields with option details in the HTTP request body in accordance with the passed ``Content-Type``. None of the fields are required.

**Example JSON:**

::

  {
    "option_type": "S",
    "variants": {
        "2": {
          "variant_name": "Gift wrap"       
        },
        "3": {
          "variant_name": "Present box",
          "modifier_type":"P",
          "modifier":"20"        
        }
    }
  }

This request changes the type and variants of the option with ``option_id=27``. When we first created this option (*Packaging*), it had the *Radiogroup* type and 2 variants: *None* and *Gift Wrap*.

Here we change the option type to *Select box*—it supports variants as well. We didn’t pass *None* this time, so this variant is removed. *Gift wrap* doesn’t change. We also add a new variant called *Present box*. Choosing this variant will increase the price of the product by 20%.

.. note::

    If an option has multiple variants, make sure to specify them all when you update the ``variants`` array with the PUT request. Variants that are not specified in the PUT request will be deleted.

================
Delete an Option
================

To delete an option, send the DELETE request to ``/api/options/<option_id>``::

  DELETE /api/options/27

This request will delete the specified option.

**Possible responses:**

* **HTTP/1.1 204 No Content**—the option has been deleted successfully.
* **HTTP/1.1 400 Bad Request**—the option couldn’t be deleted.
* **HTTP/1.1 404 Not Found**—the option doesn’t exist.

