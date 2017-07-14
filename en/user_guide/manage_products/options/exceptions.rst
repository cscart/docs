******************************************************
Exceptions (Allowed and Forbidden Option Combinations)
******************************************************

You can determine what combinations of :doc:`product options <product_options>` are available or unavailable to customers. For example, if you sell a T-shirt in various colors and sizes, you can either make certain combinations of size and color unavailable, or you can make them the only available combinations. This is done via **exceptions**.

.. important::

    Exceptions can limit what :doc:`product option combinations <option_combinations>` can be added to cart.

===================
Option Display Type
===================

A product's editing page has a setting called **Options type**. It can be useful when configuring exceptions. The setting has 2 possible values:

* **Simultaneous**—a customer can select the variants for options in any order, and all options appear on the product page with one of the variants already selected. This is the default value.

* **Sequential**—a customer has to select the variants for each option one by one: first choosing a variant for the first option, then for the second option, and so on.

  .. note::

      When options are sequential, their position relatively to each other is important. The positions can be changed in the corresponding field in the option editing pop-up window.

===============
Exception Types
===============

The behavior of exceptions is different, depending on their type. You can specify the type of exceptions separately for each product:

#. Go to **Products → Products**.

#. Click the name of the product you want to edit.

#. Find the **Exceptions type** setting and choose its value:

   * **Allowed**—only exceptions will be available to customers; other combinations of option variants will be unavailable.

   * **Forbidden**—exceptions won't be available to customers; other combinations of option variants will remain available.

#. Click the **Save** button in the top right corner.

   .. note::

       If you change the **Exceptions type** setting of the product, the type of all the existing exceptions of that product will change.

   .. image:: img/exceptions_type.png
       :align: center
       :alt: All the exceptions of the product are always of the same type.

===================
Adding an Exception
===================

#. In the Administration panel, go to **Products → Products**

#. Click the name of the desired product.

#. Switch to the **Options** tab. 

#. Click the **Allowed combinations**/**Forbidden combinations** button.

   .. hint::

       The name of the button depends on the **Exceptions type** setting of the product.

   .. image:: img/forbidden_comb_01.png
       :align: center
       :alt: The Forbidden combinations button is above the list of options on the Options tab.

#. Click the **+** button.

#. A pop-up window will open. There you can select the option variants that comprise the exception. Use the buttons on the right to add, clone, and remove combinations from the list.

   .. note::

       Only options of the **Select box**, **Radio group**, and **Check box** can be a part of an exception, because only these options have a list of variants known in advance.

#. Click the **Create** button.

   .. image:: img/forbidden_comb_02.png
       :align: center
       :alt: Select the option variants that comprise the exception.

   The combinations will be added to the list of exceptions:

   * If the product has **allowed combinations**, customers will only be able to add these combinations of options to cart.

   * If the product has **forbidden combinations**, customers won't be able to add those combinations to cart.

.. important::

    If exceptions already exist for a product, then adding a new option to that product won't lead to automatic recalculation of exceptions. The new option will have the value of *Any variant* in all existing exceptions.

=====================
Example of Exceptions
=====================

Let's assume we sell running shoes with 2 options: 

* *Size:* 41, 42, 43; 

* *Color:* black/yellow, blue, khaki. 

Let's also assume that size *43* can't be of any color specified above, because it has only one unique color scheme. We've also run out of all khaki shoes.

We'd have to create 2 exceptions (with the *Forbidden* type): 

* **Size: 43; Color: "No variant can be selected"**. It means that the *Color* option won't be available when a customer selects size *43*.

* **Size: "Any variant"; Color: Khaki**. It means that when *Khaki* is selected, customer won't be able to select any size. If *Size* is a required option (it should be), then customers won't be able to add khaki running shoes to cart.

=======================================
How Exceptions Appear on the Storefront
=======================================

The **Exception style** setting under **Settings → General** determines how exceptions appear on the storefront. It has two values:

* **Hide exception** (default value)—some option variants will be hidden, so that customers won't be able to choose a combination that is unavailable. 

  For example you sell a T-shirt with **color** and **size** options. You make the combination of *white* color and *XXL* size unavailable via exceptions. Then *XXL* won't appear on the list of sizes when *white* is selected as color, or the other way round.

* **Show warning on exception**—all variants of product options will appear. If a customer chooses an unavailable option combination, the following message will appear: *Unfortunately this combination is not accessible*. Customers won't be able to add unavailable combinations to cart.
