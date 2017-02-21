******************************************
4. Подключим домен к директории на сервере
******************************************

Когда пользователь вводит ваш домен в адресную строку браузера, тот обращается к вашему веб-серверу за получением страницы. Сервер же, в свою очередь, должен направить браузер в папку с файлами интернет-магазина.

Мы сделаем:

*   Папку (директорию) на сервере, где будут расположены файлы интернет-магазина.

*   Создадим виртуальный хост для домена. Иными словами, сделаем так, чтобы домен направлял в созданную ранее папку.

Создадим папку для файлов интернет-магазина
===========================================

Мы используем домен **dbazhenov.ru**, так и назовём папку.

Вводим в PuTTY команду:

::

    mkdir /var/www/html/dbazhenov.ru

.. fancybox:: img/putty_server_apache_8.PNG
    :alt: VPS

Создадим виртуальный хост
=========================

Нам потребуется **FileZilla**

1.  Откройте **FileZilla** и подключитесь к серверу.

    .. fancybox:: img/filezilla_1.PNG
        :alt: VPS

2.  По умолчанию, вам будет открыт каталог главного пользователя ``/root``

    .. fancybox:: img/filezilla_2.PNG
        :alt: VPS

    Кликаем на минус, чтобы перейти в основной каталог сервера ``/``

3.  Пройдите в папку:

    ::

        /etc/apache2/sites-enabled/

    .. fancybox:: img/filezilla_3.PNG
        :alt: VPS

4.  Откройте файл **000-default.conf** для редактирования (Открыть/Править):

    ::

        /etc/apache2/sites-enabled/000-default.conf


    .. hint::

        Можно скопировать файл на компьютер с помощью двойного клика по файлу. Открыть файл на компьютере, отредактировать и загрузить назад, заменив оригинальный.

5.  Замените весь код в файле, на тот что указан ниже.

    При этом замените:

    *   **dbazhenov.ru** на ваш домен

    *   **/var/www/html/dbazhenov.ru** на вашу папку

    Код для файла:

    ::

        <VirtualHost *:80>
            # Основной (первичный) домен
            ServerName dbazhenov.ru
            # Список вторичных доменов (синонимы)
            ServerAlias www.dbazhenov.ru
            # Электронная почта сервер-администратора
            ServerAdmin webmaster@dbazhenov.ru
            # Скрываем версию веб-сервера от злоумышленников
            ServerSignature Off

            # Параметры журналирования
            CustomLog /var/log/apache2/access.log combined
            ErrorLog  /var/log/apache2/error.log
            LogLevel  warn
            # Каталог с файлами интернет-магазина
            DocumentRoot /var/www/html/dbazhenov.ru

            # Определяем правила поведения контента
            <Directory />
                Options +Indexes +FollowSymLinks +MultiViews
                AllowOverride All
            </Directory>

            <Directory /var/www/html/dbazhenov.ru>
                Options +Indexes +FollowSymLinks +MultiViews
                AllowOverride All
                Order allow,deny
                Allow from all
            </Directory>

            # Закрываем доступ к папке .svn
            <Directory ~ ".*\.svn">
                Order allow,deny
                Deny from all
                Satisfy All
            </Directory>

            # Закрываем доступ к папке .git
            <Directory ~ ".*\.git">
                Order allow,deny
                Deny from all
                Satisfy All
            </Directory>

            # Сжимаем контент. Это позволяет значительно увеличить
            # скорость загрузки, но нагружает процессор
            AddOutputFilterByType DEFLATE text/plain
            AddOutputFilterByType DEFLATE text/html
            AddOutputFilterByType DEFLATE text/xml
            AddOutputFilterByType DEFLATE text/css
            AddOutputFilterByType DEFLATE application/xml
            AddOutputFilterByType DEFLATE application/xhtml+xml
            AddOutputFilterByType DEFLATE application/rss+xml
            AddOutputFilterByType DEFLATE application/javascript
            AddOutputFilterByType DEFLATE application/x-javascript

            # Отдаём старым браузерам несжатый контент
            <IfModule mod_setenvif.c>
                BrowserMatch ^Mozilla/4 gzip-only-text/html
                BrowserMatch ^Mozilla/4\.0[678] no-gzip
                BrowserMatch \bMSIE !no-gzip !gzip-only-text/html
            </IfModule>
            # End: deflate

            # Включаем кеширование
            ExpiresActive On
            # Устанавливаем время кеширования по умолчанию в один месяц
            ExpiresDefault "access plus 1 month"

            # Стилям, скриптам и изображениям говорим кешироваться на сутки
            <FilesMatch "\.(jpg|jpeg|gif|png|js|css)$">
                Header set Cache-control "public, max-age=86400"
            </FilesMatch>
        </VirtualHost>

    .. hint::

        Действия кода указаны в комментариях.

    Проверьте, чтобы код точно оказался в нужном файле.

6.  Так выглядит код в моём текстовом редакторе **Sublime**

    .. fancybox:: img/filezilla_4.PNG
        :alt: VPS

7.  Перезагрузите **Apache**

    Выполните в PuTTY команду:

    ::

        sudo service apache2 restart

    .. fancybox:: img/putty_server_apache_restart.PNG
        :alt: VPS

**Идём дальше! Установим PHP**


