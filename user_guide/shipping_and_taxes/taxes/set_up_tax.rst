********************
How To: Set up a Tax
********************

To set up a tax:

*   In the Administration panel, go to **Administration > Shipping & Taxes > Locations** and :doc:`create locations <../locations/set_location>`.
*   Go to **Administration > Shipping & Taxes > Taxes**.
*   Add a new tax by clicking the **+** button or edit the existing one by clicking on it's name. The **Editing tax page** will open.
*	On the opened page, in the **Rates depend on** field select the address depending on which this tax will be added to the product (*Shipping address* or *Billing address*).
*	Tick the **Price includes tax** option if you want the tax rate to be included in the product price, or untick it if you do not.

.. image:: img/set_tax_01.png
    :align: center
    :alt: Editing tax

*	In the **Tax rates** tab enter desired tax rates.
*	Click the **Save** button.

.. image:: img/set_tax_02.png
    :align: center
    :alt: Tax rates

.. note::

	You can enable the **Display prices with taxes on category/product pages** and **Display prices with taxes on cart/checkout pages** options in the **Settings > Appearance** section.

Apply the tax to products. You are able to apply the tax to all products: 

    Go to **Administration > Shipping & Taxes > Taxes**. On the opened page select the check box next to the name of this tax, click the button with the gear icon, and select **Apply selected taxes to all products**.

.. image:: img/set_tax_03.png
    :align: center
    :alt: Apply tax to all products

.. note::

	If you have several taxes and want to apply these taxes to the product price, they should have the same priority. For example, if the priority of tax A is 1 and the priority of tax B is 2, the tax A will be calculated for the product price and the tax B for the product price with tax A.

or to the certain products:

    Go to **Products > Products**, click on the name of the product to which you would like to add the tax, select the check box of the tax in the **Taxes** option, and click **Save**.

.. note::

	You are able to add taxes for a product using the `import <http://docs.cs-cart.com/4.3.x/user_guide/manage_products/import_export/product_import.html>`_ option. The description of the correct format can be found in the `Imported Fields Format <http://docs.cs-cart.com/4.3.x/user_guide/manage_products/import_export/fields_format.html>`_ article.

To apply the tax to a shipping method:

*   Go to **Administration > Shipping & Taxes > Shipping methods**. Choose the desired shipping method and click on its name.
*   Select the check box of the tax in the **Taxes** option.
*   Click the **Save** button.

.. image:: img/set_tax_04.png
    :align: center
    :alt: Editing shipping method