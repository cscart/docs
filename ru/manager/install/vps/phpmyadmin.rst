***************************
7. Устанавливаем PhpMyAdmin
***************************

Для создания, просмотра и редактирования баз данных MySQL установим программу PhpMyAdmin.

Процесс установки
=================

1.  Запустите в терминале (PuTTY) команду:

    ::

        sudo apt-get install phpmyadmin -y

    .. fancybox:: img/putty_server_phpmyadmin_1.PNG
        :alt: VPS

    Соглашайтесь со всем по ходу установки.

2.  Появится окно атоматической конфигурации веб-сервера. С помощью клавижи **Пробела** выбираем **Apache2** , на нем должна быть звёздочка выбора. Жмём **OK**

    .. fancybox:: img/putty_server_phpmyadmin_2.PNG
        :alt: VPS

3.  Соглашаемся в следующем окне.

    .. fancybox:: img/putty_server_phpmyadmin_3.PNG
        :alt: VPS

4.  Вводим несколько раз пароль от базы данных. Тот который использовали при установке MySQL.

    .. fancybox:: img/putty_server_phpmyadmin_4.PNG
        :alt: VPS

    .. fancybox:: img/putty_server_phpmyadmin_5.PNG
        :alt: VPS

5.  Финиш!

    .. fancybox:: img/putty_server_phpmyadmin_6.PNG
        :alt: VPS  


Повысим безопасность PhpMyAdmin
===============================

Если злоумышленник узнает адрес PhpMyAdmin, то он может взломать сервер. Поэтому мы сделаем уникальный URL для PhpMyAdmin. Это не даёт 100% гарантии, однако это самый простой способ снизить риск. Больше информации о защите вы найдёте в Яндекс.

По умолчанию, phpmyadmin доступен по адресу:

``ваш_домен/phpmyadmin`` 

Мы изменим путь после домена.

1.  Найдите на сервере с помощью FileZilla файл:

    ::

        /etc/phpmyadmin/apache.conf 

    .. fancybox:: img/putty_server_phpmyadmin_secure_1.PNG
        :alt: VPS  

2.  Откройте данный файл для правки (редактирования) или скопируйте на компьютер для редактирования.

    Замените ``/phpmyadmin`` на уникальное слово, в строке:

    ::
    
        Alias /phpmyadmin /usr/share/phpmyadmin

    Например:

    ::
    
        Alias /php1234 /usr/share/phpmyadmin


    .. fancybox:: img/putty_server_phpmyadmin_secure_2.PNG
        :alt: VPS  

    .. fancybox:: img/putty_server_phpmyadmin_secure_3.PNG
        :alt: VPS  

3.  Перезагрузите **Apache**

    Выполните в PuTTY команду:

    ::

        sudo service apache2 restart


    .. fancybox:: img/putty_server_apache_restart.PNG
        :alt: VPS    


Проверяем работу PhpMyAdmin
===========================

Откройте PhpMyAdmin по новому пути

``ваш_домен/php1234``

.. fancybox:: img/putty_server_phpmyadmin_start.PNG
    :alt: VPS  

**Отлично! Можно сказать, что ваш сервер готов! Осталось установить CS-Cart.**


