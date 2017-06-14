**********
Robots.txt
**********

Administrators use the `robots.txt <http://www.robotstxt.org/robotstxt.html>`_ file to provide instructions for `web crawlers <https://en.wikipedia.org/wiki/Web_crawler>`_. These instructions can be used to prevent search engines from indexing specific parts of your site. 

In CS-Cart and Multi-Vendor you can edit these instructions right in the Administration panel.

#. Go to **Website → SEO → robots.txt**.

#. You'll see a text field where you can enter the instructions.

#. Click the **Save** button in the top right part of the page.

   .. image:: img/robots_content.png
       :align: center
       :alt: Starting with version 4.6.1, CS-Cart supports different robots.txt instructions for different storefronts.

============
How it Works
============

------------
Before 4.6.1
------------

* The instructions were stored in the **robots.txt** file. 

* You couldn't specify different instructions :doc:`for different storefronts </user_guide/stores/index>`.

* FTP access was required for editing the **robots.txt** file.

--------
In 4.6.1
--------

* The instructions are stored in the database and can be different :doc:`for each storefront </user_guide/stores/index>`. 

* No FTP access is required to edit the instructions. 

* If a **robots.txt** file exists in the root directory of a CS-Cart/Multi-Vendor installation, then only the instructions from this file will be used, and the instructions from the database will be ignored.
