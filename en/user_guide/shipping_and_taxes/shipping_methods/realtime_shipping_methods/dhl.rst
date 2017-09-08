*****************************
How To: Set up DHL in CS-Cart
*****************************

To configure a shipping method that uses DHL delivery services, follow these steps:

#. Go to **Administration → Shipping & Taxes → Shipping methods**.

#. Create a new shipping method or сlick the existing method to modify it.

   .. hint::

       If you have created a new shipping method and want to hide it until you configure in properly, set the method’s **Status** to *Disabled* on the **General** tab, and click **Save**.

#. Name the shipping method.

#. Set **Rate calculation** to *Realtime*.

#. Select **DHL** in the **Carrier** drop-down menu.

#. Select the desired **Shipping service** (for example, DHL Express Worldwide).

   .. image:: img/dhl_general.png
       :align: center
       :alt: Name your shipping method and choose your Carrier and Shipping service.

#. Switch to the **Configure** tab.

   .. important::

       Switching to other tabs is only available for existing shipping methods, so click **Create** if you don’t see the **Configure** tab.

#. Enter your **Site ID**, **Password** and **Account number**.

#. Define the dimensions and **maximum weight** of the box.

   .. image:: img/dhl_configure.png
       :align: center
       :alt: Specify the DHL-specific settings on the Configure tab.

#. Switch to the **Shipping charges** tab.

#. Define a sum to add to the charges calculated by DHL.

   .. image:: img/dhl_charges.png
       :align: center
       :alt: Specify any additional charges on the Shipping charges tab.

#. Click **Save**.

#. Open the **General** tab.

#. Click the **Calculate shipping cost** link.

#. Enter the desired value into the **Weight (lbs)** input field.

#. Click the **Test** button and check that the calculated shipping cost is correct.

   .. image:: img/dhl_test.png
       :align: center
       :alt: Make a test calculation to make sure the shipping costs are correct.

   .. important::

       DHL uses the currency of the sender’s country to calculate shipping costs. Set your store’s primary currency under **Administration → Currencies → <Desired Currency>** to match the DHL currency determined by **Account number**.
