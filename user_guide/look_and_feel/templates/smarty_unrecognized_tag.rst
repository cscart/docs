******************************
Smarty Error: Unrecognized tag
******************************

If you get the **"unrecognized tag..."** Smarty error after adding a JavaScript code (for example, a tracking code) to a template, the inserted JavaScript code most likely contains the **{** and **}** tags. Smarty uses **{** and **}** as delimiters and attempts to interpret the JavaScript code in the template that way.

To avoid the error, complete the following steps:

1. Open the template to which you have added the code.

2. Enclose the JavaScript code in a ``{literal}...{/literal}`` container to prevent Smarty from parsing it:

   ::

     {literal}
     your JavaScript code
     {/literal}

3. Save the file.
