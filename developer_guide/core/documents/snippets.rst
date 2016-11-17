********
Snippets
********

.. note::

    This functionality is available starting with CS-Cart/Multi-Vendor 4.4.1.

A snippet is a separate part of the template that can be used in multiple templates.

The best examples of snippets are a header and a footer that are included in every email notification. Snippets don’t have their own context and variables. The context and variables are inherited from the template that calls the snippet.

Snippets are available both for email and document templates.

The example of including the snippet into the template:
``{{ snippet("header") }}``

The example of including the snippet into the template with extra variables: 
``{{ snippet("header", {"title": product.name}) }}``

=================
Types of Snippets
=================

All snippets are separated into types. This allows to restrict the access to snippets for different types of documents. For example, snippets of the ``mail`` type are available for every email notification and unavailable for documents.

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

The name of the snippet is language-dependent and is stored in the separate table called ``cscart_template_snippet_descriptions`` .

=====================
Programming Interface
=====================

To manage and manipulate the snippets the following classes are implemented:

* ``\Tygh\Template\Snippet\Snippet``—the model of the snippet. It’s a programming representation of the snippet structure.

* ``\Tygh\Template\Snippet\Repository``—the snippet repository. The class implements the low-level methods of receiving/adding/updating/deleting snippets from the database. Class instance is available from the ``Tygh::$app['template.snippet.repository']`` container.

* ``\Tygh\Template\Snippet\Service``—the service. This class implements higher-level methods of snippet management. The class instance is available from the ``Tygh::$app['template.snippet.service']`` container.

* ``\Tygh\Template\Snippet\Exim``—this class implements the logic of import and export of snippets. The class instance is available from the ``Tygh::$app['template.snippet.exim']`` container.

===========================================
The Forming Schema of the Snippet Rendering
===========================================

.. image:: img/invoice_editor_3.png
    :align: center
    :alt: New banner

1. Defining the snippet type from the template. 

   Each template calling the snippet knows what snippets are available for it. On the programming level the template is a class that implements the ITemplate interface.

2. Receiving the template snippet by the type and character id. The ``\Tygh\Template\Snippet\Repository`` class is used for this.

3. Calling the ``'template_snippet_render_pre'`` pre-hook.

4. Calling the template engine to render the snippet.

5. Calling the ``'template_snippet_render_post'`` post-hook.

6. Returning the result.

===============
Adding Snippets
===============

Add-ons can add their own snippets of any type. Snippets are meant to be added during the add-on installation and deleted when the add-on is uninstalled. To add snippets, you may use the methods of the ``\Tygh\Template\Snippet\Service`` or describe snippets right in the add-on schema.

For example:

::

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

For example, to print the list of the products in an **order.invoice** document you will need a table that can easily be expanded. Obviously, the visual editor is not the best tool in this case. To solve the tasks like this, we added the hooks thta can influence the snippet rendering and extend the interface of the editor.

---------
PHP Hooks
---------

* ``'template_snippet_render_pre'``—it’s executed before snippet rendering. This hook can add necessary variables that can later be used in the snippet template::

    fn_set_hook('template_snippet_render_pre', $snippet, $context, $variable_collection)

* ``'template_snippet_render_post'``—it’s executed after snippet rendering::

    fn_set_hook('template_snippet_render_post', $snippet, $context, $variable_collection, $result)

* ``'template_snippet_remove_post'``—it’s executed after the snippet was deleted::

    fn_set_hook('template_snippet_remove_post', $this, $snippet)

* ``'template_snippet_save_post'``—it’s executed after the snippet was saved to the database::

    fn_set_hook('template_snippet_save_post', $this, $snippet, $lang_code)

--------------
Template Hooks
--------------

* ``{hook name="snippets:tabs_extra"}{/hook}``—it allows to add new tabs to the snippet editing popup. Located in *design/backend/templates/views/snippets/update.tpl*.

===============
Template Engine
===============

We use the Twig library (version 1.24) as a template engine. The standard extensions are included:

* **Twig_Extensions_Extension_Text**
* **Twig_Extensions_Extension_Array**
* **Twig_Extension_Debug** - developer mode only.

Here are the additional filters and functions:

* **date** (filter)—it’s used to form the values of the date type.
* **price** (filter)—it’s used to form  the values of the currency type.
* **Filesize** (filter)—it’s used to form the values of the filesize type in kilobytes. 
* **puny_decode** (filter)—it’s used for decoding the URLs from PunyCode to international representation.
* **__** (function)—it’s used to output translations.
* **snippet** (function)—it’s used to insert the snippet.
* **include_doc** (function)—it is used to include documents into the body of email notification.

.. hint::

    Learn more about the template engine from `the official Twig documentation. <http://twig.sensiolabs.org>`_

Find more information on the template engine at the `Twig documentation website <http://twig.sensiolabs.org/>`_.
