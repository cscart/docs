*******************
Структура платформы
*******************

Схематичное представление папок и объектов платформы

.. contents:: Содержание
    :local: 
    :depth: 3

Основной каталог
----------------

.. code-block:: none 

    root/
    ├── app/                
    │    ├── addons/               <- Модули и расширения
    │    ├── controllers/          <- Контроллеры, обработка запросов
    │    ├── functions/            <- Функции платформы
    │    ├── lib/                  <- Сторонние PHP-библиотеки
    │    ├── payments/             <- Способы оплаты
    │    ├── schemas/              <- Различные PHP-cхемы
    │    └── Tygh/                 <- Классы платформы
    ├── design/
    │    ├── backend/              <- Дизайн панели администратора
    │    └── themes/               <- Дизайн витрины (темы интернет-магазина)
    ├── images/                    <- Изображения и миниатюры
    ├── install/                   <- Файлы инсталляции
    ├── js/
    │    ├── addons/               <- JavaScript-скрипты модулей
    │    ├── lib/                  <- Сторонние JavaScript-библиотеки
    │    └── tygh/                 <- JavaScript-скрипты платформы
    ├── var/
    │    ├── cache/                <- Кэш
    │    ├── files/                <- Файлы экспорта/импорта
    │    ├── downloads/            <- Файлы цифровых товаров и приложений
    │    ├── langs/                <- Переводы
    │    └── themes_repository/    <- Темы и шаблоны для инсталляции
    ├── admin.php                  <- Скрипт входа администратора
    ├── index.php                  <- Скрипт входа покупателя
    ├── api.php                    <- Скрипт входа API
    ├── config.local.php           <- Настройки веб-сервера
    ├── config.php                 <- Настройки ядра
    └── init.php                   <- Подключение ядра


App: Контроллеры, классы, функции, библиотеки
=============================================

Язык: PHP

.. code-block:: none 

    root/
    └── app/
        ├── addons/                     <- Модули, аддоны, расширения.
        │    ├── [id_модулей]/          <- Название папки соответствует id модуля
        │    ├── banners/               <- Баннеры
        │    ├── rus_yandex_market/     <- Яндекс.Маркет
        │    ├── seo/                   <- SEO
        │    └── ...                    <- и т.д. 
        │    
        ├── controllers/                <- Контроллеры:
        │    ├── backend/               <- Панель администратора
        │    ├── common/                <- Общие
        │    └── frontend/              <- Витрина
        │    
        ├── functions/                  <- Функции платформы:
        │    ├── smarty_plugins/        <- Расширения Smarty
        │    ├── fn.catalog.php         <- Работа с товарами и каталогом
        │    ├── fn.cart.php            <- Работа с заказ и оформление заказа
        │    ├── fn.common.php          <- Общие функции
        │    ├── fn.fs.php              <- Работа с файлами
        │    ├── ...                    <- Другие функции
        │    └── fn.users.php           <- Работа с покупателями
        │    
        ├── lib/                        <- Сторонние библиотеки:
        │    ├── other/                 <- smarty, lessphp, phpmailer, captcha и т.д.
        │    ├── pear/                  <- Crypt, GeoIp, PEAR, Text, Diff
        │    └── vendor/                <- Подключение библиотек
        │    
        ├── payments/                   <- Способы оплаты:
        │    ├── paypal.php             <- PayPal
        │    ├── yandex_money.php       <- Яндекс.Деньги
        │    └── ...                    <- и другие
        │    
        ├── schemas/                    <- PHP схемы:
        │    ├── block_manager/         <- Блоки и менеджер блоков.
        │    ├── exim/                  <- Экспорт/импорт CSV
        │    ├── menu/                  <- Меню панели администратора
        │    ├── permissions/           <- Привилегии и права доступа
        │    ├── promotions             <- Промо-акции
        │    └── ...                    <- и другие схемы
        │    
        └── Tygh/                       <- Классы платформы:
             ├── Api/                   <- Классы и методы RestFULL API
             ├── BlockManager/          <- Классы и методы блоков
             ├── Shippings/             <- Классы и методы способов доставки
             ├── Database.php           <- Методы работы с базой данных
             ├── Http.php               <- Методы для POST и GET запросов
             ├── Registry.php           <- Методы хранилища Registry
             └── ...                    <- и другие

