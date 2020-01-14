******************************************************
How To: Export and Import Email Templates and Snippets
******************************************************

.. contents::
   :backlinks: none
   :local:

=================================
Export Email Templates & Snippets
=================================

#. Go to **Administration → Notifications**.

#. Select either **Customer notifications**, or **Administrator notifications** (it doesn't matter which).

#. Scroll down to the end of the page and click **See the full list of email templates**.

#. Click the **gear** button in the upper right part of the page.

#. Choose **Export**. You’ll be offered to download an XML file with all the administrator notifications, customer notifications, and code snippets.

   .. image:: img/export_and_import_email_templates.png
       :align: center
       :alt: Use the gear button on the list of email notifications to export and import them.

=================================
Import Email Templates & Snippets
=================================

#. Go to **Administration → Notifications**.

#. Select either **Customer notifications**, or **Administrator notifications** (it doesn't matter which).

#. Scroll down to the end of the page and click **See the full list of email templates**.

#. Click the **gear** button in the upper right part of the page.

#. Choose **Import**.

#. Depending on the location of the XML file you’d like to import, click one of the 3 buttons:

   * **Local**—browse your local machine and select an XML file to import.

   * **Server**—browse the server, where your CS-Cart/Multi-Vendor is installed, and select an XML file.

   * **URL**—specify the direct link to the XML file.

#. Click **Import**. The email templates and snippets from the XML file will be imported to your store.

   .. image:: img/select_xml.png
       :align: center
       :alt: Choosing the XML file to import.

=====
Notes
=====

* All email templates and snippets are exported and imported together in one XML file.

* An imported snippet will overwrite a snippet that exists in your store, if both snippets have the same ``<code>``. The same goes for email templates.

* If you change the ``<code>`` of an email template in the XML file manually and then import that file, a new template will be created. This template will appear on the list in the Administration panel. However, it won’t be used anywhere, unless you have an add-on that sends this new notification.
