*****************************
How To: Set up DHL in CS-Cart
*****************************

To configure a shipping method that uses DHL delivery services, follow these steps:

#. Go to **Administration → Shipping & Taxes → Shipping methods**.

#. :doc:`Create a new shipping method </user_guide/shipping_and_taxes/shipping_methods/add_shipping_method>` or сlick the existing method to modify it.

   .. hint::

       If you have created a new shipping method and want to hide it until you configure in properly, set the method’s **Status** to *Disabled* on the **General** tab, and click **Save**.

#. Specify the :doc:`shipping method properties </user_guide/shipping_and_taxes/shipping_methods/shipping_method_attributes>`:

   * On the **General** tab:
   
     * **Name**—enter the sshipping method name, which a customer will see on the checkout page; for example, *DHL*.
     
     * **Rate calculation**—set to *Realtime*.
     
     * **Carrier**—select *DHL*.
     
     * **Shipping service**—select the desired shipping service, for example, *DHL Express Worldwide*.
     
       .. image:: img/dhl_general.png
           :align: center
           :alt: Name your shipping method and choose your Carrier and Shipping service.

   * On the **Configure** tab:
   
     * **Site ID**—enter your DHL ID.
     
     * **Password**—enter the password for your DHL account.
     
     * **Account number**—enter your DHL account number.
     
     * **Account country**—specify the country of your DHL account.
     
     * **Test mode**—you can tick this checkbox if you would like to test the shipping method without actually shipping products.
     
     * **System of measurement**—choose the system of measurement you want to use for DHL shipping method:
     
       * *Imperial (in, lb)*
       
       * *Metric (cm, kg)*
     
     * **Max box weight**—specify the maximum weight of the box.
     
     * **Package length/width/height**—define the dimensions of the box.
 
       .. image:: img/dhl_configure.png
           :align: center
           :alt: Specify the DHL-specific settings on the Configure tab.

#. Switch to the **Shipping time and rates** tab. Specify the rate areas, where you want to offer the shipping method.

#. Go to the **Test rate calculation** tab. Click the **Recalculate rates** button to calculate the shipping cost. The calculation is based on the weight value, that you specify on the **General** tab, and on the :doc:`default customer and company adresses </user_guide/shipping_and_taxes/address>`.
       
   .. note::
   
       If the shipping method is not configured properly, an error will occur. You can read more about what can cause an error in :doc:`this article </user_guide/shipping_and_taxes/shipping_methods/test_button_error>`.

#. Click **Save**.

   .. important::

       DHL uses the currency of the sender’s country to calculate shipping costs. Set your store’s primary currency under **Administration → Currencies** to match the DHL currency determined by **Account number**.
