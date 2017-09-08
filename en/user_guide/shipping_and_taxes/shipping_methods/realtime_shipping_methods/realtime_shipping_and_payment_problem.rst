*************************************************
Problem with Realtime Shipping or Payment Methods
*************************************************

Most of realtime shipping services (UPS, FedEx) and payment processors (PayPal, Google Checkout, AuthorizeNet.Aim, etc.) require **PHP Curl** support on your server. If your realtime shipping method does not pass shipping rates from the shipping service server, or orders get the **Failed** status after they are paid using a payment processor, it may be caused by a problem with the **CURL** PHP extension on your server.

#. :doc:`Check whether PHP CURL support is enabled on your server <../../../../install/useful_info/curl_support>`.

#. If PHP **Curl** extension is installed on your server, but real-time shipping services do not work, the problem is likely caused by the fact that the server uses proxy. If that is the case, follow the instructions below:

   * In the Administration panel, go to **Settings → General**.

   * Enter your proxy settings to the appropriate fields in the **Proxy settings** section. 

   * Click the **Save** button.

   .. hint:: 

       If your hosting provider is **GoDaddy**, enter the following parameters:

       **Proxy host**: 64.202.165.130

       **Proxy port**: 3128

       **Proxy user**: *leave blank*

       **Proxy password**: *leave blank*
