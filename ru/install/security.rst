Три шага к повышению безопасности
---------------------------------

После установки CS-Cart необходимо сделать несколько шагов для повышения безопасности вашего интернет-магазина. 

Вы получите предупреждение об этом в панели администратора:

*   Предупреждение! Из соображений безопасности настоятельно рекомендуем вам переименовать стандартный скрипт admin.php (детали в Базе знаний).

*   Предупреждение! Пожалуйста, удалите папку install.  Пока папка install не удалена, безопасность магазина может быть под угрозой.

    .. fancybox:: img/security/install_13.png
        :alt: secure

Переименовать стандартный скрипт admin.php
==========================================

1.  Откройте папку с файлами интернет-магазина.

2.  Измените название файла ``admin.php`` , на любое другое, известное только вам.

    Например: ``my_panel.php``

3.  Откройте файл config.local.php для редактирования и измените одну строчку.

    .. list-table::
        :stub-columns: 1
        :widths: 10 30

        *   -   Было
            -   .. code::   php

                    $config['admin_index'] = 'admin.php';  

        *   -   Стало
            -   .. code::   php

                    $config['admin_index'] = 'my_panel.php';

Удалить папку install
=====================

1.  Откройте папку с файлами интернет-магазина на вашем сервере.

2.  Удалите папку install. 

    .. note:: 

        Вы можете просто переименовать папку install или создать папку backup и перенести туда папку install, если потребуется переустановка в ближайшее время.


Измените права файлов
=====================

.. list-table::
        :stub-columns: 1
        :widths: 10 30

        *   -   config.local.php
            -   644
        *   -   design/.htaccess
            -   644
        *   -   images/.htaccess
            -   644
        *   -   var/.htaccess
            -   644
        *   -   var/themes_repository/.htaccess
            -   644
        *   -   design/index.php
            -   644
        *   -   images/index.php
            -   644
        *   -   var/index.php
            -   644
        *   -   var/themes_repository/index.php
            -   644

.. code::

    chmod 644 config.local.php
    chmod 644 design/.htaccess images/.htaccess
    chmod 644 var/.htaccess var/themes_repository/.htaccess
    chmod 644 design/index.php images/index.php
    chmod 644 var/index.php var/themes_repository/index.php
