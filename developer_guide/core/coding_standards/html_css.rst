*****************************
HTML, CSS, JavaScript, Smarty
*****************************

====
HTML
====

1. Write all tags and attribute names **only in lowercase**.

2. Put all attribute values in double quotes.

3. Use 4-space indentation to structure HTML code. Structure the code only in the **head** and **body** sections. Don’t separate **<tr>** from **<table>** with indentation.

.. code-block:: html

  <html>
      <head>
      </head>    
      <body>
          <div id="header">Header</div>
          <div id="contents">
              <ul>
                  <li>Item 1</li>
                  <li>Item 2</li>
              </ul>

              <h7>Some table data</h7>

              <div id="table_data">
                  <table cellpadding="0" border="0">
                  <tr>
                      <td>
                          ....
                      </td>
                  </tr>
                  </table>
              </div>
          </div>
      </body>
  </html>

4. Use 4-space indentation to structure Smarty tags.

5. Check all templates for HTML validity. Templates must be HTML5-compliant (**<!DOCTYPE html>**).

 * Make sure to **close ALL tags**. HTML5 doesn't require it, however, closed tags improve code readability. 

   If an element doesn’t have a closing tag (for example, **<hr>**, **<br>**, **<img>**, **<meta>**, **<input>**), write the tag like this: ``<tag_name />``—use a slash before the end quote, and a space before the slash.

    * **Right:**

      .. code-block:: html

          <div><p>some text<hr width="100%" /></p></div>

    *  **Wrong:**

       .. code-block:: html

          <div><p>some text<br></div>

 * Make sure to close the nested tags in the right order:

     * **Right:**

       .. code-block:: html

            <b><i>test</i></b>

     * **Wrong:**

       .. code-block:: html

            <b><i>text</b></i>


  * Keep in mind the semantics of the nested tags.

  * **Don't use "&"** in HTML body; use ``&amp;`` only.

6. Close the tags right after the content of the tag—don’t move the closing tag to the next line. The only exception are the **<table><tr><td>** tags: in this case you can move the closing tag to the next line to improve readability. Make sure there is no space between the closing **</td>** tag and the content of **<td>**.

7. Use **{* *}** for commentaries.

8. A checkbox should generally send the **"Y"** (capitalized) value. Here's the way to send **"Y"** for ticked checkboxes and **"N"** for the unticked checkboxes:

.. code-block:: html

   <input type="hidden"   name="product_data[is_selected]" value="N" />
   <input type="checkbox" name="product_data[is_selected]" value="Y" />

9. An element ID must begin with a letter and may only include digits, letters and the underscore symbol.

  * **Right:**

    .. code-block:: html
            
           <div id="box_params_1234"></div>
        
  * **Wrong:**

    .. code-block:: html

            <div id="1212asd[sdsd]"></div>

10. **Don’t** use the ``style`` parameter for elements. All styles must stay in an external file, united in classes.

11. In automated tests you may need to refer to a certain element. In this case use the ``data-ct-xxxxxx`` attribute. **CT** stands for **cscart test**, and **xxxxxx** is a meaningful name of the element. 

.. important::

    **Don’t** use classes and IDs to refer to elements.

==========
JavaScript
==========

1. Always escape the content of a Smarty variable when the variable is a part of HTML parameter or JavaScript code: otherwise a single or double quote in the variable will result in an error.

  *  **Right:**

     .. code-block:: javascript

            <script language="javascript">
            var param = '{$smarty.get.param|escape:javascript}';
            </script>
            ...
            <input type="text" name="aa" value="{$param|escape:html}">

  *  **Wrong:**

     .. code-block:: javascript

            <script language="javascript">
            var param = '{$smarty.get.param}';
            </script>
            ...
            <input type="text" name="aa" value="{$param}">

​2. Don’t use the ``javascript:`` prefix, if possible—a link is meant to lead somewhere. JavaScript code must be written in the event handler, for example, via microformat:

.. code-block:: html

   <a href="index.php" class="cm-submit-form">

​3. All function definitions must end with **;** (semicolons):

::

   // a sample of the correct code
    var input, output;

    // a semicolon at the end of function definition:
    onload = function() {
      input = document.getElementById("input");
      output = document.getElementById("output");
      clearAll(true);
    };

    function packScript() {
      output.value = pack(input.value);
    };

    function clearAll(focus) {
      output.value = input.value = '';
      // don’t use semicolon at the end of an IF construction
      if (focus) {
        input.focus();
      }
    };

===
CSS
===

1. The names of the styles must be meaningful. Write the names of styles in lowercase and use dashes (-) to separate words from each other. Use 4-space indentation to structure the code.

.. code-block:: css

   .dialog-box {
        font-size: 12px;
        font-weight: 10px;
    }

2. Use absolute values (**px**) to specify all sizes. However, relative values are justified in some cases.

3. Divide the CSS file into logical parts with commentaries:

::

    /* General styles */
    /* /General styles */

    /* Header styles */
    /* /Header styles */

    /* Side boxes styles */
    /* /Side boxes styles */

    /* Main boxes styles */
    /* /Main boxes styles */

======
Smarty
======

1. All flag parameters passed to the templates must have the **true/false** values, not **Y/N** or anything else.

  * **Right:**

    .. code-block:: javascript

           {include file="common/price.tpl" value=$price hide_sign=true}

  * **Wrong:**

    .. code-block:: javascript

           {include file="common/price.tpl" value=$price hide_sign="Y"}


2. **Don’t** use the ``str_replace`` function in templates. Use the ``replace`` modifier instead.

3. Use only double quotes in templates. The only exception is JavaScript.

4. Don’t use **$ldelim** or **ldelim** to display curly brackets, unless the opening and the closing bracket are on the same line.

::

  {$smarty_var}
  <script>
  if (some_cond) { // in these case Smarty can figure out that these aren’t Smarty tags
      ...
  }

  var a = {ldelim}{rdelim}; // the output is var a = {};
  </script>

5. Use short notation to assign values to variables.

  * **Right:**

    .. code-block:: javascript

           {$test = 123}

  * **Wrong:**

    .. code-block:: javascript

           {assign var="test" value=123}
