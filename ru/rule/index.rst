Правила оформления текста
-------------------------

Заголовок H2
============

Заголовок H3
************

Заголовок H4
++++++++++++

Изображения
***********

.. code::

  .. fancybox:: img/xampp_1.png
    :alt: fancy

.. fancybox:: img/xampp_1.png
    :alt: fancy

.. code::

  .. image:: img/xampp_1.png
    :alt: image

.. image:: img/xampp_1.png
    :alt: image

Эпиграф
*******

Код:

.. code::
    
    .. epigraph::

       No matter where you go, there you are.

       -- Buckaroo Banzai

Результат:

.. epigraph::

   No matter where you go, there you are.

   -- Buckaroo Banzai


Цитата
******

Код:

.. code::

    .. highlights::

        highlights


Результат:

.. highlights::

    highlights

Код:

.. code::

    .. pull-quote::

        pull-quote

Результат:

.. pull-quote::

        pull-quote


Выделенные блоки
****************

Код:

.. code::

    .. warning::

        Предупреждение

Результат:

.. warning::

    Предупреждение

Код:

.. code::

    .. hint::

        Намек

Результат:

.. hint::

    Намек

Код:

.. code::

    .. important::

        Важный 

Результат:

.. important::

    Важный

Код:

.. code::

    .. note::

        Примечание 

Результат:

.. note::

    Примечание 


Тема
****

Код:

.. code::

    .. topic:: Тема

        Содержание темы

Результат:

.. topic:: Тема

    Содержание темы




Ссылки
******

Код:

.. code::

    `Внешняя ссылка <https://www.cs-cart.com/download-cs-cart.html>`_ 

Результат:

`Внешняя ссылка <https://www.cs-cart.com/download-cs-cart.html>`_ 

Код:

.. code::

    :doc:`Внутренняя ссылка </manager/index>`

Результат:

:doc:`Внутренняя ссылка </manager/index>`


Скачать файл
************

Код:

.. code::

    :download:`download <files/func.php>`

Список
******

Код:

.. code::

    *   Уровень 1
    
        -   Уровень 2

            + Уровень 3

            + Уровень 3

        -   Уровень 2

    *   Уровень 1

    *   Уровень 1

Результат:

*   Уровень 1
    
    -   Уровень 2

        + Уровень 3

        + Уровень 3

    -   Уровень 2

*   Уровень 1

*   Уровень 1


Форматирование текста
*********************

Код:

.. code::

    *Курсив*

Результат:

*Курсив*

Код:

.. code::

    **Жирный**

Результат:

**Жирный**

Код:

.. code::

    ``Рамка``

Результат:

``Рамка``



Вставить код
************

*app/addons/advanced_addon/controllers/backend/index.post.php*

.. literalinclude:: files/func.php
    :linenos:

*addons/advanced_addon/addon.xml*

.. literalinclude:: files/addon.xml
    :language: xml
    :linenos:

.. code:: php

    $a = '100';



Таблица
*******

.. list-table:: Таблица 1
   :widths: 15 10 30
   :header-rows: 1

   * - Treat
     - Quantity
     - Description
   * - Albatross
     - 2.99
     - On a stick!
   * - Crunchy Frog
     - 1.49
     - If we took the bones out, it wouldn't be
       crunchy, now would it?
   * - Gannet Ripple
     - 1.99
     - On a stick!


.. table:: Таблица 2

   =====  =====
     A    not A
   =====  =====
   False  True
   True   False
   =====  =====


.. csv-table:: CSV Таблица
   :header: "Treat", "Quantity", "Description"
   :widths: 15, 10, 30

   "Albatross", 2.99, "On a stick!"
   "Crunchy Frog", 1.49, "If we took the bones out, it wouldn't be
   crunchy, now would it?"
   "Gannet Ripple", 1.99, "On a stick!"


