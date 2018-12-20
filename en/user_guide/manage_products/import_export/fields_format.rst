**********************
Imported Fields Format
**********************

An imported CSV file with product information can contain the columns described below. We have :doc:`an example of the CSV file <import_example>` that you can check; you can also make an example yourself by :doc:`exporting products <product_export>`.

.. important::

    CS-Cart and Multi-Vendor can import only the files that use the `UTF-8 character set <https://en.wikipedia.org/wiki/UTF-8>`_. If some values aren't imported properly (or at all), please try saving your file with the UTF-8 encoding and importing it again.

.. contents::
   :backlinks: none
   :local:

.. _import-product-code:

============
Product code 
============

This field is **mandatory**, and its value must be unique for each product. It can contain numbers, letters, or their combinations (up to 32 symbols). If you plan to :doc:`export product data to a CSV file <product_export>`, make sure that the CODE for each product is specified.

.. important::

    EXAMPLE: *B0002OG6NY*

.. warning::

    If the value of the field is equal to any existing product code, the imported data will replace the data of that product.

========
Language
========

A two-letter lowercase language code. This field is **mandatory**.

To find out a language code:

#. In the Administration panel, go to **Administration → Languages**.

#. Switch to the **Available** tab.

#. Find the desired language and see it language code in the **Language code** row.

.. important::

    EXAMPLE: *en*

==========
Product id
========== 

The numeric ID of the product from the store's database. If **Product code** is empty, then **Product id** will be used to identify the product instead.

.. important::

    EXAMPLE: *130*

.. _import-product-type:

============
Product type
============

.. note::

    This is a part of the :doc:`Product Variations </user_guide/addons/product_variations/index>` add-on.

The :doc:`type of the product </user_guide/manage_products/products/simple_versus_configurable>`:

* ``P``—simple product.

* ``C``—configurable product.

* ``V``—a variation of a configurable product.

.. important::

    EXAMPLE: *C*

========
Category
========

The full path to the main category of the product. Parent and child categories in the path must be separated from each other with the **Category delimiter** that you specify when you :doc:`import a CSV file with product data <product_import>`.

