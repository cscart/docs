****************
Изменение домена
****************

1.  Внесите изменения в файл ``config.local.php`` в основной директории расположения CS-Cart.

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



2.  Пройдите в раздел "Магазины" панели управления CS-Cart и измените домен магазина.

    Панель управления → Администрирование → Магазина

    .. fancybox:: img/change_domain/install_13.png
        :alt: domain

    .. fancybox:: img/change_domain/install_14.png
        :alt: domain

    .. fancybox:: img/change_domain/install_15.png
        :alt: domain

3.  Удалите или переименуйте папку ``/var/cache``, чтобы очистить кэш магазина.
