********
Snippets
********

.. note::

    This functionality will be available starting with CS-Cart/Multi-Vendor 4.4.1.

A snippet is a separate part of the template. Snippets are completely reutilizable.
The best examples of snippets are a header and a footer that are included in every email notification. Snippets don’t have their own context and variables. The context and variables are inherited from the template that calls the snippet.
Snippets are available both for email and document templates.

The example of including the snippet into the template:
``{{ snippet("header") }}``

The example of including the snippet into the template with extra variables: 
``{{ snippet("header", {"title": product.name  } ) }}``

=================
Types of Snippets
=================

All snippets are separated into types. This separation helps to control the access to snippets from different types of documents. For example, snippets of the mail type are available for almost every email notification and unavailable for documents. All available types of snippets are described in the ``snippets/types`` schema (*app/schemas/snippets/types.php*). All types of documents are automatically included into the schema, so there is no need to add the new type of snippet manually. Currently the number of snippets is equal to the number of document types + email notifications of the type form (mail).

==============
Data Structure
==============

The  ``cscart_template_snippets`` table is used for keeping the general information about snippets. The table contains the following columns:

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
    *   - params
        - text
	- Extra parameters
    *   - updated  
        - int  
	- UNIX timestamp of the update
    *   - created 
        - int 
	- UNIX timestamp of creation

The name of the snippet is language dependable and is stored in the separate ``cscart_template_snippet_descriptions`` folder.

=====================
Programming Interface
=====================

To manage and manipulate the snippets the following classes are implemented:

* ``\Tygh\Template\Snippet\Snippet`` - the model of the snippet. It’s a programming representation of the snippet structure.

* ``\Tygh\Template\Snippet\Repository`` - the snippet repository. The class implements the low-level methods of receiving/adding/updating/deleting snippets from the database. Class instance is available from the container ``Tygh::$app[‘template.snippet.repository’]``.

* ``\Tygh\Template\Snippet\Service`` - the service. This class implements higher-level methods of snippet management. The class instance is available from the container ``Tygh::$app[‘template.snippet.service’]``.

* ``\Tygh\Template\Snippet\Renderer`` - the class that renders the snippet. The class instance is available from the container ``Tygh::$app[‘template.snippet.renderer’]``.

===========================================
The Forming Schema of the Snippet Rendering
===========================================

.. image:: img/invoice_editor_3.png
    :align: center
    :alt: New banner

1. Defining the snippet type from the context. Each context calling the snippet knows what snippets are available for it. On the programming level the context is a class that implements the IContext interface.

2. Receiving the template snippet by the type and character id. For this the ``\Tygh\Template\Snippet\Repository`` class is used.

3. Calling pre hook ``'template_snippet_render_pre'``.

4. Calling the template engine to render the snippet.

5. Calling post hook ``'template_snippet_render_post'``.

6. Returning the result.

===============
Adding Snippets
===============

Add-ons can add their own snippets of any type. Snippets are added during the add-on installation process. Also they are deleted when the add-on is deleted. To add the snippet the ``\Tygh\Template\Snippet\Service`` service class is used.

For example:

::

  /** @var \Tygh\Template\Snippet\Service $snippet_service */
  $snippet_service = Tygh::$app['template.snippet.service'];
  $snippet_service->createSnippet(array(
      ‘code’ => ‘barcode_image’,
      ‘type’ => ‘invoice’,
      ‘status’ => ‘A’,
      ‘template’ => ‘<img src="...">’
  ));

To delete the snippet the method ``removeSnippetByTypeAndCode`` is used.

For example:

::

  /** @var \Tygh\Template\Snippet\Service $snippet_service */
  $snippet_service = Tygh::$app['template.snippet.service'];
  $snippet_service->removeSnippetByTypeAndCode(‘invoice’, ‘barcode_image’);

Usually add-ons automatically monitor the status of their snippets. If the add-on is disabled, it will automatically disable all its snippets, so that the snippets don’t interfere in the process of document formation. To update the status of the snippet the methods ``updateSnippetStatus`` or ``updateSnippetStatusByTypeAndCode`` are used.

::

  /** @var \Tygh\Template\Snippet\Service $snippet_service */
  $snippet_service = Tygh::$app['template.snippet.service'];
  $snippet_service->updateSnippetStatusByTypeAndCode('invoice', 'returned_products_table', Snippet::STATUS_DISABLE);

==================
Extending Snippets
==================

Sometimes to create the template the visual editor is not enough. Also in some cases, for example, if some extra structure data is required the editor can be ineffective. For example, to print the list of the products in the invoice document you will need a table that can easily be expanded and it’s obvious that the visual editor is not the best tool in this case. To solve the tasks like this one we added the hooks that can influence the snippet rendering and add extra interfaces on the editing pages for both snippets and documents.

PHP hooks:
* ``'template_snippet_render_pre' - fn_set_hook('template_snippet_render_pre', $snippet, $context, $variable_collection)`` - it’s executed before snippet rendering. This hook can add necessary variable that later can be used in the snippet template.

* ``‘template_snippet_render_post’ - fn_set_hook('template_snippet_render_post', $snippet, $context, $variable_collection, $result)`` -  it’s executed after snippet rendering.

* ``‘template_snippet_remove_post’ - fn_set_hook('template_snippet_remove_post', $this, $snippet)`` - it’s executed after the snippet was deleted.

* ``‘template_snippet_save_post’ - fn_set_hook('template_snippet_save_post', $this, $snippet, $lang_code)`` - it’s executed after the snippet was saved to the database.

Template hooks:

* ``{hook name="snippets:tabs_extra"}{/hook}`` (*design/backend/templates/views/snippets/update.tpl*) - it allows to add new tabs to the snippet editing popup.

===============
Template Engine
===============

As a template engine the twig library is used (version 1.24). The standard extensions are included:

* **Twig_Extensions_Extension_Text**
* **Twig_Extensions_Extension_Array**
* **Twig_Extension_Debug** - developer mode only.

Extra filters and functions are added:

* **Date filter** - it’s used to form the values of the date type.
* **Price filter** - it’s used to form  the values of the currency type.
* **Filesize filter** - it’s used to form the values of the filesize type in kilobytes. 
* **puny_decode filter** - it’s used for decoding the URLs from PunyCode to international representation.
* Function **__** - it’s used to output translations.
* Function **snippet** - it’s used to insert the snippet.

More information on the template engine you can find at the twig documentation website: http://twig.sensiolabs.org/

