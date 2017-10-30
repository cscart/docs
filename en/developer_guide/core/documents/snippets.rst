********
Snippets
********

.. note::

    This functionality is available starting with CS-Cart/Multi-Vendor 4.4.1.

A snippet is a separate part of the template that can be used in multiple templates.

The best examples of snippets are a header and a footer that are included in every email notification. Snippets don’t have their own context and variables; they inherit the context and variables from the template that calls the snippet.

Snippets are available both for email and document templates.

Here's the example of including a snippet into the template::

  {{ snippet("header") }}

And here's the example of including a snippet with additional variables into the template::

  {{ snippet("header", {"title": product.name}) }}

=================
Types of Snippets
=================

All snippets are separated into types. This allows to restrict access to snippets for different types of documents. For example, snippets of the ``mail`` type are available for all email notifications and unavailable for documents.

==============
Data Structure
==============

The  ``cscart_template_snippets`` table stores the general information about snippets. The table contains the following columns:

.. list-table::
    :header-rows: 1
    :widths: 10 7 20
    
    *   - Name
        - Type
	- Description
    *   - snippet_id
        - id
	- Auto incremented id
    *   - code   
        - varchar(128)
	- Character code
    *   - type
        - varchar(32)
	- Type
    *   - template
        - text
	- Template
    *   - default_template
        - text
	- Default template
    *   - status
        - char(1)
	- Status
    *   - handler
        - text
	- Name of the function that processes a snippet
    *   - params
        - text
	- Extra parameters
    *   - addon
        - varchar
	- Identifier of the add-on to which the snippet belongs
    *   - updated  
        - int  
	- UNIX timestamp of the update
    *   - created 
        - int 
	- UNIX timestamp of creation

The name of the snippet is language-dependent and is stored in a separate table called ``cscart_template_snippet_descriptions`` .

=====================
Programming Interface
=====================

The following classes were implemented to manage snippets:

* ``\Tygh\Template\Snippet\Snippet``—the model of the snippet. It’s a programming representation of the snippet structure.

* ``\Tygh\Template\Snippet\Repository``—the snippet repository. The class implements the low-level methods of receiving/adding/updating/deleting snippets from the database. An instance of the class is available from the ``Tygh::$app['template.snippet.repository']`` container.

* ``\Tygh\Template\Snippet\Service``—the service. This class implements higher-level methods of snippet management. An instance of the class is available from the ``Tygh::$app['template.snippet.service']`` container.

* ``\Tygh\Template\Snippet\Exim``—this class implements the logic of import and export of snippets. An instance of the class is available from the ``Tygh::$app['template.snippet.exim']`` container.

===================================
The Schema of the Snippet Rendering
===================================

.. image:: img/invoice_editor_3.png
    :align: center
    :alt: New banner

1. Defining the snippet type from the template. 

   Each template, that calls a snippet, knows what snippets are available for it. On the software level, a template is a class that implements the ``ITemplate`` interface.

2. Receiving the template snippet by the type and character identifier with the aid of the ``\Tygh\Template\Snippet\Repository`` class.

3. Calling the ``'template_snippet_render_pre'`` pre-hook.

4. Calling the template engine to render the snippet.

5. Calling the ``'template_snippet_render_post'`` post-hook.

6. Returning the result.

===============
Adding Snippets
===============

Add-ons can add their own snippets of any type. Snippets are meant to be added during the add-on installation and deleted when the add-on is uninstalled. To add snippets, you may use the methods of the ``\Tygh\Template\Snippet\Service`` or describe snippets right in the add-on schema. For example::

  <?xml version="1.0"?>
  <addon scheme="3.0">
      <id>my_changes</id>
      <snippet_templates>
          <item>
              <type>order_invoice</type>
              <code><![CDATA[some_snippet]]></code>
              <default_template><![CDATA[Content]]></default_template>
              <status><![CDATA[A]]></status>
              <name>
                  <en><![CDATA[Order invoice snippet]]></en>
              </name>
              <addon><![CDATA[my_changes]]></addon>
          </item>
      </snippet_templates>
  </addon>

==================
Extending Snippets
==================

Sometimes you can't create a template you'd like with the default visual editor. It might be ineffective, or you might want some additional structured data. 

For example, to print the list of the products in an **order.invoice** document you will need a table that can easily be expanded. Obviously, the visual editor is not the best tool in this case. To solve the tasks like this, we added the hooks that can influence the snippet rendering and extend the interface of the editor.

---------
PHP Hooks
---------

* ``'template_snippet_render_pre'``—it’s executed before snippet rendering. This hook can add necessary variables that can later be used in the snippet template::

    fn_set_hook('template_snippet_render_pre', $snippet, $context, $variable_collection)

