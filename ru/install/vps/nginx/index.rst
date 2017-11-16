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

::

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
      server_name example.com www.example.com;

      #   Кодировка по-умолчанию
      charset utf-8;

      #   Расположение логов
      access_log  /var/log/nginx/access.log combined;
      error_log   /var/log/nginx/error.log;

      #   Основной каталог интернет-магазина
      root /var/www/html/example.com;

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

      #   Прочие настройки
      client_max_body_size            100m;
      client_body_buffer_size         128k;
      client_header_timeout           3m;
      client_body_timeout             3m;
      send_timeout                    3m;
      client_header_buffer_size       1k;
      large_client_header_buffers     4 16k;


      error_page 598 = @backend;

      ############################################################################

  #   Обработка PHP-скриптов
      location @backend {
          try_files $uri /$1/$3 /index.php =404;
          proxy_read_timeout 61;
          fastcgi_read_timeout 61;
          #   The path to the PHP-FPM daemon socket
          fastcgi_pass unix:/var/run/php5-fpm.sock;
          fastcgi_index index.php;
          fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
          include fastcgi_params;
    }

  #   Правила rewrite для модуля SEO
      location @fallback {
          rewrite  ^/(\w+)/(\w+/)?(.*)$ /$1/index.php?$args last;
          rewrite  ^(.*)$ /index.php?$args last;
      }

  #   Правило поиска статических файлов. Например, если есть 2 витрины: example.com and example.com/shop/
      location @statics {
          rewrite ^/(\w+)/(\w+/)?(.*)$ /$1/$3 break;
          access_log off;
          try_files $uri /$1/$3 @fallback;
          rewrite_log off;
          expires max;
          add_header Cache-Control public;
          add_header Access-Control-Allow-Origin *;
      }

      rewrite ^(/admin.php)(.*)$ /?url=admin.php$2 redirect;

  #   Точка входа в интернет-магазин
      location / {
      #   Главный скрипт
          index  index.php index.html index.htm;
      #   Для  работы API
          rewrite ^/(\w+)/(\w+/)?api/(.*)$ /$1/api.php?_d=$3&ajax_custom=1&$args last;
      #   Логика поиска скрипта по порядку: файл, папка, скрипт
          try_files $uri $uri/ @fallback;

      #   Настройки статики, первое правило
          location ~* /(\w+)/(\w+/)?(.+\.(jpe?g|ico|gif|png|css|js|pdf|txt|tar|wof|woff|svg|ttf|csv|zip|xml|yml)) {
              access_log off;
          #   Правило поиска статических файлов. Если файл не находится по адресу магазина, то ищем файл по правилу @statics.
          #   Например, если магазин находится в подпапке example.com/shop/            
              try_files $uri /stores/$1/$3 @statics;
              expires max;
              add_header Access-Control-Allow-Origin *;
              add_header Cache-Control public;
          }

      #
      #  Ограничиваем возвожность запуска php в каталогах. Для безопасности.
      #

          location ~ ^/(\w+)/(\w+/)?app/ {
              return 404;
          }

      #   Разрешаем запуск скриптов способов оплаты
          location ~ ^/(\w+)/(\w+/)?app/payments/ {
              return 404;
              location ~ \.php$ {
                  return 598;
              }
          }

      #   Разрешаем запуск скриптов способов оплаты
          location ~ ^/(\w+)/(\w+/)?app/addons/paypal/payments/ {
              return 404;
              location ~ \.php$ {
                  return 598;
              }
          }

      #   Разрешаем запуск скрипта обмена данными с 1С.
          location ~ ^/(\w+)/(\w+/)?app/addons/rus_exim_1c/ {
              return 404;
              location ~ \.php$ {
                  return 598;
              }
          }

      #   Запрещаем PHP в папке /design
          location ~ ^/(\w+)/(\w+/)?design/ {
              allow all;
              location ~* \.([tT][pP][lL]|[pP][hH][pP].?)$ {
                  return 404;
              }
          }

      #   Разрешаем только статику в папке /var
          location ~ ^/(\w+)/(\w+/)?var/ {
              return 404;
              location ~* \.(jpe?g|ico|gif|png|css|js|pdf|txt|tar|wof|woff|svg|ttf|csv|zip|xml|yml)$ {
                  allow all;
                  expires 1M;
                  add_header Cache-Control public;
                  add_header Access-Control-Allow-Origin *;
              }
          }

      #   Закрываем доступ к резервным копиям шаблонов.
          location ~ ^/(\w+)/(\w+/)?var/themes_repository/ {
              allow all;
              location ~* \.([tT][pP][lL]|[pP][hH][pP].?)$ {
                  return 404;
              }
          }

      #   Запрещаем PHP в папке /images
          location ~ ^/(\w+)/(\w+/)?images/ {
              allow all;
              location ~* \.([pP][hH][pP].?)$ {
                  return 404;
              }
          }

      #   Запрещаем доступ к init.php
          location ~ ^/(\w+)/(\w+/)?init.php {
              return 404;
          }

      #   Закрываем доступ к бэкапам базы данных интернет-магазина (папка /var/database/) снаружи.
          location ~ ^/(\w+)/(\w+/)?var/database/ {
              return 404;
          }

      #   Закрываем доступ к .tpl
          location ~* \.([tT][pP][lL].?)$ {
              return 404;
          }

      #   Закрываем доступ к .htaccess, .htpasswd и git
          location ~ /\.(ht|git) {
              return 404;
          }

          location ~* /(\w+)/(\w+/)?(.+\.php)$ {
              return 598 ;
          }

          location ~* \.php$ {
              return 598 ;
          }

      }
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