Шаблоны и дизайн панели администратора
======================================

Языки: Smarty, CSS, Less

.. code-block:: none 

    root/
    │
    └ design/                           <- Шаблоны и стили
      │
      └ backend/                        <- Панель администратора                             
        ├─ css/                         <- Стили CSS и LESS
        │   ├── addons/                 <- Стили модулей
        │   │    ├─ [id_модуля]/        <- Название папки соответствует id модуля
        │   │    ├─ hybrid_auth/        
        │   │    ├─ seo/ 
        │   │    └─ ...
        │   │
        │   ├── lib/                    <- Библиотеки стилей
        │   │    ├─ 960/  
        │   │    ├─ bootstrap_switch/ 
        │   │    ├─ daterangepicker/  
        │   │    ├─ twitterbootstrap/ 
        │   │    └─ ui
        │   ├── glyphs.css              <- Стили CSS
        │   ├── styles.less             <- Стили LESS
        │   └── ...
        │
        ├─ mail/                        <- Шаблоны email оповещений и рассылок
        │   ├── media/                  <- Статические данные для писем:
        │   │    └─ images/             <- Изображения
        │   └── templates/              <- Шаблоны email писем по разделам
        │        ├─ addons/  
        │        ├─ common/ 
        │        ├─ companies/  
        │        ├─ orders/ 
        │        ├─ payments/ 
        │        └─ profiles/
        │
        ├─ media/                       <- Статические данные:
        │   ├── fonts/                  <- Шрифты
        │   └── images/                 <- Изображения
        │        ├─ addons/  
        │        ├─ block_manager/ 
        │        ├─ lib/ 
        │        └─ ...
        │
        └─ templates/                   <- Шаблоны панели администратора
            ├── addons/                 <- Модули по папкам
            │    ├─ hybrid_auth/  
            │    ├─ seo/ 
            │    ├─ banners/
            │    └─ ...
            ├── buttons/                <- Кнопки
            │    ├─ button.tpl
            │    ├─ colorpicker.tpl 
            │    ├─ save.tpl
            │    └─ ...
            ├── common/                 <- Общие шаблоны
            │    ├─ scripts.tpl
            │    ├─ styles.tpl 
            │    ├─ price.tpl
            │    └─ ...
            ├── pickers/                <- Всплывающие окна
            │    ├─ categories/         
            │    ├─ products/
            │    ├─ users/
            │    └─ ...
            └── views/                  <- Шаблоны контроллеров (страниц)
                 ├─ payments/
                 ├─ products/
                 ├─ categories/
                 └─ ...              

Шаблоны и дизайн витрины (темы интернет-магазина)
=================================================

Языки: Smarty, CSS, Less

