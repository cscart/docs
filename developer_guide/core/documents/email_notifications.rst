*******************
Email Notifications
*******************

.. note::

    This functionality will be available starting with CS-Cart/Multi-Vendor 4.4.1.

The new CS-Cart feature allows you to edit email notifications in **the Administration panel**. We use the `Twig <http://twig.sensiolabs.org/>`_ library as a template engine: developers can take advantage of the full library functionality. For the sake of convenience all email templates are divided into **two groups**:  **Administrator notifications** and **Customer notifications**. Email notifications that are based on template files will also work perfectly, which means that backward compatibility is preserved.

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
	- Auto incremented template id
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
	- Additional parameters schema for a template
    *   - params  
        - text  
	- Additional parameters data for a template
    *   - updated  
        - int  
	- UNIX timestamp of the update
    *   - created 
        - int 
	- UNIX timestamp of creation

=====================
Programming interface
=====================

To manage and manipulate the email templates the following classes are implemented:

* ``\Tygh\Template\Mail\Template`` — the template model. It’s a programming representation of the template structure in the database.

* ``\Tygh\Template\Mail\Repository`` — the template repository. The class implements low-level methods of receiving/adding/updating/deleting templates from the database. The class instance is available from the container ``Tygh::$app[‘template.mail.repository’]``

* ``\Tygh\Template\Mail\Service`` — the service class that implements higher-level methods of template management. The class instance is available from the container ``Tygh::$app[‘template.mail.service’]``

======================================
The Email Notifications Sending Schema
======================================

.. image:: img/invoice_editor_1.png
    :align: center
    :alt: New banner

1. Forming data for a notification.
This step hasn’t changed much. The data must be gathered to form the body of the message.

2.Calling the sender subsystem
The static class ``\Tygh\Mailer`` was replaced by the service class ``\Tygh\Mailer\Mailer``, that is available from the container ``Tygh::$app['mailer']``. 
When calling a message sending method, enter the character identifier of the email message. Based on that email message the body of the message is formed. For this purpose the ``template_code`` key is used. For example:

::
	
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
Before sending the message the ``\Tygh\Mailer\Mailer`` service defines how the body of the message is formed. Currently there are 3 ways to do this:

* By using the template from the file.
* By passing the template in the parameters.
* By using the template from the database.

4. Receiving the message template by the message id with the ``\Tygh\Template\Mail\Repository`` class.
      
5. Forming the context and variables of the message.
Based on the data received in **the step 1** we form the context and available variables of the email notification. Unlike the documents, the context and variables in the notifications are not separated. This preserves backward compatibility.

6. Calling the template engine to render the message body.

7. Converting CSS styles into inline.

8. Calling the low-level method of the message sending. 
On this step the formed data are sent to **the PHPMailer library** that sends the messages directly to customers.

======================================
Adding the Email Notification Template
======================================

To add the email notification template, use the ``\Tygh\Template\Mail\Service`` service class .

For example:

::

  /** @var \Tygh\Template\Mail\Service $service */
  $service = Tygh::$app['template.mail.service'];

  $service->createTemplate(array(
      'code' => 'new_notification',
      'area' => 'C',
      'status' => 'A',
      'subject' => '{{ __("new_notification_subject") }}',
      'template' => '{{ snippet("header") }} <br/> Dear {{ customer_name }}! <br/> ... <br/> {{ snippet("footer") }}',
  ));

=============================
Extending Email Notifications
=============================

PHP hooks:

* ``template_email_get_name - fn_set_hook('template_email_get_name', $this, $name)`` - it's called after the name of the notification template was formatted. The hook is used to change the name.

* ``mailer_send_pre - fn_set_hook('mailer_send_pre', $this, $transport, $message, $area, $lang_code)`` - it's called before the message is sent. This hook is used to change the content of the message.

* ``mailer_send_post - fn_set_hook('mailer_send_post', $this, $transport, $message, $result, $area, $lang_code)`` - it's called after the message was sent.

==============================
Additional template parameters
==============================

Any email notification template may contain additional parameters that can be processed later in the ``mailer_send_pre`` hook. The schema of additional parameters is contained in the ``params_schema`` field and has the following structure:

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

* ``"var_name"`` — the name of the variable that is used to save the value.
* ``"type"`` — the type of the variable; the available types are: checkbox, checkboxes, textarea, input.
* ``"title"`` — the name of the language variable that will be used as the name of the field.
* ``"description"`` — the name of the language variable that will be used as a hint for the field.
* ``"variants"`` — array of variants for the parameter type ``checkboxes``.
* ``"func"`` — the function that forms the array of variants for a parameter with the ``checkboxes`` type.

The saved values will be available in the property of the model of the notification template.
Additional parameters allow you to attach the invoice document to email notifications about order status changes. The checkbox, that determines if the invoice must be attached, appears on the template editing page. The value of this checkbox is handled in the ``mailer_send_pre`` prehook. If the checkbox is ticked, the pdf file will be attached to the message. In this case the schema of variables looks this way:

::

  array(
       "attach_invoice": array(
           "type": "checkbox",
           "title": "email_template.params.attach_invoice"
       )
  )

