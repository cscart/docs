*****************************
Создание сервиса через модуль
*****************************

В качестве примера полной реализации можно использовать **EDost add-on**.

Нужно создать класс, который реализует **IService**, и использовать тот же путь, что и в ядре.

Например: *addons/edost/Tygh/Shippings/Serivces/Edost.php*

Также нужно создать информацию о сервисе в БД в таблицах:

* ``settings_objects``
* ``settings_descriptions``
* ``shipping_services``
* ``shipping_service_descriptions``
