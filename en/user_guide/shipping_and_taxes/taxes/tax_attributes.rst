**************
Tax Properties
**************

=======
General
=======

* **Name**—the name of the tax as it appears on the storefront.

* **Registration number**—the internal registration number of the tax in the store.

* **Priority**—the position of this tax relative to other taxes. It determines the order in which taxes are applied to a product or to a shipping method.

* **Rates depend on**—the type of address by which the tax rate is determined; it can either be the shipping address or billing address.

* **Status**—the status of the tax: *Active* or *Disabled*.

* **Price includes tax**—if you tick the checkbox, it will be assumed that you specified the prices of products with this tax already included. Otherwise, the tax will be added to the order subtotal when a customer places an order.

=========
Tax Rates
=========

* **Location**—the :doc:`location </user_guide/shipping_and_taxes/locations/index>` of the customer who places the order.

* **Rate value**—the tax rate for the given location. If the tax rate is set to *0* (zero) for a location, then the tax won't apply to the order placed by customer who specified the address matching that location.

  .. important::

      The hard-coded location called **Default destination (all countries)** will apply only if the customer's address doesn't fall under any active location; it never applies to active locations, even if they have zero rate values.
	
* **Type**—the type of the tax: absolute value in the primary currency, or a percentage of the product cost.
