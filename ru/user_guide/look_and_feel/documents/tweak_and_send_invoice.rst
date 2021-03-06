****************************************************************
Как просматривать, изменять и отправлять счета отдельных заказов
****************************************************************

По умолчанию, счет прикрепляется в виде PDF-файла, к email-уведомлениям, отсылаемым при статусах заказа **Обработан** или **Выполнен**. Данное поведение можно изменить, :doc:`отредактировав соответствующие email-уведомления <../email_templates/index>`.

Также вы можете внести небольшие правки в конкретный счёт и отправить его отдельным письмом. Для этого:

#. В панели администратора откройте **Заказы → Заказы**.

#. Выберите заказ, в счёт которого необходимо внести изменения.

#. Нажмите на **кнопку с изображением шестеренки** в правом верхнем углу.

#. Выберите **Внести изменения и отправить счёт**.

   .. fancybox:: img/tweak_invoice.png
       :alt: Вы можете изменять счета отдельных заказов и отправлять их по почте.

#. Откроется страница редактирования, на которой можно редактировать следующие атрибуты:

   .. note::

       В случае если документ включается в тело почтового сообщения, то на него распространяются стили из самого почтового сообщения. Таким образом, визуально документ может отличаться от того, что вы увидите при предварительном просмотре.

   * **Тема** — тема письма, содержащего счёт.

   * **Email** — почтовый адрес, на который будет отправлен счёт. Если счёт необходимо отправить на несколько адресов сразу, они записываются таким образом: *test1@example.com,test2@example.com*.

     .. hint::

         Если хотите сохранить изменённый счет у себя, отправьте его одновременно покупателю и самому себе.

   * **Счёт** — счёт, генерируемый из данных заказа. Это тело вашего письма. В этом поле вы можете вносить в счёт любые изменения. Данные изменения не повлияют на данные в вашем магазине. 

   * **Прикрепить PDF-файл** — если поставить галочку, счёт будет продублирован в PDF-файле.

#. Закончив вносить изменения, нажмите **Отправить**. После этого счёт будет отправлен на указанный почтовый адрес. 

   .. warning::

       Изменения будут утеряны после того, как вы покинете страницу редактирования или отправите счёт. Чтобы внести какое-то изменение во все будущие счета, воспользуйтесь :doc:`редактором документов <index>`. 

   .. fancybox:: img/invoice_tweaking_interface.png
       :alt: В счёте, который необходимо изменить, используются реальные данные вместо переменных.
