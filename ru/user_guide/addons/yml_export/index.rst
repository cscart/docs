*************************
"Экспорт в Яндекс.Маркет"
*************************

.. epigraph::

   YML (Yandex Market Language) — это стандарт, разработанный Яндексом для принятия и размещения информации в базе данных Яндекс.Маркета. YML основан на стандарте XML. Единый формат представления данных позволяет быстро и качественно обрабатывать предоставляемую магазинами информацию о товарах и услугах.

   -- |ym_yml|

.. |ym_yml| raw:: html

   <!--noindex--><a href="https://yandex.ru/support/webmaster/goods-prices/technical-requirements.xml?lang=ru" target="_blank" rel="nofollow">Официальный сайт Яндекса</a><!--/noindex-->

.. contents:: Вы узнаете:
    :local: 
    :depth: 3


Полезные ссылки
===============

*   |yml_register|

.. |yml_register| raw:: html

   <!--noindex--><a href="https://partner.market.yandex.ru/pre/index.xml" target="_blank" rel="nofollow">Регистрация нового магазина на Яндекс.Маркет</a><!--/noindex-->


*   |yml_help|

.. |yml_help| raw:: html

   <!--noindex--><a href="http://help.yandex.ru/partnermarket/" target="_blank" rel="nofollow">Помощь и много полезного</a><!--/noindex-->


*   |yml_clothes|

.. |yml_clothes| raw:: html

   <!--noindex--><a href="https://yandex.ru/support/partnermarket/guides/clothes.xml" target="_blank" rel="nofollow">Одежда, обувь и аксессуары</a><!--/noindex-->

*   |ym_bid_1|

.. |ym_bid_1| raw:: html

   <!--noindex--><a href="http://help.yandex.ru/partnermarket/yml-auction.xml" target="_blank" rel="nofollow">Управление ставками через YML</a><!--/noindex-->


Основные настройки
===================

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    price/index

    product/index

    category/index

    apparel/index

    exim/index

    unit/index

Создать и открыть прайс-лист
============================

#. Откройте страницу прайс-листов.

   .. fancybox:: img/yml_price_list.png
       :alt: Прайс-листы

#. Нажмите на кнопку добавления прайс-листа.

   .. fancybox:: img/yml_add_price.png
       :alt: Добавить новый прайс-лист

#. Укажите необходимые настроки и нажмите кнопку **Создать**.

   .. fancybox:: img/yml_save_price.png
       :alt: Сохранить и закрыть прайс-лист

#. Теперь прайс-лист (YML-файл) можно сгенерировать и открыть.

   .. fancybox:: img/yml_generate_open_price.png
       :alt: Генерация и открытие прайс-листа


   .. important::

       Первое создание прайс-листа может занять продолжительное время, так как будет запущен процесс создания миниатюр. После обновления данных у товаров и категорий нужно снова генерировать YML-файл.


Отправить прайс-лист в Яндекс.Маркет
====================================

*   |yml_yandex_market|

.. |yml_yandex_market| raw:: html

   <!--noindex--><a href="https://yandex.ru/support/partnermarket/export/feed.xml" target="_blank" rel="nofollow">Работа с прайс-листом на Яндекс.Маркет</a><!--/noindex-->


Сохранить прайс-лист на компьютер
=================================

#. Откройте прайс-лист в браузере по ссылке:

   ``ваш_домен/yml_get/<access_key>``

#. Кликните правой клавишей мыши по странице и нажмите «Сохранить как».

   .. fancybox:: img/yandex_market_export_20.png
       :alt: Яндекс.Метрика

#. Сохраните файл в формате «.yml» . Например: ``yandex.yml``

   .. fancybox:: img/yandex_market_export_21.png
       :alt: Яндекс.Метрика

.. toctree::
    :hidden:

    yandex_market/index
