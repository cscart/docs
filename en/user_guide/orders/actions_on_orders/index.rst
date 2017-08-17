*****************
Actions on Orders
*****************

The **Orders** section of the Administration panel is used to manage and control order procedures in your store. Here you can review and edit orders, place new orders on behalf of other users, handle return requests, manage call requests, etc.

===============
Order Numbering
===============

Order IDs are sequential (for example, Order #1, Order #2, Order #3), regardless of the statuses of those orders. However, you can configure CS-Cart to track successful and returned orders separately by assigning additional IDs to them. To do this :doc:`specify the "Invoice/Credit memo" setting for order statuses </user_guide/orders/order_statuses/set_status>`.

Each status can have one of the following values for this setting:

* **Default**—the default value; the invoice can be viewed, but the invoice ID is not generated.

* **Order**—the order has been placed, but hasn't been paid yet.

* **Invoice**—the order has been paid and processed successfully; an invoice ID is generated.

* **Credit memo**—the order was paid and processed, but then got returned; a credit memo ID is generated.

If you configure the statuses, then invoice IDs and credit memo IDs will be generated sequentially for the orders that get this status:


.. list-table::
	:header-rows: 1
	:stub-columns: 0
	:widths: 10 10 10 10

	*   -   Order ID
	    -   Order Status
	    -   Invoice ID
	    -   Credit Memo ID
	*   -   0005
	    -   Complete
	    -   0001
	    -   -
	*   -   0006
	    -   Incomplete
	    -   -
	    -   -
	*   -   0007
	    -   Canceled
	    -   -
	    -   0001
	*   -   0008
	    -   Complete
	    -   0002
	    -   -

.. note::

    To view the orders were placed in a particular store only, switch to the store administrator's mode. To learn more, read an article about :doc:`multiple storefronts in CS-Cart </user_guide/stores/index>`.

===============
In This Section
===============

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    *
