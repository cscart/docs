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

* ``date`` (filter)—formats the value as a date.
* ``price`` (filter)—formats the value as a price.
* ``filesize`` (filter)—formats the value as a file size in kilobytes. 
* ``puny_decode`` (filter)—decodes the URLs from PunyCode to international format.
* ``__`` (function)—output translations.
* ``snippet`` (function)—inserts a snippet.
* ``include_doc`` (function)—includes documents into the body of email notification.

.. hint::

    Learn more about the template engine from `the official Twig documentation. <http://twig.sensiolabs.org>`_
