*********************************
If Document Editor Doesn't Appear
*********************************

If you don’t see **Documents** when you go to **Administration → Notifications** menu, the editor is probably disabled. This can happen if you upgrade from the versions of CS-Cart/Multi-Vendor earlier than 4.4.1 via the Upgrade Center. We didn't enable the editor automatically in existing installations to preserve maximum compatibility with the third-party add-on you might have.

To enable the editor, follow these steps:

#. Go to **Settings → Appearance**.

#. Find the **Email templates mode** setting.

#. Choose *New (nice and editable from the admin panel)* from the dropdown list.

#. Click **Save** in the top right corner of the page.

.. important::

    Once you do this, the settings that concern email notifications will disappear from **Administration → Statuses → Order statuses**. You’ll be able to manage email notifications about order status changes under **Administration → Notifications**.

.. image:: img/template_mode.png
    :align: center
    :alt: The "Email template mode" setting.

.. meta::
   :description: What should I do if I don't see document editor in CS-Cart or Multi-Vendor ecommerce platform?
