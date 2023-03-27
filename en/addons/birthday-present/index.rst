****************
Birthday Present
****************

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/landing/100000052" class="btn buy-now__btn">Buy now</a>
    </div>



.. contents::
    :local: 
    :depth: 2

--------
Overview
--------

    Send exciting offers or discounts to your customers on their birthday with the `Birthday Present add-on <https://www.simtechdev.com/addons/marketing/birthday-present.html>`_. It offers a simple way to congratulate your customers on their birthday by sending an email notification with warm words and a desired bonus, like a discount, gift, free shipping, etc. 

    .. fancybox:: img/Birthday-present-007.png
        :alt: birthday notification
        :width: 633px

    You can configure the add-on by setting how many days prior to the birthday the promotion should start and for how many days it will be valid.

    .. fancybox:: img/Birthday-present-002.png
        :alt: Birthday Present add-on

============
How it works
============

    Customers register in the store and add their date of birth in the profile. Change of date of birth can be limited in admin panel.

    .. fancybox:: img/Birthday-present-003.png
        :alt: date of birth in the profile
        :width: 631px

    The administrator creates a cart promotion with the Birthday condition and adds bonuses, for example, a discount, a gift certificate, or a free product.

    .. fancybox:: img/Birthday-present-012.png
        :alt: cart promotion

    On the specified date, the customer gets an email notification with birthday wishes and a personal bonus.

    .. fancybox:: img/Birthday-present-007.png
        :alt: birthday notification
        :width: 633px

    The customer adds products to cart and the birthday promotion is applied automatically.

    .. fancybox:: img/Birthday-present-004.png
        :alt: birthday promotion applied in cart

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.9 and above, but only versions 4.12.x and above are supported. Need compatibility with another CS-Cart version? Contact us now.
    Minimum required PHP version is 5.6. The add-on does not support PHP 8.x yet.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.

---------------------------
Managing in the admin panel
---------------------------

=====================
Installing the add-on
=====================

    Install the Birthday Present add-on on the add-ons list page (“Add-ons” → ”Manage add-ons”). Click the + button in the top right corner, select an archive and click Upload & install. You can now find the installed add-on in the list of installed add-ons, just make sure it is set to Active.

    .. fancybox:: img/Birthday-present-001.png
        :alt: Birthday Present add-on

    Make sure the **Age verification** add-on is Active. It will allow customers to add the date of birth in their profile.

    .. fancybox:: img/Birthday-present-008.png
        :alt: Age verification add-on

=====================
Setting up the add-on
=====================

    Here are available settings of the Birthday Present add-on:

    .. fancybox:: img/Birthday-present-002.png
        :alt: Birthday Present add-on settings

    * **The number of days before the birthday**—Defines how many days prior to the birthday the promotion should start.

    * **The number of days after the birthday**—Defines how many days after the birthday the promotion should be valid (including the birthday)

    * **Sending warning letters to e-mail for a specified number of days**—Specifies the number of days within which the user will get notifications about their approaching birthday.

    You can set up a cron job to run it according to a schedule to send email notifications. For example, if you enter **2** in the previous setting, the script will check all the users for the date of their birth and send an email notification to users whose birthday is in two days. 

    *php /path/to/cart/admin.php –dispatch=seo_pack_cron.apply –cron_password=CRON_PASSWORD*, where:

    **path/to/cart** is the path to your website.

    **CRON_PASSWORD** is the access key to cron script that you can find under **Settings > Security settings** in the admin panel.

=========================
Creating a cart promotion
=========================

    1. Go to **Marketing > Promotions**.

    2. Click the + button and select **Add cart promotion**.

    .. fancybox:: img/Birthday-present-009.png
        :alt: Adding cart promotion
        :width: 300px

    3. In the **General tab**, fill in the given fields.

    .. fancybox:: img/Birthday-present-011.png
        :alt: Adding cart promotion

    .. tip::

        **Name** and **Short description** will be shown when the promotion is applied on the cart and checkout pages.

        .. fancybox:: img/Birthday-present-004.png
            :alt: Birthday Present promotion

    4. In the **Conditions** tab, click **Add condition** and select **Birthday** from the list.

    .. fancybox:: img/Birthday-present-010.png
        :alt: Adding conditions

    5. In the **Bonuses** tab, click the **Add bonus** button and select bonuses you want your customers to get for their birthday.

    .. fancybox:: img/Birthday-present-012.png
        :alt: Adding conditions

    6. Click **Save and close** in the top right.

==========================
Editing email notification
==========================

    Customer notifications are sent to customers to inform them about their approaching birthday and bonuses they can get as a gift.

    To edit the template:

    1. Go to **Design > Email templates**.

    2. In the **Customer notifications** tab, select the necessary template.

    3. Edit the template and click **Save**.

    .. fancybox:: img/Birthday-present-013.png
        :alt: Editing email notifications