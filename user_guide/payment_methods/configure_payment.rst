**********************************
How To: Configure a Payment Method
**********************************

To configure a payment method:

*	Go to **Administration > Payment methods**.
	This displays a list of the available payment methods.
*	Click the gear button corresponding to the name of the method you need to configure and choose **Edit**.
	This opens a form for creating/editing a payment method.
*	Complete the form.

	The **General** tab contains basic parameters of the method:

	*	**Name** - Name of the payment method as it appears at the checkout.
	*	**Store** - Store to which a payment method belongs.
	*	**Processor** - Online payment system that will process the payments, made through this payment method. Leave *Offline* if this method does not involve online processing.

	.. important::

		To accept payments through an online payment system, first you need to register an account with this payment system.

	*	**Template** - Template to display all necessary input fields on the customer storefront. It is active only if you have selected to use an offline payment system.
	*	**Payment category** - Select a category that the payment method will be attributed to. Payment categories appear on the checkout page if two or more payment methods are assigned to different categories. Categories basically group payment methods. This makes it easier for your customers to choose their preferable payment methods at checkout.
	*	**User groups** (requires commercial license) - `User groups <http://www.cs-cart.com/documentation/reference_guide/index.htmld?users_user_groups.htm>`_ whose members can use the method.
	*	**Description** - Short description of the payment method that appears on the checkout page.
	*	**Surcharge** - Extra amount of money to be added to the order totals. This can be a flat rate or a percentage. If you specify both a percentage and a flat rate, the percentage is added first.
	*	**Surcharge title** - Title of the surcharge as it appears at the checkout.
	*	**Taxes** - Select tax calculation rules that should apply to the surcharge defined above.
		To configure the available tax calculation rules in the store, use the **Administration > Shipping & Taxes > Taxes** section.
	*	**Payment instructions** - Administrator's instructions to customers on the usage of the payment method.
		The instructions can be either a plain text or a formatted HTML text. If you are not familiar with HTML, you are encouraged to add a formatted description using the built-in WYSIWYG HTML editor.
	*	**Icon** - Icon to depict the payment method on the storefront.

	.. important::

		Icons that you upload (or refer to) here are displayed in a special block having *Payment methods* specified as the block content. Remember to create such a block in **Design > Layouts**.

	The **Configure** tab appears only if you have selected to use an online payment system. It contains the settings that are specific to the payment system.

	**Share** tab:

	Stores that share this payment method. Read `Sharing objects <http://www.cs-cart.com/documentation/reference_guide/index.htmld?store_sharing_options.htm>`_ for more details.

*	Click the **Save** button to apply the changes.