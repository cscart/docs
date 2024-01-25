***************
Loyalty Program
***************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000130" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local:
    :depth: 2

--------
Overview
--------

    The `Loyalty Program <https://www.simtechdev.com/addons/customer-experience/loyalty-program.html>`_ add-on allows you to create a loyalty program for your regular customers by offering rewards and therefore to encourage them to keep shopping in your CS-Cart store.

    .. fancybox:: img/Loyalty_program_006.png
        :alt: Loyalty Program add-on for CS-Cart

    You can create multiple loyalty cards, assign them to particular user groups and offer different benefits, like reward points, discounts, free shipping and so on to entice the loyalty of customers.

    .. fancybox:: img/Loyalty_program_005.png
        :alt: Loyalty Program add-on for CS-Cart

    The customer can get the loyalty card when their purchase total reaches the amount specified for the card. It will get available in the profile details. They can see how much is left to move to the next level, the amount of earned/left points, as well as the time period for which the card will be valid.

    .. fancybox:: img/Loyalty_program_020.png
        :alt: Loyalty Program add-on for CS-Cart

    Avilable cards can also be found in the **User groups** tab.

    .. fancybox:: img/Loyalty_program_017.png
        :alt: user groups
        :width: 500px

    By implementing a loyalty program, you are telling your customers that you are interested in not only making money off of their purchases, but also in a relationship with customers that is mutually beneficial.

    This act of goodwill will improve the overall outlook of your customers, which will ultimately have a positive impact on your business.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. 
    Minimum required PHP version is 7.1. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

====
Demo
====

    Check out the Loyalty Program add-on in our |demo_store|.

.. |demo_store| raw:: html

   <!--noindex--><a href="http://loyalty-program.demo.simtechdev.com/" target="_blank" rel="nofollow">demo store</a><!--/noindex-->

.. note::
    
    Every half an hour the demo store is reset to the default state.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Loyalty Program add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

=====================
Setting up the add-on
=====================

    Here are available settings for the add-on:

    .. fancybox:: img/Loyalty_program_002.png
        :alt: settings of the Loyalty Program add-on

    * **Successful order status**—Select a status for orders which total will be taken into account when calculating the customer's total amount of purchases in the store.

    * **Notify customer about new card**—If enabled, the customer will get an email notification of newly assigned loyalty card.

    * **Failed order statuses**—Select order statuses which total will be subtracted from the user's total amount of purchases. This will allow you to deprive users of the loyalty card if the purchase total becomes insufficient due to the order failure.

    * **Use dynamic cards**—If enabled, the loyalty cards will be valid for the period specified in the settings below. After the period expires, the total of cards will be recalculated.

    * **Cards will be valid for (days)**—Specify the number of days for which the cards will be valid.

    The specified period will be shown in the user profile details.

    .. fancybox:: img/Loyalty_program_021.png
        :alt: user profile details

    * **Send expiring card notification prior to (days)**—Specify the number of days prior to which the notification about expiring card will be sent to the customer. If you do not want to send this notification, enter 0. Keep in mind that an additional notification will be sent to the customer the day before the card expires.

    If you choose to use dynamic cards, you will need to set up a cron that will check the expiration period of cards. Use the following command:

    *php /path/to/cart/admin.php --dispatch=loyalty_program_cron.check_period --cron_password=CRON_PASSWORD*

    where:

    *path/to/cart* is the path to your website.

    *CRON_PASSWORD* is the access key to the cron script that you can find under **Settings > Security settings**.

=============
Loyalty cards
=============

    The add-on creates a new **Loyalty Program** menu item under **Marketing**.

    .. fancybox:: img/Loyalty_program_004.png
        :alt: Loyalty cards
        :width: 261px
    
    On this page, you can add and edit loyalty cards based on purchase total for specific user groups. For instance, you can create **Silver**, **Gold**, and **Platinum** cards and specify under what conditions your customers can get each of the cards.

    .. fancybox:: img/Loyalty_program_003.png
        :alt: Loyalty cards

    For each of your card, enter a name, purchase total required to get the card, and select a user group from the list of available ones. Optionally, you can add an image and description to let your customers know the benefits they can have once they get the card (like discount, free products, free shipping, certain payment options, etc).

    .. fancybox:: img/Loyalty_program_005.png
        :alt: Loyalty cards

    Click **Create**.

    In the **Share** tab, you can share the created card among other stores. Simply select the necessary ones.

    .. fancybox:: img/Loyalty_program_019.png
        :alt: Loyalty cards

    Enter the number of bonus points. User will get this reward points when this card was assigned to him

    .. fancybox:: img/loyalty_program_bonus_points.png
        :alt: Loyalty cards

    The user's reward points received by moving to a specific loyalty program level will be displayed in the bonus points log:

    .. fancybox:: img/loyalty_program_bonus_points_log.png
        :alt: Loyalty cards

    .. fancybox:: img/loyalty_program_bonus_points_log_2.png
        :alt: Loyalty cards

    The reward points recieved functionality is available only when the "Reward Points" add-on is enabled

    .. fancybox:: img/loyalty_program_bonus_points_2.png
        :alt: Loyalty cards

    All the cards will be shown on the Loyalty Program page. Read further for more details.

