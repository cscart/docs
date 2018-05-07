*********************************************
Настройка веб-сервера Nginx + PHP-FPM + MySQL
*********************************************

Быстрая установка и настройка веб-сервера NginX для работы CS-Cart.

Если вы в первый раз настраиваете VPS сервер, то рекомендуем начать с изучения с более детальной инструкции: :doc:`Настройка веб-сервера Apache </install/vps/apache/index>`.

Видео
=====

|nginx|

.. |nginx| raw:: html

   <iframe width="560" height="315" src="//www.youtube.com/embed/ljLyCC9SIgY" frameborder="0" allowfullscreen></iframe>

Сервер и ресурсы
================

Для инструкции арендован самый простой VPS сервер.

Обычно VPS сервер предоставляется с чистой операционной системой, мы выбрали последнюю версию **Ubuntu 14.04 LTS x86** на данный момент.

Технические характеристики сервера:

.. list-table::
   :widths: 10 30

   *    -   ОС

        -   **Ubuntu 14.04 LTS x86**

   *    -   Диск

        -   2.0 ГБ

   *    -   Процессор

        -   2000 МГц

   *    -   Память

        -   128 МБ


.. hint::

    Ресурсов данного сервера достаточно только для теста и эксперимента.


.. warning::

    Предупреждение! Настройку сервера для живого интернет-магазина необходимо доверить профессионалам.

    Данная инструкция может быть использована для тестовых интернет-магазинов.


1. Подключаемся к серверу по SSH
================================

Используем терминал (PuTTY).

2. Обновим список пакетов
=========================

Запустите в терминале (PuTTY) команду:

::

    sudo apt-get update -y


3. Устанавливаем NginX
======================

Наша команда:

::

    sudo apt-get install nginx -y


4. Останавливаем Nginx
======================

Остановим NginX на время настройки простой командой:

::

    sudo service nginx stop


5. Узнаем количество процессоров в системе
==========================================

Количество процессоров нам понадобится для конфигурации NginX:

::

    cat /proc/cpuinfo | grep processor | wc -l

Запоминаем число процессоров.


6. Установим число процессов Nginx
==================================

Найдите на сервере и откройте для редактирования файл:

``/etc/nginx/nginx.conf``

Найдите строчку

::

    worker_processes  4;

Установите для неё значение равное числу процессоров. В нашем случае один процессор.

Стало:

::

    worker_processes  1;

Сохраняем.

7. Создадим папку для интернет-магазина
=======================================

Простая команда:

::

    mkdir -p /var/www/html/example.com

.. important::

    В примерах команд и в конфигурационном файле мы будем использовать ``example.com``. Замените его на имя своего домена, например, *dbazhenov.ru*.


8. Конфигурация Nginx
=====================

Нам необходимо настроить конфигурацию NginX. Сделаем так, чтобы Nginx понимал наш домен и отправлял его в нужную папку на сервере, а также установим правила для SEO.

Найдите на сервере и откройте файл:

``/etc/nginx/sites-available/default``

Удалите весь код и вставьте новый. Ниже будет код, в комментариях кратко описано происходящее. Вам нужно заменить домен **example.com** на ваш домен

