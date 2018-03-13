Настройка единицы измерения
---------------------------

При выгрузки |yml_furniture|, |yml_beauty| и |ym_toys| для некоторых характеристик необходимо
указывать единицу измерения. В YML-файле для таких характеристик добавляют атрибут unit.

.. note::
    Возможность указывать единицы измерений появилась с версии 4.3.8.


Добавление единиц измерений
===========================

В настройках характеристики есть поле YML unit, в котором можно указать единицу измерения.

.. fancybox:: img/yml_unit.png
    :alt: YML unit

При необходимости, есть возможность указать единицу измерения для конкретного варианта.

.. fancybox:: img/yml_unit_variant.png
    :alt: YML variant unit

.. fancybox:: img/product_feature.png
    :alt: Product feature

При экспорте в YML-файле для характеристик, у которых указаны единицы измерения, добавляется атрибут unit.

.. fancybox:: img/yml_param.png
    :alt: YML param


.. |yml_furniture| raw:: html

   <!--noindex--><a href="http://help.yandex.ru/partnermarket/guides/furniture.xml" target="_blank" rel="nofollow">Мебель</a><!--/noindex-->

.. |yml_beauty| raw:: html

   <!--noindex--><a href="https://help.yandex.ru/partnermarket/guides/beauty.xml" target="_blank" rel="nofollow">Косметика, парфюмерия и уход</a><!--/noindex-->

.. |ym_toys| raw:: html

   <!--noindex--><a href="https://help.yandex.ru/partnermarket/guides/toys.xml" target="_blank" rel="nofollow">Детские товары</a><!--/noindex-->
