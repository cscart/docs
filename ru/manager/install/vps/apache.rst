************************************
3. Устанавливаем веб-сервер — Apache
************************************

1.  Устанавливаем **Apache** с помощью команды серверу. Запустите в терминале (PuTTY) команду:

    .. code::

        sudo apt-get install apache2 -y

    .. list-table:: 
        :header-rows: 1
        :widths: 50 50

        *   -   Запуск

            -   Результат

        *   -   .. fancybox:: img/putty_server_apache_1.PNG
                    :alt: VPS

            -   .. fancybox:: img/putty_server_apache_2.PNG
                    :alt: VPS

2.  Включим **mod_rewrite** для работы SEO.

    Команда:

    .. code::

        sudo a2enmod rewrite

    .. list-table:: 
        :header-rows: 1
        :widths: 50 50

        *   -   Запуск

            -   Результат

        *   -   .. fancybox:: img/putty_server_apache_3.PNG
                    :alt: VPS

            -   .. fancybox:: img/putty_server_apache_4.PNG
                    :alt: VPS


3.  Включим **AllowOverride** для возможности использования .htaccess в директориях

    Две команды по очереди:

    ``sudo sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/sites-enabled/000-default.conf`` 

    ``sudo sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf``


    .. important::

        Важно! Данные пути верны только для Ubuntu 14.04


    .. fancybox:: img/putty_server_apache_5.PNG
                    :alt: VPS


4.  Включим **mod_headers** для работы режима виджета

    Команда:

    .. code::

        sudo a2enmod headers

    .. fancybox:: img/putty_server_apache_6.PNG
                    :alt: VPS


5.  Включим мод **expires** для кэширования контента (изображений, стилей, скриптов) на стороне клиента (браузером)

    Команда:

    .. code::

        sudo a2enmod expires

    .. fancybox:: img/putty_server_apache_7.PNG
                    :alt: VPS


**Apache и необходимые модули установлены!**
