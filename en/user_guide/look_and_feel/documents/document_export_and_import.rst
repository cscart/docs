***********************************
How To: Export and Import Documents
***********************************

.. contents::
   :backlinks: none
   :local:

================
Export Documents
================

#. Go to **Administration → Notifications → Documents**.

#. Tick the checkboxes next to the documents you want to export.

#. Click the **gear** button in the top right corner of the page.

#. Choose **Export selected**. You’ll be offered to download an XML file with all the selected documents and their snippets.

   .. image:: img/document_export_and_import.png
       :align: center
       :alt: Use the gear button to export and import documents.

================
Import Documents
================

#. Go to **Administration → Notifications → Documents**.

#. Click the **gear** button in the top right corner of the page.

#. Choose **Import**.

#. Depending on the location of the XML file you’d like to import, click one of the 3 buttons:

   * **Local**—browse your local machine and select an XML file to import.

   * **Server**—browse the server, where your CS-Cart/Multi-Vendor is installed, and select an XML file.

   * **URL**—specify the direct link to the XML file.

#. Click **Import**. The documents and snippets from the XML file will be imported to your store.

   .. image:: img/select_xml.png
       :align: center
       :alt: Choosing the XML file to import.

=====
Notes
=====

* All the snippets of a document are exported along with the document in the same XML file.

* An imported snippet will overwrite a snippet that exists in your store, if both snippets have the same ``<code>``. The same goes for documents.

* If you change the ``<code>`` of an document in the XML file manually and then import that file, a new document will be created. This document will appear on the list in the Administration panel, but won’t be used anywhere, unless you have an add-on that uses that document.

  If you export an invoice or order summary and create a new document based on either of them, you can later attach that document as a PDF file to your :doc:`email notifications <../email_templates/index>` about order status changes.
