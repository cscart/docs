*****************************************
How to Configure the Vendor Rating Add-on
*****************************************

.. contents::
    :backlinks: none
    :local:
    
Basic Settings
==============

#. Install the :doc:`Vendor rating </user_guide/addons/vendor_rating/index/>` add-on just like :doc:`any other add-on </user_guide/addons/1manage_addons/>`.

#. Click the add-on name to open it's settings.

#. On the **General** tab configure the formula for the rating calculation. 
   
   It can consist of the following variables:
   
   * ``paidOrdersCount``—amount of orders which statuses are **Paid** and **Complete**.
   
   * ``paidOrderTotal``—total of orders which statuses are **Paid** and **Complete**.
   
   * ``activeProductsCount``—amount of products which status is **Active**.
    
   * ``manualVendorRating``—vendor's rating, set manually. Go to the **Rating** tab on the **Vendors → Vendors** page to specify this value. Values acceptable to enter: from *0* to *100*.
    
   * ``vendorReviewsRating``—average of approved vendor's reviews.
    
   * ``productReviewsRating``—average of approved products' reviews.
    
   * ``manualVendorPlanRating``—rating of a vendor plan, set manually. Go to the **Vendors → Vendor plans** page. Click the plan's name to open it's settings, and go to the **Rating** tab. Specify the rating value. Values acceptabe to enter: from *0* to *100*.
    
   * ``returnsCount``—amount of refund requests received by vendor.
   
   .. important::
   
       The ``productReviewsRating``, ``manualVendorPlanRating`` and ``returnsCount`` variables are only available if you have the :doc:`/user_guide/addons/comments_and_reviews/index`, :doc:`/user_guide/addons/vendor_plans/index` and :doc:`/user_guide/addons/rma/index` add-ons installed, respectively.
       
#. Specify the **Calculation period start date**. Only orders, products, and reviews created after the specified date will be calculated in the rating.
   
#. Click **Save**, then hit the **Run recalculation** button.

   .. image:: img/rating_general_settings.png
       :align: center
       :alt: General tab of the add-on settings

   .. hint::

       To ensure that process of recalculation does not disrupt the stability of your store, it is recommended to set the automatic recalculation to the moment of the lowest store traffic (for example, nighttime). Specify the time and add the following command in `cron <http://en.wikipedia.org/wiki/Cron>`_:
       
       ``php /path/to/cart/admin.php -p --dispatch=vendor_rating.recalculate``
       
How to Assign a Rating Level to a Vendor
========================================

#. Open the add-on's settings. 

#. Go to the **Rating ranges** tab.

#. Set the **Rating lower limits**. Values are set as a percentage, where *100%* is the highest rating among vendors.

#. Click **Save**.

      .. image:: img/rating_ranges.png
          :align: center
          :alt: Rating ranges tab in the add-on settings

How to: Add the Ability to Sort by Rating
=========================================

To allow customers to sort products and vendors on the storefront by rating:

#. Open the **Settings → Appearance** page.

#. In the **Products list layouts settings** section tick the **Sort by Vendor rating** checkbox.

#. Click **Save**.

   .. image:: img/enable_sort_by_rating.png
       :align: center
       :alt: Enabling the sort by rating setting

