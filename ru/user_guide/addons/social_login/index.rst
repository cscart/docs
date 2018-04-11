***************
Социальные сети
***************


.. contents:: Вы узнаете:
    :local: 
    :depth: 3



Авторизация через социальные сети
---------------------------------

Модуль CS-Cart "Вход через соцсети" позволяет покупателям авторизоваться с помощью социальных сетей и почтовых сервисов (Вконтакте, Яндекс, Mail.ru, Одноклассники и др.).

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

*   и другие сервисы и социальные сети. 

Покупатель может привязать сразу несколько социальных сетей к одному аккаунту.

.. fancybox:: img/hybrid_auth_49.png
    :alt: HybridAuth  

.. hint::

    Помимо прочих способов интеграции с различными сервисами и социальными сетями, :doc:`можно встроить свой магазин на страницу Facebook. <../../look_and_feel/layouts/widget_mode/facebook_app>`

Настройка модуля
++++++++++++++++

1.  Установите модуль «Вход через соцсети» в панели администратора

    .. fancybox:: img/hybrid_auth_25.png
        :alt: HybridAuth

2.  Откройте настройки модуля, кликнув по названию. 

    .. fancybox:: img/hybrid_auth_26.png
        :alt: HybridAuth    

    .. fancybox:: img/hybrid_auth_28.png
        :alt: HybridAuth    

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

3.  Создайте необходимых провайдеров на специальной странице «Вход через соцсети»

    .. note:: 

        Панель администратора → Веб сайт → Вход через соцсети

    .. fancybox:: img/hybrid_auth_29.png
        :alt: HybridAuth    

    Данная страница позволяет создавать и редактировать настройки провайдеров.

4.  Создайте нового провайдера (сервис) с помощью кнопки **+**.

    .. fancybox:: img/hybrid_auth_30.png
        :alt: HybridAuth   

5.  Нажмите на название сервиса, чтобы выполнить настройку.

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

Необходимо создать новое приложение Google, это не сложно.

1.  Создайте новый проект в Google по ссылке: |link_google|

    .. |link_google| raw:: html

           <!--noindex--><a href="https://console.developers.google.com/project" target="_blank" rel="nofollow">https://console.developers.google.com/project</a><!--/noindex-->

    Нажмите «Create Project»

    .. fancybox:: img/hybrid_auth_01.png
        :alt: HybridAuth


2.  Введите название и ID проекта. 

    .. fancybox:: img/hybrid_auth_02.png
        :alt: HybridAuth

    Проект будет создан

    .. fancybox:: img/hybrid_auth_03.png
        :alt: HybridAuth

3.  Пройдите в раздел «Projects» 

    .. fancybox:: img/hybrid_auth_04.png
        :alt: HybridAuth


4.  Пройдите в настройки созданного проекта, кликнув по его названию.

    .. fancybox:: img/hybrid_auth_05.png
        :alt: HybridAuth

5.  Откройте раздел «APIS & AUTH» → «Credentials»

    .. fancybox:: img/hybrid_auth_07.png
        :alt: HybridAuth

6.  Нажмите «Create new Client ID»

    .. fancybox:: img/hybrid_auth_08.png
        :alt: HybridAuth

7.  Выполните настройку.

    .. fancybox:: img/hybrid_auth_13.png
        :alt: HybridAuth

    .. list-table::
        :stub-columns: 1
        :widths: 10 30

        *   -   Web aplication

            -   Да

        *   -   AUTHORIZED JAVASCRIPT ORIGINS

            -   Адрес вашего интернет-магазина.

                Например: ``http://ваш_домен/``

        *   -   AUTHORIZED REDIRECT URI

            -   ``http://ваш_домен/index.php?dispatch=auth.process&hauth_done=Google``

8.  Будет создано приложение и вы увидите данные настроек провайдера в интернет-магазине:

    *   CLIENT ID — ID

    *   CLIENT SECRET — Секретный ключ             

    .. fancybox:: img/hybrid_auth_14.png
        :alt: HybridAuth

9.  Для того чтобы заработала авторизация Google, необходимо добавить Contacts API и Google+ API в секцию Enabled APIs. Добавить данные API вы можете, выбрав статус ON у Contacts API и Google+ API из списка Browse APIs.

    .. fancybox:: img/Selection_162.jpeg
        :alt: HybridAuth

10.  Создайте нового провайдера «Google» в панели администратора интернет-магазина, используя данные созданного приложения.

    .. fancybox:: img/hybrid_auth_12.png
        :alt: HybridAuth



Финиш!

Дополнительные настройки вашего Google приложения вы можете настроить в разделе «Consent screen»