.. code-block:: none 

    root/
    │
    └ design/                                  <- Шаблоны и стили
      │
      └ themes/                                <- Темы   
        │                    
        └ [название_темы]/                     <- Папка с файлами темы. 
          │                                       Например: basic или responsive
          ├── css/                             <- Основные стили CSS или LESS
          │   ├── addons/                      <- Стили модулей
          │   │   ├ [id_модуля]/               
          │   │   ├ banners/                   <- Модуль «Баннеры»
          │   │   ├ hybrid_auth/               <- Модуль «Social Login»
          │   │   └ ...                        <- и другие модули
          │   │        
          │   ├── lib/                         <- Библиотеки стилей
          │   │   ├ bootstrap/            
          │   │   └ ui/            
          │   │
          │   ├── base.css                     <- Файлы CSS и LESS темы
          │   ├── grid.less
          │   ├── print.css
          │   ├── styles.css
          │   └── ...
          │
          ├── layouts/                         <- Схемы макетов для инсталяции темы.
          │   ├── layouts_multivendor.xml  
          │   ├── layouts_ultimate.xml 
          │   └── layouts_widget_mode.xml
          │
          ├── mail/                            <- Шаблоны email писем и счетов
          │   ├── media/                       <- Статические данные
          │       └ images/                    <- Изображения
          │   └── templates/                   <- Шаблоны
          │       ├ addons/                    <- Модули по папкам
          │       │  ├ [id_модуля]/           
          │       │  ├ news_and_emails/
          │       │  └ ...                    
          │       ├ orders/                    <- При заказе
          │       ├ promotions/                
          │       └ ...
          │
          ├── media/                           <- Статические данные
          │   ├── fonts/                       <- Шрифты
          │   └── images/                      <- Изображения
          │       ├ addons/ 
          │       │  ├ [id_модуля]/           
          │       │  ├ image_zoom/
          │       │  └ ...   
          │       ├ icons/                     <- Иконки
          │       ├ lib/ 
          │       ├ patterns/ 
          │       └ ...
          │
          ├── styles/                          <- Стили из визуального редактора
          │   ├── data/                       
          │   │   ├ [название_стиля].css       <- CSS стиля
          │   │   ├ [название_стиля].less      <- LESS стиля
          │   │   ├ [название_стиля].png       <- Иконка стиля
          │   │   └ ...
          │   ├── manifest.json                <- Список стилей
          │   └── schema.json                  <- Настройки визуального редактора
          │
          └── templates/                       <- Smarty шаблоны
              ├── addons/                      <- Хуки и шаблоны модулей
              │   ├ [id_модуля]/
              │   ├ banners/
              │   └ ...
              ├── blocks/                      <- Блоки
              │   ├ categories/                <- Блоки списка (меню) категорий
              │   ├ checkout/                  <- Для страницы оформления заказа
              │   ├ list_templates/            <- Шаблоны списков товаров
              │   ├ menu/                      <- Меню
              │   ├ pages/                     <- Блоки списка (меню) страниц
              │   ├ product_filters/           <- Фильтры товаров
              │   ├ product_list_templates/    <- Шаблоны страницы категории
              │   ├ product_tabs/              <- Вкладки товаров
              │   ├ product_templates/         <- Детальная страница товара
              │   ├ products/                  <- Продуктовые блоки
              │   ├ static_templates/          <- Статические шаблоны
              │   ├ wrappers/                  <- Оболочки блоков
              │   └ [название_шаблона].tpl     <- Различные шаблоны
              ├── buttons/                     <- Кнопки
              │   └ [названия_кнопок].tpl
              ├── common/                      <- Общие шаблоны (заготовки) 
              │   ├ [название_шаблона].tpl
              │   ├ scripts.tpl                <- Подключение всех скриптов
              │   ├ styles.tpl                 <- Подключение всех стилей
              │   ├ price.tpl                  <- Отображение цен
              │   ├ product_data.tpl           <- Обработка данных товаров
              │   └ ....                       <- и другие
              ├── pickers/                     <- Всплывающие окна для выбора объектов
              │   ├ categories/                <- Окно "Выбрать категорию"
              │   └ products/                  <- Окно "Выбрать товар"
              ├── views/                       <- Главные шаблоны платформы
              │   ├ block_manager/             <- Рендер блоков
              │   │   └ render/                
              │   │     ├ location.tpl         <- Шапка, содержимое, подвал
              │   │     ├ container.tpl        <- Подключение контейнера с секциями
              │   │     ├ grid.tpl             <- Подключение секции блоков
              │   │     └ block.tpl            <- Подключение блоков
              │   │ 
              │   ├ [название_контроллера]/    <- Шаблоны контроллеров.
              │   │   └ [режим_mode].tpl       <- Шаблон mode (режима) контроллера
              │   ├ categories/
              │   ├ checkout/
              │   ├ products/
              │   └ ...
              ├ 404.tpl                        <- 404
              ├ index.tpl                      <- Сборка страницы
              └ meta.tpl                       <- Мета данные

Детально
--------

Стили витрины
=============

Все стили платформы и модулей собираются в один файл и кэшируются.

.. code-block:: none 

    root/
    └ design/                                  
      └ themes/       
        └ [название_темы]/                     
          │                                   
          ├── css/                             
          │   ├── addons/                      <- Стили модулей
          │   │   └ [id_модуля]/     
          │   │     ├ styles.css     
          │   │     └ styles.less    
          │   │        
          │   ├── lib/                         <- Библиотеки стилей
          │   │   ├ bootstrap/            
          │   │   └ ui/            
          │   │
          │   ├── base.css                     <- Файлы CSS и LESS темы
          │   ├── grid.less
          │   ├── print.css
          │   ├── styles.css
          │   └── ...                          <- и другие основные стили 
          │
          ├── styles/                          <- Стили из визуального редактора
          │   └── data/                       
          │       ├ [название_стиля].css       <- CSS стиля
          │       └ [название_стиля].less      <- LESS стиля
          │
          └── templates/                       
              └── common/                      
                  └ styles.tpl                 <- Подключение всех стилей


