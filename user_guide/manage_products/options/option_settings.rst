**************************************
Specific Settings of Some Option Types
**************************************

While setting up the `product options <http://kb.cs-cart.com/product_options>`_ , the following option types are available:

*   select box
*   radio group
*   check box
*   text
*   text area
*   file

There are some specific settings of some option types:

*   If you add an option of **text** or **textarea** type, you can specify additional parameters for it, namely:

    *   **RegExp** - Enter a regular expression that will validate the value entered by the customer.

    .. important ::

    	For example, if the field is set to **^[a-zA-Z]{3}[0-9]{2,3}$**, then the customer will have to enter 3 letters and 2 or 3 figures. To learn more about regular expressions, you should follow this `link <https://en.wikipedia.org/wiki/Regular_expression>`_ or you can find some quick examples in this :download:`file <files/regular-expressions-cheat-sheet-v1.pdf>`.

    *   **Inner hint** - Help notice appearing on the storefront to explain to the customer what values can be entered.
    *   **Incorrect filling message** - The message that is displayed in case of incorrect filling of the field. This may occur when a certain regular expression is set for the option.

    .. important ::

    	For example, if RegExp is set to **^[a-zA-Z]{3}[0-9]{2,3}$**, in this field you can enter the following: *Please, enter 3 letters and 2 or 3 figures (e.g. abc123)*. So if the customer enters an incorrect value, he/she will see the specified notification. This can be used to check a telephone number, postal code, date, etc.

*	If the option type is **file**, it means that the customer can upload a file for this product.

.. important ::

	It is especially useful for customizable products like T-shirts, mugs or postcards, where customers can use their own graphic image.

For option of the **file** type, you can specify the following additional parameters:

*   **Allowed extension** - Leave this field empty to allow uploading of all file types or input allowed extensions separated by comma (e.g. jpg, bmp, gif, pdf).
*   **Max uploading file size** - Leave this field empty to allow uploading of files of any size or limit the file size (**100** is equal to 100 Kb).
*   **Multiupload** - If selected, customers can upload several files.

