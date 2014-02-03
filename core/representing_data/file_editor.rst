***********
File editor
***********

It is possible to edit source code of the theme files directly from your administration panel in CS-Cart. **File editor** helps to manage files located in the *.../design/themes/theme_name* directory.

.. note::

	The file editor is based on Javascript. So, Javascript must be enabled in your web browser.

To edit files:

*	In the administration panel go to **Design > File editor**.
*	In the left panel choose the desired directory and file. This panel displays the structure of the *.../design/themes/theme_name* directory.
*	Edit the desired part of code in the opened panel and click **Save changes**.


.. image:: img/file_editor.png
    :align: center
    :alt: File_editor


.. note::

	Pay attention, that the files of the currently used theme are displayed in this section. If you want to edit any other theme, choose it in the **Design > Themes** section.

========================
On-site template editing
========================

This feature makes editing the storefront templates on the fly possible. Choose the desired element right on the storefront (editable ones have icons), click on the desired template and edit its contents in the appeared window. The source code is highlited so that it is very easy to track its structure, and the applied changes are seen just there on the storefront.

.. note::

	Do not forget to switch on the **Rebuild cache automatically** selector, if you want the modified files to be re-cached and applied changes be seen immediately.

=====
Usage
=====

As the example of the **File editor** usage let's consider changing the **Add to cart** section location at the categories page.

This is what we have:

.. image:: img/file_editorbefore.png
    :align: center
    :alt: Before

And this is what we will get:

.. image:: img/file_editorafter.png
    :align: center
    :alt: After


*	In the File editor open *templates > blocks > list_templates > products_list.tpl*, find the following lines and cut them from the code:


.. image:: img/file_editorcut.png
    :align: center
    :alt: Cut


*	In the same file find the line with the *<div class="float-left product-item-image center">* class and paste the previous code in it exactly as shown in the picture (just before the closing *</div>* tag):


.. image:: img/file_editorpaste.png
    :align: center
    :alt: Paste


*	Remove *float-right right* from *<div class="float-right right add-product">*. Result: *<div class="add-product">*
*	Click **Save changes**.
*	Open the categories page on the storefront to make sure, that the changes are displayed correctly.