Страница в панели администратора
================================

.. code-block:: none 

    root/
    ├─ app/
    │  ├─ functions/                            <- Функции
    │  │  └─ [функции].php                      <- Функции вызываемые контроллером          
    │  └─ controllers/                          <- Контроллеры
    │     ├─ backend/                           <- Панель администратора
    │     │  └─ [контроллер].php                <- Контроллер страницы
    │     └─ schemas/                           <- Схемы
    │        └─ menu/                           <- Схема меню
    │           └─ menu.php                     
    │
    └─ design/                
       └ backend/                              <- Шаблоны панели администратора
         └ templates/                          <- Шаблоны                   
           └ views/                            <- Собственная страница
             └ [контроллер]/                   <- Контроллер
               └ [режим_контроллера].tpl       <- Режим (mode) контроллера

Страница витрины
================

.. code-block:: none 

    root/
    ├─ app/      
    │  ├─ functions/                            <- Функции
    │  │  └─ [функции].php                      <- Функции вызываемые контроллером            
    │  └ controllers/     
    │    └─ frontend/                           <- Контроллеры витрины
    │       └─ [контроллер].php                 <- контроллер страницы
    └─ design/        
       └ themes/                                <- Дизайн витрины — темы
         └ [название_темы]/         
           └ templates/                         <- Шаблоны                      
             └ views/                           <- Собственная страница
               └ [контроллер]/                  <- Контроллер
                 └ [режим_контроллера].tpl      <- Режим (mode) контроллера

Блок на витрине
===============

.. code-block:: none 

    root/
    ├─ app/                
    │  ├ functions/                          <- Функции для получения содержимого
    │  │ └─ [функции].php                    
    │  └─ schemas/                           <- Схемы
    │     └─ block_manager/                  <- Схемы связанные с блоками
    │        └─ blocks.php                   <- Главная схема блоков
    └─ design/        
       └ themes/                             <- Дизайн витрины — темы
         └ [название_темы]/         
           └ templates/                      <- Шаблоны                      
             └ blocks/                       <- Шаблоны блоков
               ├ [папка_с_блоками]/          <- Папка с блоками по типам
               │ └ [блок].tpl                <- Шаблон блока
               └ [блок].tpl                  <- Или простой шаблон блока

Способ оплаты
=============

.. code-block:: none 

    root/
    ├─ app/                
    │  └ payments/                           <- Способы оплаты
    │    └─ [способ_оплаты].php              <- Скрипт способа оплаты
    │
    └─ design/                
       ├ backend/                            <- Шаблоны панели администратора
       │ └ templates/                                            
       │   └ views/                            
       │     ├ payments/                   
       │     │ └ components/            
       │     │   └ cc_processors/         
       │     │     └ [способ_оплаты].tpl     
       │     └ orders/
       │       └ components/
       │         └ payments/
       │           └ [способ_оплаты].tpl         
       └ themes/                             <- Шаблоны витрины
         └ [название_темы]/         
           └ templates/                                       
             └ views/                            
               ├ checkout/                   
               │ └ processors/                  
               │   └ [способ_оплаты].tpl   
               └ orders/
                 ├ components/
                 │ └ payments/
                 │   └ [способ_оплаты].tpl   
                 └ processors/
                   └ [способ_оплаты].tpl   


Расширение с помощью модуля
---------------------------

Схема модуля
============

