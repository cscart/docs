********
Buy More
********

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000292" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 3

--------
Overview
--------

    Increase of the average bill values makes a significant impact on the total profit of the online store. Specialists of the e-commerce business put a lot of effort to fill the customer's cart with as many products as possible. Maximizers such as Up-Sell, Down-Sell, Cross-Sell are very useful in terms of sells stimulation and increase of the average bill. Marketing events like that are able to increase the selling rate up to 30% average. Buy More add-on presents a solution for implementing such techniques for your store/marketplace. 

    The add-on informs the customer about the conditions left to apply the promo.

    **Available promo conditions:**

    * Initial price

    * Quantity of the products in the cart

    * Product price

    **Available promo conditions operators:**

    * Greater

    * Greater or equal

    * Equal

    **Available promo condition bonuses:**

    * Product price

    * Free shipment

    * Order discount

    * Gift certificate

    * Bonus points

========
Features
========

    * Display of the special notifications on the product and cart pages

    * New Promo Conditions and Promo Messages tabs on the Promotions setting page

    * Ability to create the custom messages

    * Ability to change the color of the message text and background

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.12 and above. Need compatibility with another CS-Cart version? |Contact us now.|
    Minimum required PHP version is 7.1. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Buy More add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://buy-more.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state. 

---------------------------
Managing in the admin panel
---------------------------

    .. important::
        Promo conditions and Promo Messages tabs are available when the conditions of the add-on is active only

    The list of message display types is added to the General tab of the promotion settings (Marketing>Promotions):

    * Customer promo message

    * Default promo message

    * Don't show promo message

    .. fancybox:: img/bm_1.png
        :alt: Promo message options

    The **Promo Message** tab contains the content of the message and tools for text and background color changing:

    .. fancybox:: img/bm_2.png
        :alt: Promo message content

    CS-Cart language variables can also be used in the message.  Due to dynamic and dependency of language variables on the promotion conditions, we suggest the following list:

    * **promo_name** - name of the promotion, taken from the General tab

    * **currency_symbol** - symbol of the selected currency

    Variables with **condition** prefix contains the same data mentioned in the Condition tab:

    * **condition_{name of the condition}** - displays the name of the condition

    * **condition_value_{name of the condition}** - displays the values required to apply the promotion

    Variables with the **bonus** prefix contain the same data mentioned in the Bonuses tab:

    * **bonus_{name of the bonus}** -  displays the name of the bonus

    * **bonus_value_{name of the bonus}** - displays the value of the bonus (i.e. shipping method of the amount of the discount)

    Variables with the **diff** prefix display the difference between the required and the actual quantity of the products in the cart:

    * **diff_{name of the condition}** -  displays the quantity of the products to add to the cart

    * **diff = condition_value** - displays the total amount of the cart required to apply the promotion

    .. note::
        Every language requires special message

    Name and the value of the conditions taken from the Condition tab is displayed on the Promo condition tab.

    .. note::
        * The value mentioned in this tab must be less than the value mentioned in the Condition tab

        * Condition cannot be changed from this tab. Condition will be changed automatically from the Condition tab

    .. fancybox:: img/bm_3.png
        :alt: Promo conditions

    .. important::
        The add-on does not support the groups of conditions. 

    Option **Users can close promo messages** allows the customer to close the notification about promotion. After the notification is closed and the page refreshed, the message will not be displayed.

    .. fancybox:: img/bm_4.png
        :alt: add-on settings

    .. fancybox:: img/bm_5.png
        :alt: Option available

    When the option is disabled, the notification cannot be closed by the customer.

    ..  fancybox:: img/bm_6.png
        :alt: Option unavailable

==================
Storefront display
==================

    The following condition list will appear in case of use of several promo conditions and/or if each of several conditions needs to be met: 

    .. fancybox:: img/bm_7.png
        :alt: List

    When the condition is fulfilled, the relevant line in the list will be erased from the list

    .. fancybox:: img/bm_7.png
        :alt: Fulfilled condition list

    In case *Customer Promo Message* type is selected, the message will be displayed on the product and cart pages, when the conditions from the *Promotion Conditions* tab are met:

    .. fancybox:: img/bm_9.png
        :alt: Custom promo message

    If *Default Promo Message* is selected, then:

    .. fancybox:: img/bm_10.png
        :alt: Default promo message

    Different styles can be applied for each of promotions and displayed in different relevant blocks: 

    .. fancybox:: img/bm_11.png
        :alt: Style change

============================================================================================
Example of creation of free delivery promotion with a condition on the total amount of cart:
============================================================================================

        * Create a new promotion and select *Order Subtotal* in the *Conditions* tab. Select one of the following operators: greater, equal, greater or equal. For example, we have selected greater or equal $500 and clicked Save button. Thus, we have selected the subtotal amount to get the promotion bonus from.

    .. fancybox:: img/bm_12.png
        :alt: Conditions tab

        * *Promotion conditions* tab will appear once we have saved the condition. Insert there the subtotal amount to start display the message from. We have inserted $150 as an example. Click save:

    .. fancybox:: img/bm_13.png
        :alt: Promotion conditions tab

        * We are able to select color of the text and background of the message. Text field can be left blank in case the *Default Promo Message* is selected on the *General* tab.

    .. fancybox:: img/bm_14.png
        :alt: Change color

        * Open the storefront and add some product to the cart. After the total amount of the cart will make $150 the following message will appear:

    .. fancybox:: img/bm_15.png
        :alt: Finel message

