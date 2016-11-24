*********
Documents
*********

.. note::

    This functionality is available starting with CS-Cart/Multi-Vendor 4.4.1.

A document is a set of data that serves to confirm a fact. Here are some examples of documents: *an order invoice*, *a packing slip*, *a gift certificate*, etc. You can edit the templates of such documents in the Administration panel by using the visual editor. Just go to **Design → Documents** and choose a document you want to edit. 

A document template is an HTML layout which includes dynamic data such as variables and snippets. The **Twig** template engine is used to render the documents. Developers can use all the features provided by this library.

==================
Types of Documents
==================

For the purposes of logical separation all documents are divided into types. All available document types are described in the ``documents/types`` schema (*app/schemas/documents/types.php*). 

Each type is a separate class that implements the ``\Tygh\Template\Document\IType`` interface and must be registered in the ``Tygh::$app`` container in the following format::

  Tygh::$app['template.document.[type].type']

``[type]`` is the type identifier, for example, **order**.

To extend functionality, each type can implement the following interfaces:

* ``\Tygh\Template\Document\IPreviewableType``–allows you to use preview when editing a document.

* ``\Tygh\Template\Document\IIncludableType``–allows you to include documents of this type into email notifications via ``include_doc``. 

The structure of the context is meant to be the same for the documents of the same type.

Currently the following document types have been implemented:

* Order invoice
* Order summary
* Packing slip
* RMA::Packing slip 
* Gift certificates::Gift certificate
* Suppliers::Invoice

=======
Context
=======

**Context** is the system state and the environment data at the time when the document is formed. For example, the context for the **order**-type document is the order. The context structure must be known for each document type. That allows you to add your own variables that will use the context as a base. 
 
At the software level the context is a class that implements the ``\Tygh\Template\IContext`` interface. Its minimum responsibility is to report the output language.

=========
Variables
=========

**Variables** are the dynamic part of the templates. Through variables a template can access the context and other data. Each type of documents has its own variables. All variables available for a document type must be described in the ``documents/[type]`` schema (*app/schemas/documents/[type].php*), where ``[type]`` is the type of the document. For example, for the **order** type the schema is ``documents/order``. Each variable is a separate class implementing the ``\Tygh\Template\IVariable`` interface.

Here’s the example of describing a variable in a schema::

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

* ``'order'``—the basic name of the variable, for example, ``{{ order.total }}``. By using it you can refer to a variable in the template.

* ``'class'``—the fully qualified name of the class that is responsible for forming the variable.

* ``'arguments'``—the array that describes the arguments of the variable class constructor. 

  Each variable can have its own dependencies. All dependencies must be described in the schema. Placeholders can be used as values:

  * If a placeholder begins with **#**, then the value for this argument is formed locally, when the variable is initialized. Currently there are two variants available:

    * ``'#context'``—the instance of the document’s context. 
    * ``'#config'``—the schema of the variable.

  * If a placeholder begins with **@**, then the value for this argument is received from the ``Tygh::$app`` container.

  The description for this parameter can be omitted. By default it is considered that the constructor of the described variable accepts two arguments—``#context`` and ``#config``. 

  Omitting this parameter is the same as describing the arguments as ``'arguments' => array('#context', '#config')``.

* ``'alias'``—the alias of the variable. By using it you can also refer to the variable in the template, for example, ``{{ o.total }}``.

* ``'attributes'``—this parameter describes the attributes of the variable. These attributes will be displayed and available at the document editor. 

  The value of this parameter can be either an array or an anonymous function (if additional calculations are required) that returns the array in the end. 

  This parameter can also be used to describe the treelike structure of attributes. For this you’ll need to use the nested array, for example:

  ::

    'products' => array(
        '0..N' => array(
            'item_id', 'product_id', 'product_code', 'price', 'amount', 'product', 'product_status'
        )
    )

If this parameter is omitted, then reflection will be used to get the attributes. All public nonstatic properties of the class, and also public nonstatic methods of the class that begin with ``get`` will be considered as available attributes.

Besides the main parameters, you can describe other parameters in the schema. They will be available through ``'#config'``.

If a variable has complex structure and it's not rational to use a schema to describe it, the class of the variable may implement the ``\Tygh\Template\IActiveVariable`` interface, that imposes the implementation of the only method—``attributes()``. That way a variable that is in fact a separate class can describe its own attributes.

To make adding variables easier, a special ``\Tygh\Template\Document\Variables\GenericVariable`` class was implemented. This class can be fully configured from the schema, so there's no need to create a separate class for each variable. Here's the example of a variable like this::

  'payment' => array(
      'class' => '\Tygh\Template\Document\Variables\GenericVariable',
      'alias' => 'p',
      'data' => function (\Tygh\Template\Document\Order\Context $context) {
          //...
          return $payment;
      },
      'attributes' => array(
          'payment_id', 'payment', 'description', 'payment_category', 'surcharge_title', 'instructions'
      )
  ),

``'data'`` is either an array of data, or an anonymous function that provides an array of data as a result.

