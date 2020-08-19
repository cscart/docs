********************************************************
How To: Disable Email Notifications about Order Statuses
********************************************************

CS-Cart and Multi-Vendor can send email notifications when an order gets a certain status. These notifications can be sent to:

* the email addresses of customers;

* the orders department of your store.

.. hint::

    The email address of the orders department is specified in the Administration panel under **Settings → Company**.

Let's assume that we want to keep sending email notifications about order status changes to customers, but disable those notifications for the orders department. There are two ways to do this, depending on whether or not :doc:`the email template editor is enabled </user_guide/look_and_feel/email_templates/enable_email_editor>`.

=====================================
When Email Template Editor Is Enabled
=====================================

#. Go to **Administration → Notifications → Administrator notifications**.

#. Disable notifications for the specific statuses there.

   .. image:: img/disable_status_notification.png
       :align: center
       :alt: Disabling an email notification about a certain order status.

   .. note::

       If necessary, you can disable specific email notifications for customers as well. This is done in **Customer notifications**.

======================================
When Email Template Editor is Disabled
======================================

#. In the Administration panel, go to **Administration → Statuses → Order statuses**.

#. Click on the order status to edit it.

#. Untick the **Notify orders department** checkbox.

#. Click the **Save** button to apply the changes.

#. Repeat steps from 2 to 4 for all statuses which shouldn't send an email notification to administrators.

   .. image:: img/notifications.png
       :align: center
       :alt: Unticking the "Notify orders department" checkbox.

.. meta::
   :description: How to disable notifications to admins and customers about order statuses in CS-Cart and Multi-Vendor ecommerce software?
