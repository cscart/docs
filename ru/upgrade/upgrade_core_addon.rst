*****************************
Обновление встроенных модулей
*****************************

.. contents::
   :backlinks: none
   :local:

Для встроенных модулей, так же как для третьесторонних, имеется возможность организации обновления, отдельного от ядра. В этом документе будут описаны особенности, связанные с обновлением таких аддонов.

=============================
Структура обновляемого модуля
=============================

Предполагается, что подобные модули не будут обновляться вместе с ядром и соответсвенно все вспомогательные скрипты, такие как миграции и валидаторы, должны быть отделены от скриптов ядра. Скрипт сборки пакета ожидает следующую структуру:

::

  ├── app
  │   └── addons
  │       └── [sample]
  │           ├── addon.xml
  │           ├── config.php
  │           ├── func.php
  │           ├── Tygh
  │           │   └── UpgradeCenter
  │           │       └── Connectors
  │           │           └── [Sample]
  │           │               └── Connector.php
  │           └── upgrades
  │               ├── [version1]
  │               │   ├── migrations
  │               │   │   ├── 467676233_migration1.php
  │               │   │   └── 467676233_migration2.php
  │               │   │
  │               │   ├── validators
  │               │   │   ├── validator1.php
  │               │   │   └── validator2.php
  │               │   │
  │               │   ├── scripts
  │               │   │   ├── pre_script.php
  │               │   │   └── post_script.php
  │               │   │
  │               │   ├── extra_files
  │               │   │   ├── extra_file1.php
  │               │   │   └── extra_file2.php
  │               │   │
  │               │   └── extra
  │               │       └── extra.php
  │               │
  │               │
  │               └── [version2]
  │                   ├── migrations
  │                   │   ├── 467676233_migration1.php
  │                   │   └── 467676233_migration2.php
  │                   │
  │                   ├── validators
  │                   │   ├── validator1.php
  │                   │   └── validator2.php
  │                   │
  │                   ├── scripts
  │                   │   ├── pre_script.php
  │                   │   └── post_script.php
  │                   │
  │                   ├── extra_files
  │                   │   ├── extra_file1.php
  │                   │   └── extra_file2.php
  │                   │
  │                   └── extra
  │                       └── extra.php
  │

Где:

* *[sample]* — название модуля.
* *[version1]* — версия, например 1.0.0.
* *[version2]* — версия, например 2.0.0.
* *app/addons/upgrades/[version]/migrations* — папка с миграциями.
* *app/addons/upgrades/[version]/validators* — папка с валидаторами.
* *app/addons/upgrades/[version]/scripts* — папка с PRE/POST скриптами.
* *app/addons/upgrades/[version]/extra_files* — папка с дополнительными файлами.
* *app/addons/upgrades/[version]/extra/extra.php* — файл для расширения *package.json* пакета обновления.

Файлы и директории в *app/addons/upgrades/[version]* не являются обязательными, например, если в новой версии не было изменения в БД, то нет необходимости создавать *app/addons/upgrades/[version]/migrations*, скрипт сборки пакета в таком случае просто сообщит, что миграций нет.

===================
Добавляем коннектор
===================

Коннектор (т.н. "upgrade connector") позволяет "Центру обновлений" запрашивать с сервера обновлений необходимые обновления. Для внутренних модулей сервером обновлений будет являться **helpdesk**. Для облегчения написания коннектора в ядре подготовлен базовый класс коннектора *Tygh\UpgradeCenter\Connectors\BaseAddonConnector*. Необходимо создать файл *app/addons/[ADDON_NAME]/Tygh/UpgradeCenter/Connectors/Upgrade/Connector.php*.

::

  namespace Tygh\UpgradeCenter\Connectors\[ADDON_NAME];

  use Tygh\Addons\AXmlScheme;
  use Tygh\Addons\SchemesManager;
  use Tygh\Registry;
  use Tygh\UpgradeCenter\Connectors\BaseAddonConnector;

  /**
   * Class Connector
   * @package Tygh\UpgradeCenter\Connectors\Ebay
   */
  class Connector extends BaseAddonConnector
  {
      /** @inheritdoc */
      public function __construct()
      {
          parent::__construct();

          /** @var AXmlScheme $addon_scheme */
          $addon_scheme = SchemesManager::getScheme('[ADDON_NAME]');

          $this->addon_id = '[ADDON_NAME]';
          $this->license_number = '';
          $this->product_edition = '[ADDON_NAME]_EDITION';
          $this->product_name = $addon_scheme->getName();
          $this->product_version = $addon_scheme->getVersion();
          $this->product_build = '';
          $this->notification_key = 'upgrade_center:addon_[ADDON_NAME]';
      }
  }

Где:

* ``addon_id`` — символьный код модуля.
* ``license_number`` — лицензия модуля.
* ``product_edition`` — редакция модуля, должна быть равна значению редакции в соответствующем товаре в helpdesk.
* ``product_name`` — название модуля.
* ``product_version`` — текущая версия модуля.
* ``product_build`` — номер сборки.
* ``notification_key`` — ключ для нотификаций об upgrade пакете.

======================
Создание релиза модуля
======================

Для автоматической генерации архива с модулем был реализован скрипт ``_tools/upgrade/release_addon.php``.

Пример использования:

::

  php release_addon.php addon_name

Где:

* ``addon_name`` - название модуля.

В результате выполнения скрипта в папке **_tools/upgrade** будет создан файл: **addon_name_version.tgz** (например: **ebay_2.1.0.tgz**).

==========================
Создание пакета обновления
==========================

Для автоматической генерации upgrade пакета был написан скрипт ``_tools/upgrade/build_addon.php``.

Пример использования:

::

  php build_addon.php old_release.tgz new_release.tgz

Где:

* **old_release.tgz** — tgz-архив текущей версии модуля (релиз старой версии).
* **new_release.tgz** — tgz-архив новой версии модуля (новый релиз).

Скрипт работает по тому же принципу, что и соответствующий скрипт для генерации пакета обновления ядра, и поддерживает все те же возможности. Вспомогательные скрипты (валидаторы, миграции), будут браться из релиза модуля.

После выполнения скрипта в папке **_tools/upgrade/packs** будет создана папка **upgrade** и файл с архивом (например: **upgrade_2.1.0_ebay--2.1.1_ebay.zip**). Созданный архив можно добавлять в HelpDesk в соответствующий товар в табе **updates**.