.. code-block:: none

    root/
    ├─ app/                
    │  └ addons/                                     
    │    └ [id_модуля]/                              <- Папка модуля
    │       ├─ controllers/                          <- Расширение контроллеров
    │       ├─ database/                             <- MySQL файлы 
    │       ├─ schemas/                              <- Расширение PHP схем
    │       ├─ Tygh/                                 <- Классы и расширения классов
    │       ├─ addon.xml                             <- Главный файл модуля
    │       ├─ config.php                            <- Константы
    │       ├─ func.php                              <- Функции и расширения хуков
    │       └─ init.php                              <- Подключение хуков
    ├─ design/                
    │  ├ backend/                                    <- Шаблоны панели администратора
    │  │ ├ css/                                      <- Стили панели администратора
    │  │ │ └ addons/       
    │  │ │   └ [id_модуля]/                          
    │  │ ├ mail/                                     <- Email и шаблоны счетов
    │  │ │ └ templates/       
    │  │ │   └ addons/              
    │  │ │     └ [id_модуля]/                                              
    │  │ ├ media/                                    <- Статические данные
    │  │ │ └ images/                                 <- Изображения
    │  │ │   └ addons/     
    │  │ │     └ [id_модуля]/                                       
    │  │ └ templates/                                <- Шаблоны, хуки и страницы
    │  │   └ addons/    
    │  │     └ [id_модуля]/                          
    │  └ themes/                                     <- Дизайн витрины — темы
    │    └ [название_темы]/                          <- Название темы
    │      ├ css/                                    <- Стили
    │      │ └ addons/       
    │      │   └ [id_модуля]/                           
    │      ├ mail/                                   <- Шаблоны писем и счетов
    │      │ └ templates/       
    │      │   └ addons/   
    │      │     └ [id_модуля]/                               
    │      ├ media/                                  <- Статические данные
    │      │ └ images/       
    │      │   └ addons/                             <- Изображения модуля   
    │      │     └ [id_модуля]/        
    │      └ templates/                              <- Шаблоны
    │        └ addons/                               <- Хуки, блоки и страницы
    │          └ [id_модуля]/     
    ├ js/                                            <- Скрипты модуля
    │ └ addons/       
    │   └ [id_модуля]/                       
    └ var/                                           <- Хранилище шаблонов модуля     
      └ themes_repository/                           <- Используется при установке
        └ [название_темы]/
          └ ...