* ``'template_snippet_render_post'``—it’s executed after snippet rendering::

    fn_set_hook('template_snippet_render_post', $snippet, $context, $variable_collection, $result)

* ``'template_snippet_remove_post'``—it’s executed after a snippet is deleted::

    fn_set_hook('template_snippet_remove_post', $this, $snippet)

* ``'template_snippet_save_post'``—it’s executed after a snippet is saved to the database::

    fn_set_hook('template_snippet_save_post', $this, $snippet, $lang_code)

--------------
Template Hooks
--------------

* ``{hook name="snippets:tabs_extra"}{/hook}`` (*design/backend/templates/views/snippets/update.tpl*)—it allows to add new tabs to the snippet editing popup.

===============
Template Engine
===============

We use the Twig library (version 1.24) as a template engine. The standard extensions are included:

* Twig_Extensions_Extension_Text
* Twig_Extensions_Extension_Array
* Twig_Extension_Debug — only in development mode.

Here are the additional filters and functions:

* **date** (filter)—formats the value as a date. 

  If you use the this filter, make sure to specify the date format. For example:
 
  * ``{{ o.raw.timestamp }}`` will look like *1127988066* (Unix timestamp).

  * ``{{ o.raw.timestamp|date("%d/%m/%Y") }}`` will look like *29/09/2005* (human-readable time).

  Starting with version 4.6.3, specifying the date format isn't required. If you use the filter without the format like ``{{ o.raw.timestamp|date }}``, then the date format selected on the **Settings → Appearance** page will be used.

  Here are the formats available in CS-Cart/Multi-Vendor settings:

  .. list-table::
      :header-rows: 1
      :widths: 20 25 20

      *   -   Date format
          -   Displayed date
          -   Description

      *   -   ``"%d/%m/%Y"``
          -   29/09/2005
          -   day/month/year

      *   -   ``"%d-%m-%Y"``
          -   29-09-2005
          -   day-month-year

      *   -   ``"%d.%m.%Y"``
          -   29.09.2005
          -   day.month.year

      *   -   ``"%m/%d/%Y"``
          -   09/29/2005
          -   month/day/year

      *   -   ``"%m-%d-%Y"``
          -   09-29-2005
          -   month-day-year

      *   -   ``"%m.%d.%Y"``
          -   09.29.2005
          -   month.day.year

      *   -   ``"%Y/%m/%d"``
          -   2005/09/29
          -   year/month/day

      *    -   ``"%Y-%m-%d"``
           -   2005-09-29
           -   year-month-day

      *    -   ``"%Y.%m.%d"``
           -   2005.09.29
           -   year.month.day

      *    -   ``"%b %e, %Y"``
           -   Sep 29, 2005
           -   month day, year

      *    -   ``"%d %b %Y"``
           -   29 Sep 2005
           -   day month year

      *    -   ``"%A, %B %e, %Y"``
           -   Thursday, September 29, 2005
           -   day of week, month day, year

      *    -   ``"%A, %e %B %Y"``
           -   Thursday, 29 September 2005
           -   day of week, day month year

* **price** (filter)—formats the value as a price. For example, ``{{ o.raw.total }}`` will look like *917.99*, and ``{{ o.raw.total|price }}`` will look like *$917.99*.

  Starting with version 4.6.3, you can use this filter to choose in what currency you'd like to display the price. For example, ``{{ o.raw.total|price("EUR") }}`` will display the order total in Euro according to the conversion rate specified in your store. If no currency is specified for the filter, then ``CART_PRIMARY_CURRENCY`` will be used.

* **filesize** (filter)—formats the value as a file size in kilobytes. For example, this filter is used in the email template about access to downloadable products: ``{{ file.file_size|filesize }}``.

* **puny_decode** (filter)—decodes the URLs from PunyCode to international format. This filter can be found in email templates that have URLs, for example, in password recovery emails: ``{{ url|puny_decode }}``.

* **__** (function)—shows translations. For example, ``{{__("change_order_status_c_text")}}`` will be displayed in the English version of the document as the English value of the corresponding language variable: *Your order has been completed. Thank you for choosing us.*

* **snippet** (function)—inserts a snippet. For example, ``{{ snippet("ship_to") }}`` in the **Invoice** document inserts the corresponding snippet from the **Code snippets** tab into the document.

* **include_doc** (function)—includes documents into the body of email notification. For example, the email notifications about order statuses have the following line: ``{{ include_doc("order.summary", order_info.order_id) }}``.

  That line includes the ``order.summary`` document (information about the order) into the body of those emails. 

.. hint::

    Learn more about the template engine from `the official Twig documentation. <http://twig.sensiolabs.org>`_
