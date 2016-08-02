*****************************************
Указание зависимостей и конфликтов модуля
*****************************************

==================
Необходимые модули
==================

Данная проверка производится на этапе :ref:`установки аддона <ru-install-addon-process>`.

Необходимые модули задаются так:

.. code-block:: xml

    <compatibility>
        <dependencies>discussion,form_builder</dependencies>
    </compatibility>

Если хотя бы один из модулей не установлен, то будет сгенерирована ошибка вида:

 .. important::

     **Warning:** The add-on cannot be installed because a dependency on the Comments and reviews, Form builder add-on is set for it. Please install the Comments and reviews, Form builder add-on first."

=================
Конфликтые модули
=================

Данная проверка производится на этапе :ref:`активации аддона <ru-activate-addon-process>`. При установке аддона аддон успешно установится, но останется выключенным (если проверка не прошла).

Конфликтные модули задаются так:

.. code-block:: xml

    <compatibility>
        <conflicts>catalog_mode,reward_points</conflicts>
    </compatibility>

Если хотя бы один из конфликтных модулей включен, то будет сгенерирована ошибка вида: 

.. important::

    **Warning:** Add-on Gvs is incompatible with the following add-ons: Catalog mode, Reward points. These add-ons will be automatically disabled.

Два конфликтующих аддона могут быть установлены, суть в том, что они не могут одновременно быть активными (включенными).
