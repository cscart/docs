**************************************************************
A Script Embedded into a Page Displays After All Other Content
**************************************************************

You may have a problem that scripts embedded into any part of a page display after all other content.

For example, here a map appears at the very bottom of a page:

.. image:: img/embed_script_00.png
    :align: center
    :alt: Wrong script display

To solve this problem, do the following:

1.   In the Administration panel of your store, open the page editing section. **Website → Content → Free returns** in our example.
2.   In the **Description** field switch to **HTML** (**<>** icon).
3.   Add your script to desired part of the code, adding the ``data-no-defer`` parameter to it.

    For example, this is what we had:

    *<script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=y4oQZZZO4ztyCCS4z0emVSlKODDnz3Gp&width=600&height=450">*
    
    And this is what it should look like:

    *<script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=y4oQZZZO4ztyCCS4z0emVSlKODDnz3Gp&width=600&height=450" data-no-defer>*

.. image:: img/embed_script_02.png
    :align: center
    :alt: Description

4.   Save the changes

That is how this page looks like now:

.. image:: img/embed_script_03.png
    :align: center
    :alt: Normal script display
