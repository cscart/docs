*******************************************************
Адаптация существующих модулей и тем под CS-Cart 4.15.1
*******************************************************

.. contents::
    :local:
    :backlinks: none

===================
Изменения в модулях
===================

Модуль «Соответствие GDPR (Общему регламенту по защите данных в ЕС)»
--------------------------------------------------------------------

В 4.15.1 появился новый механизм, который дает возможность пользователю отказаться от необязательных cookie и ознакомиться со списком cookie, которые использует магазин.

Существующие разделы cookie
~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Strictly necessary cookies (раздел не отключается) — ``strictly_necessary``

#. Performance cookies — ``performance``

#. Functional cookies — ``functional``

#. Marketing cookies — ``marketing``

После "—" указаны имена, которые должны использоваться в схеме как ``cookie_purpose``.

Расширение списка cookie с помощью модуля
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Если ваш модуль добавляет новые cookie, и вы хотите расширить существующий список для соответствия стандарту, вам необходимо:

#. Расширить схему ``gdpr/klaro_config.php``.

   Каждый элемент схемы имеет следующую структуру::

     php
     $schema['services']['cookie_name'] = [
      'purposes' => ['cookie_purpose'],
         'name' => 'cookie_name',
         'translations' => [
             'zz' => [
                 'title' => __('cookie_title'),
                 'description' => __('cookie_description')
             ],
         ],
         'required' => true/false,
         'default' => true/false
     ];
     return $schema;

#. Подключить JS скрипт, который будет ставить cookie. Сделать это можно несколькими способами:

   2.1. ::

          html
          {script src="path/script.js" cookie-name="cookie_name"}

   2.2. ::

          html
          <script
              type="text/plain"
              data-type="application/javascript"
              data-src="src"
              data-name="cookie_name"
          ></script>
