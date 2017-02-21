**************************************************************
How To: Make Shipping Cost Dependent on Order Total and Weight
**************************************************************

To set up a shipping cost depending on order total and weight:

*   In the Administration panel, go to **Administration → Shipping & Taxes → Shipping methods**.
*   :doc:`Create a new shipping method <../manual_shipping_methods/set_manual_shipping>` or choose the existing one.
*   Click on the name of this shipping method. The **Editing shipping method** page will open.
*   On that page open the **Shipping charges** tab.
*   Select the desired location in the **Show rates for location** box.
*   In the **Cost dependencies** section in the first row enter 0 (for instance) into the **More than** input field and a shipping rate (e.g. 25) into the input field next to it.
*   In the following row enter the total amount (e.g. 50) after which you would like to change the shipping cost into the **More than** input field and different shipping rate (e.g. 20) into the input field next to it.
*   You are able to specify as many intervals as you like.
*   Click the **Create/Save** button.
*   In the **Weight dependencies** section in the first row enter 0 (for instance) into the **More than** input field and a shipping cost (e.g. 2) into the input field next to it.
*   In the following row enter the total amount (e.g. 100) after which you would like to change the shipping cost into the **More than** input field and different shipping cost (e.g. 3) into the input field next to it.

.. note::

	In this case the shipping cost will be a shipping rate of the **Cost dependencies** section plus a shipping rate of the **Weight dependencies** section. For instance, if the order total is between $0 and $50 and the order weight is less than 100 lbs, the shipping cost will be $25 + $2, if the order total is between $0 and $50 and the order weight is more than 100 lbs, the shipping cost will be $25 + $3, if the order total exceeds $50 and the order weight is less than 100 lbs, the shipping cost will be $20 + $2 and if the order total exceeds $50 and the order weight is more than 100 lbs, the shipping cost will be $20 + $3.

*   Click the **Create** button.

.. image:: img/cost_and_weight.png
    :align: center
    :alt: Editing shipping method

.. important::

	You should set up the desired product weight in the **Weight** field on the product details page of your Administration panel.