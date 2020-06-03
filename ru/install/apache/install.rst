*******************************
8. Устанавливаем CS-Cart на VPS
*******************************

Мы имеем:

*   Всё необходимое ПО на сервере (Apache, PHP, MySQL).

*   Инструмент для создания базы данных (phpMyAdmin).

*   Директорию (папку) для файлов интернет-магазина.

*   Домен, который ссылается на нашу папку.

.. warning::

    Предупреждение! Настройку сервера для живого интернет-магазина необходимо доверить профессионалам.

Устанавливаем CS-Cart как на обычный хостинг.

#. Скачайте последнюю версию `CS-Cart <https://www.cs-cart.ru/download.html>`_ на официальном сайте. Если вас интересует русская версия Multi-Vendor (CS-Cart для маркетплейсов), то `свяжитесь с нами через форму <https://multivendor.cs-cart.ru/#form>`_.

   .. fancybox:: img/download.PNG
       :alt: VPS

#. Копируем архив в папку на сервере (с помощью FileZilla).

   .. fancybox:: img/install_1.PNG
       :alt: VPS

#. Открываем терминал (PuTTY) и переходим в папку интернет-магазина с помощью команды:

   ::

       cd /var/www/html/dbazhenov.ru/

   .. fancybox:: img/install_2.PNG
       :alt: VPS

#. Чтобы увидеть содержимое папки, используем команду:

   ::

       ls

   .. fancybox:: img/install_3.PNG
       :alt: VPS

   Видим наличие архива в папке.

#. Распаковываем архив с помощью команды:

   ::

       tar xvzf название_архива.tgz

   В нашем случае это:

   ::

       tar xvzf cscart_v4.2.3_ru.tgz

   .. fancybox:: img/install_4.PNG
       :alt: VPS

#. Устанавливаем права на папки и файлы, с помощью команд:

   ::

       chmod 666 config.local.php
       chmod -R 777 design images var
       find design -type f -print0 | xargs -0 chmod 666
       find images -type f -print0 | xargs -0 chmod 666
       find var -type f -print0 | xargs -0 chmod 666

   Вводим команды в терминал по очереди.

   .. fancybox:: img/install_5.PNG
       :alt: VPS

   По файлам готово!

   Может потребоваться:

   .. code::
 
       chmod 644 design/.htaccess images/.htaccess var/.htaccess var/themes_repository/.htaccess
       chmod 644 design/index.php images/index.php var/index.php var/themes_repository/index.php


#. Создадим новую базу данных.

   Откроем phpMyAdmin.

   Данные для первого входа в phpMyAdmin:

   *   root

   *   пароль при установке phpMyAdmin


   Создадим новую базу данных.

   .. fancybox:: img/install_7.PNG
       :alt: VPS

#. Откроем на интернет-магазин в браузере:

   .. fancybox:: img/install_6.PNG
       :alt: VPS


#. Кликаем **install** и выполняем установку согласно инструкции: :doc:`Установка в браузере </install/process/index>`
