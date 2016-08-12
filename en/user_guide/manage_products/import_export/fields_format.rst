**********************
Imported Fields Format
**********************

An imported CSV file can contain the fields described below.

============
Product code 
============

This field is **mandatory**, and its value must be unique for each product. It can contain numbers, letters, or their combinations.

.. important::

    EXAMPLE: *B0002OG6NY*

.. warning::

    If the value of the field is equal to any existing product code, the imported data will replace the data of that product.

========
Language
========

A two-letter language code. This field is **mandatory**.

To find out language code of the desired language:

* In the Administartion panel, go to **Administartion → Languages**.

* Switch to the **Available** tab.

* Find the desired language and see it language code in the **Language code** row.

.. important::

	EXAMPLE: *en*

==========
Product id
========== 

The numeric ID of the product.

.. important::

	EXAMPLE: *130*

========
Category
========

Full category path to the product. If there are several categories in it, they must be separated by **Category delimiter** that you specify on the **Import products** page.

.. important::

	EXAMPLE (the delimiter is *///*): *Computers///Desktops*

==========
List price
==========

List price of the product. It must be in **0.00** format.

.. important::

	EXAMPLE: *1750.00*

=====
Price
===== 

The price of the product in your store. It must be in **0.00** format.

.. important::

	EXAMPLE: *1600.00*

======
Status
====== 

Status of the product:

* **A**—*active*—the product appears on the storefront. 

* **H**—*hidden*—the product doesn't appear on the storefront. Customers can view it via direct link.

* **D**—*disabled*—the product appears only in the Administration panel.

========
Quantity
========

The amount of this product that you have in stock.

.. important::

	EXAMPLE: *50*

======
Weight
====== 

The weight of the product. You can configure the units of weight measurement under :doc:`Settings → General <../../settings/general>`. By default, it is *lbs*. 

.. important::

	EXAMPLE: *20.25*

.. note::

    The weight must be an integral number or a decimal fraction with no more than two decimal places.

============
Min quantity
============

The minimum amount of this product that can be purchased.

.. important::

	EXAMPLE: *1*

============
Max quantity
============

The maximum amount of this product that can be purchased.

.. important::

	EXAMPLE: *10*

=============
Quantity step
=============
 
The number of product items between the two choices in the **Quantity** select box. For example:

* **Min quantity** is *2*.

* **Max quantity** is *10*. 

* **Quantity step** is *2*.

Then customers can choose to buy 2, 4, 6, 8, or 10 items of this product. 

.. important::

	EXAMPLE: *1*

==============
List qty count
==============

The maximum number of choices in the **Quantity** select box. For example:

* **Min quantity** is *2*.

* **Max quantity** is *10*. 

* **Quantity step** is *2*.

* **List qty count** is *3*.

Then customers can choose to buy 2, 4, or 6 items of this product. 

.. important::

	EXAMPLE: *10*

================
Shipping freight
================ 

The shipping cost for this particular product. It is added to the shipping charges calculated at checkout.

.. important::

	EXAMPLE: *2.00*

==========
Date added
==========

The date when the product was added. It uses the **dd mmm yyyy 00:00:00** format.

.. important::

	EXAMPLE: *25 Dec 2011 14:05:00*

.. note::

     If this field is not filled in, the date of the product creation will be the date when this product has been imported.

============
Downloadable
============

* **Y**—the product is downloadable.

* **N**—the product is not downloadable.

=====
Files
=====

The full path to the file for the downloadable product.

.. important::

    EXAMPLE: */home/client/public_html/cscart-4.4.1/var/files/exim/backup/downloads/filename.pdf*

The file can be specified without a path (just its name) if you specify **Files directory** on the **Import products** page when importing. Please refer to the :doc:`Product Import <../import_export/product_import>` article. Several files must be delimited by a comma.

.. important::

    EXAMPLE: *file1.pdf, file2.jpg*

=================
Ship downloadable
=================

* **Y**—calculate the shipping cost for the downloadable product just like for a tangible one.
* **N**—don't calculate shipping cost for a downloadable product.

==================
Inventory tracking
==================

* **D**—do not track the number of products in stock.

* **B**—track without options.

* **O**—track with options.

====================
Out of stock actions
==================== 

This field determines :doc:`what customers can do on the product page when the product is out of stock <../products/out_of_stock_actions>`:

* **B**—buy the product in advance. 

* **S**—sign up to receive an email notification when the product is available. 

* **N**—nothing.

=============
Free shipping
=============

* **Y**—the product is shipped for free.

* **N**—the product isn't shipped for free.

==================
Feature comparison
================== 

* **Y**—the product can be added to the comparison list.

* **N**—the product can't be added to the comparison list.

=================
Zero price action
=================

This field describes the action when the product price is zero:

* **R**—do not allow to add the product to cart.

* **P**—allow to add the product to cart.

* **A**—ask customer to enter the price.

=========
Thumbnail
=========

The full path to the product thumbnail image.

.. important::

    EXAMPLE: */home/client/public_html/cscart-4.4.1/var/files/exim/backup/images/thumbnail_image.jpg*

The image file can be specified without a path (just its name) if you specify **Images directory** on the **Import products** page when importing. Please refer to the :doc:`Product Import <../import_export/product_import>` article.

==============
Detailed image
==============

The full path to the detailed product image.

.. important::

    EXAMPLE: */home/client/public_html/cscart/var/files/exim/backup/images/detailed_image.jpg*

The image file can be specified without a path (just its name) if you specify **Images directory** on the **Import products** page when importing. Please refer to the :doc:`Product Import <../import_export/product_import>` article.

============
Product name
============

The name of the product.

.. important::

    EXAMPLE: *Adidas Men's ClimaCool Short Sleeve Mock*

===========
Description
===========

The full description of the product.

.. important::

    EXAMPLE: *ClimaCool is softer than cotton and resists pilling better than other natural and synthetic fibers. The shape and placement of ClimaCool fibers help move moisture quickly to the outer surface, where it evaporates away from the body. Adidas Mens ClimaCool Short Sleeve Mocks features: 100% polyester Coolmax Extreme - UV protection; ClimaCool is a superior moisture management technology designed to regulate skin temperature, improve the flow of air and dry faster; ClimaCool is proven to reduce skin temperature and heart rate during exercise; Short sleeve mock; Coolmax Extreme rib knit mock; Set-in sleeve; Jacquard mesh side panels for added breathability; Open hem sleeves*

=================
Short description
=================

The short description of the product.

.. important::

    EXAMPLE: *100% circular rib Coolmax« Extreme 1x1 mini-rib solid pique mock with UV and anti-microbial finish.*

=============
Meta keywords
=============

The meta keywords of the product.

.. important::

    EXAMPLE: *adidas, climacool, clima cool, mock turtleneck, golf shirts, uv protection, sun*

================
Meta description
================

The meta description of the product.

.. important::

    EXAMPLE: *Adidas Men's ClimaCool Short Sleeve Mock*

============
Search words
============ 

Search words for the product.

.. important::

    EXAMPLE: *adidas, climacool, men*

.. note::

    CS-Cart & Multi-Vendor search is not case-sensitive.

==========
Page title
==========

The name of the page displayed in a browser.

.. important::

	EXAMPLE: *Adidas Men's ClimaCool Short Sleeve Mock*

==========
Promo text
==========

A short promo text displayed on the product page.

.. important::

    EXAMPLE: *FREE US shipping over $100! Orders within next 2 days will be shipped on Monday*

=====
Taxes
=====

The names of the taxes which will be applied to the product. Several taxes must be delimited by a comma.

.. important::

	EXAMPLE: *VAT, test*

.. warning::

     :doc:`Create taxes <../../shipping_and_taxes/taxes/set_up_tax>` **before** you import products with those taxes.

========
Features
========

All features that you import must follow the **{Feature ID} (Group name) Feature name: Feature type[Feature value]** format:

* **Feature ID**—the ID of the feature. 

* **Group name**—the name of the feature group.

* **Feature name**—the name of the feature.

* **Feature type**—the type of the feature:

  * **C**—checkbox
  * **M**—multiple checkboxes
  * **S**—text select box
  * **N**—number select box
  * **E**—extended select box 
  * **T**—simple text
  * **O**—number
  * **D**—date 

* **Feature value**—the value of the feature (several values can be delimited by a comma). Several features must be delimited by a semicolon.

.. important::

    EXAMPLE: *T[1233423423]; Release date: D[05/05/07]; Color: S[Red]*

.. warning::

    :doc:`Create features <../features/product_features>` **before** you import products with those features.

=======
Options
=======

All product options that you import must follow the **(Storefront) Option name: Option type[Variant1, Variant2, ..., VariantN]** format:

* **(Storefront)**—the name of the storefront.

.. warning::

    If you don't specify the storefront, you won't be able to edit the options.

* **Option name**—the name of the option.

* **Option type**—the type of the option:
 
  * **S**—select box
  * **R**—radio group
  * **C**—checkbox, 
  * **I**—simple input
  * **T**—text area 

* **Variant1,2,...N**—the names of the variants. 

.. note::
 
    Variants must be specified if the option type is a select box or radio group only. Several options must be delimited by a semicolon.

.. important::

    EXAMPLE (simple text options): *(Simtech) Your age: I; (Simtech) Date of birth: I; (Simtech) Notes: T*

    EXAMPLE (options with variants): *(Simtech) Color: S[Red, Green, Blue]; (Simtech) Size: R[X, XL, XX]*

If you want to import a product with options that have variants with **Modifier/Type** or **Weight modifier/Type** (they can be set up on the product detail page in the **Options** tab), it must be in the following format: **(Storefront) Option name: Option type[Variant1///modifier=0.000///modifier_type=TYPE, Variant2///weight_modifier=0.000///weight_modifier_type=TYPE, ..., VariantN]**: 

* **///**—the category delimiter that you specify on the **Import products** page.

* **TYPE**—the type of weight or price modifier: 

  * **A** (absolute)—change the weight or price by a certain fixed amount
  * **P** (percentage)—change the weight or price by a certain percent.

.. important::

    EXAMPLE: *(Simtech) Color: S[Black,White///modifier=1.000///modifier_type=A,Green///modifier=2.000///modifier_type=P,Red///weight_modifier=2.000///weight_modifier_type=A,Blue///weight_modifier=4.000///weight_modifier_type=P]; Size: S[Small,Medium,Large,X Large,XX Large]*

====================
Secondary categories
====================

Additional categories, separated by **Category delimiter** that you specify on the **Import products** page. Please refer to the :doc:`Product Import <../import_export/product_import>` article. Several secondary categories must be delimited by a semicolon.

.. important::

    EXAMPLE (the delimiter is *///*): *Computers///New products; Computers///Desktops*

============
Items in box
============ 

The minimum and maximum number of product items to be shipped in a separate box. They must be specified in this format: **min:[number];max:[number]**.

.. important::

    EXAMPLE: *min:1;max:5*

========
Box size
========

Dimensions for a box. They must be specified in this format: **length:[number];width:[number];height:[number]**.

.. important::

	EXAMPLE: *length:10;width:15;height:15*

=============
Usergroup IDs
=============

Numeric IDs of the usergroups that the product will be displayed for.

.. important::

    EXAMPLE: *0,1,2,3*

===============
Available since
===============

The date when the product becomes available for sale. It must use the following format: **dd mmm yyyy 00:00:00**.

.. important::

    EXAMPLE: *25 Dec 2015 14:05:00*

===============
Exceptions type
===============

The type of the product option exceptions: 

* **F**—all option exceptions are forbidden. and the customer cannot add the product with such option combination to the cart. All other option combinations are allowed.

* **A**—all option exceptions are allowed, and the customer can add the product with such option combination to the cart. All other option combinations are not allowed.

.. important::

	EXAMPLE: *F*

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

===============
Override points
===============

* **Y**—recalculate points awarded for buying the product.

* **N**—don't recalculate points awarded for buying the product.

======================
Override exchange rate
======================

* **Y**—override global point exchange rate for this product.

* **N**—use global point exchange rate for this product.
