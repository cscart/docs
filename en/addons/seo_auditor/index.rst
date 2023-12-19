SEO Auditor
***********

.. raw:: html

    <div class="buy-now">
        <a href="https://marketplace.simtechdev.com/seo-auditor.html" class="btn buy-now__btn">Buy now</a>
    </div>
 
.. contents::
    :local:
    :depth: 2

--------
Overview
--------

    SEO Auditor is the crawler created for CS-Cart and Multi-Vendor platforms to scan the store, inspect the links, audit key elements, and monitor pages statuses and important parameters. SEO Auditor enables you to analyze your current technical SEO state and make amendments to improve store ranking, user experience, and load speed.

==============================
Pains to kill with SEO Auditor
==============================


    * **Find 4xx, 5xx pages** - Pages with error status negatively influence your visitors’ browsing experience and search engine ranking. Find these pages to fix them or add a redirection.

    * **Measure the weight of your pages** - Find the heaviest pages and optimize them to increase load speed. This will also influence your search engine ranking in a positive way.

    * **Collect metadata** - Fetch your store metadata to adapt it to the search engine requirements and best SEO practices.

============
Key features
============

    * Works with **multiple storefronts** within one CS-Cart and Multi-Vendor license.

    * **No scan limit** - unlike other solutions on the Internet, the add-on has no limit of scanned URLs.

    * **Multitasking** - the add-on can perform multiple scans simultaneously. But make sure your server can bear it.

    * **Single management panel** - All tasks are displayed and can be managed from one panel. You can schedule scans, set the number of URLs to scan per step, and balance the load of your server.

=============
Compatibility
=============

    The add-on is compatible with CS-Cart and Multi-Vendor 4.11 and above, but only versions 4.12.x and above are supported. 
    Minimum required PHP version is 7.1.

    See more information about compatibility of our add-ons `here <https://docs.cs-cart.com/marketplace-addons/compatibility/index.html>`_.

=======
Support
=======

    You are guaranteed a quality add-on supported by the future versions. If you need help, please contact us via our `help desk system <https://helpdesk.cs-cart.com>`_.


--------------------------
Managing in the admin area
--------------------------

=====================
Installing the add-on
=====================

    Install the **SEO Auditor** add-on on the add-ons list page ("Addons" → "Manage add-ons"). Click the + button in the top right corner, select an archive, and click Upload & install. 

=====================
Setting up the add-on
=====================

    Here are the available settings of the add-on.

    .. fancybox:: img/seo_auditor_001.png
        :alt: settings of the SEO Auditor add-on

    On the **General** tab: 

    * **License key** — Enter your license key.

    * **Number of URLs per step** — Enter the number of pages to be analyzed in one step. It determines the number of pages the сron should process every time it starts.

    * **Crawl-delay rate** — Set up the crawl delay (in milliseconds) between pages checked if you want to delay the bots to start crawling the site pages,.

    * **Timeout** - Increase this value if the ``404: Page not found`` error occurs while trying to check an existing page. The default value is 5.

   
=============
Cron settings
=============

   On the **Cron** tab, you can configure and schedule the cron job:

    .. fancybox:: img/seo_auditor_002.png
        :alt: cron settings

 
   Configure launch frequency according to a load of your server. Take into account how often you add new products, update content, and the number of daily orders. If your server is under high load, the intervals should be longer. 

   The recommended frequency is once a day. However, if the site is quite static (the content is not updated, the configuration does not change, add-ons are not being installed), it is enough to perform checks once every two or three days. 

   Note that if you have CS-Cart Ultimate with multiple storefronts, you need to configure сron job for each storefront. Adjust the schedule of tasks according to the number of the storefronts you have and the capacity of your server. 

   .. tip:: Сonfigure the execution of cron scripts on the time with the minimum load on the server.

-----------------------
Working with the add-on
-----------------------

=====================
How to start an audit
=====================

    Launch the cron job on the server to start an audit according to a schedule. Navigate to **Add-ons - SEO Auditor** page to inspect the list of audit tasks and their statuses there. 

    .. fancybox:: img/seo_auditor_003.png
        :alt: Audit tasks page

    Click on the audit task name to see the list of URLs being checked and the tasks' statuses.

    .. fancybox:: img/seo_auditor_004.png
        :alt: Audit task details page

    Clicking on the URL opens a detailed report of the result of the page check.

    .. fancybox:: img/seo_auditor_005.png
        :alt: URL details page

    You also have an option to start a process for rechecking the page after you made some changes to it. Just click the **Recheck** option in the **Gear** button.

    .. fancybox:: img/seo_auditor_006.png
        :alt: add description to the product

===========
Video Guide
===========

You may also want to watch **video tutorials on how to install and use** the add-on:

Part 1.

    .. raw:: html

        <iframe width="560" height="315" src="https://www.youtube.com/embed/EchlcupX8Ok" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Part 2.

    .. raw:: html

        <iframe width="560" height="315" src="https://www.youtube.com/embed/jf5X6qh760Q" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


---
FAQ
---
======================================================================================
The audit status is always Pending and the pages are not being checked. What can I do?
======================================================================================

Check if you configured the cron job on your server correctly. Creating an audit in the admin panel is not enough. To start an audit, you need to launch the cron job.

==============================================================================================
I am checking an existing page but the result is ``404: Page not found``. How can it be fixed?
==============================================================================================

Try increasing the value of the **Timeout** setting in the add-on's settings. The default value is 5.