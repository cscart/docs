***************
Социальные сети
***************


.. contents:: Вы узнаете:
    :local: 
    :depth: 3



Авторизация через социальные сети
---------------------------------

Модуль CS-Cart "Вход через соцсети" позволяет покупателям авторизоваться с помощью социальных сетей и почтовых сервисов (ВКонтакте, Яндекс, Mail.ru, Одноклассники и др.).

Модуль использует библиотеку с открытым исходным кодом — |link_1| . HybridAuth популярна, активно развивается и имеет множество провайдеров.

.. |link_1| raw:: html

       <!--noindex--><a href="http://hybridauth.sourceforge.net/" target="_blank" rel="nofollow">HybridAuth</a><!--/noindex-->

Вход через соцсети
==================

.. fancybox:: img/hybrid_auth_33.png
    :alt: HybridAuth  

Описание
++++++++

Модуль «Вход через соцсети» позволяет покупателям авторизоваться в вашем интернет-магазине с помощью:

*   Яндекс

*   Вконтакте

*   Одноклассники

*   Mail.ru

*   Google

*   Facebook

*   Twitter

*   OpenID

*   и других сервисов и социальных сетей. 

Покупатель может привязать сразу несколько социальных сетей к одному аккаунту.

.. fancybox:: img/hybrid_auth_49.png
    :alt: HybridAuth  

.. hint::

    Помимо прочих способов интеграции с различными сервисами и социальными сетями, :doc:`можно встроить свой магазин на страницу Facebook. </user_guide/look_and_feel/layouts/widget_mode/facebook_app>`

Настройка модуля
++++++++++++++++

#. Установите модуль «Вход через соцсети» в панели администратора

   .. fancybox:: img/hybrid_auth_25.png
       :alt: HybridAuth

#. Откройте настройки модуля, кликнув по названию.   

   Доступные настройки:

   .. list-table::
       :stub-columns: 1
       :widths: 10 30

       *   -   Иконки

           -   Выберите размер иконок социальных сетей. Доступные размеры:

               *   24х24px

               *   32х32px

               *   64х64px

               .. note::

                   Вы можете изменить или создать свои иконки, в том числе собственного размера. Иконки расположены в папке: 

                   ``/design/themes/[название_темы]/media/images/addons/hybrid_auth/icons/``

                   Просто создайте свою папку или измените существующую. Иконки будут автоматически доступны.

       *   -   Автогенерация электронной почты 

           -   Некоторые социальные сети и сервисы не предоставляют email покупателя. В данной ситуации возможно два варианта:

               1.  Покупателю будет предложено ввести адрес электронной почты, перед авторизацией.

               2.  Покупатель будет сразу авторизован, email будет сгенерирован автоматически

#. Создайте необходимых провайдеров на специальной странице **Веб сайт → Вход через соцсети**.


#. Создайте нового провайдера (сервис) с помощью кнопки **+**.

   .. fancybox:: img/hybrid_auth_30.png
       :alt: HybridAuth   

#. Нажмите на название сервиса, чтобы выполнить настройку.

   .. fancybox:: img/hybrid_auth_31.png
       :alt: HybridAuth  

   .. fancybox:: img/hybrid_auth_32.png
       :alt: HybridAuth  

Для каждого провайдера (сервиса) необходимо получить API ключи. Как получить API ключи, читайте в следующем разделе.


Получить ключи API социальных провайдеров
=========================================

Yandex
++++++

1.  Авторизуйтесь на сайте |link_yandex|

    .. |link_yandex| raw:: html

           <!--noindex--><a href="http://www.yandex.ru/" target="_blank" rel="nofollow">www.yandex.ru</a><!--/noindex-->

2.  Пройдите на страницу API OAuth-авторизация: |link_yandex_oauth|

    .. |link_yandex_oauth| raw:: html

           <!--noindex--><a href="https://tech.yandex.ru/oauth/" target="_blank" rel="nofollow">tech.yandex.ru/oauth</a><!--/noindex-->

    .. fancybox:: img/hybrid_auth_16.png
        :alt: HybridAuth

3.  |link_yandex_register| новое приложение на OAuth-сервере Яндекса.

    .. |link_yandex_register| raw:: html

           <!--noindex--><a href="https://oauth.yandex.ru/client/new" target="_blank" rel="nofollow">Зарегистрируйте</a><!--/noindex-->

    .. fancybox:: img/hybrid_auth_17.png
        :alt: HybridAuth

4.  Выполните настройку нового приложения.

    .. list-table::
        :stub-columns: 1
        :widths: 10 30

        *   -   Название

            -   Будет отображаться в окне авторизации пользователя на вашем сайте.

        *   -   Описание

            -   На ваше усмотрение

        *   -   Права

            -   Яндекс.Логин

                *   Адрес электронной почты

                *   Дата рождения

                *   Имя пользователя, ФИО, пол

        *   -   Ссылка на иконку

            -   URL логотипа

        *   -   Ссылка на приложение    

            -   URL интернет-магазина

        *   -   Callback URI 

            -   ``http://ваш_домен/index.php?dispatch=auth.process&hauth_done=Yandex``       

    Создать!

    .. fancybox:: img/hybrid_auth_19.png
        :alt: HybridAuth

