****************
CSS Minimization
****************

CSS file size can be minimized with the so called special classes. They can be used both separately:

.. code-block:: html

	//Creating a floating element
	<div class="float-left">It's a floating block</div>
	<div>It's a standard block</div>

and together with standard classes:

.. code-block:: html

	//Creating a floating element on basis of a notice box
	<div class="notice-box float-left">It's a floating block</div>
	<div>It's a standard block</div>

Here is the full special classes list:

	*   ``input-text`` - used for text inputs, the width of the element is equal to the parameter size.

	*   ``input-textarea`` - used for text areas, the width of the element is equal to the parameter cols.

	*   ``input-textarea-long`` - used for all text areas in forms, the width is defined through css.

	*   ``input-text-short`` - used for inputs such as Position, Amount, etc. in forms and tables, the width is defined through CSS (30px).

	*   ``input-text-medium`` - used for inputs such as Price, Weight, Product Code, etc. in forms.

	*   ``input-text-large`` - used for inputs such as Title, Name, etc. in forms.

	*   ``hand`` - used to change the mouse cursor to a hand when the mouse is over an element.

	*   ``nowrap`` - used instead of the *nowrap* parameter in tables so that words are not wrapped to the next line.

	*   ``uppercase`` - all letters in words will be capital.

	*   ``lowercase`` - all letters in words will be small.

	*   ``strong`` - the word will be in bold type.

	*   ``error-text`` - red color font.

	*   ``solid-border`` - there will be a 1px frame around the element.

	*   ``float-left`` - a floating element is created, it is located on the left, other elements flow it around from the left (relative to runaround elements).

	*   ``float-right`` - a floating element is created, it is located on the right, other elements flow it around from the right (relative to runaround elements).

	*   ``clear`` - defined for a parent block, if this block contains only floating elements in order to stretch it over the area occupied by floating blocks.

	*   ``no-padding`` - the attribute padding, which is specified in CSS or inherited, is zeroed out.

	*   ``no-margin`` - the attribute margin, which is specified in CSS or inherited, is zeroed out.

	*   ``valign`` - element is aligned in the middle with the baseline of the row where it is located.

	*   ``checkbox`` - used to align check boxes in tables and forms.

	*   ``radio`` - used to align radio buttons in tables and forms.

	*   ``no-items`` - used to design a block where the notification *no items found* is displayed.

	*   ``center`` - used to align text and inline elements in the middle inside the block.

	*   ``right`` - used to align right text and inline elements inside the block.

	*   ``scroll-x`` - creating horizontal scrolling.

	*   ``hidden`` - used instead of *style="display: none;"*, hides the element.