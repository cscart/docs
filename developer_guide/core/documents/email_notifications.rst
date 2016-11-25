*******************
Email Notifications
*******************

.. note::

   Email notification editor is available starting with CS-Cart/Multi-Vendor 4.4.1.

The new CS-Cart feature allows you to edit email notifications in the Administration panel. Just go to **Design → Email templates** and choose the template you want to edit. 

For the sake of convenience, all email templates are divided into two groups:

* Administrator notifications.

* Customer notifications. 

We use `Twig <http://twig.sensiolabs.org/>`_ as the template engine: developers can take advantage of the full functionality of the library.

.. note::

    Backward compatibility was preserved: email notifications based on template files will also work perfectly.

==============
Data Structure
==============

The ``cscart_template_emails`` table is used to keep email notification templates. The table has the following structure:

.. list-table::
    :header-rows: 1
    :widths: 10 7 20
    
    *   - Name
        - Type
	- Description
    *   - template_id  
        - int 
	- Auto incremented ID of the template
    *   - code  
        - varchar(128) 
	- Character identifier of the template
    *   - area 
        - сhar(1)  
	- Template working area
    *   - status 
        - char(1) 
	- Template status
    *   - subject  
        - text  
	- Email subject template
    *   - template 
        - text  
	- Email body template
    *   - default_subject  
        - text  
	- Default template of the email subject
    *   - default_template  
        - text 
	- Default template of the email body
    *   - params_schema 
        - text  
	- Schema of additional parameters of the template
    *   - params  
        - text  
	- Data of additional parameters of the template
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

The following classes were implemented to manage email templates:

* ``\Tygh\Template\Mail\Template``—the template model. It’s a programming representation of the template structure in the database.

* ``\Tygh\Template\Mail\Repository``—the template repository. This class implements low-level methods of receiving/adding/updating/deleting templates from the database. An instance of the class is available from the ``Tygh::$app['template.mail.repository']`` container.

* ``\Tygh\Template\Mail\Service``—the service class that implements higher-level methods of template management. An instance of the class is available from the ``Tygh::$app['template.mail.service']`` container.

* ``\Tygh\Template\Mail\Exim``—the class that implements the logic of importing and exporting email templates. An instance of the class is available from the ``Tygh::$app['template.mail.exim']`` container.

=========================================
The Schema of Sending Email Notifications
=========================================

.. image:: img/invoice_editor_1.png
    :align: center
    :alt: New banner

1. Forming data for a notification.

   This step hasn’t changed much. The data must be gathered to form the body of the message.

2. Calling the sender subsystem.

   The ``\Tygh\Mailer`` static class was replaced by the  ``\Tygh\Mailer\Mailer`` service class that is available from the ``Tygh::$app['mailer']`` container. 

   When calling a message sending method, specify the character identifier of the email template in the ``template_code`` key. For example::
	
     $mailer->send(array(
         'to' => 'company_orders_department',
         'from' => 'default_company_orders_department',
         'data' => array(...)	
         /* indicating email template id. */
         'template_code' => 'call_requests_call_request',
         'tpl' => 'addons/call_requests/call_request.tpl',
         'company_id' => $company_id,
     ), 'A', $lang_code);


3. Defining the type of the email event.

   Before sending the message, the ``\Tygh\Mailer\Mailer`` service defines how the body of the message is formed. Currently there are 3 ways to do this:

   * By using the template from the file.
   * By passing the template in the parameters.
   * By using the template from the database.

4. Receiving the message template by the message ID with the ``\Tygh\Template\Mail\Repository`` class.
      
5. Forming the context and variables of the message.

   Based on the data received in step 1, we form the context and available variables of the email notification. Unlike the documents, the context and variables in the notifications are not separated. This preserves backward compatibility.

6. Calling the template engine to render the message body.

7. Converting CSS styles into inline.

8. Calling the low-level method of the message sending. 

   On this step the formed data are sent to the **PHPMailer** library that handles sending messages.

======================================
Adding the Email Notification Template
======================================

To add the email notification template, use the ``\Tygh\Template\Mail\Service`` service class.

For example:

