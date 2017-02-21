"Кратко и по делу"
------------------

Для профессионалов и системных администраторов

Установка на Linux
==================

1.  Скачайте последнюю версию CS-Cart или Multi-Vendor на сайте `www.cs-cart.ru <https://www.cs-cart.ru/download.html>`_.

2.  Распакуйте архив на сервере (в любую удобную вам директорию).

3.  Установите права на файлы и папки:

    .. list-table::
        :stub-columns: 1
        :widths: 10 30

        *   -   777
            -   На следующие папки и их содержимое:

                *   var/
                *   design/
                *   images/

        *   -   666
            -   config.local.php

    Установка прав в terminal:

    .. code::

        chmod 666 config.local.php
        chmod -R 777 design images var
        find design -type f -print0 | xargs -0 chmod 666
        find images -type f -print0 | xargs -0 chmod 666
        find var -type f -print0 | xargs -0 chmod 666

    Может потребоваться:

    .. code::
 
        chmod 644 design/.htaccess images/.htaccess var/.htaccess var/themes_repository/.htaccess
        chmod 644 design/index.php images/index.php var/index.php var/themes_repository/index.php


4.  Запустите установку в браузере по адресу вашей директории.

    Инструкция: :doc:`Установка в браузере </manager/install/process/index>`

5.  Выполните ":doc:`Три шага к повышению безопасности </manager/install/secure/index>`"


Перенос или копия магазина
==========================

1. Сделайте копию базы данных MySQL.

2. Сделайте копию всех файлов интернет-магазина в другую папку или перенесите на другой сервер.

3. Внесите изменения в файл ``config.local.php``

    .. list-table::
        :stub-columns: 1
        :widths: 10 30

        *   -   Изменение
            -   Строки в config.local.php

        *   -   Измените данные доступа к MySQl
            -   .. code:: php

                    $config['db_host'] = 'localhost';
                    $config['db_name'] = 'my_db';
                    $config['db_user'] = 'root';
                    $config['db_password'] = 'password';

        *   -   Измените пути к расположению файлов магазина
            -   .. code:: php

                    $config['http_host'] = 'localhost';
                    $config['http_path'] = '/new_shop';

                    $config['https_host'] = 'localhost';
                    $config['https_path'] = '/new_shop';

5. Проверьте права.

6. Очистите кэш, удалив или переименовав папку ``/var/cache``.

7. Запустите магазин по новому адресу.

8. Пройдите в раздел "Магазины" панели управления CS-Cart и измените домен витрины.

Установка из консоли
====================

1.  Скачайте последнюю версию CS-Cart или Multi-Vendor на сайте `www.cs-cart.ru <https://www.cs-cart.ru/download.html>`_.

2.  Распакуйте архив на сервере.

3.  Установите необходимые права на файлы и папки.

    .. code::

        chmod 666 config.local.php
        chmod -R 777 design images var
        find design -type f -print0 | xargs -0 chmod 666
        find images -type f -print0 | xargs -0 chmod 666
        find var -type f -print0 | xargs -0 chmod 666

    Может потребоваться:

    .. code::
 
        chmod 644 design/.htaccess images/.htaccess var/.htaccess var/themes_repository/.htaccess
        chmod 644 design/index.php images/index.php var/index.php var/themes_repository/index.php

4.  Откройте файл **/install/config.php** и внесите данные сервера

    .. list-table::
        :stub-columns: 1
        :widths: 10 30

        *   -   Настройки базы данных MySQL
            -   .. code::   php

                    'name' => '%DB_NAME%',
                    'user' => '%DB_USER%',
                    'password' => '%DB_PASS%',

        *   -   Домен и директория
            -   .. code::   php

                    'http_host' => '%HTTP_HOST%',
                    'http_path' => '',
                    'https_host' => '%HTTP_HOST%',
                    'https_path' => '',

5.  Запустите установку в консоли.

    Пройдите в папку install:

    .. code::

        cd install

    Запустите установку:

    .. code::

        php index.php

6.  Готово. Выполните ":doc:`Три шага к повышению безопасности </manager/install/secure/index>`"