Полная схема модуля
===================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                                     <- Модули и расширения
    │    └ [id_модуля]/                              <- Папка модуля
    │       ├─ controllers/                          <- Расширение контроллеров
    │       │  ├─ backend/                           <- Панель администратора
    │       │  │  ├─ [ваш_контроллер].php            <- Новый контроллер
    │       │  │  ├─ [контроллер].pre.php            <- Расширение перед контроллером
    │       │  │  └─ [контроллер].post.php           <- Расширение после контроллером
    │       │  ├─ common/                            <- Общие контроллеры
    │       │  │  ├─ [ваш_контроллер].php            
    │       │  │  ├─ [контроллер].pre.php            
    │       │  │  └─ [контроллер].post.php           
    │       │  └─ frontend/                          <- Контроллеры витрины
    │       │     ├─ [ваш_контроллер].php          
    │       │     ├─ [контроллер].pre.php         
    │       │     └─ [контроллер].post.php          
    │       ├─ database/                             <- MySQL файлы 
    │       ├─ schemas/                              <- Расширение PHP схем 
    │       │  └─ [папка_схем]/                      <- Папка схемы (тип схемы)
    │       │     └─ [название_схемы].post.php       <- Расширение после схемы
    │       ├─ Tygh/                                 <- Классы
    │       │  ├─ Shippings/                         <- Доставки
    │       │  │  └─ Services/                       <- Службы доставки
    │       │  │     └─ [СлужбаДоставки].php         <- Ваша служба доставки
    │       │  └─ [ВашКласс].php                     <- Любой новый класс
    │       ├─ addon.xml                             <- Главный файл модуля
    │       ├─ config.php                            <- Константы
    │       ├─ func.php                              <- Функции и расширения хуков
    │       └─ init.php                              <- Подключение хуков
    ├─ design/                
    │  ├ backend/                                    <- Шаблоны панели администратора
    │  │ ├ css/                                      <- Стили панели администратора
    │  │ │ └ addons/       
    │  │ │   └ [id_модуля]/                          <- Ваш модуль
    │  │ │     ├ styles.css                          <- Ваши стили
    │  │ │     └ styles.less                        
    │  │ ├ mail/                                     <- Email и шаблоны счетов
    │  │ │ └ templates/       
    │  │ │   └ addons/                               <- Модули и аддоны
    │  │ │     └ [id_модуля]/                        <- Папка модуля
    │  │ │       ├ hooks/                            <- Подключение к хукам
    │  │ │       │ └ [тип_хука]/                     <- Папка хука
    │  │ │       │   ├ [название_хука].pre.tpl       <- Код перед хуком
    │  │ │       │   ├ [название_хука].post.tpl      <- Код после хука
    │  │ │       │   └ [название_хука].override.tpl  <- Переписать хук
    │  │ │       ├ [шаблон_письма]_subj.tpl/            
    │  │ │       └ [шаблон_письма].tpl/                     
    │  │ ├ media/                                    <- Статические данные
    │  │ │ └ images/                                 
    │  │ │   └ addons/                           
    │  │ │     └ [id_модуля]/                        <- Изображения вашего модуля    
    │  │ │       ├ изображение_1.jpg/           
    │  │ │       └ изображение_2.png/         
    │  │ └ templates/                                <- Шаблоны
    │  │   └ addons/       
    │  │     └ [id_модуля]/                          
    │  │       ├ hooks/                              <- Подключение к хукам
    │  │       │ ├ index/                            <- Папка хука
    │  │       │ │ ├ scripts.post.tpl                <- Хук подключения вашего скрипта
    │  │       │ │ └ styles.post.tpl                 <- Хук подключения вашего стиля
    │  │       │ └ [тип_хука]/                             
    │  │       │   ├ [название_хука].pre.tpl         <- Ваш код перед хуком            
    │  │       │   ├ [название_хука].post.tpl        <- Ваш код после хука                
    │  │       │   └ [название_хука].override.tpl    <- Ваш код перепишет хук 
    │  │       ├ views/                              <- Собственная страница
    │  │       │ └ [ваш_контроллер]/                 <- Контроллер
    │  │       │   └ [режим_контроллера].tpl         <- Режим (mode) контроллера
    │  │       └ overrides/                          <- Переписать любой шаблон
    │  │         └ ...                               <- Создайте нужную структуру
    │  │   
    │  └ themes/                                     <- Дизайн витрины — темы
    │    └ [название_темы]/                          <- Название темы
    │      ├ css/                                    <- Стили
    │      │ └ addons/       
    │      │   └ [id_модуля]/                        
    │      │     ├ styles.css                        <- Ваш стиль CSS
    │      │     └ styles.less                       <- Ваш стиль LESS
    │      ├ mail/                                   <- Шаблоны писем и счетов
    │      │ └ templates/       
    │      │   └ addons/                             
    │      │     └ [id_модуля]/                            
    │      │       ├ hooks/                          <- Расширение через хуки
    │      │       │ └ [тип_хука]/                             
    │      │       │   ├ [название_хука].pre.tpl                             
    │      │       │   ├ [название_хука].post.tpl                 
    │      │       │   └ [название_хука].override.tpl    
    │      │       ├ [шаблон_письма]_subj.tpl/       <- Шаблон темы письма
    │      │       └ [шаблон_письма].tpl/            <- Шаблон письма
    │      ├ media/                                  <- Статические данные
    │      │ └ images/       
    │      │   └ addons/                             <- Изображения модуля
    │      │     └ [id_модуля]/                     
    │      │       ├ изображение_1.jpg/          
    │      │       └ изображение_2.png/           
    │      └ templates/                              <- Шаблоны
    │        └ addons/       
    │          └ [id_модуля]/                        <- Ваш модуль
    │            ├ hooks/                            <- Расширение хуков
    │            │ ├ index/                          <- Папка хука
    │            │ │ ├ scripts.post.tpl              <- Хук подключения вашего скрипта
    │            │ │ └ styles.post.tpl               <- Хук подключения вашего стиля
    │            │ └ [тип_хука]/                     <- Папка хука
    │            │   ├ [название_хука].pre.tpl       <- Ваш код перед хуком
    │            │   ├ [название_хука].post.tpl      <- Ваш код после хука
    │            │   └ [название_хука].override.tpl  <- Перезаписать хук целиком
    │            ├ views/                            <- Новая страница
    │            │ └ [ваш_контроллер]/               <- Папка вашего контроллера
    │            │   └ [режим_контроллера].tpl       <- Шаблон для режима контроллера
    │            └ overrides/                        <- Переписать любой шаблон темы
    │              └ ...                             <- Файл который нужно переписать
    │
    ├ js/                                            <- Скрипты модуля
    │ └ addons/       
    │   └ [id_модуля]/                         
    │     └ func.js/                          
    └ var/                                           <- Хранилище шаблонов модуля     
      └ themes_repository/                           <- Используется при установке
        └ [название_темы]/
          └ ...

