******************************************************************
How To: View, Export, or Anonymize Customer's Personal Data (GDPR)
******************************************************************

.. note::

    The functionality described in this article is a part of the :doc:`GDPR Compliance (EU) </user_guide/addons/gdpr/index>` add-on that first appeared in CS-Cart and Multi-Vendor 4.7.4.

Customers can request their personal data in the XML format or anonymization of the said data by contacting you. For example, they can use the email address you provide in your Privacy Policy or in the notices about personal data processing. Here's how an administrator can work with personal data:

#. In the Administration panel, go to **Customers → Customers**.

#. Click on the name of the customer whose data you'd like to work with.

#. The customer editing page will open. Switch to the **GDPR user data** tab.

   .. image:: /user_guide/addons/gdpr/img/gdpr-user.png
       :align: center
       :alt: The personal data of a customer in the admin panel.

#. On this tab, you'll be able to:

   * *View the personal data of the customer* collected from various sources in your store (such as comments and reviews, orders, newsletter subscriptions, etc.).

   * *Export the personal data as an XML file* by clicking the **Export to XML** button.

   * *Anonymize the customer* by clicking the **Anonymize** button. This action will randomly generate personal data for the selected customer and replace the actual data with it in all the listed sources. For example, that way the order history will still be there, but the customer's actual personal data won't be. 

     Please note that **anonymization will also affect** the ``cscart_gdpr_user_agreements`` table that stores the logs of consent for personal data processing given by customers. However, **anonymization will not affect:**

     * Any backups of your store that you might have. The backups you made with CS-Cart's built-in mechanisms are located under **Administration → Backup/Restore**. If necessary, secure them and delete them afterwards.

     * The CS-Cart/Multi-Vendor logs located under **Administration → Logs**. If necessary, clear these logs by using the gear button.

     * Any other places where you may be collecting the data (for example, server logs, forms, integrations with third-party services, etc.).

     .. warning::

         Anonymization can't be undone, unless you return your database to a previous state by restoring it from a backup you made earlier.
