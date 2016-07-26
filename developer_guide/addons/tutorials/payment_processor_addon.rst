****************************************
Adding a Payment Processor via an Add-on
****************************************

A payment processor is a group of several **PHP** and **TPL** files and an entry in the ``payment_processors`` table.

============================================
The Fields of the *payment_processors* Table
============================================

* **processor** *(string)*—the name of the payment processor. It is the same for all languages, so it’s better to fill in this field in English or at least use the letters of the Latin alphabet.

* **processor_script** *(string)*—the name of the PHP file that contains the logic of the payment processor. Specify only the name of the file here, for example, **foo_bar.php**. Don’t put directories or any other symbols here.

  By default, that file will be loaded from *app/payments*. If the payment processor is added by an add-on and the **addon** field in the ``payment_processors`` table is filled in correctly, the file will be loaded from *app/addons/{$addon_name}/payments*.

* **processor_template** *(string)*—the relative path without the first slash to the TPL file of the template that appears to a customer who places an order. The path must be relative to *design/themes/{$theme_name}/templates*. For example: *views/orders/components/payments/cc.tpl*.

  If the processor was added by an add-on and requires a custom template, you can specify the path to the template from the add-on’s template folder. 

  For example, this is the template path for the PayPal add-on: *addons/paypal/views/orders/components/payments/paypal_express.tpl*.

  The **responsive** theme includes several standard templates. You can use them by specifying them in the **processor_template** field. As an alternative, you can use those templates as a base for your own custom template added by an add-on. The templates of the **responsive** theme are stored in *design/themes/responsive/templates/views/orders/components/payments*.

* **admin_template** *(string)*—the name of the TPL file of the template that appears when creating and editing the payment method on a separate tab. This template may include fields and forms where administrators specify payment processor properties, such as access tokens, etc.

  Enter the name of the TPL file without any directories and other symbols. It should look like **foo_processor_template.tpl**. By default, this file will be loaded from *design/backend/templates/views/payments/components/cc_processors*.

  If the processor was added by an addon, and the **addon** field in the ``payment_processors`` table is filled in correctly, the file will be loaded from *design/backend/templates/addons/{$addon_name}/views/payments/components/cc_processors*; ``{$addon_name}`` stands for the name of the addon.

* **callback** *(ENUM('Y','N'))*—determines how the payment step of the order placement will work:

  * **Y**—the processor will send the request to the processing server without redirecting the customer to that server. For example, this can be done via cURL. 

    .. hint::

        **PayPal Pro** and **Authorize.Net** processors work that way.

  * **N**—the customer who places an order will be redirected to the processing server to make the payment. 

    .. hint::

        That’s how **DPS PX Access** and **Player** processors work.

* **type** (ENUM('P','C','B'))—determines where exactly the template specified in the **processor_template** field will appear.

  * **P** *(Payment gateway)*—the template will appear in the **Billing Options** section at checkout.

    .. note::

        The location for checkout is ``dispatch=checkout.checkout``.

  * **C** *(Checkout)*—the template will appear as a payment button in the cart.

    .. note::

        The location for cart is ``dispatch=checkout.cart``.

  * **B** *(Both)*—the template will appear in both places specified above.

* **addon** *(string)*—the identifier of the add-on that adds the payment processor (for example, ``paypal``). 

  If that add-on is disabled or not installed, then the payment methods that rely on this add-on won’t appear to customers on the storefront; also, the processor itself won’t be available when creating a payment method.

===================================
The Script of the Payment Processor
===================================

We’ll use a payment processor script that has ``callback = "N"`` as an example.

The core of the logic of any payment processor is the PHP file specified in the **processor_script** field of the ``payment_processors`` table. It is an ordinary script that is included via the ``include`` directive. After that the content of the file is executed.

However, that file serves two different purposes, so it must include logical branching that allows running only one of the script’s two parts depending on the context, i.e. the purpose for which the script was included.

In our example the script will be located in *app/addons/sample_payment/payments*. We'll call it **sample_payment_processor.php** and add the minimum of the necessary code::

  <?php
  // app/addons/sample_payment/payments/sample_payment_processor.php

  // Preventing direct access to the script, because it must be included by the "include" directive. The "BOOTSTRAP" constant is declared during system initialization.
  defined('BOOTSTRAP') or die('Access denied');

  // Here are two different contexts for running the script.
  if (defined('PAYMENT_NOTIFICATION')) {
      /**
       * Receiving and processing the answer 
       * from third-party services and payment systems.
       */
  } else {
    /**
     * Running the necessary logics for payment acceptance 
     * after the customer presses the "Submit my order" button.
     */
  }