.. important::

    EXAMPLE (the delimiter is *///*): *Computers///Desktops*

.. note::

    If the specified categories and subcategories don't exist in the database, they will be created.

If the name of your category contains a colon (``:``), for example *Promotions///Discount: 10%*, then you need to escape it like this in the imported file: ``|Promotions///Discount: 10%|``. Otherwise the category won't be imported correctly.

=====
Price
===== 

The price of the product in your store. It must be in **0.00** format.

.. important::

    EXAMPLE: *1600.00*

==========
List price
==========

The recommended price of the product. It is used to display a discount label on the storefront: ``Discount = List price - Price``. The list price must be in **0.00** format.

.. important::

    EXAMPLE: *1750.00*

======
Status
====== 

The status of the product:

* **A**—*active*—the product appears on the storefront. 

* **H**—*hidden*—the product doesn't appear on the storefront. Customers can view it via direct link.

* **D**—*disabled*—the product appears only in the Administration panel.

.. important::

    EXAMPLE: *A*

========
Quantity
========

The amount of this product that you have in stock.

.. important::

    EXAMPLE: *50*

======
Weight
====== 

The weight of the product. You can configure the units of weight measurement under :doc:`Settings → General </user_guide/settings/general>`. By default, it is *lbs*. 

.. important::

    EXAMPLE: *20.25*

.. note::

    The weight must be an integral number or a decimal fraction with no more than two decimal places. The fractional part is separated by a full point (``.``).

============
Min quantity
============

The minimum amount of this product that can be purchased in one order. 

.. important::

    EXAMPLE: *1*

============
Max quantity
============

The maximum amount of this product that can be purchased in one order.

.. important::

    EXAMPLE: *10*

=============
Quantity step
=============
 
The number of items of this product by which a customer can increase or decrease the number of this product in cart. For example:

* **Min quantity** is *2*.

* **Max quantity** is *10*. 

* **Quantity step** is *2*.

Then customers will be able to buy 2, 4, 6, 8, or 10 items of this product in one order. 

.. important::

    EXAMPLE: *1*

==============
List qty count
==============

The maximum number of choices in the drop-down list that allows you to select the number of product items in cart. For example:

* **Min quantity** is *2*.

* **Max quantity** is *10*. 

* **Quantity step** is *2*.

* **List qty count** is *3*.

Then customers will be able to choose between 2, 4, or 6 items of this product.

.. important::

    EXAMPLE: *10*

.. note::

    Using **List qty count** will turn the **Quantity** input field on the product page into a select box.

================
Shipping freight
================ 

The additional shipping cost for this particular product, which is specified in the primary currency of the store. The shipping freight is added to the shipping charges calculated at checkout; it can be used as packaging cost.

.. important::

    EXAMPLE: *2.00*

.. note::

    Assuming that the calculated shipping charges are $50, and the shipping freight of a product is $5, then having 3 items in the cart would make the total shipping cost $65.

==========
Date added
==========

The date when the product was added. It uses the following format:

  *dd mmm yyyy 00:00:00*

.. important::

    EXAMPLE: *25 Dec 2011 14:05:00*

.. note::

     If this field is not filled in, the date and time when the product was imported will be used instead.

============
Downloadable
============

* **Y**—the product is downloadable.

* **N**—the product is not downloadable.

.. important::

    EXAMPLE: *Y*

.. note::

    To allow the creation of downloadable products in your store, go to **Settings → General** and tick the **Enable selling downloadable products** checkbox.

=====
Files
=====

The full path to the files of the downloadable product.

.. important::

    EXAMPLE: */home/client/public_html/cscart-4.4.1/var/files/exim/backup/downloads/filename.pdf*

The file can be specified without a path (just its name) if you specify **Files directory** when you :doc:`import a CSV file with product data <product_import>`. Several files must be delimited with a comma.

.. important::

    EXAMPLE: *file1.pdf, file2.jpg*

=================
Ship downloadable
=================

* **Y**—calculate the shipping cost for the downloadable product just like for a tangible one.

* **N**—don't calculate shipping cost for a downloadable product.

.. important::

    EXAMPLE: *Y*

==================
Inventory tracking
==================

* **D**—do not track the number of products in stock.

* **B**—track without options.

* **O**—track with options.

.. important::

    EXAMPLE: *D*

====================
Out of stock actions
==================== 

This field determines :doc:`what customers can do on the product page when the product is out of stock <../products/out_of_stock_actions>`:

* **B**—buy the product in advance. 

* **S**—sign up to receive an email notification when the product is available. 

* **N**—nothing.

.. important::

    EXAMPLE: *B*

=============
Free shipping
=============

* **Y**—the product is shipped for free and won't be taken into account for shipping cost calculation, if the shipping method can be used for free shipping.

* **N**—the product isn't shipped for free and will always be taken into account for shipping cost calculation.

.. important::

    EXAMPLE: *Y*

==================
Feature comparison
================== 

* **Y**—the product can be added to the comparison list.

* **N**—the product can't be added to the comparison list.

.. important::

    EXAMPLE: *Y*

.. note::

    This field existed until version 4.3.5. Starting with CS-Cart and Multi-Vendor 4.3.6, :doc:`any product can be added to the comparison list </user_guide/manage_products/features/feature_comparison>`.

=================
Zero price action
=================

This field describes the action when the product price is zero:

* **R**—do not allow to add the product to cart.

* **P**—allow to add the product to cart.

* **A**—ask customer to enter the price.

.. important::

    EXAMPLE: *A*

.. _advanced-image-import:

=======================
Advanced Import: Images
=======================

.. note::

    This field is available only with the :doc:`/user_guide/addons/advanced_products_import/index` add-on.

The path (or paths) to product images. Multiple images can be specified by using the image delimiter in the additional settings on the **File** tab of an :doc:`import preset </user_guide/manage_products/import_export/advanced_product_import>`.

.. important::

    EXAMPLE: *exim/backup/images/main_image.jpg///exim/backup/images/additional_image.jpg*

The image file can be specified without a path (just its name) if you specify **Images directory** when you :doc:`import a CSV file with product data <product_import>`.

You can specify alternative text for images by adding it after the path.

.. important::

    EXAMPLE: *exim/backup/images/main_image.jpg#{[ar]:Arabic alt text;[en]:English alt text;}///exim/backup/images/Nadditional_image.jpg#{[ar]:Arabic alt text;[en]:English alt text;}*

If each product image has its own column (in a CSV file) or node (in an XML file), you can map all of them to **Advanced Import: Images**. Then these fields will be combined properly, and multiple images will be imported for a product.


.. _csv-detailed-image-import:

==============
Detailed image
==============

The full path to the detailed product image.

.. important::

    EXAMPLE: */home/client/public_html/cscart/var/files/exim/backup/images/detailed_image.jpg*

The image file can be specified without a path (just its name) if you specify **Images directory** when you :doc:`import a CSV file with product data <product_import>`.

You can specify alternative text for images by adding it after the path. For example, to specify *ALT TEXT* as an alternative text for image in English and German, import the image as follows:

.. important::

    EXAMPLE: */home/client/public_html/cscart/var/files/exim/backup/images/detailed_image.jpg#{[de]:ALT TEXT;[en]:ALT TEXT;}*

=========
Thumbnail
=========

The full path to the product thumbnail image. **Thumbnails are generated from detailed images automatically**, so you need to use this field only if you want a thumbnail that is different from the detailed image of the product.

.. important::

    EXAMPLE: */home/client/public_html/cscart/var/files/exim/backup/images/thumbnail_image.jpg*

.. note::

    Specifying the paths and alternative text of the thumbnail works the same way as for :ref:`the detailed image <csv-detailed-image-import>`.

============
Product name
============

The name of the product, which can contain up to 255 symbols.

.. important::

    EXAMPLE: *Adidas Men's ClimaCool Short Sleeve Mock*

===========
Description
===========

The full description of the product, which can contain up to 16 777 215 symbols.

.. important::

    EXAMPLE: *ClimaCool is softer than cotton and resists pilling better than other natural and synthetic fibers. The shape and placement of ClimaCool fibers help move moisture quickly to the outer surface, where it evaporates away from the body.*

An imported file may contain HTML markup that affects the look of the text. It often occurs in the description, for example:

  <p><i>ClimaCool</i> is softer than cotton and resists pilling better than other natural and synthetic fibers.</p>

For CSV files it doesn't matter, but when you import an XML file, a problem occurs: XML and HTML tags both look like ``<...>``, and CS-Cart can't distinguish what is what. That's why HTML tags (a part of the description) must be separated from the XML tags (a part of the file structure). A text with HTML markup must be imported as follows:

  <![CDATA[<p><i>ClimaCool</i> is softer than cotton and resists pilling better than other natural and synthetic fibers.</p>]]>

=================
Short description
=================

The short description of the product, which can contain up to 16 777 215 symbols.

.. important::

    EXAMPLE: *100% circular rib Coolmax« Extreme 1x1 mini-rib solid pique mock with UV and anti-microbial finish.*

=============
Meta keywords
=============

The meta keywords of the product, which can contain up to 255 symbols; used for SEO purposes.

.. important::

    EXAMPLE: *adidas, climacool, clima cool, mock turtleneck, golf shirts, uv protection, sun*

================
Meta description
================

The meta description of the product, which can contain up to 255 symbols; used for SEO purposes.

.. important::

    EXAMPLE: *Adidas Men's ClimaCool Short Sleeve Mock*

============
Search words
============ 

The list of search words for the product, which can contain up to 65 535 symbols. A product with search words can be found by entering these search words in the CS-Cart's built-in search bar.

.. important::

    EXAMPLE: *adidas, climacool, men*

.. note::

    CS-Cart & Multi-Vendor search is not case-sensitive.

==========
Page title
==========

The name of the page as displayed in a browser, which can contain up to 255 symbols.

.. important::

    EXAMPLE: *Adidas Men's ClimaCool Short Sleeve Mock*

==========
Promo text
==========

A short promo text displayed on the product page, which can contain up to 16 777 215 symbols.

.. important::

    EXAMPLE: *FREE US shipping over $100! Orders within next 2 days will be shipped on Monday*

=====
Taxes
=====

The names of the taxes which will be applied to the product. Several taxes must be delimited with a comma.

.. important::

    EXAMPLE: *VAT, test*

.. warning::

     :doc:`Create taxes <../../shipping_and_taxes/taxes/set_up_tax>` **before** you import products with those taxes.

========
Features
========

All features that you import must follow this format:

  *{Feature ID} (Group name) Feature name: Feature type[Feature value]*

* **Feature ID**—the ID of the feature. 

* **Group name**—the name of the group to which the feature belongs.

* **Feature name**—the name of the feature.

* **Feature type**—one of the following types:

  * **C**—checkbox.

  * **M**—multiple checkboxes.

  * **S**—text select box.

  * **N**—number select box.

  * **E**—extended select box (Brand/Manufacturer).

  * **T**—simple text.

  * **O**—number.

  * **D**—date.

* **Feature value**—the value of the feature. 

Several features must be delimited with a semicolon.

.. important::

    EXAMPLE: *T[1233423423]; Release date: D[05/05/07]; Color: S[Red]*

.. note::

    If a feature or its variant doesn't exist in the database, it will be created automatically. You can also :doc:`create features manually <../features/product_features>` or import them **before** you import products with those features.


.. _import-options:

=======
Options
=======

All product options that you import must follow this format:

  *(Storefront) Option name: Option type[Variant 1///variant_property=value///variant_property=value, ..., Variant N///variant_property=value///variant_property=value]///setting=value///setting=value*

.. note::

    Several options must be delimited with a semicolon (``;``).

* **(Storefront)**—the name of the storefront.

  .. warning::

      If you don't specify the storefront, you won't be able to edit the options.

* **Option name**—the name of the option.

* **Option type**—one of the following option types:

  * **I**—text.

  * **T**—text area.
 
  * **S**—select box.

  * **R**—radio group.

  * **C**—checkbox.

.. important::

    EXAMPLE (text options): *(Simtech) Your age: I; (Simtech) Date of birth: I; (Simtech) Notes: T*

---------------
Option Variants
---------------

Variants can be specified for *select box* (*S*) and *radio group* (*R*) options right after the option type:

  *(Storefront) Option name: Option type[Variant 1///variant_property=value///variant_property=value, ..., Variant N///variant_property=value///variant_property=value]*

* **Variant 1, ..., Variant N**—the names of the variants. 

  .. important::

      EXAMPLE: *(Simtech) Color: S[Red, Green, Blue]; (Simtech) Size: R[S, M, L, XL, XXL]*

* **///**—the feature values delimiter that you specify when you :doc:`import a CSV file with product data <product_import>`.

* **variant_property=value///variant_property=value**—the properties of an option variant: 

  * **modifier**—a positive or negative value that is added to or subtracted from the product price when this option variant is selected.

  * **modifier_type**—the type of the price modifier:

    * **P**—a percentage.

    * **A**—a fixed value in the primary currency of the store.

  * **weight_modifier**—a positive or negative value that is added to or subtracted from the product weight when this option variant is selected.

  * **weight_modifier_type**—the type of the weight modifier:

    * **P**—a percentage.

    * **A**—a fixed value in the weight measurement unit of the store. 

  * **image**—an image of an option variant. This field works the same way as :ref:`the detailed image <csv-detailed-image-import>`.

.. important::

    EXAMPLE: *(Simtech) Size: S[Normal,Large///modifier=10.000///modifier_type=P///weight_modifier=20.000///weight_modifier_type=A]; Color: S[Grey///image=exim/backup/images/variant_image/grey_example.jpg,Black///modifier=50.000///modifier_type=A///image=exim/backup/images/variant_image/black_example.jpg]*

---------------
Option Settings
---------------

Settings can be specified after the option variants. Here are the settings that you may specify:

* **inventory**—determines if this option can be a part of an :doc:`option combination </user_guide/manage_products/options/option_combinations>` and has to be tracked separately:

  * **Y**—yes.

  * **N**—no.

* **missing_variants_handling**—determines what happens when all the variants of the option are disabled or not specified at all: 

  * **M**—display message.

  * **H**—hide option completely.

* **required**—if an option is required, customers will have to select/enter the variant of this option:

  * **Y**—the option is required.

  * **N**—the option isn't required.

* **status**—the status of the option:

  * **A**—active.

  * **D**—disabled.

  .. important::

      EXAMPLE: *(Simtech) Color: S[Red///modifier=5///modifier_type=A,Green///modifier=10///modifier_type=P]///inventory=Y///missing_variants_handling=M///required=Y///status=A*

* **multiupload** (for options with the *File* (*F*) type)—determines if customers can upload several files for one option:

  * **Y**—yes.

  * **N**—no.

* **allowed_extensions** (for options with the *File* (*F*) type)—the extensions of the files that the customers are allowed to upload:

* **max_file_size** (for options with the *File* (*F*) type)—the maximum size of an uploaded file in KBs.

  .. important::

      EXAMPLE: *(Simtech) Custom image: F///required=Y///multiupload=N///allowed_extensions=jpg,bmp,gif///max_file_size=1000*

.. _import-variation-options:

=================
Variation options
=================

The variants of options that comprise :doc:`a product variation </user_guide/manage_products/products/product_variations>`. For example, if you sell a T-shirt with options like *Size* and *Color*, then *a medium white T-shirt* would be a product variation. We have :doc:`a separate article on how to import product variations </user_guide/manage_products/import_export/variation_import>`.

.. important::

    EXAMPLE: *Size:Medium|Color:White*

====================
Secondary categories
====================

The full path to additional categories to which the product is assigned. Parent and child categories must be separated with the **Category delimiter** that you specify when you :doc:`import a CSV file with product data <product_import>`. If a product is assigned to several secondary categories, the paths to each category must be delimited with a semicolon (``;``).

.. important::

    EXAMPLE (the delimiter is *///*): *Computers///New products; Computers///Desktops*

If the name of your category contains a colon (``:``), for example *Promotions///Discount: 10%*, then you need to escape it like this in the imported file: ``|Promotions///Discount: 10%|``. Otherwise the category won't be imported correctly.

When you have multiple secondary categories, it can look like this: ``Best Products;|Promotions///Discount: 10%|``.

============
Items in box
============ 

The minimum and maximum number of product items to be shipped in a separate box. This field is used for automatic calculation of the shipping cost. The format of data in this field is as follows: **min:[number];max:[number]**.

.. important::

    EXAMPLE: *min:1;max:5*

========
Box size
========

Dimensions of a box. This field is used for automatic calculation of the shipping cost. The format of data in this field is as follows: 

  *length:[number];width:[number];height:[number]*

.. important::

    EXAMPLE: *length:10;width:15;height:15*

=============
Usergroup IDs
=============

Numeric IDs of the user groups will be able to see the product. Here are the IDs that CS-Cart and Multi-Vendor have by default:

* *0*—all users

* *1*—guests

* *2*—registered users

.. important::

    EXAMPLE: *0,1,2,3*

===============
Available since
===============

The date when the product becomes available for sale. It is used when the :doc:`out-of-stock action </user_guide/manage_products/products/out_of_stock_actions>` is set to *Buy in advance*. It must use the following format: 

  *dd mmm yyyy 00:00:00*

.. important::

    EXAMPLE: *25 Dec 2015 14:05:00*

===============
Exceptions type
===============

The type of the :doc:`product option exceptions </user_guide/manage_products/options/exceptions>`: 

* **F**—all option exceptions are forbidden: the customer cannot add the product with such option combination to the cart. All other option combinations are allowed.

* **A**—only option exceptions are allowed: the customer can add a product with such option combinations to the cart. However, other option combinations are forbidden.

.. important::

    EXAMPLE: *F*

============
Options type
============

The order in which option variants are selected by a customer on the product page:

* **P**—simultaneous: customers can select variants for options in any order; each option has some variant selected by default.

* **S**—sequential: customer must select a variant for the first option, then for the second option, and so on; by default, no variant is selected.

.. important::

    EXAMPLE: *S*

=====
Store
===== 

The store that the item belongs to. This field is **mandatory** in CS-Cart.

.. important::

    EXAMPLE: *Sample Store*

.. note::

    Multi-Vendor has the **Vendor** field instead.

========
SEO name
========

The SEO name of the product.

.. important::

    EXAMPLE: *my-product*

=============
Pay by points
=============

* **Y**—customers can pay for the product with :doc:`reward points <../../addons/reward_points/index>`.

* **N**—customers can't pay for the product with :doc:`reward points <../../addons/reward_points/index>`.

.. important::

    EXAMPLE: *Y*

===============
Override points
===============

* **Y**—override the amount points awarded for buying the product.

* **N**—don't override the amount of points awarded for buying the product.

.. important::

    EXAMPLE: *Y*

======================
Override exchange rate
======================

* **Y**—override the price in points for this product.

* **N**—use global point exchange rate for this product's price in points.

.. important::

    EXAMPLE: *Y*

==========
Popularity
==========

The popularity of the product. It is an integer that changes depending on the activity around the product (when the product is viewed, added to cart, removed from cart, or purchased). The higher it is, the more popular the product is.

.. important::

    EXAMPLE: *8*
