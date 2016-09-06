*****
Menus
*****

Use this section to create custom storefront menus. Menus help to organize different types of content (e.g. Links, Content pages, Categories, etc.) displayed on pages into short consistent lists. Each menu can be added to any part of the storefront in **Design → Layouts** through a block of the *Menu* type. By using menus you can provide lots of useful information without occupying too much space on the storefront.

There are two types of menus in CS-Cart—**manually created** and **dynamic**.

* **Manually created** menus use the content that was added manually by a user, e.g. Internal and external links in the Quick links menu.

* **Dynamic menus** use the content of the store, e.g. Category tree for the Categories menu.

.. image:: img/menus.png
    :align: center
    :alt: Menus

Use the **+** button to add new menu, or click the **gear** button and choose **Edit** to edit existing menus.

To create a new menu and to display it on the storefront, complete the following steps:

==============================
Step 1. Creating an Empty Menu
==============================

All menus are created empty.

*   In the Administration panel, go to **Design → Menus**.
*   Click the **+** button to add a menu.
*   In the appeared window, specify the **Name** of the menu (e.g. *New menu*).

.. image:: img/menu_01.png
    :align: center
    :alt: New menu

*   Click the **Create** button.

========================
Step 2. Filling the Menu
========================

You can fill the menus manually or using the content of the store.

*   Click the gear button next to the created menu, choose **Manage items**, and in the opened window click the **+** button.
*   In the appeared window specify:

    *   **Parent item**—Select the necessary parent level.
    *   **Name**—Type the name of your item (e.g. *New Item*).
    *   **Pos.**—Specify the link position.
    *   **URL**—Enter the URL of the page which will open when the link is clicked on (e.g. *index.php?dispatch=categories.catalog*).
    *   **Activate menu item for dispatch**—Specify the pages on which to display the tab as active (e.g. *sitemap.view*).

        .. note ::

        	If you use two or more pages, leave this field empty.

    *   **Generate submenu**—Select whether submenu containing child elements of the selected object (*None* = no submenu; *Category* = subcategories of the selected category; *Page* = child pages of the selected page) should be generated.
    *	**User-defined CSS class**—User-defined CSS class will be added to the menu item, so this will allow to define the menu item with its own CSS style.

.. image:: img/menu_02.png
    :align: center
    :alt: New menu item

*   Click the **Create** button.

=============================
Step 3. Creating a Menu Block
=============================

To display a menu on the storefront you will need to create :doc:`a block <../layouts/blocks/index>` of the **Menu** type.

*   In the Administration panel, go to **Design → Layouts**.
*   Click the **+** button in the necessary container and click **Add block**. 
*   Open the **Create New Block** tab and select **Menu**. 
*   In the opened window specify the **Name** of the block (e.g. *New menu*), select the desired template in the **Template** select box. 
*   Go to the **Content** tab and choose the desired menu from the list. Or create a new one by clicking the **Manage menus** link.
*   Click the **Create** button.
*   Click on the gear icon of the created block and select:

    *	The desired wrapper in the **Wrapper** select box.
    *   Specify the CSS-class in the **User-defined CSS-class** field, if needed.

.. image:: img/new_menu.png
    :align: center
    :alt: New menu

*   Click the **Save** button.

.. toctree::
    :maxdepth: 2
    :hidden:
    :glob:

    *