Let’s look into both possible contexts.

-----------------------------------------------------------------------
Running the Payment Acceptance Logic after a Customer Submits the Order
-----------------------------------------------------------------------

The script is included after the order is placed (i.e., after the entry in the orders table is created). Here are the typical tasks the script must handle in this context:

* Checking the data entered by the customer when placing the order. 

  .. hint::
  
      For example, checking the expiration date of the credit card specified by the customer.

* Changing the order status to **Failed** if the data doesn’t pass a check.

* Gathering and preparing the data to be passed to the server of the third-party payment system. 

* Acquiring various one-use tokens and access keys from the payment systems.

* Generating the URL where the customer will be taken after he/she performs the necessary actions at the payment service website.

* Redirecting the customer to the payment system website so that he/she can provide additional data or confirm the payment.

Let’s study the processes that take place before and after the payment processor script is run:

* The customer chooses the payment method and clicks the **Submit my order** button. Doing that sends a POST request to ``index.php?dispatch=checkout.place_order``.

* The ``checkout.place_order`` controller is executed, calling the ``fn_checkout_place_order()`` function.

  Apart from other arguments, this function accepts the ``$_REQUEST`` array. If the function finds an element with the ``payment_info`` key  in that array (``$_REQUEST['payment_info']``), it copies the value of that element to the ``$cart`` array with the same key—``$cart['payment_info']``.
 
  This allows the processor script to work with the data entered by the customer when he/she chooses the payment method. For example, the credit card number is one of the kinds of that data. You can declare such fields in the **processor_template** template.

  After that the function performs various checks required before creating the order. Then the function creates the order itself, which has the **Incomplete** status. This status is referred to by its letter code ``N`` in the database. 

* The logic of the payment process initiation begins with calling the ``fn_start_payment()`` function. When this function is run, important variables are declared. This variables can later be used in the payment processor script:

  * **$order_id** *(integer)*—the unique identifier of the created order.

  * **$order_info** *(array)*—the detailed information about the order.

    .. note::
 
        This information is returned by the ``fn_get_order_info()`` function.

  * **$processor_data** *(array)*—the information about the payment processor.

    .. note::

        This information is returned by the ``fn_get_processor_data()`` function.

  Then the processor script is included and executed via the ``include`` directive.

  The script must have the ``$pp_response`` variable declared. This variable is later used in the ``fn_start_payment()`` function and passed to the ``fn_finish_payment()`` function call.

---------------------------------------------------------------------------------------
Receiving and Processing the Response from the Third Party Services and Payment Systems
---------------------------------------------------------------------------------------

In this context the script has to process HTTP requests sent by the payment system. This can be the request to return the customer to the store website, or some additional requests sent from the server of the payment system.

There is the **payment_notification** controller (with ``callback = "N"``) for accepting requests like these. This controller expects two mandatory GET parameters:

* **mode** *(string)*—the exact purpose of the request in free form. 

  The value of this parameter will be available in the processor script in the ``$mode`` variable. The values can be something like *success*, *error*, *redirect*, etc.

* **payment** *(string)*—the name of the file with the processor script to be executed. 

  The name shouldn’t include the .php extension. For example, it can be **sample_payment_processor**.

This is what happens when the **payment_notification** controller is executed:

* The ``PAYMENT_NOTIFICATION`` constant is declared; its value is ``true``. 

  This provides a way to discern this context from the other context in the processor script by logical branching.

* A check is performed to verify whether the payment method that uses the payment processor passed in the GET parameter is active.

* The payment processor script is included via the ``include`` directive.

=======================================
Example of the Payment Processor Script
=======================================

Let’s create a payment processor script with ``callback = "N"`` and ``type = "P"``: it will redirect the customer to the payment processor server, and the payment method will appear in the **Billing Options** section at checkout.

