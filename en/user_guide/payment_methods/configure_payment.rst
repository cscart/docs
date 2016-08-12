**********************************
How To: Configure a Payment Method
**********************************

To configure a payment method, follow these steps:

1. Go to **Administration → Payment methods** to see the list of available payment methods.

2. Click the **gear button** next to the method you need to configure and choose **Edit**.

3. You'll see the form for creating/editing a payment method. Fill it in.

The **General** tab contains basic parameters of the method:

 * **Name**—the name of the payment method as it appears at the checkout.

 * **Store**—the store to which a payment method belongs.

   .. note::

       The **Store** field won't appear if you have only one storefront.

 * **Processor**—the online payment system that will process the payments made through this payment method. Set to *Offline* if this method doesn't involve online processing.

   .. important::

       Before you can accept payments through an online payment system, you need to register an account with this payment system.

 * **Template**—the template to display all the necessary input fields in the customer area of your store. You can select the template only if you set **Processor** to *Offline*.

 * **Payment category**—select a category that the payment method belongs to. Payment categories will appear on the checkout page, if two or more payment methods are assigned to different categories. Categories group payment methods and make it easier for your customers to find the desired payment methods at checkout.

 * **User groups**—the :doc:`user groups <../users/user_groups/index>` that are allowed to use this method.

 * **Description**—brief description of the payment method. This description appears on the checkout page.

 * **Surcharge**—the extra amount of money to be added to the order totals. This can be a flat rate or a percentage. 

   .. note::

       If you specify both a percentage and a flat rate, the percentage will be added first.

 * **Surcharge title**—the title of the surcharge as it appears at the checkout.

 * **Taxes**—select the tax calculation rules that should apply to the surcharge defined above.
		
   .. note::

       To configure the tax calculation rules available in your store, use the **Administration → Shipping & Taxes → Taxes** section.

 * **Payment instructions**—administrator's instructions to customers on the usage of the payment method. The instructions can either be written in plain text, or formatted in HTML. If you are not familiar with HTML, use the built-in WYSIWYG HTML editor to add a formatted description.

 * **Icon**—the icon to depict the payment method on the storefront.

   .. important::

       Icons of the payment methods are displayed in the **Payment icons** block. To see the icons, add this block to the desired page in the **Design → Layouts** section.

The **Configure** tab appears only if you selected an online payment system in the **Processor** field. It contains the settings that are specific to the payment system.

The **Share** tab lists the stores that share this payment method. For more details :doc:`read the article about sharing objects <../stores/sharing>`.

4. Click the **Save** button to apply the changes.
