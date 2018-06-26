********************
GDPR Compliance (EU)
********************

This add-on helps you comply with the GDPR, a European Union regulation on personal data processing. **The add-on by itself doesn't guarantee compliance with the GDPR**; it only gives you the tools to achieve compliance.

.. contents::
   :backlinks: none
   :local:

===================
What Is GDPR About?
===================

The `General Data Protection Regulation <http://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv:OJ.L_.2016.119.01.0001.01.ENG&toc=OJ:L:2016:119:TOC>`_ describes how you can acquire, store, and process personal data of citizens and residents of the European Union. Here are some of the important points of the regulation (with references to the GDPR Articles):

#. In most cases (*Article 6*) you'll need an explicit permission to collect and use someone's personal data. You'll also need proof that such permission was given (*Article 7*).

#. When you collect personal data, you need to inform people who you are, why you need their data, how you'll use it, and more (*Article 13*).

#. People have the right to withdraw their consent at any time (*Article 7*), to request a copy of their personal data (*Article 20*), and "to be forgotten" (*Article 17*).

#. Fines for non-compliance can be up to €20,000,000 or 4% of the company's total worldwide annual turnover (*Article 83*).

#. The regulation applies outside of the European Union as well, as long as you process personal data of EU citizens and residents (*Article 3*).

We don’t claim to have summarized an 80-page law in one article. But as you can see, these points do affect online stores. For example, when a customer gives you an email address for account registration or newsletter subscription, that counts as personal data processing too.

=============================================
How Does the Add-on Help to Comply with GDPR?
=============================================

------------------------
Tools to Ask for Consent
------------------------

* *Optional checkboxes* that can appear in the standard places where personal data is collected (such as checkout, registration, newsletter subscription, etc.).

* *Notices about personal data processing* that appear next to each of the checkboxes mentioned above. The text of each notice can be customized separately.

* *Requesting active consent for cookies* before the customer can enter the site (optional).

  .. image:: img/gdpr-storefront.png
      :align: center
      :alt: A notification about personal data processing on the storefront.

-----------------------------
Tools to Keep Consent History
-----------------------------

* *A separate table in the database* for logging what a person has consented to. That table is called ``cscart_gdpr_user_agreements``. It includes the texts of personal data notices as they were at the time when consent was given. This information can only be viewed in the database directly.

  .. image:: img/gdpr-database.png
      :align: center
      :alt: A table in the database that stores customers' consent for personal data processing.

-----------------------------
Tools to Manage Personal Data
-----------------------------

* *A tab with all the personal data of a customer* that appears on the customer editing page.

* *The ability to export personal data of a customer* to an XML file on request.

* *The ability to anonymize a customer*, replacing all his or her personal data with randomly-generated information on request.

  .. note::

      Customers have to request their personal data or anonymization by sending an email to the address you specify in the notices about personal data processing. However, you can :ref:`make sending a GDRP-related email easier for your customers <gdpr-data-request-buttons>`.

  .. image:: img/gdpr-user.png
      :align: center
      :alt: The personal data of a customer in the admin panel.

========================
Articles in This Section
========================

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:
    
    *

* :doc:`/user_guide/users/customers/gdpr`
