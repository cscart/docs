**********************************************
How To: Find out about Rate Calculation Issues
**********************************************

.. note::

    The functionality described in this article first appeared in version 4.8.1.

Realtime shipping methods use servers to calculate shipping rates and return them to your customers. However, what if the third-party server is down? Then CS-Cart won't receive any response or rates, so the shipping method won't appear at checkout. 

This could prevent a customer from making a purchase, especially if the store has no alternative shipping methods, and customers end up having nothing to choose from. Until version 4.8.1, admins could only find out about this issue by receiving a message from a customer or checking the store and going through the checkout process themselves.

Although not all problems can be solved on the store's end, it helps to be informed. That's why CS-Cart & Multi-Vendor 4.8.1 (and newer versions) can send email notifications to admins about such issues. To receive those notifications:

#. Go to :doc:`Settings → Logging </user_guide/settings/logging>` in the administration panel of your store.

#. Find the *Realtime shipping errors* checkbox in the **Requests** section and make sure it is ticked. This checkbox does 2 things: 

   * If the shipping rate calculation service doesn't respond within the allotted time, this will be logged under **Administration → Logs**.

   * If 3 such errors occur with a shipping method within an hour, an email notification about it will be sent to the *Site administrator e-mail address* from **Settings → Company**.

#. Click the **Save** button.
