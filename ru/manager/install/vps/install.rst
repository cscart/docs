*******************************
8. Устанавливаем CS-Cart на VPS
*******************************

Мы имеем:

*   Всё необходимое ПО на сервере (Apache, php, mysql).

*   Инструмент для создания базы данных (PhpMyAdmin).

*   Директорию (папку) для файлов интернет-магазина.

*   Домен, который ссылается на нашу папку.

.. warning::

    Предупреждение! Настройку сервера для живого интернет-магазина необходимо доверить профессионалам.

Устанавливаем CS-Cart как на обычный хостинг.

1.  Скачиваем свеженький CS-Cart с официального сайта `www.cs-cart.ru <https://www.cs-cart.ru/download.html>`_

    .. fancybox:: img/download.PNG
        :alt: VPS

2.  Копируем архив в папку на сервере (с помощью FileZilla).

    .. fancybox:: img/install_1.PNG
        :alt: VPS

3.  Открываем терминал (PuTTY) и переходим в папку интернет-магазина с помощью команды:

    ::

        cd /var/www/html/dbazhenov.ru/

    .. fancybox:: img/install_2.PNG
        :alt: VPS

4.  Чтобы увидеть содержимое папки, используем команду:

    ::

        ls

    .. fancybox:: img/install_3.PNG
        :alt: VPS

    Видим наличие архива в папке.

5.  Распаковываем архив с помощью команды:

    ::

        tar xvzf название_архива.tgz

    В нашем случае это:

    ::

        tar xvzf cscart_v4.2.3_ru.tgz

    .. fancybox:: img/install_4.PNG
        :alt: VPS

6.  Устанавливаем права на папки и файлы, с помощью команд:

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

7.  Создадим новую базу данных. 

    Откроем PhpMyAdmin.

    Данные для первого входа в PhpMyAdmin:

    *   root

    *   пароль при установке PhpMyAdmin


    Создадим новую базу данных.

    .. fancybox:: img/install_7.PNG
        :alt: VPS

8.  Откроем на интернет-магазин в браузере:

    .. fancybox:: img/install_6.PNG
        :alt: VPS


9.  Кликаем **install** и выполняем установку согласно инструкции: :doc:`Установка в браузере </manager/install/process/index>`