::

  /** @var \Tygh\Template\Mail\Service $service */
  $service = Tygh::$app['template.mail.service'];

  $service->createTemplate(array(
      'code' => 'new_notification',
      'area' => 'C',
      'status' => 'A',
      'default_subject' => '{{ __("new_notification_subject") }}',
      'default_template' => '{{ snippet("header") }} <br/> Dear {{ customer_name }}! <br/> ... <br/> {{ snippet("footer") }}',
      'addon' => 'my_changes',
  ));

To make adding email notification templates easier, we implemented declarative description of templates in the add-on schema. In that case the templates will be added automatically when the add-on is installed. For example::

  <?xml version="1.0"?>
  <addon scheme="3.0">
      <id>my_changes</id>
      <email_templates>
          <templates>
              <item>    
                  <code><![CDATA[my_changes_notification]]></code>
                  <area><![CDATA[C]]></area>
                  <status><![CDATA[A]]></status>
                  <default_subject><![CDATA[{{ subject }}]]></default_subject>
                  <default_template><![CDATA[{{ snippet("header") }}


              {{ snippet("my_changes.snippet”) }}


              {{ snippet("footer") }}]]></default_template>
                  <addon><![CDATA[my_changes]]></addon>
              </item>
          </templates>
          <snippets>
              <item>
                  <code><![CDATA[[my_changes.snippet]]></code>
                  <default_template>Content</default_template>
                  <status><![CDATA[A]]></status>
                  <name>
                      <en><![CDATA[my_changes: snippet]]></en>
                  </name>
                  <addon><![CDATA[my_changes]]></addon>
              </item>
          </snippets>
      </email_templates>
  </addon>

=============================
Extending Email Notifications
=============================

---------
PHP Hooks
---------

* ``'template_email_get_name'``—it's called after the name of the notification template was formatted. The hook is used to change the name::

    fn_set_hook('template_email_get_name', $this, $name)

* ``'mailer_send_pre'``—it's called before the message is sent. This hook is used to change the content of the message::

    fn_set_hook('mailer_send_pre', $this, $transport, $message, $area, $lang_code)

* ``'mailer_send_post'``—it's called after the message was sent::

    fn_set_hook('mailer_send_post', $this, $transport, $message, $result, $area, $lang_code)

==============================
Additional Template Parameters
==============================

Any email notification template may contain additional parameters that can be processed later in the ``mailer_send_pre`` hook. The schema of additional parameters is stored in the ``params_schema`` field and has the following structure:

::

  array(
       "var_name" => array(
           "type" => "checkbox",
           "title" => "param_title",
           "description" => "param_description"
       ),
       "var_name1" => array(
           "type" => "checkboxes",
           "title" => "param_title",
           "description" => "param_description",
           "variants" => array(
               "variant_key" => "variant_name"
          )
       ),
       "var_name2" => array(
           "type" => "checkboxes",
           "title" => "param_title",
           "description" => "param_description",
           "func" => "fn_get_params_variants"
       ),
  )

Where:

* ``"var_name"``—the name of the variable that is used to save the value.
* ``"type"``—the type of the variable; the available types are: *checkbox*, *checkboxes*, *textarea*, *input*, *selectbox*.
* ``"title"``—the name of the language variable that will be used as the name of the field.
* ``"description"``—the name of the language variable that will be used as a hint for the field.
* ``"variants"``—array of variants for a parameter with the ``checkboxes`` type.
* ``"func"``—the function that forms the array of variants for a parameter with the ``checkboxes`` type.

The saved values will be available in the property of the model of the notification template.

Additional parameters allow you to attach the **order** document to email notifications about order status changes. The dropdown list that determines, which document must be attached, appears on the template editing page. The value of this list is handled in the ``mailer_send_pre`` pre-hook. 

The selected document will generate a PDF file that will be attached to the message. In this case the schema of variables looks this way:

::

  array(
      "attach_order_document": array(
          "type": "selectbox",
          "title": "email_template.params.attach_order_document",
          "func": "fn_emails_get_order_document_variants"
      )
  )

Function ``fn_emails_get_order_document_variants`` is described in the **emails/variants.functions** schema.