.. fancybox:: img/hybrid_auth_15.png
    :alt: HybridAuth


Вконтакте
+++++++++

.. note::

    В связи с техническими изменениями на стороне Вконтакте, поддержка авторизации через эту социальную сеть доступна только в CS-Cart 4.7.3 и более новых версиях. Если вы используете старую версию, рекомендуем обновиться – в новых версиях есть другие улучшения и исправления. Если с обновлением возникли сложности, обращайтесь `в службу технической поддержки CS-Cart <https://helpdesk.cs-cart.com>`_.

Создайте новое приложение Вконтакте.

1.  Откройте сайт vk.com и пройдите в раздел «Приложения» → «Управление» : |link_vk|

    .. |link_vk| raw:: html

           <!--noindex--><a href="http://vk.com/apps?act=manage" target="_blank" rel="nofollow">http://vk.com/apps?act=manage</a><!--/noindex-->

    .. fancybox:: img/hybrid_auth_34.png
        :alt: HybridAuth

2.  Нажмите «Создать приложение».

    Наобходимые настройки:

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

1.  Авторизуйтесь на сайте  |link_facebook|

    .. |link_facebook| raw:: html

           <!--noindex--><a href="https://www.facebook.com/" target="_blank" rel="nofollow">Facebook</a><!--/noindex-->

2.  Пройдите в раздел «Разработчикам» по ссылке в нижней части настроек аккаунта.

    .. fancybox:: img/hybrid_auth_39.png
            :alt: HybridAuth 

    Прямая ссылка на раздел «Разработчикам»: |link_facebook_dev|

    .. |link_facebook_dev| raw:: html

           <!--noindex--><a href="https://developers.facebook.com" target="_blank" rel="nofollow">https://developers.facebook.com</a><!--/noindex-->

4.  Нажмите «Create New App»

    .. fancybox:: img/hybrid_auth_40.png
        :alt: HybridAuth 

5.  Выполните настройку:

    .. list-table::
        :stub-columns: 1
        :widths: 10 30

        *   -   Display name

            -   Название приложения

        *   -   Namespace

            -   Любой идентификатор, только строчные буквы, тире и подчёркивание. 

        *   -   Категория

            -   Выберите из списка.

    .. fancybox:: img/hybrid_auth_42.png
        :alt: HybridAuth 

6.  Вам будет создано приложение и кличи для настроек авторизации.
   
    *   App ID — ID

    *   App Secret — Секретный ключ

    .. fancybox:: img/hybrid_auth_43.png
        :alt: HybridAuth 

7.  Пройдите в раздел Settings (Настройки).

    .. fancybox:: img/hybrid_auth_45.png
        :alt: HybridAuth 

8.  Заполните настройки:

    *   App Domains — домены.

    *   Contact Email — email.

    .. fancybox:: img/hybrid_auth_46.png
        :alt: HybridAuth 

9.  Нажмите «+Add Platform». Выберите «Website». Заполните URL интернет-магазина.

    .. fancybox:: img/hybrid_auth_47.png
        :alt: HybridAuth 
    
    .. fancybox:: img/hybrid_auth_48.png
        :alt: HybridAuth 

    Нажмите «Save Changes»


10. Включите приложение на вкладке «Status & Review»

    .. fancybox:: img/hybrid_auth_48_1.png
        :alt: HybridAuth 

11. Пройдите на страницу создания провайдеров в панели администратора интернет-магазина. 

    Создайте нового провайдера с сервисом «Facebook», используя ключи из приложения Facebook.

    .. fancybox:: img/hybrid_auth_44.png
        :alt: HybridAuth

12. Откройте страницу своего приложения на сайте разработчиков «Facebook». На панели управления откройте вкладку «Facebook Login». 
    
    .. fancybox:: img/hybrid_auth_66.png
        :alt: HybridAuth

    Выключите опцию «Use Strict Mode for Redirect URIs» или укажите в поле «Valid OAuth redirect URIs» URI вида: [STORE_URL]/index.php?dispatch=auth.process&hauth_done=Facebook 

    Например, https://domain.com/index.php?dispatch=auth.process&hauth_done=Facebook

    .. fancybox:: img/hybrid_auth_67.png
        :alt: HybridAuth

Готово!

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

5.  Сайт будет добавлен и вы получите все необходимые ключи:

    *   ID

    *   Приватный ключ

    *   Секретный ключ
    
    .. fancybox:: img/hybrid_auth_63.png
        :alt: HybridAuth 

6.  Пройдите в панель администратора и создайте нового провайдера с помощью модуля «Social Login».

    .. fancybox:: img/hybrid_auth_64.png
        :alt: HybridAuth 

Финиш!



