**********************************************************************
Указание совместимости модуля с версией CS-Cart и серверным окружением
**********************************************************************

Проверка совместимости производится :ref:`в процессе установки модуля <ru-install-addon-process>`. Настройки совместимости задаются в секциии ``compatibility`` в **addon.xml**. Примеры можно увидеть в аддоне :doc:`sample_addon_3_0 <scheme3.0_structure>`.

===================================
Совместимость с CS-Cart/MultiVendor
===================================

------------------------
Совместимость с версиями
------------------------

Задается в следующем формате:

.. code-block:: xml

    <compatibility>
        <core_version>
            <min>4.3.2</min>
            <max>4.3.6</max>
        </core_version>
    </compatibility>

Не обязательно задавать одновременно ``min`` и ``max``. В ``min`` задается минимально поддерживаемая версия СS-Cart/MultiVendor, а в ``max`` — максимально поддерживаемая.

При ошибке получаем сообщение вида:

.. warning::

    **Error:** Version of your cart (4.3.7) is not supported. Minimal: 4.3.2. Maximal: 4.3.6.

--------------------------
Совместимость с редакциями
--------------------------

Редакцию можно указать как одну:

.. code-block:: xml

    <compatibility>
        <core_edition>MULTIVENDOR</core_edition>
    </compatibility>

так и несколько:

.. code-block:: xml

    <compatibility>
        <core_edition>MULTIVENDOR,ULTIMATE</core_edition>
    </compatibility>

При ошибке получаем сообщение вида:

.. warning::

    **Error:** Edition of your cart (ULTIMATE) is not supported. Required:  MULTIVENDOR.

====================================
Совместимость с серверным окружением
====================================

----------
Версия PHP
----------

Задается так:

.. code-block:: xml

    <compatibility>
        <php_version>
            <min>5.6.6</min>
            <max>5.6.1</max>
        </php_version>
    </compatibility>

Не обязательно задавать одновременно и минимальное, и максимальное ограничение.

При ошибке получаем сообщение вида:

.. warning::

    **Error:** PHP version (5.5.9-1ubuntu4.14) is not supported. Minimal: 5.6.1. Maximal: 7.1.1.

--------------
Расширения PHP
--------------

Можно указать необходимые и конфликтные расширения.

* Пример необходимого расширения:

  .. code-block:: xml

      <compatibility>
          <php_extensions>
              <gd>
                  <supported>Y</supported>
              </gd>
          </php_extensions>
      </compatibility>

  Если необходимое расширение отсутствует, то будет сгенерирована ошибка вида: 

  .. warning::

      **Error:** The gd extension should be installed on your server for correct add-on operation.

* Пример конфликтного расширения:

  .. code-block:: xml

      <compatibility>
          <php_extensions>
              <gd>
                  <supported>N</supported>
              </gd>
          </php_extensions>
      </compatibility>

  Если конфликтное расширение установлено, то будет сгенерирована ошибка вида: 

  .. warning::

      **Error:** The gd extension should be removed from your server for correct add-on operation.

Для необходимого модуля можно указать нужную версию, при этом ``<supported>Y</supported>`` можно уже не указывать, например:

.. code-block:: xml

    <compatibility>
        <php_extensions>
            <json>
                <min>3.0</min>
                <max>4.0</max>
            </json>
        </php_extensions>
    </compatibility>

Если версия расширения не соответствует нужной, то будет сгенерирована ошибка вида:

.. warning::

    **Error:** The json version (1.3.2) is not supported by the add-on. Minimal: 3.0. Maximal: 4.0.
