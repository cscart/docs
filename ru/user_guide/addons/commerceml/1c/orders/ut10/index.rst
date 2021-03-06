****************************************************
Обмен заказами между интернет-магазином и 1С УТ 10.3
****************************************************

Здесь описан процесс обмена заказами между интернет-магазином на платформе CS-Cart и 1С Управление торговлей 10.3. Аналогичным образом можно настроить обмен с другой версией 1С.

.. note::

    В зависимости от версии, некоторые настройки могут быть видоизменены или отсутствовать. По поводу настроек на стороне 1С обратитесь к администратору 1С.

.. contents:: Содержание
    :local: 
    :depth: 3

Настройки в 1С
--------------

#. Откройте базу данных, с которой будет производиться обмен.

   .. fancybox:: img/order1c_001.png
       :alt: Обмен заказами 1C и CS-Cart

#. Проверьте настройки 1С (см. :doc:`Настройки обмена <../../instruction/ut10/index>`).

#. Откройте окно "Настройка обмена данными с WEB-сайтом". В данном окне создайте новую настройку обмена.

   .. hint::

       Сервис → Обмен данными с WEB-сайтом → Настроить обмен данными с WEB-сайтом.

   * В основных настройках обмена включите настройку "Обмен заказами" и нажмите кнопку "Далее".

     .. fancybox:: img/order1c_002.png
         :alt: Обмен заказами 1C и CS-Cart

   * На следующем шаге заполните настройки для обмена заказами.

     .. fancybox:: img/image10_008.png
         :alt: Обмен заказами 1C и CS-Cart

   * На следующем шаге укажите следующие настройки:

     * "Установка даты" — дата, которая будет указана в заказе, загруженном из магазина.

     * "Установка номера" — номер, который будет указан в заказе, загруженном из магазина.

     * "Проведение документа" — задается в зависимости от необходимого вида записи документа.

     После указания необходимых настроек нажмите кнопку "Далее".

     .. fancybox:: img/order1c_003.png
         :alt: Обмен заказами 1C и CS-Cart

   * На следующем шаге укажите режим обмена данными и нажмите кнопку "Далее".

       .. fancybox:: img/order1c_004.png
           :alt: Обмен заказами 1C и CS-Cart

   * На следующем шаге задайте расписание обмена данными и нажмите кнопку "Готово".

     .. fancybox:: img/order1c_005.png
         :alt: Обмен заказами 1C и CS-Cart

#. С помощью созданной настройки вы можете выполнить обмен с сайтом.

Настройки в интернет-магазине
-----------------------------

#. :doc:`Установите модуль <../../../../1manage_addons>` "CommerceML — синхронизация интернет-магазина с 1С, МойСклад, Класс365".

   .. hint:: 

       Панель администратора → Верхнее меню → Модули → Управление модулями → Просмотреть все доступные модули → "CommerceML – синхронизация интернет-магазина с 1С, МойСклад, Класс365"

   .. fancybox:: /user_guide/addons/commerceml/img/commerceml_addon.png
      :alt: Модуль CommerceML в CS-Cart.

#. После установки модуля откройте его настройки. Нажмите на название модуля и переключитесь на вкладку "Заказы":

   * "Включать отдельно стоимость доставки заказа для 1С" — если у заказа задана доставка, то при включении данной настройки доставка будет выгружаться в заказе в виде отдельной услуги.

   * "Выгружать опции товара" — если товары в заказе содержат опцию, то при включении данной настройки будут выгружаться опции товаров.

   * "Выгружать с номера" — задает номер первого выгружаемого заказа. Выгружаться будет этот заказ и все более поздние заказы.

   * "Загружать статусы заказов" — если включить эту настройку, то статусы у заказов в интернет-магазине будут обновлены в соответствии с файлом заказов 1С.

   * "Выгружать статусы заказов" — если включить эту настройку, то из интернет-магазина в 1С будут передаваться статусы выгружаемых заказов.

   * "Выгрузить все товары магазина" — если включить настройку, то заказы из магазина выгружаться не будут. Вместо этого будут выгружены все включенные товары, у которых включена настройка "Обновлять товар".

   * "Статусы выгружаемых заказов" — выгружать заказы только с указанными статусами. Если не выбран ни один из статусов, то будут выгружены все заказы, независимо от статуса.

   .. fancybox:: /user_guide/addons/commerceml/img/commerceml_orders.png
      :alt: Настройки синхронизации заказов по CommerceML в CS-Cart.

#. Для просмотра заказов, выгружаемых в 1С, введите в браузере следующий URL: ``ваш_домен/exim_1c?type=sale&mode=query``

   .. fancybox:: img/order1c_009.png
       :alt: Обмен заказами 1C и CS-Cart

Обмен заказами
--------------

#. Откройте в 1С созданный узел обмена и выполните обмен.

   .. fancybox:: img/order1c_010.png
       :alt: Обмен заказами 1C и CS-Cart

#. Откройте в 1С заказы покупателей и проверьте, выгрузились ли заказы из интернет-магазина.

   .. hint::

       Документы → Продажи → Заказы покупателей

   .. fancybox:: img/order1c_011.png
       :alt: Обмен заказами 1C и CS-Cart