===============
Loyalty program
===============

    The full description of the Loyalty Program is available on the **Loyalty Program** page. This is your chance to let your customers know why they should consider joining your loyalty program. 

    .. fancybox:: img/Loyalty_program_006.png
        :alt: Loyalty program

    .. note::

        The **Loyalty Program** page can be accessed only by the direct link. To make it accessible via storefront, you can, for example, insert the link to the page ('loyalty_program.view') into the menu. For more details, see `How to insert a link to the Loyalty Program page into the top panel?`_.

    You can easily edit the content and layout of this page by doing the following:

    1. Go to **Design - Layouts**.

    2. Switch to the **Loyalty Program** tab.

    .. fancybox:: img/Loyalty_program_007.png
        :alt: Loyalty program

    3. Click the gear button of a desired block to edit its content.

    .. fancybox:: img/Loyalty_program_008.png
        :alt: Loyalty program

    4. Edit the content in the **Content** tab.

    .. fancybox:: img/Loyalty_program_009.png
        :alt: Loyalty program

    5. Click **Save** to save the changes.

=====================
Loyalty program logs
=====================
    You can view the history of changes to loyalty cards and user groups by each customer:

    1. Go to the "Customers" ➝ "Customers".

    2. History of  the loyalty program changes is available in the gear on the page with the list of customers:

    .. fancybox:: img/loyalty_program_history.png
        :alt: Loyalty program

    or on the customer edit page:

    .. fancybox:: img/loyalty_program_history__2.png
        :alt: Loyalty program

    3. By clicking on "Loyalty program" you will be able to access the history of changes of the loyalty program:

    .. fancybox:: img/loyalty_program_history_3.png
        :alt: Loyalty program

    If you use dynamic cards, the log will also show changes of such cards, including information about card expiration.

====================================================================
How to insert a link to the Loyalty Program page into the top panel?
====================================================================

    To let your customers access the Loyalty Program page by a link, do the following:

    .. fancybox:: img/Loyalty_program_012.png
        :alt: Loyalty program

    1. Navigate to **Design - Menus**.

    2. Click the **+** button to add a new item, or select the existing menu.

    3. Enter a name for the menu and click **Create**.

    .. fancybox:: img/Loyalty_program_010.png
        :alt: Loyalty program

    4. Click on the created item and then click the **+** button again to add an item.

    5. Type in the **loyalty_program.view** value into the **URL** field and configure the rest of the settings.

    .. fancybox:: img/Loyalty_program_011.png
        :alt: Loyalty program

    6. Click **Save** to save the changes.

===================================================
How do I create promotions for the loyalty program?
===================================================

    Promotions for the loyaly program are created like any other cart promotions.

    1. Go to Marketing → Promotions → Give a name to your first loyalty plan.

    .. fancybox:: img/Loyalty_program_013.png
        :alt: Creating promotions

    2. Choose a user group.

    .. fancybox:: img/Loyalty_program_014.png
        :alt: Creating promotions

    3. Create a bonus for the customers of the user group.

    .. fancybox:: img/Loyalty_program_015.png
        :alt: Creating promotions

    The promotions has been applied successfully!

    .. fancybox:: img/Loyalty_program_016.png
        :alt: Creating promotions

==============================================================================================
How do I offer a loyalty card to the customers who already have the sufficient purchase total?
==============================================================================================

    Once you've created a loyalty program in your store and you've set up loyalty cards, your customers can now get loyalty cards when their purchase total becomes sufficient. But what should you do with the customers whose purchase total is already enough to get a Silver card, for example, before you even installed the add-on? 

    Say, you have a customer Tom who has already purchased products for USD 1500 and he should already have a Silver card (which states the purchase total from USD 1000). What do you do in this case? 

    No worries, all you need to do is to open the **Loyalty Program** page (Marketing > Loyalty Program), select the desired cards, click the gear button and select **Assign selected**.

    .. fancybox:: img/Loyalty_program_018.png
        :alt: assigning loyalty cards

    Now all your customers should get appropriate loyalty cards based on their purchase history. Be sure no-one is missed out.