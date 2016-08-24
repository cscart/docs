*************************************************
Table is Marked as Crashed and Should be Repaired
*************************************************

Эта ошибка появляется, если какая-то таблица повреждена и ее нужно восстановить. Например, для таблицы ``cscart_sessions`` ошибка выглядит так::

  Database error: Table 'cscart_sessions' is marked as crashed and should be repaired

.. note::

    PHP-скрипты CS-Cart не могут повредить таблицы базы данных MySQL. Обычно таблицы MyISAM повреждаются при сбоях системы.

Решается проблема так:

1. Скачайте файл **repair4.php** :download:`по этой ссылке <files/repair4.php>`. 

2. Загрузите этот файл в корневую директорию установленного CS-Cart на сервере.

3. Запустите скрипт. Просто перейдите в браузере по ссылке следующего вида::

     http://www.your_domain.com/your_cscart_directory/repair4.php?table=cscart_table_name

   Не забудьте заменить следующие части ссылки:

   * **your_domain.com** — подставьте ваш домен, например, *example.com*;

   * *your_cscart_directory* — подставьте имя директории, где лежит установленный CS-Cart. Если магазин доступен по адресу *example.com/shop*, замените *your_cscart_directory* на *shop*. Если магазин доступен напрямую через *example.com*, просто уберите */your_cscart_directory* из ссылки.

   * *cscart_table_name* — подставьте имя таблицы из сообщения об ошибке. В примере выше это *cscart_sessions*.

   Например, если магазин доступен по адресу *www.example.com*, а поврежденная таблица называется *cscart_sessions*, то ссылка будет такой::

     http://www.example.com/repair4.php?table=cscart_sessions