4.  Будет создано приложение и вам будут доступные данные:

    *   Id приложения

    *   Пароль приложения

    .. fancybox:: img/hybrid_auth_18.png
        :alt: HybridAuth

5.  Пройдите в панель администратора интернет-магазина и добавьте нового провайдера «Yandex». Используйте данные созданного приложения.

    .. fancybox:: img/hybrid_auth_21.png
        :alt: HybridAuth

    .. fancybox:: img/hybrid_auth_22.png
        :alt: HybridAuth

    .. fancybox:: img/hybrid_auth_23.png
        :alt: HybridAuth

Всё!

Созданные вами приложения доступны на специальной странице: |link_yandex_my|

.. |link_yandex_my| raw:: html

       <!--noindex--><a href="https://oauth.yandex.ru/client/my" target="_blank" rel="nofollow">https://oauth.yandex.ru/client/my</a><!--/noindex-->


.. fancybox:: img/hybrid_auth_24.png
    :alt: HybridAuth



Google
++++++

.. note::

    Из-за `закрытия Google+ API <https://developers.google.com/+/api-shutdown?hl=ru>`_ вам понадобится как минимум CS-Cart или Multi-Vendor 4.9.2 SP4. В этих версиях реализован вход на сайт через Gmail без Google+ API.

#. Создайте проект в `Google API Console <https://console.developers.google.com/project>`_.

#. Перейдите на страницу `Учётные данные <https://console.developers.google.com/apis/credentials>`_ и создайте **Идентификатор клиента OAuth** для *веб-приложения*.

   .. important::

       На этом шаге скопируйте ссылку из настроек провайдера Google на стороне CS-Cart и вставьте её как **Разрешённый URI перенаправления** на стороне Google.

   .. fancybox:: img/social_login_google.png
       :alt: Создание реквизитов Google API для входа в магазин на CS-Cart через Gmail.

#. После создания учётных данных вы увидите **Идентификатор клиента** и **Секрет клиента**. Скопируйте их в настройки провайдера Google на стороне CS-Cart и сохраните изменения. После этого покупатели смогут зарегистрироваться и войти в магазин через свои учётные записи Gmail.


ВКонтакте
+++++++++

.. note::

    На стороне Вконтакте произошли изменения. Поэтому авторизация через эту социальную сеть теперь доступна только в CS-Cart 4.10.2 и более новых версиях. Если вы используете старую версию, рекомендуем обновиться – в новых версиях есть другие улучшения и исправления. Если с обновлением возникли сложности, обращайтесь `в службу технической поддержки CS-Cart <https://helpdesk.cs-cart.com>`_.

Создайте новое приложение Вконтакте.

1.  Откройте сайт vk.com и пройдите в раздел «Приложения» → «Управление» : |link_vk|

    .. |link_vk| raw:: html

           <!--noindex--><a href="http://vk.com/apps?act=manage" target="_blank" rel="nofollow">http://vk.com/apps?act=manage</a><!--/noindex-->

    .. fancybox:: img/hybrid_auth_34.png
        :alt: HybridAuth

2.  Нажмите «Создать приложение».

    Необходимые настройки:

    .. list-table::
        :stub-columns: 1
        :widths: 10 30

        *   -   Название

            -   Ваш интернет-магазин

        *   -   Тип

            -   Веб-сайт       

        *   -   Адрес сайта

            -   ``http://ваш_домен/``

        *   -   Базовый домен

            -   ``http://ваш_домен/``

    .. fancybox:: img/hybrid_auth_35.png
        :alt: HybridAuth

3.  Будет создано приложение. 

    .. fancybox:: img/hybrid_auth_37.png
        :alt: HybridAuth

4.  Откройте вкладку «Настройки» и получите настройки для провайдера:

    *   ID приложения

    *   Защищенный ключ

    .. fancybox:: img/hybrid_auth_36.png
        :alt: HybridAuth

5.  Создайте нового провайдера «Vkontakte» на странице «Social Login».

    .. fancybox:: img/hybrid_auth_38.png
        :alt: HybridAuth    

Успех!

Facebook
++++++++

#. Зарегистрируйтесь на портале `Facebook for Developers <https://developers.facebook.com/apps>`_.

#. Зайдите в раздел `Мои приложения <https://developers.facebook.com/apps/>`_ и добавьте новое приложение. Используйте для приложения такое же название, как у вашего магазина — покупатели увидят название приложения, когда попытаются войти в учётную запись в магазине через Facebook. Поэтому название магазина там будет смотреться естественно.

#. Найдите и добавьте в своё прилжение продукт **Вход через Facebook**. Предложение его настроить может появиться при создании приложения или на главной панели; ещё вы можете воспользоваться для этого разделом **Продукты**.

