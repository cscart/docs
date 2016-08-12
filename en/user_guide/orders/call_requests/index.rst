*************
Call Requests
*************

In the **Orders → Call requests** section you can see a list of customer call requests.

.. image:: img/call_request.png
    :align: center
    :alt: Call requests

When a customer clicks the **Buy now with 1-click**  link on the product details page and fills in the form, a new order with the **Awaiting call** status is formed in the list of orders. At the same time a call request is generated that can be looked through and managed on this page. If a customer fills in only the **Phone** field, only the call request is created (without an order).

A customer can also click the **Request call** link on the storefront (if the **Call requests** block is added in the **Design → Layouts** section). In this case a call request is created too where the list of products added to a customer's cart is mentioned.

.. important ::

	To allow call requests in your store, activate the `Call requests <http://docs.cs-cart.com/4.4.x/user_guide/addons/call_requests/index.html>`_ add-on in the **Add-ons → Manage add-ons** section. There you can also configure some essential settings that relate to call requests.

For each call request in the list you can see the following information:

*	**ID** - A request identifier as it appears in the Administration panel.
*	**Date** - Date and time when a request was sent.
*	**Name and phone** - Name and phone of a customer who sent a request (as he/she wrote them in a form).
*	**Order/Status** - Order ID as it appears on the **View orders** page and its status.
*	**Responsible** - Here you can choose an administrator responsible for calling a customer.
*	**Status** - Status of a call request. All newly sent requests have the **New** status.

In this list you can also see the requested products for each call request and the convenient time for calling a customer.

To add some notes for a call request, just type them in the **Notes** field.

To change a request status, click on the current status in the **Status** row and choose the required status from the drop-down menu:

*	**New** - A call request was just sent by a customer.
*	**In progress** - An administrator is working on a request.
*	**Completed** - A customer was called to.
*	**No answer** - A customer was called to, but there was no answer.

To delete a call request, hover the mouse pointer over it. You will see a gear button. Click it and choose **Delete**. To delete several requests at once, tick checkboxes to the left of them, click the gear button in the right top corner of the page, and choose **Delete selected**.
