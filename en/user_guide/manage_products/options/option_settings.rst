*********************************
Settings of Specific Option Types
*********************************

While setting up the :doc:`product options <../options/product_options>`, the following option types are available:

* Select box
* Radio group
* Check box
* Text
* Text area
* File

Different option types have their own settings and properties that are specific to them.

.. contents::
   :backlinks: none
   :local:

==============
Text/Text Area
==============

If you add an option of **Text** or **Textarea** type, you'll be able to specify:

* **RegExp**—a regular expression that will validate the value that a customer enters into the text field. For example, if **RegExp** is set to *^[a-zA-Z]{3}[0-9]{2,3}$*, then the customer will have to enter 3 letters and 2 or 3 digits. 

  .. hint::

      More information about regular expressions is available `in other sources <https://en.wikipedia.org/wiki/Regular_expression>`_; you can also :download:`download a PDF file with examples <files/regular-expressions-cheat-sheet-v1.pdf>`.

* **Inner hint**—the text that will appear on the storefront in the text field; it may be used to show to customers what values can be entered in the text field.

* **Incorrect filling message**—the message that will be displayed when an incorrect value is entered in the text field. This may occur when a certain regular expression is set for the option. For example, if we use a regular expression from above, here's a possible message:

  .. note ::

      Please enter 3 letters and 2 or 3 digits (for example, *abc123*) 

  This functionality can be used to check a telephone number, postal code, date, etc.

====
File
====

If the option type is **File**, it means that a customer can upload a file for this product. It is especially useful for customizable products like T-shirts, mugs or postcards, where customers can use their own graphic image.

For an option of the **file** type, you can specify the following additional parameters:

* **Allowed extensions**—specify what formats of files can be uploaded by customers. Separate the extensions with commas like this: ``jpg,bmp,gif,pdf``. To allow customers to upload files of any format, leave this field empty.

* **Max uploading file size**—limit the size of the uploaded file (for example, *100* is equal to 100 Kb) or leave this field empty to allow uploading files of any size.

* **Multiupload**—if you tick this checkbox, customers will be able to upload several files.

================================
Select Box/Radio Group/Check box
================================

If the option type is **Select box**, **Radio group**, or **Check box**, it means that customers will be offered to choose from multiple existing variants. When you are creating or editing an option, you'll see the **Variants** tab, where you can:

* Enter the name of the variant (for example, *Green* for the **Color** option).

* Enter the modifiers that will be added to or subtracted from the product's price and weight when this variant is selected (for example, *+2*). Leave the fields empty if the price and weight don't change. Each of the modifiers can either be an absolute value or a percentage.
        
* Click the **Extra** link to manage the following settings:

  * **Icon**—the thumbnail to represent the option variant. You can also provide alternative text, it's good for SEO.

  * **Earned point modifier/Type**—a positive or negative value that is added to or subtracted from the original number of reward points that customers receive at their accounts when they buy the product. The modifier can be either an absolute value or a percentage.

* Add more variants by clicking the **+** icon.

.. note::

    An option with the **Check box** type only has one variant (ticked checkbox). That variant doesn't have an image and a name.

.. image:: img/global_options_02.png
    :align: center
    :alt: The properties of option variants in CS-Cart