.. code-block:: nginx

    #######################################################################
    # Виртуальный хост по умолчанию, предназначен для работы по IP адресу или домену без собственной конфигурации
    #######################################################################

    server {
        listen  80;
        server_name _;
        root /var/www/empty;

        # Редирект на нужный магазин по умолчанию
        location / {
            return 301 $scheme://example.com$request_uri;
        }
    }

    #######################################################################
    # Описание и конфигурация основного домена для интернет-магазина
    #######################################################################

    server {
        listen  80;
        #   Домен интернет-магазина
        server_name example.com;

        ############################################################################

        #   Кодировка по умолчанию
        charset utf-8;

        ############################################################################

        #   Основной каталог интернет-магазина
        root /var/www/html/example.com;
        index  index.php index.html index.htm;

        ############################################################################

        #   Сжатие
        gzip on;
        gzip_disable "msie6";
        gzip_comp_level 6;
        gzip_min_length  1100;
        gzip_buffers 16 8k;
        gzip_proxied any;
        gzip_types text/plain application/xml
        application/javascript
        text/css
        text/js
        text/xml
        application/x-javascript
        text/javascript
        application/json
        application/xml+rss;

        ############################################################################

        #   Прочие настройки
        client_max_body_size            100m;
        client_body_buffer_size         128k;
        client_header_timeout           3m;
        client_body_timeout             3m;
        send_timeout                    3m;
        client_header_buffer_size       1k;
        large_client_header_buffers     4 16k;

        ############################################################################

        access_log  /var/log/nginx/example.com_access.log combined;
        error_log   /var/log/nginx/example.com_error.log;

        ############################################################################

        error_page 598 = @backend;

        ############################################################################

        location @backend {
            try_files $uri $uri/ /$2$3 /$3 /index.php  =404;
            #   Путь к сокету PHP-FPM
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            #
            fastcgi_index index.php;
            fastcgi_read_timeout 360;
            #   Добавляем содержимое fastcgi_params.conf
            ################################################################################
            fastcgi_param  QUERY_STRING       $query_string;
            fastcgi_param  REQUEST_METHOD     $request_method;
            fastcgi_param  CONTENT_TYPE       $content_type;
            fastcgi_param  CONTENT_LENGTH     $content_length;
            fastcgi_param  SCRIPT_NAME        $fastcgi_script_name;
            fastcgi_param  REQUEST_URI        $request_uri;
            fastcgi_param  DOCUMENT_URI       $document_uri;
            fastcgi_param  DOCUMENT_ROOT      $document_root;
            fastcgi_param  SERVER_PROTOCOL    $server_protocol;
            fastcgi_param  HTTPS              $https if_not_empty;
            fastcgi_param  GATEWAY_INTERFACE  CGI/1.1;
            fastcgi_param  SERVER_SOFTWARE    nginx/$nginx_version;
            fastcgi_param  REMOTE_ADDR        $remote_addr;
            fastcgi_param  REMOTE_PORT        $remote_port;
            fastcgi_param  SERVER_ADDR        $server_addr;
            fastcgi_param  SERVER_PORT        $server_port;
            fastcgi_param  SERVER_NAME        $server_name;
            fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name;
            fastcgi_param  REDIRECT_STATUS    200;
            ################################################################################
        }

        ############################################################################

        location  / {
            index  index.php index.html index.htm;
            try_files $uri $uri/ /index.php?$args;
        }

        ############################################################################

        location ~ ^/(\w+/)?(\w+/)?api/ {
            rewrite ^/(\w+/)?(\w+/)?api/(.*)$ /api.php?_d=$3&ajax_custom=1&$args last;
            rewrite_log off;
        }

        ############################################################################

        location ~ ^/(\w+/)?(\w+/)?var/database/ {
            return 404;
        }

        location ~ ^/(\w+/)?(\w+/)?var/backups/ {
            return 404;
        }

        location ~ ^/(\w+/)?(\w+/)?var/restore/ {
            return 404;
        }

        location ~ ^/(\w+/)?(\w+/)?var/themes_repository/ {
            allow all;
            location ~* \.(tpl|php.?)$ {
                return 404;
            }
        }

        location ~ ^/(\w+/)?(\w+/)?var/ {
            return 404;
            location ~* /(\w+/)?(\w+/)?(.+\.(js|css|png|jpe?g|gz|yml|xml))$ {
                try_files $uri $uri/ /$2$3 /$3 /index.php?$args;
                allow all;
                access_log off;
                expires 1M;
                add_header Cache-Control public;
                add_header Access-Control-Allow-Origin *;
            }
        }

        ############################################################################

        location ~ ^/(\w+/)?(\w+/)?app/payments/ {
            return 404;
            location ~ \.php$ {
                return 598;
            }
        }

        location ~ ^/(\w+/)?(\w+/)?app/addons/rus_exim_1c/ {
            return 404;
            location ~ \.php$ {
                return 598;
            }
        }

        location ~ ^/(\w+/)?(\w+/)?app/ {
            return 404;
        }

        ############################################################################

        location ~* /(\w+/)?(\w+/)?(.+\.(jpe?g|jpg|ico|gif|png|css|js|pdf|txt|tar|woff|svg|ttf|eot|csv|zip|xml|yml))$ {
            access_log off;
            try_files $uri $uri/ /$2$3 /$3 /index.php?$args;
            expires max;
            add_header Access-Control-Allow-Origin *;
            add_header Cache-Control public;
        }

        ############################################################################      

        location ~ ^/(\w+/)?(\w+/)?design/ {
            allow all;
            location ~* \.(tpl|php.?)$ {
                return 404;
            }
        }

        ############################################################################

        location ~ ^/(\w+/)?(\w+/)?images/ {
            allow all;
            location ~* \.(php.?)$ {
                return 404;
            }
        }

        ############################################################################

        location ~ ^/(\w+/)?(\w+/)?js/ {
            allow all;
            location ~* \.(php.?)$ {
                return 404;
            }
        }

        ############################################################################

        location ~ ^/(\w+/)?(\w+/)?init.php {
            return 404;
        }

        location ~* \.(tpl.?)$ {
            return 404;
        }

        location ~ /\.(ht|git) {
            return 404;
        }

        location ~* \.php$ {
            return 598 ;
        }

        ################################################################################

    }

