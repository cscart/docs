*********************************
The Reward Points Add-on Settings
*********************************

To manage the following settings, go to **Add-ons → Manage add-ons** and click on the name of the **Reward Points** add-on.

* **Points Exchange Rate (PER)**—the global exchange rate to convert monetary product price to a price in points. The value you enter here is the number of points to cover one monetary unit (such as $1, €1, or £1) of the primary currency of your store.

  .. note::

      For example, with the exchange rate of 10 and the product cost of $50, the product's worth in points is 500 points (50*10).
	
* **"Price in points" is calculated automatically on PER basis**—if you enable this setting, the price of products in points will be calculated automatically based on the global exchange rate.

* **"Price in points" is recalculated taking into account discounts**—if you enable this setting, the price of products in points will be recalculated in accordance with the applied discounts.

* **"Points" is recalculated taking into account discounts**—if you enable this setting, the amount of granted reward points will be recalculated in accordance with the applied discounts.

* **"Price in points" is recalculated taking into account order discounts**—if you enable this setting, the price of products in points will be recalculated in accordance with the discounts applied to the order.

* **"Points" is recalculated taking into account order discounts**—if you enable this setting, the amount of granted reward points will be recalculated in accordance with the discounts applied to the order.

* **If the product and the product category do not have defined reward points but the higher level category has such reward points, extract data from it**—if you enable this setting, categories and products with no specified reward point data will inherit that data from a higher level category.

* **If several reward points can be applied, set**—the rule of handling multiple bonuses. Select whether to give a minimum or maximum bonus when multiple bonuses can be applied.

* **Apply zero reward point values**—if you enable this setting, and some of the reward point rules (:doc:`for orders </user_guide/addons/reward_points/order_auto>`, :doc:`for products </user_guide/addons/reward_points/products_auto>`, or :doc:`for categories </user_guide/addons/reward_points/category_auto>`) have *0* specified for a user group, then these rules will apply, and the members of the user group will not get reward points. 

  Otherwise, one of the other rules will apply to this user group, and its members will receive reward points according to the rule.

* **Log lines per page**—the number of records from the log to be displayed on a single page of the reward point log.
