******************************
Options and Inventory Tracking
******************************

Respectively to Inventory there are two types of products:

* **option dependent**—for example, trainers physically depend on options (size), which means that different options—different things.

* **option independent**—a gift can be tied with a band or not, which means that the gift stays the same irrespectively of the band.

For the option dependent products there is a setting named **Inventory**.

This setting has three values: 

* **Do not track**—the storage tracking for this product is not required.

* **Track without options**—it is used if the product is option independent.

  The product quantity is specified in the **In stock** field. When selecting options this quantity is used. Selecting options for the product with individual combinations will result in changes in images but it won't affect the product codes.

* **Track with options**—the quantity of the product depends on the quantity of combinations.

  **In stock** field becomes unavailable and is replaced by the link that redirects to the combinations page. On the storefront when the specific combination is selected the product code is replaced by the combination code (if the code is not specified it will be left as is). The product images are replaced by the combination images. The quantity is specified for each combination separately. 


.. note::

    To make an option a part of the combination you will need to tick the **Inventory** checkbox on the option settings page.

======================
Low Stock Notification
======================

After the purchase was made the quantity of a product is decreased by the number of products bought.

If the number of products is not enough to supply a purchase, the order status will change to **Backordered** and the number of products will return to initial value.

The number left might be lower than set up in the **Low stock notification threshold** setting located in **Settings → General**. In this case the administrator receives an email notifying that a certain product is almost out of stock. Also the email contains the name of the product, its code, and the number products left.

The number sent depends on the **Inventory** setting. If **track with options** is enabled, then the quantity of a certain combination is sent, otherwise—the quantity of the product itself. 
  
