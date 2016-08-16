*********
Documents
*********

.. note::

    This functionality will be available starting with CS-Cart/Multi-Vendor 4.4.1.

A document is a set of data that serves to confirm a fact. Here are some examples of documents: *an order invoice*, *a packing slip*, *a gift certificate*, *etc*. You can edit the templates of such documents in **the Administration panel** by using **the visual editor**. The document template is html layout with the parts of dynamic data such as variables and snippets. **The Twig template engine** is used to render the documents. You can use all the features provided by this library.

==================
Types of Documents
==================

For the purposes of logical separation all documents are divided into types. All available types are described in the ``documents/types`` schema (*app/schemas/documents/types.php*). Each type is a separate class that implements the ``\Tygh\Template\Document\IType`` interface. 
To speed up the process of adding new types, there is a base abstract class called ``\Tygh\Template\Document\AType``. This class implements the logic that is similar for the most types.

The example of the schema that describes the **invoice** document type:

::

  return array(
	  'invoice' => array(
   		  'class' => '\Tygh\Template\Document\Invoice\Type',
   		  'arguments' => array('@template.snippet.repository', '@databse', '@template.document.invoice.renderer', '@template.variable_meta_data_collection_factory')
	  )
  );

* **'invoice'** — the character id of the document type.

* **'сlass'** — the full name of the class that is responsible for the document type.

* **'arguments'** — the description of the class constructor arguments. Each type can have its own dependencies. The placeholders that begin with "@" can be used as values; in this case the value for the argument will be received from the container ``Tygh::$app``.

The structure of the document context is always the same for the documents of the same type.

Currently the following document types are implemented:

* **Invoice**
* **Packing slip**
* **RMA::Packing slip** 
* **Gift certificates::Gift certificate**
* **Suppliers::Invoice**

=======
Context
=======

**Context** is the system state and the environment data at the time when the document is formed. For example, the context for the invoice document is the order. The context structure must be known for each document type. That allows you to add your own variables that will use the context as a base. 
 
At the software level the context is a class that implements the ``\Tygh\Template\IContext`` interface. Its first responsibility is to report the output language and the type of the available snippets.

=========
Variables
=========

**Variables** are the dynamic part of the templates. Through variables a template can access the context and other data. Each type of documents has its own variables. All variables available for the type must be described in the ``documents/[type]`` schema (*app/schemas/documents/[type].php*), where ``[type]`` is the type of the document. For example, for the invoice type the schema is ``documents/invoice``. Each variable is a separate class implementing the ``\Tygh\Template\IVariable`` interface.

Here’s the example of describing a variable in a schema:

::

  return array(
	  'order' => array(
   	  'class' => '\Tygh\Template\Document\Invoice\Variables\OrderVariable',
   		  'arguments' => array('#context', '#config', '@formatter'),
   	  'alias' => 'o',
   		  'attributes' => array(
       	  'order_id', 'company_id', 'total', 'subtotal', ...
	  )
  )
  );

* **'order'** — the basic name of the variable, for example, ``{{ order.total }}``. By using it you can refer to a variable in the template.

* **'class'** — the full name of the class that is responsible for forming the variable.

* **'arguments'** — the array that describes the arguments of the variable class constructor. 

Each variable can have its own dependencies. All dependencies must be described in the schema. Placeholders can be used as values:

* If a placeholder begins with the "#" symbol, then the value for this argument is formed locally, when the variable is initialized. Currently there are two variants available - ``'#context'`` — the copy of the document’s context and ``'#config'`` — the schema of the variable.

* If a placeholder begins with the "@" symbol, then the value for this argument is received from the ``Tygh::$app`` container.

The description for this parameter can be omitted. By default it is considered that the constructor of the described variable takes two arguments – ``#context`` and ``#config``. Omitting this parameter is the same as describing the arguments as 'arguments' => array('#context', '#config').

* **'alias'** — the alias of the variable. By using it you can also refer to the variable in the template, for example, ``{{ o.total }}``.

* **'attributes'** — this parameter describes the attributes of the variable. These attributes will be displayed and available at the document editor. As a value of this parameter both the array and the anonymous function (if additional calculations are required) can be used, the function must return the array in the end. The parameter can also be used to describe the treelike structure of attributes. For this you’ll need to use the nested array, for example:

::

	  'products' => array(
            '0..N' => array(
		  'item_id', 'product_id', 'product_code', 'price', 'amount', 'product', 'product_status'
            )
        ).

If this parameter is omitted, then reflection will be used to get the attributes. All public nonstatic properties of the class, and also public nonstatic methods of the class that begin with ``get`` will be considered as available attributes.

Besides the main parameters, you can describe other parameters in the scheme. They will be available through ``'#config'``.

Also the lazy initialization of the variables is implemented. This initialization creates the copy of the variable during the first variable access. This copy is created once and for all so there is no need for the developer to care about it. The proxy class ``\Tygh\Template\VariableProxy`` is responsible for the implementation of this behavior.

==============
Data Structure
==============

The templates of the documents are saved at the ``cscart_template_documents`` table. The table has the following structure:

.. list-table::
    :header-rows: 1
    :widths: 10 7 20
    
    *   - Name
        - Type
	- Description
    *   - document_id  
        - int 
	- Auto incremented identifier
    *   - template   
        - text
	- Template
    *   - default_template
        - text 
	- Default template
    *   - type
        - varchar(32)
	- Document type
    *   - code
        - varchar(128)
	- Character identifier of the document
    *   - updated  
        - int  
	- UNIX timestamp of the update
    *   - created 
        - int 
	- UNIX timestamp of creation

=====================
Programming Interface
=====================

