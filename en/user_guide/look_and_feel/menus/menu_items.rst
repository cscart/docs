*************************
How To: Manage Menu Items
*************************

To manage the content of the menu:

*	In the Administration panel, go to **Design → Menus** and click the **gear** button of the desired menu.
*	Choose **Manage items** from the drop down list.

.. image:: img/items_for_menu.png
    :align: center
    :alt: Menu items

Here you can edit or delete each item (the **gear** button), or add new items to the list with the **+** button.

To edit or add the item, fill in the form with the following attributes:

    *   **Parent item** - Select the necessary parent level.
    *   **Name** - Type the name of your item (e.g. *New Item*).
    *   **Pos.** - Specify the link position.
    *   **URL** - Enter the URL of the page which will open when the link is clicked on (e.g. *index.php?dispatch=categories.catalog*).
    *   **Activate menu item for dispatch** - Specify the pages on which to display the tab as active (e.g. *sitemap.view*).

        .. note ::

        	If you use two or more pages, leave this field empty.

    *   **Generate submenu** - Select whether submenu containing child elements of the selected object (*None* = no submenu; *Category* = subcategories of the selected category; *Page* = child pages of the selected page) should be generated.
    *	**User-defined CSS class** - User-defined CSS class will be added to the menu item, so this will allow to define the menu item with its own CSS style.