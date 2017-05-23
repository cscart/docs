**********
Categories
**********

The two key concepts to describe the cataloging in CS-Cart are **product** and **category** (a group of products). The system of categories enables you to build the catalog in the way of a tree with multiple branches, making it easier for customers to find the products they want.

.. important::

    Every product that you have in your catalog must be assigned to at least one category.

Each category can include an unlimited number of child categories which, in turn, can include their own child categories. Child categories are often referred to as **sub-categories**. Categories without a parent are called **root categories**.
 
.. note::

    To learn more about using categories in a multiple-store environment, please refer to :doc:`this article </user_guide/stores/index>`.

.. image:: img/categories_list.png
    :align: center
    :alt: List of the product categories

=====================
Actions on Categories
=====================

When on the **Products → Categories** page, administrators can perform the following actions:

--------------
Add Categories
--------------

* To add one category, click the **+** button in the upper right part of the page.

* To add several categories at a time, click the gear button in the upper right part of the page and choose **Bulk category addition**.

---------------
Edit Categories
---------------

* To change the properties of a specific category, click the name of that category. Alternatively, you can click the category's gear button (it appears when you hover over the category) and choose **Edit**.

* To change the properties of multiple categories at the same time, tick the checkboxes of those categories, click the gear button in the upper right part of the page and choose **Edit selected**.

-----------------
Delete Categories
-----------------

* To delete a specific category, hover the mouse pointer over this category. The gear button will appear for this category on the right. Click it and choose **Delete**.
    
* To delete multiple categories at the same time, tick the checkboxes of those categories, click the gear button in the upper right part of the page, and choose **Delete selected**.

.. warning::

    Be careful when deleting a category! In Multi-Vendor, child categories and the products under the category will be deleted automatically. In CS-Cart the products will be moved to the :doc:`trash category <trash_category>`. 

===============
In This Section
===============

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    *
