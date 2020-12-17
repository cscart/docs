************
CDN Settings
************

**CDN** stands for `Content Delivery Network <https://en.wikipedia.org/wiki/Content_delivery_network>`_. You can specify CDN parameters under **Administration → Storage → CDN settings**. The CDN used is `Amazon CloudFront <http://aws.amazon.com/cloudfront/>`_.

* **Key**—the identification key you get after registering at `aws.amazon.com <http://aws.amazon.com/cloudfront/>`_.

* **Secret key**—the secure key given to you after registering at `aws.amazon.com <http://aws.amazon.com/cloudfront/>`_.

  .. note::

      The Amazon Web Services documentation contains `more information about getting the key and secret key <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html>`_.

  .. important::

      If you use secure connection in your store (either in the administration panel or on the storefront), you also should upload the SSL certificate for this domain name to Amazon Cloudfront. The Amazon Web Services documentation contains `more information <http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html#cnames-and-https-procedure>`_.

  .. image:: img/cdn_settings.png
      :align: center
      :alt: Specify the CDN settings to use Amazon CloudFront.
