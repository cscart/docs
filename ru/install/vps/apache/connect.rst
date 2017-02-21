*************************
2. Подключаемся к серверу
*************************

При регистрации VPS сервера, хостинг предоставляет SSH доступ к серверу:

*   IP адрес

*   Логин

*   Пароль

.. fancybox:: img/hosting_2.PNG
    :alt: VPS

VPS сервер предоставляется с чистой операционной системой без дополнительного ПО.

Для работы CS-Cart мы установим:

*   Apache

*   Модули Apache

*   PHP

*   MySQL

*   phpMyAdmin

.. hint::

    О каждом из компонентов, вам может рассказать Wiki или Яндекс.

Для начала, подключимя к серверу.

1.  Включите PuTTY

2.  Введите IP адрес сервера и нажмите **Соединиться**

    .. fancybox:: img/putty_1.PNG
        :alt: PuTTY

    Вы увидите терминал (окно с чёрным экраном) для ввода команд серверу.

3.  Введите логин и нажмите **ENTER**

    .. fancybox:: img/putty_2.PNG
        :alt: PuTTY

3.  Введите или скопируйте пароль и нажмите **ENTER**

    .. fancybox:: img/putty_3.PNG
        :alt: PuTTY

4.  Успех. Вы увидите информацию о вашем сервере.

    .. fancybox:: img/putty_4.PNG
        :alt: PuTTY

5.  Обновите базу пакетов операционной системы сервера с помощью команды:

    .. code::

        sudo apt-get update -y

    .. list-table::
        :header-rows: 1
        :widths: 50 50

        *   -   Запуск

            -   Результат

        *   -   .. fancybox:: img/putty_server_update_1.PNG
                    :alt: VPS

            -   .. fancybox:: img/putty_server_update_2.PNG
                    :alt: VPS


Отлично. Переходим к установке **Apache**.






