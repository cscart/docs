*******************************
Nginx and PHP-FPM Configuration
*******************************

Магазин на платформе CS-Cart может работать на веб-сервере, построенном на базе Nginx и PHP-FPM. Ниже представлена конфигурация виртуального хоста NginX для работы с PHP-FPM, настроенным на локальном компьютере. 

Setup NginX
===========

Согласно RFC 1945 соединения по протоколу HTTP устанавливаются на 80-м порту сервера. Указываем NginX "слушать" 80-й порт и установить виртуальный хост по умолчанию.

.. code-block:: sh

	listen      80   default_server;

Подсказываем NginX "слушать" 443-й порт для HTTPS-соединений – использование защищённого протокола крайне важно для безопасности передаваемых данных на чекауте или аутентификации в панели администратора. Директива ``ssl_certificate`` содержит полный путь до файла SSL-сертификата, а ``ssl_certificate_key`` – полный путь до приватного ключа SSL. 

Обратите внимание, если ваш магазин не использует защищённое соединение HTTPS, описание настроек SSL требуется закомментировать или удалить.

.. code-block:: sh

    # Включаем HTTPS. 
    # Если магазин не использует защищённое соединение, 
    # строки необходимо удалить или закомментировать.
    listen      443  ssl;
    ssl_certificate     /etc/nginx/ssl/certs.crt;
    ssl_certificate_key /etc/nginx/ssl/certs.key;
    ssl_protocols       SSLv3 TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers         HIGH:!aNULL:!MD5;

Указываем доменное имя виртуального хоста для вашего магазина, алиасы отделяются друг от друга пробелами.

.. code-block:: sh
	
	server_name foo.example.org bar.example.org;

Браузеры умеют получать HTML-странички в сжатом виде. Сжатие никак не влияет на внешний вид сайта, но при этом количество передаваемого трафика сильно уменьшается, что позволяет порой сильно увеличить скорость загрузки страниц. 

Процесс происходит следующим образом: сервер сайта архивирует странички и в сжатом виде посылает вам на компьютер, ваш браузер, получив эти архивы страниц, автоматически их распаковывает. Учтите, хорошо сжимается только текст, поэтому использовать сжатие для изображений, шрифтов или архивов нецелесообразно. Если по какой-то причине вам не требуется использовать сжатие, закомментируйте или удалите строки из конфигурационного файла.

.. code-block:: sh

    gzip            on;
    gzip_min_length 1000;
    gzip_proxied    expired no-cache no-store private auth;
    gzip_types      application/x-javascript text/css;

Иногда возникает необходимость запретить доступ к определенным файлам. Например, к конфигурационным файлам, содержащим реквизиты доступа к базам данных, интерфейсам и т.п. Ниже представленные правила запрещают использовать показывают серверу к каким файлам разрешать доступ, а к каким нет. 

.. code-block:: sh

    location ~ /\.ht {
        deny all;
    }

    location /design {
        root /var/www/html;
        allow all;
        location ~* \.([pP][hH][pP].?)$ {
            deny all;
        }
    }

    location /images {
        root /var/www/html;
        allow all;
        location ~* \.([pP][hH][pP]|[tT][pP][lL])$ {
            deny all;
        }
    }

    location /app {
        root /var/www/html;
        deny all;
        location = /app/payments$ {
            allow all;
        }
        location ~* payments/paybox_files/(.*)$ {
            allow all;
        }
    }

    location /var/logs {
        root /var/www/html;
        deny all;
    }

    location /var/database {
        root /var/www/html;
        deny all;
    }

    location / {
        root /var/www/html;
        index index.php;
    }

Подскажем серверу как следует обрабатывать PHP – все запросы, содержащие ``*.php`` перенаправляем на PHP-FPM. Безопаснее будет указать список разрешённых исполняемых скриптов – точек входа в приложения, не давая ни малейшего шанса на запуск сторонних подпрограмм. 

Также укажем путь до статических файлов и срок их клиентского кэширования – это то время, на которое клиентский браузер поместит объекты в локальный кэш, чтобы при следующей загрузке обратиться к не к вашему серверу, а к локальному хранилищу. 

.. code-block:: sh

    location ~ \.php$ {
        deny all;
        location ~ ^\/(index|api|admin).php$ {
            allow all;
            root /var/www/html;
            proxy_read_timeout 61;
            fastcgi_read_timeout 61;
            try_files $uri =404;
            fastcgi_pass 127.0.0.1:9000;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }
    }

    location ~* \.(jpeg|jpg|gif|png|css|woff|eot|svg|ttf|ttc|otf)$ {
        root /var/www/html;
        add_header Access-Control-Allow-Origin *;
        try_files $uri $uri/ =404;
        expires 1d;
    }