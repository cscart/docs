**************
Tax Attributes
**************

General
*******

*	**Name** – Name of the tax as it appears on the storefront.
*	**Registration number** – Internal registration number of the tax calculation rule in the store.
*	**Priority** – Position of this tax calculation rule in a sequence of multiple tax calculation rules being applied to a product or a shipping method.

.. note::

	If two rules have the same priority, they are applied in the same order as they are retrieved from the database. In this situation, the correct sequence may be breached. So, it is highly recommended that you set priority of every tax calculation rule in the store.

*	**Rates depend on** – Type of customers' addresses that the calculation rule depends on: shipping address or billing address.
*	**Status** – Status of the tax calculation rule in the store: *Active* or *Disabled*.
*	**Price includes tax** – If selected, the tax represented by this rule will be already included in the product price specified on the product details page. Otherwise, the calculated tax will be added to the order subtotal when a customer places the order.

Tax rates
*********

*	**Location** – Location of the customer who places the order. To adjust the available locations, use the controls in **Administration → Shipping & Taxes → Locations**.
*	**Rate value** – Tax calculation rate that is specific to the given location. When the value is set to zero (0), the tax will not apply to the order if it has been placed by a customer whose address falls within the corresponding location.

.. note::

	Locations do not override each other. So, the value specified for the hard-coded default location (*all countries*) will apply only if a customer comes from a location which is not defined or activated in **Administration → Shipping & Taxes → Locations**, but will never apply to active locations, even those with zero values.
	
*	Type – Type of the tax: absolute value in the primary currency that you can manage in the **Administration → Currencies** section, or a percentage of the product cost.