9. Перезапускаем nginx
======================

Опять терминал:

::

    sudo service nginx restart

10. Устанавливаем PHP-FPM
=========================

Одной командой:

::

    sudo apt-get install php5-fpm php5-mysql php5-curl php5-gd php-mail -y

Можете установить любую версию PHP, соответствующую :doc:`системным требованиям </install/system_requirements>`. Но в этом случае придется поменять конфигурацию nginx (*/etc/nginx/sites-available/default*) соответствующим образом. Например, если вы устанавливаете PHP7-FPM, вам придётся заменить путь к сокету PHP-FPM на ``/var/run/php/php7.0-fpm.sock``.

11. Установим MySQL
===================

Команда для установки MySQL:

::

    sudo apt-get install mysql-server -y

В процессе установки вам потребуется несколько раз ввести пароль. Не потеряйте пароль!


12. Установим PhpMyAdmin
========================

Ещё одной командой установим PhpMyAdmin для удобства работы с базой данных:

::

    sudo apt-get install phpmyadmin -y

Потребуется ввести пароль от MySQL.

Консоль попросит вас выбрать Apache2 или lighttpd во время установки, пропустите данный шаг, просто нажмите **ENTER**

13. Добавим конфигурацию Nginx для PhpMyAdmin
=============================================

Сделаем так, чтобы PhpMyAdmin открывался на отдельном поддомене: pma.example.com. Нам необходимо добавить в конфигурацию nginx новый раздел для поддомена.

Откройте на сервере файл:

``/etc/nginx/sites-available/default``

В конец файла добавьте конфигурацию для поддомена, который будет ссылаться на phpmyadmin. Просто скопируйте код в конец существующей конфигурации, замените example.com на ваш домен:

::

    #######################################################################
    # pma.example.com
    #######################################################################

    server {
        listen  80;

        #   Поддомен для phpmyadmin
        server_name pma.example.com www.pma.example.com;

        charset utf-8;

        #   Расположение логов
        access_log  /var/log/nginx/pma.example.com_access.log combined;
        error_log   /var/log/nginx/pma.example.com_error.log;

        #   Путь по которому будет ссылаться поддомен
        root /usr/share/phpmyadmin;
        index index.php index.html index.htm;

        location / {
            try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
            root /usr/share/phpmyadmin;
            proxy_read_timeout 61;
            fastcgi_read_timeout 61;
            try_files $uri $uri/ =404;
            #   Путь к сокету PHP-FPM
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }
    }


14. Перезапускаем nginx
=======================

Вы уже знаете команду для перезагрузки nginx:

::

    sudo service nginx restart


15. Всё! Устанавливаем CS-Cart
==============================

*   Скопируйте архив с CS-Cart в папку домена на новом сервере (/var/www/html/example.com).

*   Распакуйте архив

*   Установите нужные права на файлы и папки.

*   Создайте базу данных для интернет-магазина в PhpMyAdmin

*   Завершите установку в бразере: :doc:`Установка в браузере </install/process/index>`

:doc:`Больше информации </install/index>`






