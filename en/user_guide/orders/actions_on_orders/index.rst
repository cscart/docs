*****************
Actions on Orders
*****************

The **Orders** section of the Administration panel is used to manage and control order procedures in your store. Here you can review and edit orders, place new orders on behalf of other users, handle return requests, manage call requests, etc.

For accounting purposes, orders have continuous ID numbers disregarding their current state and number. At that, CS-Cart keeps track of successful and returned orders assigning them separate IDs.

That is how it works. All orders can be one of the three conditions:

*	**Order** - The order has been placed, but not paid out.
*	**Invoice** - The order has been paid and processed successfully.
*	**Credit memo** - The order has been paid and processed, but then returned.

So, invoice IDs and credit memo IDs are generated continuously for the appropriate orders only:


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

	To list orders that has been placed in a particular store only, switch to the store administrator's mode. For details, see `Understanding multi-store functionality <http://docs.cs-cart.com/4.4.x/user_guide/stores/index.html>`_ (for CS-Cart users).

In this section
***************

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    *
