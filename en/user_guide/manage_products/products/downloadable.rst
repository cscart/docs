************************************
How To: Create Downloadable Products
************************************

To create a downloadable product:

#. In the administration panel, go to **Products → Products**.

#. Click on a product name in the list or add a new product by clicking the **+** button.

#. Tick the **Downloadable** check box in the **Extra** section.

   .. image:: img/downloadable_01.png
       :align: center
       :alt: How to make a product downloadable

   .. important::

       This check box appears when the **Enable selling downloadable products** option is activated in the **Settings → General** section.

#. Tick the **Enable shipping for downloadable products** checkbox if the product has a tangible component and it is required to display a shipping method.

#. Tick the **Time-unlimited download** checkbox if you would like to make the product download always available after purchase.

   .. important::

       If the **Time-unlimited download** checkbox is ticked, the **Download key TTL (for electronically distributed products), hours** setting from **Settings → General** won't affect the product. 

   .. hint::

       The **Download key TTL (for electronically distributed products), hours** setting defines time in hours within which the customer can download the file(s) after the purchase. This period can be prolonged for a certain order on the order details page.

#. Click the **Save** or **Create** button.

#. Switch to the **Files to sell** tab.

#. While on this tab, click the **Add file** button. This will open a special form where you'll be able to upload the necessary files.

   .. note::

       If you need to upload several files and divide them in several groups, use the **Add folder** button to create folders first.

   .. image:: img/downloadable_02.png
       :align: center
       :alt: The Files to sell tab

   .. note::

       The uploaded files are stored in the *var/downloads* directory of your CS-Cart installation.

#. Select one of the following variants in the **Activation mode** drop-down list:

   * **Manually**—allow a customer to download the file after the administrator has allowed it. 

     .. hint::

         Administrators allow downloads on the order editing page (**Orders → View orders → [Click on the order ID]**) on the **Downloads** tab.

   * **Immediately**—allow a customer to download the file immediately after the order is placed.

   * **After full payment**—allow a customer to download the file after the order status changes to **Processed** or **Completed**.

   .. image:: img/downloadable_03.png
       :align: center
       :alt: Activation mode

   The placed order will have a link to the download page containing the name of the file to be downloaded. When the download is permitted/activated, the string with the filename will be converted into a download link, and the customer will receive this link by email.

#. Click the **Create** or **Save** button.
