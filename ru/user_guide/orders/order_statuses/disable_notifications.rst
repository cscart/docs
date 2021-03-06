**************************************************
Как отключить email-уведомления о статусах заказов
**************************************************

CS-Cart может отправлять уведомления по электронной почте, когда заказ получает определённый статус. Эти уведомления могут отправляться:

* на электронные адреса покупателей;

* на электронный адрес отдела оформления и обработки заказов вашего магазина.

.. hint::

    Электронный адрес отдела оформления и обработки заказов можно указать на странице **Настройки → Компания**.

Допустим, мы хотим отправлять уведомления покупателям, но не хотим, чтобы эти же уведомления приходили в отдел по работе с заказами. Сделать это можно двумя способами, в зависимости от того, включен ли в вашем магазине :doc:`редактор шаблонов почтовых уведомлений </user_guide/look_and_feel/email_templates/enable_email_editor>`.

=======================================
Если редактор email-уведомлений включен
=======================================

#. Откройте страницу **Администрирование → Уведомления → Уведомления для администратора** в панели администратора.

#. Отключите там уведомления для статусов, которым они не нужны.


   .. fancybox:: img/disable_status_notification.png
       :alt: Отключение уведомления об определённом статусе заказа по электронной почте.

   .. note::

       Если необходимо, можно так же отключить уведомления об определённых статусах в разделе **Уведомления для покупателей**, чтобы они не приходили ещё и покупателям.

========================================
Если редактор email-уведомлений выключен
========================================

#. Откройте страницу **Администрирование → Статусы заказов** в панели администратора.

#. Нажмите на название статуса, который хотите отредактировать.

#. Уберите галочку **Уведомить отдел оформления и обработки заказов**.

#. Нажмите кнопку **Сохранить**, чтобы изменения применились.

#. Повторите шаги с 2 по 4 для всех статусов, о которых не нужно информировать администраторов.

   .. fancybox:: img/notifications.png
       :alt: Убрать галочку "Уведомить отдел оформления и обработки заказов".
