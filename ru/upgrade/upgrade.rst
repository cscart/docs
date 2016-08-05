**************
Upgrade Сenter
**************

Основные свойства, которые были добавлены в новый Upgrade Center:

* Больше нет SQL файлов. Вся работа с БД ведется через миграции;
* Добавилась возможность аддонам указывать свои сервера обновлений и загружать свои пакеты обновлений;

=========
Интерфейс
=========

.. image:: img/uc_interface.png
    :align: center
    :alt: New banner

Страница обновлений отображает доступные пакеты. Пакеты могут быть двух видов:

* core
* add-on

**Core** пакеты скачиваются через ``$config['resources']['updates_server']`` (http://updates.cs-cart.com).

**Add-ons** пакеты скачиваются через коннекторы аддонов и с серверов, указанных в этих коннекторах.

Upgrade пакет можно также загрузить вручную, используя форму загрузки на странице Центра Обновлений (кнопка +).

===================
Проверка обновлений
===================

Проверка обновлений запускается в двух случаях:

* при логине в панель администратора;
* при переходе на страницу "Центра обновлений".

----------------
Схема обновлений
----------------

.. image:: img/uc_connectors.png
    :align: center
    :alt: New banner

Upgrade Center App посылает запрос на проверку обновлений. Connector manager получает список всех доступных коннекторов. Каждый коннектор (реализующий IConnector interface) должен вернуть массив с информацией о подключении к своеу серверу обновлений (каждый коннектор может добавлять любые данные, которые нужно отправить на сервер).
Пример:

::

  return array(
      'method' => 'get',
      'url' => 'http://example.com/uc/index.php',
      'data' => array(
          'dispatch' => 'product_updates.get_available',
          'ver' => PRODUCT_VERSION,
          'edition' => PRODUCT_EDITION,
          'product_build' => PRODUCT_BUILD,
          'lang' => CART_LANGUAGE,
          'my_license_number' => 'ABC-123-XYZ',
          'weather' => 'windy',
      ),
      'headers' => array(
          'Content-type: text/xml'
      )
  )

После получения информации о серверах обновлений, Connector manager одновременно отправит запросы на все их них. Полученные ответы также будут переданы коннекторам для их дальнейшей обработки.

Коннектор принимает ответ от сервера и должен вернуть либо пустой массив (если обновление недоступно), либо информацию о пакете (при этом пакет не скачивается. Получается только информация о нем). Возвращаемая схема (массив) должна содержать ряд обязательных полей:

* ``file`` - имя файла (*some_upgrade_1.2.3.tgz*).
* ``name`` - заголовок пакета обновления (Например: *"Обновление аддона Маркетплейс"*).
* ``description`` - описание. Что делает пакет обновлений, какие ошибки были исправлены, какие улучшения добавлены.
* ``from_version`` - с какой версии обновляется Ядро/Аддон.
* ``to_version`` - до какой версии обновляется Ядро/Аддон.
* ``timestamp`` - время создания пакета.
* ``size`` - размер (в байтах).
* ``type`` - тип пакета (*core/addon*). Выставляется автоматически.

И не обязательных:

* ``hello`` - любой тип поля с любым значением и именем.
* ``world`` - нужны для сохранения данных, которые будут использованы при скачивании пакета с сервера, его проверки и т.д.
* ``example_md5`` - *68e109f0f40ca72a15e05cc22786f8e6* Например, сохранить md5 хеш файла и проверить его после скачивания с сервера (Исключить подмену, битые файлы и т.д.).

Пример возвращаемых данных:

::

  $data = simplexml_load_string($response);

  return array(
      'file' => (string) $data->package->file,
      'name' => (string) $data->package->name,
      'description' => (string) $data->package->description,
      'from_version' => (string) $data->package->from_version,
      'to_version' => (string) $data->package->to_version,
      'timestamp' => (int) $data->package->timestamp,
      'size' => (int) $data->package->size,
      'my_very_important_field' => (string) $data->package->my_sha_key,
      'custom_field' => (string) $data->package->custom_field,
  );

Если схема обновления проходит проверку, то будет создана схема */path/to/store/var/upgrade/packages/NAME/schema.json*. Где **NAME** - имя аддона или *core* (для ядра).

---------------------
Скачивание обновлений
---------------------

После получения схемы пакета появляется возможность скачать сам пакет (это не делается автоматически, потому что пакеты могут достигать больших размеров). При нажатии **Download** Upgrade Center App подключает коннектор этого пакета и передает ему сохраненную ранее схему и путь, куда нужно сохранить скачанный пакет.

Коннектор соединяется со своим сервером обновлений, передает необходимую информацию и получает содержимое пакета, который сохраняет по переданному пути. В случае успешного сохранения коннектор должен вернуть ``array(true, '');``. Если призошла ошибка (Не удалось подключиться к серверу, не смог сохранить и тд) возвращаем ошибку ``array(false, __('text_uc_cant_download_package'))``.

После получения файла Upgrade Center App распаковывает и проверяет его:

* Наличие схемы пакета *package.json* (описание и структура пакета).

* Соответствие описания схемы и файлов. Проверяется, что все *package.json* содержит описание для всех файлов пакета. Если в пакете окажутся лишние файлы, то валидация пакета не пройдет.

* В случае с пакетом обновления для Аддона, проверяется, что этот пакет не пытается перезаписать Core файлы. Доступные пути для файлов аддона:

::

  'app/addons/' . $addon_id,
  'js/addons/' . $addon_id,
  'images/',

  'design/backend/css/addons/' . $addon_id,
  'design/backend/mail/templates/addons/' . $addon_id,
  'design/backend/media/fonts/addons/' . $addon_id,
  'design/backend/media/images/addons/' . $addon_id,
  'design/backend/templates/addons/' . $addon_id,

  'var/themes_repository/[^/]+/css/addons/' . $addon_id,
  'var/themes_repository/[^/]+/mail/media/',
  'var/themes_repository/[^/]+/mail/templates/addons/' . $addon_id,
  'var/themes_repository/[^/]+/media/fonts/',
  'var/themes_repository/[^/]+/media/images/addons/' . $addon_id,
  'var/themes_repository/[^/]+/media/images/addons/' . $addon_id,
  'var/themes_repository/[^/]+/styles/data/',
  'var/themes_repository/[^/]+/templates/addons/' . $addon_id,

  'var/langs/',

================
Структура пакета
================

Примерная структура пакета выглядит так:

::

  ├── languages
  │   └── en
  │       ├── addons
  │       │   ├── access_restrictions.po
  │       │   └── age_verification.po
  │       ├── core.po
  │       └── editions
  │           └── mve.po
  ├── migrations
  │   └── 20141230084721_core_ult_logos_linked_to_styles.php
  ├── package
  │   ├── changelog.txt
  │   ├── config.php
  │   └── js
  │       └── tygh
  │           └── core.js
  ├── package.json
  └── scripts
  │   └── pre_create_folder.php
  └── validators
      └── CheckFileValidator.php

Папка **languages** содержит языки в формате пакета Crowdin (http://translate.cs-cart.com).

**ВАЖНО!** 
**При установке языков из Upgrade пакета будут установлены только новые Языковые Переменные. Старые обновлены не будут. Если вам нужно обновить существующую языковую переменную, используйте новое имя или создайте миграцию.**

Папка **migrations** содержит phinx :doc:`миграции <upgrade_addon>`. Применяются в порядке *TIMESTAMP* имени файла. Теоретически - миграции должны работать только с БД (но практически - работают в окружении карты и могут делать что угодно). Но все же для работы с файлами нужно использовать *PRE/POST* скрипты.

Папка **scripts** сожержит *PRE/POST* скрипты. Запуск скриптов зависит от имени файла. Выборка идет по его префиксу ``pre_`` и ``post_``. ``PRE`` скрипты запускаются перед началом обновления (но после Validators). ``POST`` скрипты - после окончания обновления.

Папка **validators** содержит дополнительные проверочные функции, которые должны вернуть *true* перед началом установки обновления. Например: проверка на возможность записи в *.htaccess*, проверка на имя домена и т.д.

Папка **package** сожержит непосредственно новые файлы. Эта папка будет целиком скопирована в корень магазина.

Файл **package.json** описывает всю структуру пакета. Какие файлы входят, хеши обновляемых файлов, миграции, языки и тд.

Пример **package.json** файла:

::

  {
      "files": {
          "app/addons/upgrade/addon.xml": {"status": "changed", "hash": "b0911a0d64453ab06b0872c9eb6fbc34"},
          "app/addons/upgrade/func.php": {"status": "changed", "hash": "4fefb0fed1496f179a14b7e872eb16d9"},
          "app/addons/upgrade/robots.txt": {"status": "deleted", "hash": "df32e836628b51af570dd2425cb3e97e"},
          "js/addons/upgrade/up.js": {"status": "new"},
          "var/themes_repository/responsive/templates/addons/upgrade/hooks/products/image_wrap.post.tpl": {"status": "new"}
      },
      "migrations": [
          "20141022083711_addon_update_version.php"
      ],
      "languages": [
          "en"
      ],
      "validators": [
          "CheckFileValidator"
      ],
      "scripts": {
          "pre": "hello_world.php",
          "post": "clear_cache.php"
      }
  }

----------------------------
Порядок установки обновления
----------------------------

.. image:: img/uc_workflow.png
    :align: center
    :alt: New banner

------------
Логгирование
------------

Каждый шаг установки обновления логгируется в файл *var/upgrade/[NAME]_log.txt*, где **NAME** - *core* или название аддона. В случае непредвиденной остановки обновления всегда можно узнать причину.

Пример лог файла:

::

  2015-03-27 12:01:13: Start installation of the "core" upgrade package
  2015-03-27 12:01:13: ================================================
  2015-03-27 12:01:13: Get all available validators
  2015-03-27 12:01:13: Execute "collisions" validator
  2015-03-27 12:01:13: Upgrade stopped: Awaiting resolving validation errors: collisions
  2015-03-27 12:01:21: 
  2015-03-27 12:01:56: Start installation of the "core" upgrade package
  2015-03-27 12:01:56: ================================================
  2015-03-27 12:01:56: Get all available validators
  2015-03-27 12:01:56: Execute "collisions" validator
  2015-03-27 12:01:56: Execute "permissions" validator
  2015-03-27 12:01:56: Execute "restore" validator
  2015-03-27 12:01:56: Backup files and Database
  2015-03-27 12:01:56: Copy package files
  2015-03-27 12:01:56: Run migrations
  2015-03-27 12:01:56: Phinx by Rob Morgan - http://phinx.org. version 0.3.7
  2015-03-27 12:01:56: 
  2015-03-27 12:01:56: using config file ./app/Tygh/UpgradeCenter/Migrations/config.migrations.php
  2015-03-27 12:01:56: using config parser php
  2015-03-27 12:01:56: using migration path /Users/alexions/www/git/work/var/upgrade/packages/core/content/migrations
  2015-03-27 12:01:56: using environment development
  2015-03-27 12:01:56: using adapter mysql
  2015-03-27 12:01:56: using database alexions_staging
  2015-03-27 12:01:56: 
  2015-03-27 12:01:56:  == 20150317072105 CoreChangePrivelegeName: migrating
  2015-03-27 12:01:56:  == 20150317072105 CoreChangePrivelegeName: migrated 0.0034s
  2015-03-27 12:01:56: 
  2015-03-27 12:01:56: All Done. Took 0.1739s
  2015-03-27 12:01:56: Install langauges from the upgrade package
  2015-03-27 12:01:56: Install the \"en\" language
  2015-03-27 12:01:56: Upgrade completed

