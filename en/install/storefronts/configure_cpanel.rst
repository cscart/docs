************************************************
How To: Configure Multiple Storefronts in cPanel
************************************************

.. note::

    Here is :doc:`more information about storefronts </user_guide/stores/index>` in CS-Cart and Multi-Vendor. You only need one CS-Cart or Multi-Vendor installation to manage all your storefronts.

This article describes how to create a storefront and configure a hosting account with cPanel to support it. A storefront can be located:

* in a web subdirectory (*example.com/store2*)

* on a subdomain (*store2.example.com*)

* on a different domain (*store2.com*)

.. note::

    We assume that you have already :doc:`installed CS-Cart or Multi-Vendor </install/cpanel>` on the *example.com* website, and its web root directory on the server is */home/account_name/public_html*.

=============================================
Create New Storefront in CS-Cart/Multi-Vendor
=============================================

#. Open the administration panel of your store.

#. Go to **Administration → Stores** (in CS-Cart) or **Administration → Storefronts** (in Multi-Vendor).

#. Click the **+ button**.

#. Fill in the properties of the storefront. **Storefront URL** (without the *http://* prefix) is how your new storefront will be available to customers. There are three variants:

   * A subdirectory: ``example.com/store2``.

   * A subdomain: ``store2.example.com``.

   * A different domain: ``store2.com``.

   .. image:: img/cpanel_storefront_url.png
       :align: center
       :alt: Enter the URL of your storefront in the corresponding field.

   Fields from **Settings: Company** will be displayed to store customers in invoices, etc.

   .. hint::

       If you use CS-Cart, you can also select an existing store in the **Copy existing store configuration** section and tick the checkboxes of the entities (settings, layouts, languages, etc) that you want to copy to the new storefront.

#. Click the **Create** button. The new storefront will be accessible by its URL only after you configure your hosting account.

==============================
Configure Your Hosting Account
==============================

It's time to configure your hosting account in cPanel. Choose one of the following ways, depending on the **Storefront URL** you specified.

----------------------------------------
Way 1. Subdirectory (example.com/store2)
----------------------------------------

If CS-Cart or Multi-Vendor is installed on a website (like *example.com*), and you want the additional storefront to be accessible via a web subdirectory (like *example.com/store2*), you only need to create that storefront in your administration panel. No other actions are required.

When you open *http://example.com/store2* in your browser, you should see the appropriate storefront.

-------------------------------------
Way 2. Subdomain (store2.example.com)
-------------------------------------

#. Open the cPanel of the *example.com* website, if this is where CS-Cart is installed.

#. Click on the **Subdomains** icon in the **Domains** section.

   .. image:: img/subdomains.png
       :align: center
       :alt: Open the Subdomains page in cPanel.

#. Fill in the following fields in the opened section:

   * **Subdomain** - type the name of the subdomain which you wish to create, for example, store2.

   * **Domain** - select the desired domain you wish to create this subdomain for from the drop-down menu on the right of the **Subdomain** input field (in our case, *example.com*).

   * **Document Root** - when you click on this field, it should be filled with a cPanel suggested location automatically.

     Change it to *public_html* (taking into account that the home directory is */home/account_name*), so that the subdomain points to the directory, where CS-Cart is installed (*/home/account_name/public_html*).

   .. image:: img/create_subdomain.png
       :align: center
       :alt: Fill in the form to create a subdomain in cPanel.

#. Click the **Create** button. The new subdomain will be created and displayed in the subdomains table on the page.

   .. image:: img/subdomain_list.png
       :align: center
       :alt: Now you should see the new subdomain on the list.

#. Open the store URL (*http://store2.example.com* in this example) in your browser. You should see the appropriate storefront.

------------------------------------
Way 3. Different Domain (store2.com)
------------------------------------

If CS-Cart or Multi-Vendor is installed on one website (e.g., *example.com*) and its additional storefront should be accessible via a different domain name (e.g., *store2.com*), then the second domain name (*store2.com*) must point to the nameservers of the first website (*example.com*). The second domain name (*store2.com*) must be added as an additional domain to the hosting account of the first website (*example.com*).

Follow the instructions below to set it up:

#. Find out nameservers of *the example.com* domain name (change **example.com** to the domain name of your website, on which CS-Cart is installed). This information can be provided by the domain name registrar or it can be viewed via a network tool, for example, `www.network-tools.com <http://network-tools.com/default.asp?prog=dnsrec&host=example.com>`_.

   .. image:: img/network-tools.png
       :align: center
       :alt: Now you should see the new subdomain on the list.

#. Log in to the registrar account for the *store2.com* domain name and enter new nameservers. If you are unable to change your name server settings, contact your domain registrar's customer service for further assistance.

   .. note::

       Once you have updated your nameservers, allow up to 48 hours for the new information to propagate through the Internet.

#. Now open cPanel of the *example.com* website and click on the Addon Domains icon in the Domains section.

   .. image:: img/addon_domains.png
       :align: center
       :alt: Open the Addon Domains page in cPanel.

#. Fill in the following fields in the opened section:

   * **New Domain Name** - type the name of the domain which nameservers were changed at step 2, for example, *store2.com* (do not enter **'www'** or **'http://'** into the field).

   * **Document Root** - when you click on this field, it should be filled with a cPanel suggested location automatically.

     Change it to *public_html* (taking into account that the home directory is */home/account_name*), so that the different domain points to the directory with CS-Cart installed (*/home/account_name/public_html*).

   .. image:: img/create_addon_domain.png
       :align: center
       :alt: Fill in the form to create a new addon domain.

#. Come up with a password and click the **Add Domain** button. The addon domain will be created and displayed in the table on the page.

   .. image:: img/addon_domain_list.png
       :align: center
       :alt: Your newly created addon domain should appear on the list.

   .. note:: 

       If you receive an error from park wrapper stating that *"the domain is pointed to an IP address that does not appear to use DNS servers associated with this server"*, it may mean that:

       * you have not changed nameservers for *store2.com* properly, or

       * the DNS propagation process is not finished yet. It can take up to 48 hours.

#. Open the store URL (*http://store2.com* in this example) in your browser. You should see the appropriate storefront.
