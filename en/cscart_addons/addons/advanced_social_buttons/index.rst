***********************
Social Buttons PRO
***********************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000045" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    Online shoppers are using social media more and more to share their favorite finds with their followers. That’s good news for your e-commerce site! Make it easy for online shoppers to share your products with their family and friends by installing **Social Buttons PRO** in your CS-Cart store. 

    The add-on lets you add social buttons to the product details page:

    .. fancybox:: img/Advanced_social_buttons_029.png
        :alt: CS-Cart Social Buttons PRO add-on

    You can also set the number of social networks to display per page. The rest will be available in a drop-down list.

    .. fancybox:: img/Advanced_social_buttons_030.png
        :alt: CS-Cart Social Buttons PRO add-on

    As a thank you gesture you can give your customers bonuses for sharing products in social networks.

    .. fancybox:: img/Advanced_social_buttons_019.png
        :alt: applied promotion at checkout
        :width: 300px

    The **Social Buttons PRO** add-on will definitely help you convert more customers.

========
Features
========

    - 14 popular social networks: Vkontakte, Pinterest, Odnoklassniki, My World\@mail.ru, Twitter, Digg, Reddit, Evernote, Linkedin, LiveJournal, Pocket, Qzone, Sina Weibo, Tumblr.

    - Nice and eye-catching design.

    - Ability to set a visible amount of social networks on the page.

    - Ability to display social buttons on Product details pages, Pages and Promotions pages.

    - Ability to give bonuses to customers for sharing products.

    - Easy to install and use.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/latest/cscart_addons/compatibility/index.html>`_.

    .. important::

        Please note that the **Social Buttons PRO** add-on is not compatible with the `Order Social Sharing add-on <https://www.simtechdev.com/docs/addons/order_social_sharing/index.html>`_ and the default `Social Buttons add-on <https://docs.cs-cart.com/latest/user_guide/addons/social_buttons/index.html>`_.


=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Social Buttons PRO add-on in our |demo_store|.

.. |demo_store| raw:: html

    <!--noindex--><a href="http://advanced-social-buttons.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Social Buttons PRO add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.


=====================
Setting up the add-on
=====================

    The settings of the Social Buttons PRO add-on are divided into three sections:

    **1. Available social networks**

    It provides you with a long list of available social networks. Select the **Status** checkbox next to the social buttons you want to display and define **Position** if you want to display the social buttons in a particular order.

    .. note::

        The **Position** setting is available starting from version 4.5.x.

    .. fancybox:: img/Advanced_social_buttons_031.png
        :alt: settings of the Order social sharing add-on

    **2. Options**
  
    .. fancybox:: img/Advanced_social_buttons_028.png
        :alt: settings of the Order social sharing add-on
        :width: 570px

    **Small buttons**—If enabled, smaller social buttons will be shown.

    Here's a quick look of regular sized buttons:

    .. fancybox:: img/Advanced_social_buttons_029.png
        :alt: regular sized social buttons

    Compare it with small buttons:

    .. fancybox:: img/Advanced_social_buttons_032.png
        :alt: small social buttons

    **Number of social buttons**—This setting will help you add an unlimited number of social buttons to the page without overloading it. The social buttons which exceed the limit will be available in a drop-down list.

    .. fancybox:: img/Advanced_social_buttons_030.png
        :alt: Number of social buttons

    **Show Specicfc Color** — This setting is allows the user to set a specific color to all buttons

    .. fancybox:: img/Advanced_social_buttons_033.png
        :alt: Color of social buttons

    **3. Display on**

    You need to select pages on which social buttons will be displayed: product details pages, all pages or promotions page.

    .. fancybox:: img/Advanced_social_buttons_027.png
        :alt: Number of social buttons
        :width: 586px

====================
Creating a promotion
====================

    The Social Buttons PRO add-on allows you to create a new cart promotion in your store. If users share products in social networks, they can get bonuses for that. 

    To create a promotion, follow these quick steps:

    1. Go to **Marketing - Promotions**.

    2. Click the + button in the top right to create a new cart promotion.

    .. fancybox:: img/Advanced_social_buttons_020.png
        :alt: creating a new cart promotion

    3. In the **General** tab, enter a name for the promotion, add a description, and other information.

    4. In the **Conditions** tab, click **Add condition** and select **Share in social network** from the list.

    .. fancybox:: img/Advanced_social_buttons_018.png
        :alt: creating a new cart promotion

    5. In the **Bonuses** tab, add a desired bonus for this promotion.

    .. tip::

        To learn more about the basics of creating promotions, refer to the `CS-Cart Docs <http://docs.cs-cart.com/4.3.x/user_guide/manage_products/promotions/index.html>`_.

    Once you've created a promotion, you can make a test order to make sure everything works fine.

    To do this:

    1. Under a test user share a product.

    .. fancybox:: img/Advanced_social_buttons_034.png
        :alt: share a product

    2. Add the product to cart and proceed to checkout.

    3. At checkout, you should see the applied promotion.

    .. fancybox:: img/Advanced_social_buttons_019.png
        :alt: applied promotion at checkout
        :width: 300px

    .. note::

        Keep in mind that the promotion will be applied only for the product shared on the product page. If the customer shared a product, but then added one more product to cart, the promotion will not be applied.

---
FAQ
---

======================================
How to a hook for versions 4.3.1-4.3.6
======================================

    .. important::

        If your CS-Cart or Multi-Vendor store runs on versions 4.3.1-4.3.6, you'll need to insert a hook to make the add-on perform correctly. 

    To do this, please follow the steps below:

    Open the **app/functions/fn.cart.php** file.

    In the **fn_checkout_place_order** function, before this line:

    .. code::

        fn_order_placement_routines('route', $order_id);

    add this one:

    .. code::

        fn_set_hook('checkout_place_orders_pre_route', $cart, $auth, $params);

    Example:

    .. code::

        if (empty($params['skip_payment']) && $process_payment == true || (!empty($params['skip_payment']) && empty($auth['act_as_user'])))
        { $payment_info = !empty($cart['payment_info']) ? $cart['payment_info'] : array(); fn_start_payment($order_id, array(), $payment_info); }
        // added hook checkout_place_orders_pre_route
        fn_set_hook('checkout_place_orders_pre_route', $cart, $auth, $params);
        fn_order_placement_routines('route', $order_id);