Подключить стиль CSS или LESS
=============================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                                     <- Модули и расширения
    │    └ [id_модуля]/                              <- Папка модуля
    │       └─ addon.xml                             <- Главный файл модуля
    │
    └─ design/                
       └ themes/                                     <- Дизайн витрины — темы
         └ [название_темы]/                          <- Название темы
           ├ css/                                    <- Стили
           │ └ addons/       
           │   └ [id_модуля]/                        
           │     ├ styles.css                        <- Ваш стиль CSS
           │     └ styles.less                       <- Ваш стиль LESS
           │
           ├ media/                                  <- Статические данные
           │ └ images/       
           │   └ addons/                             <- Изображения модуля
           │     └ [id_модуля]/                     
           │       └ изображение_фона.png/           <- Например, изображение фона
           │
           └ templates/                              <- Подключить стиль в шаблоне
             └ addons/       
               └ [id_модуля]/                        
                 └ hooks/                            
                   └ index/                           
                     └ styles.post.tpl               <- Хук подключения вашего стиля

Новая страница в панели администратора
======================================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                                     <- Модули и расширения
    │    └ [id_модуля]/                              <- Папка модуля
    │       ├─ controllers/                          <- Контроллеры
    │       │  └─ backend/                           <- Панель администратора
    │       │     └─ [ваш_контроллер].php            <- Новый контроллер
    │       ├─ schemas/                              <- Расширение PHP схем 
    │       │  └─ menu/                              <- Схема меню
    │       │     └─ menu.post.php                   <- Добавить новый пункт в меню
    │       ├─ addon.xml                             <- Главный файл модуля
    │       └─ func.php                              <- Функции
    └─ design/                
       └ backend/                                    <- Шаблоны панели администратора
         └ templates/                                <- Шаблоны
           └ addons/       
             └ [id_модуля]/                          
               └ views/                              <- Собственная страница
                 └ [ваш_контроллер]/                 <- Контроллер
                   └ [режим_контроллера].tpl         <- Режим (mode) контроллера

Новая страница витрины
======================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                                       <- Модули и расширения
    │    └ [id_модуля]/                                <- Папка модуля
    │       ├─ controllers/                            <- Расширение контроллеров
    │       │  └─ frontend/                            <- Панель администратора
    │       │     └─ [ваш_контроллер].php              <- Новый контроллер
    │       ├─ addon.xml                               <- Главный файл модуля
    │       └─ func.php                                <- Функции
    └─ design/        
       └ themes/                                       <- Дизайн витрины — темы
         └ [название_темы]/         
           └ templates/                                <- Шаблоны
             └ addons/       
               └ [id_модуля]/                          
                 └ views/                              <- Собственная страница
                   └ [ваш_контроллер]/                 <- Контроллер
                     └ [режим_контроллера].tpl         <- Режим (mode) контроллера

Новый блок на витрине
=====================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                             <- Модули и расширения
    │    └ [id_модуля]/                      <- Папка модуля
    │       ├─ schemas/                      <- Расширение PHP схем 
    │       │  └─ block_manager/             <- Схемы связанные с блоками
    │       │     └─ blocks.post.php         <- Расширить схему блоков
    │       ├─ addon.xml                     <- Главный файл модуля
    │       └─ func.php                      <- Функции для получения содержимого
    └─ design/        
       └ themes/                             <- Дизайн витрины — темы
         └ [название_темы]/         
           └ templates/                      <- Шаблоны                      
             └ addons/       
               └ [id_модуля]/                          
                 └ blocks/                   
                   └ [ваш_блок].tpl          <- Шаблон нового блока


Новый способ доставки
=====================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                             
    │    └ [id_модуля]/                      
    │       ├─ Tygh/                              <- Расширение класса
    │       │  └─ Shippings/                      <- Способов доставки
    │       │     └─ Services/             
    │       │        └─ [СпособДоставки].php      <- Скрипт подключения к API
    │       ├─ addon.xml                          <- Главный файл модуля
    │       └─ func.php                           <- Функции
    └─ design/        
       └ themes/                             
         └ [название_темы]/                       <- Отобразить
           └ templates/                           <- дополнительную информацию         
             └ addons/                            <- на шаге выбора 
               └ [id_модуля]/                     <- способа доставки      
                 └ hooks/                         <- в помощью
                   └ checkout/                    <- хука в шаблоне
                     └ shipping_method.post.tpl/  <- способов доставки