To manage and manipulate the document templates the following classes are implemented:

* ``\Tygh\Template\Document\Document`` - the model of the document template is the program representation of the template structure in the databse.

* ``\Tygh\Template\Document\Repository`` - the repository class. It implements the low-level methods of adding/updating/deleting/selecting templates from the databse. Class instance is available from the container Tygh::$app[‘template.document.repository’].

* ``\Tygh\Template\Document\Service`` - the class of service. It implements higher-level methods of template management. Class instance is available from the container ``Tygh::$app[‘template.document.service’]``.

Helper classes:

* ``\Tygh\Template\Document\TypeFactory`` - the factory class. It is used to create instances of the document type. Class instance is available from the container ``Tygh::$app['template.document.type_factory']``.

* ``\Tygh\Template\Collection`` - the class of nontype data collection. It is used to create the collection of variables.

* ``\Tygh\Template\ObjectFactory`` - the object factory class. It can create the class instances based on the describing information. Class instance is available from the container ``Tygh::$app['template.object_factory']``.

* ``\Tygh\Template\Renderer`` - wrapper class for twig. Class instance is available from the container ``Tygh::$app['template.renderer']``.

* ``\Tygh\Template\VariableMetaData`` - the class for variable metadata processing.

* ``\Tygh\Template\VariableCollectionFactory`` - the variable collection factory. It can create the variable collection based on the variable schema. Class instance is available from the container ``Tygh::$app['template.variable_collection_factory']``.

* ``\Tygh\Template\VariableMetaDataCollectionFactory`` - the variable metadata collection factory creates the collection based on the variable schema. Class instance is available from the container ``Tygh::$app['template.variable_meta_data_collection_factory']``.

* ``\Tygh\Template\VariableProxy`` - proxy class that organizes the lazy initialization of variables.

============================================
The Forming Schema of the Document Rendering
============================================

.. image:: img/invoice_editor_2.png
    :align: center
    :alt: New banner

1. Receiving the document template. Selecting the model of the document template by using the ``\Tygh\Template\Document\Repository`` repository class.

2. Forming the context of the document. The context of the document is created on the basis of the data that were sent.

3. Forming the variable collection. The variable collection is initialized on the basis of the document context by using the ``\Tygh\Template\VariableCollectionFactory`` class.

4. Calling the template engine to render the document.

5. Returning the result.

===================================================
Adding Variables to the List of Available Variables
=================================================== 

To add your own variable it is necessary to create the class of variable that implements the ``\Tygh\Template\IVariable`` interface and register it in the document schema.

The example of adding the variable that provides the barcode of the order:

File **app/addons/barcode/Barcode/Invoice/BarcodeVariable.php**.

::

  <?php

  namespace Barcode\Invoice;

  use Tygh\Registry;
  use Tygh\Template\Invoice\Order\Context;
  use Tygh\Template\IVariable;

  class BarcodeVariable implements IVariable
  {
	  public $image;

	  public function __construct(Context $context)
	  {
   		  $order = $context->getOrder();

   		  $width = Registry::get('addons.barcode.width');
   		  $height = Registry::get('addons.barcode.height');
   		  $url = fn_url(sprintf(
  'image.barcode?id=%s&type=%s&width=%s&height=%s&xres=%s&font=%s&no_session=Y',
       	  $order->getId(),
       		  Registry::get('addons.barcode.type'),
       	  $width,
       	  $height,
       	  Registry::get('addons.barcode.resolution'),
       	  Registry::get('addons.barcode.text_font')
   		  ));

   	  $this->image = <<<EOF
  <div style="text-align:center">
	  <img src="{$url}" alt="BarCode" width="{$width}" height="{$height}">
  </div>
  EOF;
	  }
  }

Extending the variable schema for the documents of invoice type: 

Adding file **/app/addons/barcode/schemas/documents/invoice.post.php**.

::

  <?php
  $schema['barcode'] = array(
    'class' => '\Barcode\Invoice\BarcodeVariable'
  );

  return $schema;

After all these manipulations a new available variable named barcode with image attribute appears in the editor of the documents of the invoice type.

=================================================
Adding Snippets to the List of Available Snippets
=================================================

To add a snippet to the list of available snippets it is necessary to add the snippet to the databse for the specified type of the document. You can find more information on snippet adding in :doc: `Snippets <snippets>` section.

===================
Extending Documents
===================

PHP hooks:

* ``template_document_get_name - fn_set_hook('template_document_get_name', $this, $result)`` - it’s called after the document name was generated. By using the hook you can change the name of the document.

* ``template_document_remove_post - fn_set_hook('template_document_remove_post', $this, $document)``- it’s called after the document was deleted.

Template hooks:

* ``{hook name="documents:tabs_extra"}{/hook} (design/backend/templates/views/documents/update.tpl)`` - it allows to add extra tabs to the document editing page.

* ``{hook name="documents:update_buttons_extra"}{/hook} (design/backend/templates/views/documents/update.tpl)`` - it allows to add extra buttons to the toolbar.

* ``{hook name="documents:update_adv_buttons_extra"}{/hook} (design/backend/templates/views/documents/update.tpl)`` - it allows to add extra buttons to the toolbar depending on the current tab. 

===========
Constraints
===========

* **Hooks** 

One of the most notable constraints are the lack of hooks in the document template itself. It is implied that the document template can not be changed automatically (by software). This action is completely in the hands of the store administrator. **This way add-ons can only extend the lists of available snippets and variables**.

* **Complex logic of templates** 

The visual template editor doesn’t fully support the use of branching, cycles, etc. in templates, so if you want to format the template by using the logic it is obligatory to use snippets where the visual editor is not presented.

