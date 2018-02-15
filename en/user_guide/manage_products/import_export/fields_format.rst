**********************
Imported Fields Format
**********************

A CSV file can contain the following fields:

**Product code**. This field is **mandatory**, and its value must be unique for each product (if its value is equal to the existing product code, this product data will be replaced with the imported data). It can contain numbers, letters, or their combinations.

.. important::

	EXAMPLE: *B0002OG6NY*

**Language**. Two-letter language code. This field is **mandatory**.

To find out language code of the desired language:

*	In the administartion panel, go to **Administartion → Languages**.
*	Switch to the **Available** tab.
*	Find the desired language and see it language code in the **Language code** row.

.. important::

	EXAMPLE: *en*

**Product id**. Numerical ID of the product.

.. important::

	EXAMPLE: *130*

**Category**. Full category path to the product. If there are several categories in it, they must be separated by **Category delimiter** that you specify on the **Import products** page.

.. important::

	EXAMPLE: *Computers///Desktops* (the delimiter is *///*).

**List price**. List price of the product. It must be in **0.00** format.

.. important::

	EXAMPLE: *1750.00*

**Price**. Price of the product. It must be in **0.00** format.

.. important::

	EXAMPLE: *1600.00*

**Status**. Status of a product (**A** - Active, **H** - Hidden, **D** - Disabled).

**Quantity**. Product amount.

.. important::

	EXAMPLE: *50*

**Weight**. Weight of the product in units of weight defined by the weight symbol in the **Settings → General** page in the Administration panel. By default, it is *lbs*. The weight must be an integral number or a decimal fraction with no more than two decimal places.

.. important::

	EXAMPLE: *20.25*

**Min quantity**. Minimum product amount that can be purchased.

.. important::

	EXAMPLE: *1*

**Max quantity**. Maximum product amount that can be purchased.

.. important::

	EXAMPLE: *10*

**Quantity step**. Number of product items between the two choices in the **Quantity** select box.

.. important::

	EXAMPLE: *1*

**List qty count**. Maximum of choices in the **Quantity** select box.

.. important::

	EXAMPLE: *10*

**Shipping freight**. Value of the shipping cost for this particular product. It is added to the ones calculated at checkout.

.. important::

	EXAMPLE: *2.00*

**Date added**. Date the product was added. In the **dd mmm yyyy 00:00:00** format.

.. important::

	EXAMPLE: *25 Dec 2011 14:05:00*

.. important::

	If this field is not completed, the date of the product creation will be the date this product has been imported.

**Downloadable**. It must be **Y** if product is downloadable, **N** - if not.

**Files**. Full path to the file for the downloadable product.

.. important::

	EXAMPLE: */home/client/public_html/cscart-4.3.1/var/files/exim/backup/downloads/filename.pdf*

The file can be specified without a path (just its name) if you specify **Files directory** on the **Import products** page when importing. Please refer to the :doc:`Product Import <../import_export/product_import>` article. Several files must be delimited by a comma.

.. important::

	EXAMPLE: *file1.pdf, file2.jpg*

**Ship downloadable**. It must be **Y** if the shipping cost is calculated for a downloadable product like for a tangible one, **N** - if not.

**Inventory tracking**. This field describes the inventory tracking type: **D** - do not track, **B** - track without options, **O** - track with options.

**Out of stock actions**. Select if customers should be able to buy the product in advance before it is not yet available for sale - **B** , or sign up to receive an email notification when the product is available - **S**. **N** - no action.

**Free shipping**. It must be **Y** if the product is shipped for free, **N** - if not.

**Feature comparison**. It must be **Y** if the product can be added to the compare list, **N** - if not.

**Zero price action**. This field describes the action when the product price is zero: **R** - Do not allow to add the product to cart, **P** - Allow to add the product to cart, **A** - Ask customer to enter the price.

**Thumbnail**. Full path to the product thumbnail image.

.. important::

	EXAMPLE: */home/client/public_html/cscart-4.3.1/var/files/exim/backup/images/thumbnail_image.jpg*

The image file can be specified without a path (just its name) if you specify **Images directory** on the **Import products** page when importing. Please refer to the :doc:`Product Import <../import_export/product_import>` article.

**Detailed image**. The full path to the detailed product image.

.. important::

	EXAMPLE: */home/client/public_html/cscart/var/files/exim/backup/images/detailed_image.jpg*

The image file can be specified without a path (just its name) if you specify **Images directory** on the **Import products** page when importing. Please refer to the :doc:`Product Import <../import_export/product_import>` article.

**Product name**. Name of the product.

.. important::

	EXAMPLE: *Adidas Men's ClimaCool Short Sleeve Mock*

**Description**. Product full description.

.. important::

	EXAMPLE: *ClimaCool is softer than cotton and resists pilling better than other natural and synthetic fibers. The shape and placement of ClimaCool fibers help move moisture quickly to the outer surface, where it evaporates away from the body. Adidas Mens ClimaCool Short Sleeve Mocks features: 100% polyester Coolmax Extreme - UV protection; ClimaCool is a superior moisture management technology designed to regulate skin temperature, improve the flow of air and dry faster; ClimaCool is proven to reduce skin temperature and heart rate during exercise; Short sleeve mock; Coolmax Extreme rib knit mock; Set-in sleeve; Jacquard mesh side panels for added breathability; Open hem sleeves*

