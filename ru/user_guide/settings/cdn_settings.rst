*****************************************
Настройки системы доставки контента (CDN)
*****************************************

.. important::

	Версии 4.10.1 и 4.10.2 используют Amazon SDK, который перестал работать 6 июня 2019 года. Мы обновили Amazon SDK в версии CS-Cart 4.10.3. Для того, чтобы использовать CDN, обновитесь до последней версии.


**CDN** расшифровывается как `Content Delivery Network <https://ru.wikipedia.org/wiki/Content_Delivery_Network>`_. Настройки CDN задаются в разделе **Администрирование → Настройки контента → Настройки системы доставки контента (CDN)**. В качестве CDN используется `Amazon CloudFront <http://aws.amazon.com/cloudfront/>`_.

* **Ключ** — ключ для идентификации, который вы получите после регистрации на `aws.amazon.com <http://aws.amazon.com/cloudfront/>`_.

* **Секретный ключ** — секретный ключ, который вы получите после регистрации на `aws.amazon.com <http://aws.amazon.com/cloudfront/>`_.

  .. note::

      В документации Amazon более подробно описан `процесс получения ключей <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html>`_.

  .. important::

      Если в магазине используется HTTPS (не важно, в панели администратора или на витрине), то нужно загрузить SSL-сертификат для этого доменного имени в CloudFront. В документации Amazon есть `больше информации <http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html#cnames-and-https-procedure>`_.

  .. fancybox:: img/cdn_settings.png
      :alt: Задайте настройки CDN, чтобы использовать Amazon CloudFront.