#. Откройте настройки продукта **Вход через Facebook**. Там нужно будет заполнить значение настройки **Действительные URI перенаправления для OAuth** — скопируйте это значение из настроек провайдера Facebook в панели администратора CS-Cart, а затем сохраните свои изменения на стороне Facebook.

#. Перейдите в основные настройки вашего приложения на Facebook. Скопируйте **Идентификатор приложения** и **Секрет приложения** и вставьте их в соответствующие поля провайдера Facebook в CS-Cart. Сохраните свои изменения на стороне CS-Cart.

   .. important::

       На этом этапе в магазин уже можно войти через *вашу* учётную запись Facebook. Но приложение всё ещё в разработке, поэтому покупатели пока ещё не могут войти в учётные записи через Facebook.

#. Чтобы покупатели могли войти через Facebook, переведите его в рабочий режим на стороне Facebook. Для этого от вас могут потребоваться дополнительные действия (например, добавить ссылку на политику конфиденциальности).

   .. fancybox:: img/social_login_facebook.png
       :alt: Создание приложения, чтобы была возможность авторизоваться в магазине на CS-Cart через Facebook.

Twitter
+++++++

1.  Пройдите на страницу: |link_twitter|

    .. |link_twitter| raw:: html

           <!--noindex--><a href="https://apps.twitter.com/" target="_blank" rel="nofollow">https://apps.twitter.com/</a><!--/noindex-->
   
2.  Нажмите «Create New Apps».

    .. fancybox:: img/hybrid_auth_50.png
        :alt: HybridAuth 

3.  Выполните первоначальную настройку приложения:

    .. list-table::
        :stub-columns: 1
        :widths: 10 30

        *   -   Name

            -   Название

        *   -   Description

            -   Описание

        *   -   Website

            -   URL

        *   -   Callback URL

            -   ``http://ваш_домен/index.php?dispatch=auth.process&hauth_done=Twitter``

        *   -   Yes, I agree

            -   Соглашаемся с условиями.       

    .. fancybox:: img/hybrid_auth_51.png
        :alt: HybridAuth 

4.  Вам будет создано приложение. Переходите в раздел «API Keys», где будут доступны:

    *   API key — ID

    *   API secret — Секретный ключ

    .. fancybox:: img/hybrid_auth_52.png
        :alt: HybridAuth 

    .. fancybox:: img/hybrid_auth_53.png
        :alt: HybridAuth 

5.  Создайте нового провайдера для сервиса «Twitter» в панели администратора. 

    .. fancybox:: img/hybrid_auth_54.png
        :alt: HybridAuth 

Готово!


Одноклассники
+++++++++++++

1.  Получите права разработчика на странице: |link_odnoklassniki|

    .. |link_odnoklassniki| raw:: html

           <!--noindex--><a href="http://www.odnoklassniki.ru/devaccess" target="_blank" rel="nofollow">http://www.odnoklassniki.ru/devaccess</a><!--/noindex-->

2.  Заполните необходимые настройки для нового приложения.

    .. fancybox:: img/hybrid_auth_58.png
        :alt: HybridAuth 

3.  API-ключи будут отправлены на вашу электронную почту. 

    .. fancybox:: img/hybrid_auth_56.png
        :alt: HybridAuth 

    .. fancybox:: img/hybrid_auth_57.png
        :alt: HybridAuth 

4.  Создайте нового провайдера используя полученные ключи.

    .. fancybox:: img/hybrid_auth_59.png
        :alt: HybridAuth 

Mail.ru
+++++++

1.  Пройдите в сервис «Сайты» от api.mail.ru: |link_mailru|

    .. |link_mailru| raw:: html

           <!--noindex--><a href="http://api.mail.ru/sites/" target="_blank" rel="nofollow">http://api.mail.ru/sites/</a><!--/noindex-->

    .. fancybox:: img/hybrid_auth_60.png
        :alt: HybridAuth 

2.  Нажмите «Подключить сайт» и соглашайтесь с условиями.

3.  Заполните настройки на втором шаге регистрации:

    *   Название

    *   Адрес главной страницы

    .. fancybox:: img/hybrid_auth_61.png
        :alt: HybridAuth 

4.  Видим, что нам предлагают скачать и разместить файл receiver.html в основном каталоге интернет-магазина. 

    Можно скачать и разместить, а можно пропустить.
    
    .. fancybox:: img/hybrid_auth_62.png
        :alt: HybridAuth 

5.  Сайт будет добавлен, и вы получите все необходимые ключи:

    *   ID

    *   Приватный ключ

    *   Секретный ключ
    
    .. fancybox:: img/hybrid_auth_63.png
        :alt: HybridAuth 

6.  Пройдите в панель администратора и создайте нового провайдера с помощью модуля «Social Login».

    .. fancybox:: img/hybrid_auth_64.png
        :alt: HybridAuth 

Финиш!



