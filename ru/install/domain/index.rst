****************
Изменение домена
****************

#. Внесите изменения в файл ``config.local.php`` в основной директории CS-Cart.

   .. list-table::
       :stub-columns: 1
       :widths: 10 30

       *   -   Было
           -   .. code:: php

                   $config['http_host'] = 'старый_домен';
                   $config['http_path'] = '';

                   $config['https_host'] = 'старый_домен';
                   $config['https_path'] = '';

       *   -   Стало
           -   .. code:: php

                   $config['http_host'] = 'новый_домен';
                   $config['http_path'] = '';

                   $config['https_host'] = 'новый_домен';
                   $config['https_path'] = '';


#. Если вы используете CS-Cart (а не Multi-Vendor):

   * перейдите в раздел **Администрирование → Магазины** в панели администратора CS-Cart;

   * нажмите на название витрины, чтобы открыть её настройки;

   * измените домен в настройках витрины.

     .. fancybox:: img/change_domain/install_13.png
         :alt: Переход в раздел "Магазины".

     .. fancybox:: img/change_domain/install_14.png
         :alt: Выбор нужного магазина.

     .. fancybox:: img/change_domain/install_15.png
         :alt: Смена домена у магазина.

#. Удалите или переименуйте папку ``/var/cache``, чтобы очистить кэш магазина.
