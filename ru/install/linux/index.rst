******************************
Установка на компьютер c Linux
******************************

Рассмотрим установку CS-Cart на локальный компьютер под управлением Unix-подобной операционной системы (например, Linux или Ubuntu).

.. important::

    Сначала установите Apache, MySQL и PHP.

#. Скачайте последнюю версию CS-Cart на сайте `www.cs-cart.ru <https://www.cs-cart.ru/download.html>`_.

#. Создайте новую директорию */var/www/cscart/*. Если хотите, используйте вместо *cscart* любое другое имя.

#. Распакуйте архив дистрибутива в созданную директорию.

   .. fancybox:: img/install_01.png
       :alt: Устанавливаем CS-Cart на Ubuntu.

#. Установите права на файлы и папки:

   .. list-table::
       :stub-columns: 1
       :widths: 10 30

       * - 777
         - На следующие папки и их содержимое:

           * var/
           * design/
           * images/

       * - 666
         - На следующий файл:

           * config.local.php

   Вот команды, чтобы задать нужные права через командную строку:

   .. code::

       chmod 666 config.local.php
       chmod -R 777 design images var
       find design -type f -print0 | xargs -0 chmod 666
       find images -type f -print0 | xargs -0 chmod 666
       find var -type f -print0 | xargs -0 chmod 666

#. Также могут потребоваться эти команды:

   .. code::

       chmod 644 design/.htaccess images/.htaccess var/.htaccess var/themes_repository/.htaccess
       chmod 644 design/index.php images/index.php var/index.php var/themes_repository/index.php

#. Запустите "Мастер установки". Для этого откройте в браузере страницу ``localhost/cscart``.

#. Нажмите **[install]** и следуйте :doc:`инструкции по установке в браузере </install/process/index>`.

   .. fancybox:: img/install_04.png
       :alt: Запускаем установку CS-Cart в браузере.
