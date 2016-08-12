******************************
How To: Set up eWAY in CS-Cart
******************************

1. In the administration panel, go to **Administration → Payment methods**.

2. Click the **+** (Add payment method) button on the right.

3. Fill in the form:

   *   Name your new payment method (for example, **eWAY**).

   *   Select **eWAY Direct Payment (Rapid API)** or **eWAY Responsive Shared (Rapid API)** in the **Processor** drop-down menu.

   *   Specify other settings and upload an icon for the payment method.

.. image:: img/eway/eway_name.png
    :align: center
    :alt: Name your payment method and select one of the two eWAY Rapid API processors.

4. Switch to the **Configure** tab and specify the eWAY settings:

   *     API Key and API Password (learn `how to set up a live eWAY API key and password <https://go.eway.io/s/article/How-do-I-setup-my-Live-eWAY-API-Key-and-Password>`_).

   *     if you use **eWAY Direct Payment (Rapid API)**, enter your Encryption Key.

   *     the currency you accept.

   *     if you use **eWAY Responsive Shared (Rapid API)**, choose the Theme and enter Header text.
 
   *     Test/Live mode (choose **Live** for your store).

.. image:: img/eway/eway_configure.png
    :align: center
    :alt: Name your payment method and select one of the two eWAY Rapid API processors.

.. note::

    The Test mode is intended for developers. To use the Test mode, you need an additional account at `eWAY Sandbox <https://sandbox.myeway.com.au/gbc/login.aspx>`_.


5. Click **Create** to save the changes.

.. hint::

    If you have modified an existing payment method, click **Save**. 

