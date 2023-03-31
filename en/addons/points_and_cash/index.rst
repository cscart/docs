***************
Points and Bonuses
***************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000101" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 3

--------
Overview
--------

    With the `Points and Bonuses add-on <https://www.simtechdev.com/addons/marketing/points-and-cash.html>`_, you can get the most out of your points-based loyalty campaign by allowing your customers to enjoy the freedom of mixing cash and points—from a single product to a whole shopping cart.

    .. fancybox:: img/Points_and_cash_Selection_005.png
        :alt: applying reward points

    You can give your customers reward points for registration and leaving product reviews. Points for registration are granted automatically right after registration is complete. Points for reviews are granted once the administrator approves the review. Customers can see the amount of points they have in their profile.

    .. fancybox:: img/Points_and_cash_Selection_007.png
        :alt: reward points log

    The add-on lets you disable using reward points for products and carts with applied promotions and set the percentage of the product price that can be paid with reward points.

    .. fancybox:: img/Points_and_cash_Selection_010.png
        :alt: settings of the Points and Bonuses add-on

========
Features
========

    - Apply special earning point rule to some products and shopping carts.
    - Give reward points for registration and reviews.
    - Set a percentage of the product price that can be paid with reward points.
    - Set a percentage of the price for a particular product in the store.
    - Set a percentage of the order total, including taxes and shipping fee.
    - Disable using reward points for the cart with applied promotions.
    - Disable using reward points for the products with applied promotions.
    - Extend the functionality of the default Reward points add-on.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.12 and above. Need compatibility with another CS-Cart version? Contact us via email cart-addons@cscart.com now.
    Minimum required PHP version is 7.1. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Points and Bonuses add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://points-and-cash.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

--------------------------
What the customer will see
--------------------------

    The customer can see the available amount of reward points in their profile.

    .. fancybox:: img/Points_and_cash_Selection_007.png
        :alt: reward points log

    At checkout, the customer can see the maximum amount of points to be used for this order.

    Here's a quick look.

    .. fancybox:: img/Points_and_cash_Selection_005.png
        :alt: applying reward points

    Once the reward points are applied, the customer will see the discount amount for this order.

    .. fancybox:: img/Points_and_cash_Selection_006.png
        :alt: reward points applied

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Points and Bonuses add-on on the add-ons list page (Add-ons → Manage add-ons). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. important::

        Make sure the **Reward points** add-on is set to Active in your store. Otherwise the Points and Bonuses add-on might not perform correctly.

        .. fancybox:: img/Points_and_cash_Selection_002.png
            :alt: Reward points add-on

        The **Comments and reviews** add-on must be active to let you grant points for registration and reviews.

        .. fancybox:: img/Points_and_cash_Selection_0081.png
            :alt: Reward points add-on

=====================
Setting up the add-on
=====================

    .. important::

        If your CS-Cart or Multivendor store runs on version lower than 4.3.1, you'll need to insert a hook to make the add-on perform correctly. For more details, refer to `Adding a hook`_.

    Here are available settings of the Points and Bonuses add-on.

    .. fancybox:: img/Points_and_cash_Selection_010.png
        :alt: settings of the Points and Bonuses add-on

    * **Enable cart points**—Enable using reward points for cart with applied promotions.

    * **Enable product points**—Enable using reward points for products with applied promotions.

    * **Enable points for discounted items**—Enable the use of bonus points for products that have a discount

    * **Percentage, %**—Percentage of the product price/ order total that can be paid with reward points.

    * **Points for registration**—Determine how many reward points users will get for registration. Set the setting to 0 if you do not want to use this setting.

    * **Points for review**—Determine how many reward points users will get for leaving a product review after it gets the admin approval. Set the setting to 0 if you do not want to use this setting.

    * **Allow to pay for entire order with points**—If enabled, customers can pay with points not only for products but for the entire order, including shipping charges, taxes, etc.

    .. tip::

        **Points Exchange Rate** can be set in the appropriate setting of the *Reward Points* add-on.

            .. fancybox:: img/points-exchange-rate.png
                :alt: Points Exchange Rate

===============================================================================
How do I limit percentage of product price that can be paid with reward points?
===============================================================================

    The store admin can define percentage of the product price that can be paid with reward points for a particular product or multiple products.

+++++++++++
One product
+++++++++++

    1. Go to **Products > Products** and open the editing page of the required product. 

    2. Switch to the **Add-ons** tab.

    3. In the **Points and Bonuses** field, enter the necessary value.

    .. fancybox:: img/Points_and_cash_Selection_004.png
        :alt: Percentage limitation

    4. Click **Save**.

    .. note::

       If you specify a value for the percentage limitation for a particular product, it will override the global value defined in the add-on settings.

        .. fancybox:: img/Points_and_cash_Selection_012.png
            :alt: Percentage limitation

+++++++++++++++++
Multiple products
+++++++++++++++++

    1. Go to **Products > Products**.

    2. Select the necessary products and under the gear button select **Edit selected**.

    .. fancybox:: img/selecting-products.png
        :alt: bulk product editing

    3. Click **Unselect all*, then select **Percentage, %** box. Click **Modify selected**.

    .. fancybox:: img/bulk-product-editing.png
        :alt: bulk product editing

    4. Add values and click **Save**.

    .. fancybox:: img/adding-values.png
        :alt: bulk product editing

    .. note::

       If you specify values for the percentage limitation for particular products, the global value defined in the add-on settings will be overridden.

        .. fancybox:: img/Points_and_cash_Selection_012.png
            :alt: Percentage limitation

=============================
Managing comments and reviews
=============================

    The add-on enables you to give customers reward points for leaving comments and reviews for products. We advise you to re-check settings of the **Comments and reviews** add-on. Check whether the administrator needs to approve posts submitted by customers. If approval required, customers will get reward points for the submitted review only after the administrator approves it. If no approval needed, reward points will be given automatically.

    .. fancybox:: img/Points_and_cash_Selection_009.png
        :alt: comments and reviews addon

=============
Adding a hook
=============

    .. important::

        If your CS-Cart or Multivendor store runs on version lower than 4.3.1, you'll need to insert a hook to make the add-on perform correctly. 

    To do this, please follow the steps below:

    1. Open the app/addons/reward_points/func.php file of your CS-Cart installation.

    2. Approximately on line 259, right after this:

    .. code::

        if (defined('ORDER_MANAGEMENT')) {
        $user_points = fn_get_user_additional_data(POINTS, $auth['user_id']) + (!empty($cart['previous_points_info']['in_use']['points']) ? $cart['previous_points_info']['in_use']['points'] : 0);
        } else {
        $user_points = !empty($user_info) ? $user_info['points'] : 0;
        }

    insert this line:

    .. code::

        fn_set_hook('set_point_payment', $cart, $cart_products, $auth, $user_info, $cost_covered_by_applied_points, $point_exchange_rate, $user_points);

    3. Approximately on line 549, right after this:

    .. code::

        function fn_gather_reward_points_data(&$product, &$auth, $get_point_info = true)
        {

    insert this line:

    .. code::

        fn_set_hook('gather_reward_points_data_pre', $product, $auth, $get_point_info);

    Save the changes.
