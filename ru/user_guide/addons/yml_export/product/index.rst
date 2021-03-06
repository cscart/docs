Настройки товара
----------------

.. fancybox:: img/yml_product.png
    :alt: Товар

Откройте редактирование товара и перейдите на вкладку **Экспорт в Яндекс.Маркет**.

.. hint::

    На странице **Товары → Товары** можно выбрать сразу несколько товаров, и воспользоваться функцией **Редактировать выбранные** на кнопке с изображением шестерёнки. Так вы сможете поменять настройки, связанные с Янедкс.Маркетом, у нескольких товаров сразу.

Общее
=====


.. list-table::
    :stub-columns: 1
    :widths: 20 30

    *   -   Тип товарного предложения

        -   Какой формат предложения будет использоваться для выгрузки этого товара. Переопределяет настройку категории. Для типов *Одежда*, *Книга*, *Видео* и *Аудио* можно выгружать :doc:`вариации товаров </user_guide/manage_products/products/product_variations>`. Желательно называть :doc:`характеристики </user_guide/manage_products/features/index>` так же, `как name у param в Яндекс.Маркете <https://yandex.ru/support/partnermarket/elements/param.html>`_.

    *   -   Исключить экспорт

        -   Выберите прайс-листы, в которых товара не должно быть.

    *   -   Бренд

        -   <brand>

            Обязательное поле для типа экспорта "Произвольный тип описания" (vendor.model)

            Если в настройках модуля выбрана характеристика для данного поля, то можно не заполнять.

    *   -   Модель

        -   <model>

            Обязательное поле для типа экспорта "Произвольный тип описания" (vendor.model)

    *   -   Группа товаров/категория (typePrefix):

        -   <typePrefix>

            Необязательное поле. |yml_type_prefix|

    *   -   Sales notes

        -   <sales_notes>

            Короткий промо-текст. |yml_notes|

    *   -   Категория Яндекс.Маркета

        -   Товар будет отображаться в данной категории Яндекс.Маркета.

            Мы добавили полный список категорий Яндекс.Маркета, просто начните вводить название категории в поле.

    *   -   Страна-производитель

        -   <country_of_origin>

            Страна производства товаров.

    *   -   Гарантия производителя

        -   <manufacturer_warranty>

            Формат поля должен соответствовать ISO 8601, например, P1Y2M10DT2H30M - 1 год, 2 месяца, 10 дней, 2 часа и 30 минут.

    *   -   Гарантия продавца

        -   <seller_warranty>

            Формат поля должен соответствовать ISO 8601, например, P1Y2M10DT2H30M - 1 год, 2 месяца, 10 дней, 2 часа и 30 минут.

    *   -   Время жизни

        -   <expiry>

            Срока годности / срока службы. Формат поля "expiry" должен соответствовать ISO 8601, например, P1Y2M10DT2H30M - 1 год, 2 месяца, 10 дней, 2 часа и 30 минут.


    *   -   Основная ставка

        -   <bid> (oсновная ставка)

            *   |ym_bid_1|

            *   |ym_bid_2|

    *   -   Ставка для карточек

        -   <cbid> (cтавка на клик для карточек);

            *   |ym_bid_1|

            *   |ym_bid_2|

    *   -   Размер комиссии

        -   `Атрибут fee <https://yandex.ru/support/partnermarket/elements/fee.xml>`_

    *   -   Покупная цена

        -

    *   -   Товары для взрослых

        -

.. important::

    Элемент ``<downloadable>true</downloadable>`` (обозначает товар, который можно скачать) добавляется автоматически, если соблюдены все эти условия:

    * Выбран любой тип товарного предложения, кроме типа *Одежда*.

    * Товар является цифровым (подробнее см. `в видеоуроках по CS-Cart <https://www.cs-cart.ru/videos/admin/kak-prodavat-cifrovye-tovary-v-internet-magazine-na-cs-cart.html>`_).

    * Вы не отключили добавление этого элемента во вкладке **Экспортируемые поля** :doc:`при создании прайс-листа <../index>`.

Доставка
========

.. list-table::
    :stub-columns: 1
    :widths: 20 30

    *   -   Возможность доставки товара

        -   <delivery>

            Значение должно соответствовать настройкам в личном кабинете Яндекс.Маркета

    *   -   Возможность купить товар в розничном магазине

        -   <store>

            Значение должно соответствовать настройкам в личном кабинете Яндекс.Маркета

    *   -   Возможность зарезервировать товар и забрать его самостоятельно

        -   <pickup>

            Значение должно соответствовать настройкам в личном кабинете Яндекс.Маркета

    *   -   Варианты доставки

        -   <delivery-options>

            Индивидуальные условия доставки для отдельного товара. |yml_delivery_option|


.. |yml_type_prefix| raw:: html

   <!--noindex--><a href="https://yandex.ru/support/partnermarket/elements/typeprefix.xml" target="_blank" rel="nofollow">Описание</a><!--/noindex-->

.. |yml_notes| raw:: html

   <!--noindex--><a href="https://yandex.ru/support/partnermarket/elements/sales_notes.xml" target="_blank" rel="nofollow">Описание</a><!--/noindex-->

.. |ym_bid_1| raw:: html

   <!--noindex--><a href="http://help.yandex.ru/partnermarket/yml-auction.xml" target="_blank" rel="nofollow">Управление ставками через YML</a><!--/noindex-->

.. |ym_bid_2| raw:: html

   <!--noindex--><a href="http://help.yandex.ru/partnermarket/auction/placement.xml#placement" target="_blank" rel="nofollow">На что влияют ставки</a><!--/noindex-->

.. |yml_delivery_option| raw:: html

   <!--noindex--><a href="https://yandex.ru/support/partnermarket/elements/delivery-options.xml" target="_blank" rel="nofollow">Опции доставки</a><!--/noindex-->