**Short description**. Product short description.

.. important::

	EXAMPLE: *100% circular rib Coolmax« Extreme 1x1 mini-rib solid pique mock with UV and anti-microbial finish.*

**Meta keywords**. Product meta keywords.

.. important::

	EXAMPLE: *adidas, climacool, clima cool, mock turtleneck, golf shirts, uv protection, sun*

**Meta description**. Product meta description.

.. important::

	EXAMPLE: *Adidas Men's ClimaCool Short Sleeve Mock*

**Search words**. Search words for the product (search is not case-sensitive in CS-Cart).

.. important::

	EXAMPLE: *adidas, climacool, men*

**Page title**. Name of the page displayed in the browser.

.. important::

	EXAMPLE: *Adidas Men's ClimaCool Short Sleeve Mock*

**Promo text**. Short promo text displayed on the product page.

.. important::

	EXAMPLE: *FREE US shipping over $100! Orders within next 2 days will be shipped on Monday*

**Taxes**. Name of the tax defined in your store which will be applied to the product. It is required to create taxes on the **Taxes** page before (!) importing them. Several taxes must be delimited by a comma.

.. important::

	EXAMPLE: *VAT, test*

**Features**. All features that you import must be in the **{Feature ID} (Group name) Feature name: Feature type[Feature value]** format, where **Feature ID** - ID of the feature, **Group name** - Name of the feature group, **Feature name** - Name of the feature, **Feature type** - Type of the feature (**C** - checkbox, **M** - multiple checkboxes, **S** - text select box, **N** - number select box, **E** - extended selectbox, **T** - simple text, **O** - number, **D** - date), **Feature value** - Value of the feature (several values can be delimited by a comma). Several features must be delimited by a semicolon.

.. important::

	It is required to create features on the **Product features** page before (!) applying them to the products.

.. important::

	EXAMPLE: *T[1233423423]; Release date: D[05/05/07]; Color: S[Red]*

**Options**. All product options that you import must be in the **Option name: Option type[Variant1, Variant2, ..., VariantN]** format, where **Option name** - Name of the option, **Option type** - Type of the option (**S** - select box, **R** - radio group, **C** - check box, **I** - simple input, **T** - text area), **Variant1,2,...N** - Name of the variant. Variants must be specified if the option type is a select box or radio group only. Several options must be delimited by a semicolon.

.. important::

	Example of simple text options: *Your age: I; Date of birth: I; Notes: T*

    Example of options with variants: *Color: S[Red, Green, Blue]; Size: R[X, XL, XX]*

If you want to import a product with options that have variants with **Modifier/Type** or **Weight modifier/Type** (they can be set up on the product detail page in the **Options** tab), it must be in the following format: **Option name: Option type[Variant1///modifier=0.000///modifier_type=TYPE, Variant2///weight_modifier=0.000///weight_modifier_type=TYPE, ..., VariantN]**. Where **///** - Category delimiter that you specify on the **Import products** page, **TYPE** in **modifier_type** - **A** for $ and **P** for %; **TYPE** in **weight_modifier_type** - **A** for Ibs, **P** for %.

.. important::

	Example: *Color: S[Black,White///modifier=1.000///modifier_type=A,Green///modifier=2.000///modifier_type=P,Red///weight_modifier=2.000///weight_modifier_type=A,Blue///weight_modifier=4.000///weight_modifier_type=P]; Size: S[Small,Medium,Large,X Large,XX Large]*

**Secondary categories**. Additional categories, separated by **Category delimiter** that you specify on the **Import products** page. Please refer to the :doc:`Product Import <../import_export/product_import>` article. Several secondary categories must be delimited by a semicolon.

.. important::

	EXAMPLE: *Computers///New products; Computers///Desktops* (the delimiter is *///*).

**Items in box**. The minimum and maximum number of product items to be shipped in a separate box. It must be in **min:[number];max:[number]** format.

.. important::

	EXAMPLE: *min:1;max:5*

**Box size**. Dimensions for a box. It must be in **length:[number];width:[number];height:[number]** format.

.. important::

	EXAMPLE: *length:10;width:15;height:15*

**Usergroup IDs**. Numerical IDs of the usergroups that the product will be displayed for.

.. important::

	EXAMPLE: *0,1,2,3*

**Available since**. Date when the product becomes available for sale. In the **dd mmm yyyy 00:00:00** format.

.. important::

	EXAMPLE: *25 Dec 2015 14:05:00*

**Exceptions type**. A type of the product options exceptions: **F** - all option exceptions are forbidden, and the customer cannot add the product with such option combination to the cart, all other option combinations become permissible; **A** - all option exceptions are allowed, and the customer can add the product with such option combination to the cart, all other option combinations become impermissible.

.. important::

	EXAMPLE: *F*

**Store**. Store that the item belongs to. This field is **mandatory** in CS-Cart.

.. important::

	EXAMPLE: *Sample Store*

.. note::

	In Multi-Vendor the **Vendor** field is used instead.

**SEO name**. SEO name of the product.

.. important::

	EXAMPLE: *my-product*

**Pay by points**. Product can be paid for with points. **Y** = yes, **N** = no.

**Override points**. Recalculate points that go together with the product. **Y** = yes, **N** = no.

**Override exchange rate**. Override global point exchange rate. **Y** = yes, **N** = no.