We’ll start by creating the **sample_payment_processor.php** file in *app/addons/sample_payment/payments* and adding the minimum necessary code to it::

  <?php
  // Preventing direct access to the script, because it must be included by the "include" directive.
  defined('BOOTSTRAP') or die('Access denied');

  // Here are two different contexts for running the script.
  if (defined('PAYMENT_NOTIFICATION')) {
      /**
       * Receiving and processing the answer
       * from third-party services and payment systems.
       *
       * Available variables:
       * @var string $mode The purpose of the request
       */
  } else {
      /**
       * Running the necessary logics for payment acceptance
       * after the customer presses the "Submit my order" button.
       *
       * Availablе variables:
       *
       * @var array $order_info     Full information about the order
       * @var array $processor_data Information about the payment processor
       */
  }

For example, let's’ add the following code::

  <?php
  // Preventing direct access to the script, because it must be included by the "include" directive.
  defined('BOOTSTRAP') or die('Access denied');

  // Here are two different contexts for running the script.
  if (defined('PAYMENT_NOTIFICATION')) {
    
       fn_print_r("Processing the answer");
    
  } else {
    
       fn_print_r("Sending data");
    
  }

Now if you choose the payment method that uses this processor and click **Submit my order** at checkout, you’ll get a message *"Sending data"*, followed by *"Processing the answer"*.

You can use the code of any payment processor in *app/payments* as an example.

============================================
Adding Description for the Payment Processor
============================================

You can add a description for the payment processor you create. This description will appear below the **Processor** field when you :doc:`create or edit a payment method <../../../user_guide/payment_methods/adding_payment>` under **Administration → Payment Methods**.

The description of the payment processor is a dynamically-formed :doc:`language variable <../../core/language_variables>` in the ``language_values`` table. 

The name of the language variable is **processor_description_{$processor_script}**; ``{$processor_script}`` is the value of the **processor_script** field in the ``payment_processors`` table without the .php extension.

For example, if the value of **processor_script** is *foo_bar_processor.php*, the name of the language variable will be **processor_description_foo_bar_processor**.

When this language variable with the payment processor description is added to the ``language_values`` table, the description of the foo_bar_processor will appear in the Administration panel.

The values of this language variable can be edited in 3 ways:

* in the administration panel under Administration → Languages → Translations;

* via an SQL query to the ``language_values`` table :ref:`during the add-on installation <install-addon-process>`;

* via a migration.

===================================
IFRAME Mode for a Payment Processor
===================================

Some processors allow customers to interact with the payment gateway via a page that is loaded in an iframe. That way the customer doesn’t leave the store website.

.. note::

    Check **Skrill QuickCheckout** (*skrill_qc.php*) and **Skrill eWallet** (*skrill_ewallet.php*) in *app/payments*—these processors support iframe mode. There’s also an `example add-on on GitHub <https://github.com/cscart/addons/tree/master/iframe_payment>`_.

To work in iframe mode, a payment processor must have a setting called ``iframe_mode`` with the value set to ``Y``.
Here’s an example for the method that works only in the iframe mode::

  <input
     type="hidden"
     name="payment_data[processor_params][iframe_mode]"
     value="Y"
  />

When the customer selects an iframe payment method at the **Billing Options** step at checkout, the **Submit my order** button won’t show up. That’s why the processors in the **checkout.post.php** controllers won’t be executed. For example, the customer won’t be able to subscribe for :doc:`newsletters <../../../user_guide/addons/newsletters/index>` at checkout.

Because the order is not yet created, the `order nonce <https://en.wikipedia.org/wiki/Cryptographic_nonce>`_ serves to identify the order instead of ``order_id``. The order nonce is created from the ``TIME`` constant and ``user_id``.

The payment gateway in the iframe is loaded via the ``process_payment`` mode of the **checkout.php** controller, where the processor script is included via the ``include`` directive.

The processor script sends all the necessary information to the payment gateway, including the order nonce and the session identifier.

Once the payment notification from the gateway is received, the order is placed, and the information about the order is retrieved from the session.

After receiving a payment notification, the payment method must:

* manually mark the order as placed;

* save the correlation between the **order nonce** and ``order_id``.

Here are the entries added to the ``order_data`` table when ``payment_notification`` is received:

+--------------------------------------+-------+------------------------+
| order_id                             | type  | data                   |
+======================================+=======+========================+
|                                      | S     | The ``TIME`` constant  |
| The identifier of the created order  +-------+------------------------+
|                                      | E     | Order nonce            |
+--------------------------------------+-------+------------------------+