The lazy initialization of the variables was also implemented. The instance of the variable is only created once, when the variable is accessed for the first time. That way a developer doesn't have to do it manually. The ``\Tygh\Template\VariableProxy`` proxy class implements this behavior.

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
    *   - addon
        - varchar(32)
	- Identifier of the add-on to which the template belongs
    *   - updated  
        - int  
	- UNIX timestamp with the update time
    *   - created 
        - int 
	- UNIX timestamp with the creation time

=====================
Programming Interface
=====================

The following classes were implemented to manage document templates:

* ``\Tygh\Template\Document\Document``—the model of the document template. It is the software representation of the template structure in the database.

* ``\Tygh\Template\Document\Repository``—the repository class. It implements the low-level methods of adding/updating/deleting/selecting templates from the database. An instance of the class is available from the ``Tygh::$app['template.document.repository']`` container.

* ``\Tygh\Template\Document\Service``—the service class. It implements higher-level methods of template management. An instance of the class is available from the ``Tygh::$app['template.document.service']`` container.

* ``Tygh\Template\Document\Exim``—this class implements the logic of import and export of document templates. An instance of the class is available from the ``Tygh::$app['template.document.exim']`` container.

**Helper classes:**

* ``\Tygh\Template\Document\TypeFactory``—the factory class. It is used to create instances of a document type. An instance of the class is available from the ``Tygh::$app['template.document.type_factory']`` container.

* ``\Tygh\Template\Collection``—the class of nontype data collection. It is used to create the collection of variables.

* ``\Tygh\Template\ObjectFactory``—the object factory class. It can create class instances based on the describing information. An instance of the class is available from the ``Tygh::$app['template.object_factory']`` container.

* ``\Tygh\Template\Renderer``—a wrapper class for Twig. An instance of the class is available from the ``Tygh::$app['template.renderer']`` container.

* ``\Tygh\Template\VariableMetaData``—the class for processing the metadata of variables.

* ``\Tygh\Template\VariableCollectionFactory``—the variable collection factory. It can create the variable collection based on the variable schema. An instance of the class is available from the ``Tygh::$app['template.variable_collection_factory']`` container.

* ``\Tygh\Template\VariableProxy``—the proxy class that organizes the lazy initialization of variables.

====================================
The Schema of the Document Rendering
====================================

.. image:: img/invoice_editor_2.png
    :align: center
    :alt: New banner

1. Receiving the document template. Selecting the model of the document template with the aid of the ``\Tygh\Template\Document\Repository`` repository class.

2. Forming the context of the document based on the received data.

3. Forming the variable collection. The variable collection is initialized based on the document context with the aid of the ``\Tygh\Template\VariableCollectionFactory`` class.

4. Calling the template engine to render the document.

5. Returning the result.

===================================================
Adding Variables to the List of Available Variables
=================================================== 

To add your own variable, create the class of the variable that implements the ``\Tygh\Template\IVariable`` interface and register it in the document schema.

Here's the example of adding a variable that provides a barcode for the order:

We have a file **app/addons/barcode/Tygh/Addons/Barcode/Documents/Order/BarcodeVariable.php**::

  <?php

  namespace Tygh\Addons\Barcode\Documents\Order;

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

Let's extend the variable schema for the documents of the **order** type. To do that, add a file **/app/addons/barcode/schemas/documents/order.post.php**::

  <?php
  $schema['barcode'] = array(
      'class' => '\Tygh\Addons\Barcode\Documents\Order\BarcodeVariable'
  );

  return $schema;

Once you do all that, one more variable will become available when editing documents of the **order** type. Its name is **barcode**. The variable also has an attribute called **image**.

=================================================
Adding Snippets to the List of Available Snippets
=================================================

To add a snippet to the list of available snippets you need to add the snippet to the database for the specific template of the document. In this case the snippet type will be  ``[type]_[code]``, where

* ``[type]`` is document type; and
* ``[code]`` is a sequence of characters that identifies the document template.

.. hint::

    :doc:`Learn more about adding snippets. <snippets>`

===================
Extending Documents
===================

---------
PHP Hooks
---------

* ``'template_document_get_name'``—it’s called after the document name was generated. By using the hook you can change the name of the document::

    fn_set_hook('template_document_get_name', $this, $result)

* ``'template_document_remove_post'``—it’s called after document deletion::

    fn_set_hook('template_document_remove_post', $this, $document)

--------------
Template Hooks
--------------

* ``{hook name="documents:tabs_extra"}{/hook}`` (*design/backend/templates/views/documents/update.tpl*)—it allows to add extra tabs to the document editing page.

* ``{hook name="documents:update_buttons_extra"}{/hook}`` (*design/backend/templates/views/documents/update.tpl*)—it allows to add extra buttons to the toolbar.

* ``{hook name="documents:update_adv_buttons_extra"}{/hook}`` (*design/backend/templates/views/documents/update.tpl*)—it allows to add extra buttons to the toolbar depending on the current tab. 

===========
Constraints
===========

-----
Hooks
----- 

One of the most notable constraints are the lack of hooks in the document template itself. That means that the document template can not be changed automatically (by software). This action is completely in the hands of the store administrator. **Add-ons can only extend the lists of available snippets and variables**.

--------------------------
Complex Logic of Templates
-------------------------- 

The visual template editor doesn’t fully support the use of branching, cycles, etc. in templates, so if you want to format the template by using the logic, you have to use snippets, which don't have a visual editor.
