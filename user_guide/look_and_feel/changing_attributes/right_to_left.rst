********************************************
How To: Set the Right-to-left Text Direction
********************************************

In some cases, for example, when you use the Arabic Language, you will need to place your text from right to left. To do it, use the **Right-to-Left** add-on.

=============================
Step 1. Installing the Add-on
=============================

To get and install this add-on, do the following:

1. Download the Right-to-Left add-on archive using `this link <https://github.com/cscart/addon-rtl-text-layout/archive/master.zip>`_.

.. note::

    If you want to check the add-on code, please, visit `the add-on page on GitHub <https://github.com/cscart/addon-rtl-text-layout>`_.

2. Log in to the Administration panel of your store.

3. Go to **Add-ons → Manage add-ons**.

4. Сlick the **+** button to upload the add-on.

.. image:: img/addons_plus_button.png
    :align: center
    :alt: Add-ons plus button

5. In the pop-up window click **Local**, and choose the add-on archive.

6. Click **Upload & install**.

.. image:: img/upload_and_install_addon.png
    :align: center
    :alt: Upload and install pop-up

The Right-to-Left add-on has been installed.

.. image:: img/right_to_left_01.png
    :align: center
    :alt: the Right-to-Left add-on

=============================
Step 2. Setting up a Language
=============================

To set the right-to-left text direction you will need to make some changes in the code of the installed add-on.

.. note::

    The add-on is designed for the Responsive theme, which is the default theme of CS-Cart and Multi-Vendor.

1. Open the **html_tag.pre.tpl** file located in the *design/themes/responsive/templates/addons/rtl_text_layout/hooks/index*.

2. Replace ``[YOUR_LANGUAGE_CODE]`` with the language code for which the right-to-left text direction should be active.

.. image:: img/right_to_left_02.png
    :align: center
    :alt: Language codes

3. Click **Save changes**.

The Right-to-Left add-on is ready for work.

.. important ::

	The right-to-left text direction will not be active on all the pages and not for all text content, it will work only for the base text content and only in case a customer selects the language in the storefront, which is written in the **html_tag.pre.tpl** file.

	In order to make the full right-to-left language direction support on your site, some additional code modifications will be required. You can find more info `here <http://codex.wordpress.org/Right_to_Left_Language_Support>`_ or order our Custom Development service.
