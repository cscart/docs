Установка на компьютер c Linux
------------------------------

Рассмотрим установку CS-Cart на локальный компьютер под управлением Ubuntu. 

.. note::

    Вам потребуются установленные пакеты Apache, MySQL и PHP.

1.  Скачайте последнюю версию CS-Cart на сайте `www.cs-cart.ru <https://www.cs-cart.ru/download.html>`_.

2.  Создайте новую папку **/var/www/cscart/** и распакуйте в неё архив дистрибутива.

    .. fancybox:: img/install_01.png
        :alt: ubuntu install

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


4.  Запустите "Мастер установки" в браузере по адресу ``localhost/cscart`` и нажмите **[install]**

    Инструкция: :doc:`Установка в браузере </install/process/index>`

    .. fancybox:: img/install_04.png
        :alt: ubuntu install