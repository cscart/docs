*****************
Обновление модуля
*****************

.. contents::
   :backlinks: none
   :local:

Предположим, у нас есть простой модуль, добавляющий пару полей товару и меняющий логику выборки товара. Модуль называется **"Демо аддон"** и имеет ``id = "upgrade"``. Структура модуля предельно проста (*app/addons/*):

::

  upgrade
    ├── addon.xml
    ├── func.php
    └── init.php

Структура *addon.xml* базовая:

::

  <?xml version="1.0"?>
  <addon scheme="3.0">
      <id>upgrade</id>
      <version>1.1</version>
      <priority>100</priority>
      <position>100</position>
      <default_language>en</default_language>
      <status>active</status>
      <name>Demo upgrade add-on v1.1</name>
      <description>This is description of the addon v1.1</description>
  </addon>

Представим, что тут еще добавляются пара полей в таблицу ``cscart_products``:

::

  <queries>
      <item>ALTER TABLE `?:products` ADD `search_field` varchar(255) NOT NULL DEFAULT 'custom'</item>
      <item for="uninstall">ALTER TABLE `?:products` DROP `search_field`</item>
  </queries>

==========================
Создание Upgrade Connector
==========================

Первое, что нам нужно сделать — это создать коннектор, при помощи которого **Upgrade Center App** будет связываться с нашим сервером обновлений.

Создать его нужно по следующему пути: 

*app/addons/[ADDON_NAME]/Tygh/UpgradeCenter/Connectors/Upgrade/Connector.php*

В нашем же случае этот путь будет таким: 

*app/addons/upgrade/Tygh/UpgradeCenter/Connectors/Upgrade/Connector.php*

Коннектор должен реализовывать интерфейс **IConnector**. Создадим шапку файла и базовые функции:

::

  namespace Tygh\UpgradeCenter\Connectors\Upgrade;// "Upgrage" - is an add-on name.
                                                  // If your add-on has "my_changes" name, so namespace will look like: Tygh\UpgradeCenter\MyChanges
  use Tygh\UpgradeCenter\Connectors\IConnector as UCInterface;

  /**
   * Core upgrade connector interface
   */
  class Connector implements UCInterface
  {
      /**
       * Prepares request data for request to Upgrade server (Check for the new upgrades)
       *
       * @return array Prepared request information
       */
      public function getConnectionData()
      {
      }

      /**
       * Processes the response from the Upgrade server.
       *
       * @param  string $response            server response
       * @param  bool   $show_upgrade_notice internal flag, that allows/disallows Connector displays upgrade notice (A new version of [product] available)
       * @return array  Upgrade package information or empty array if upgrade is not available
       */
      public function processServerResponse($response, $show_upgrade_notice)
      {
      }

      /**
       * Downloads upgrade package from the Upgade server
       *
       * @param  array  $schema       Package schema
       * @param  string $package_path Path where the upgrade pack must be saved
       * @return bool   True if upgrade package was successfully downloaded, false otherwise
       */
      public function downloadPackage($schema, $package_path)
      {
      }
  }

Первое, что нам нужно — это реализовать возможность сообщить **Upgrade Center App** о том, как можно узнать у нашего сервера обновлений о наличии новых версий. Реализуем функцию ``getConnectionData``.

Небольшое отступление. Скорее всего нам понадобятся текущие настройки аддона (например, введенная для аддона лицензия или его текущая версия). Сделать это можно с помощью переменной класса ``protected`` ``$settings = array();`` и метода класса ``__contruct()``.

::

  class Connector implements UCInterface
  {
    protected $settings = array();

    public function __construct()
    {
        // Initial settings
        $addon_scheme = SchemesManager::getScheme('upgrade');

        $this->settings = array(
            'upgrade_server' => 'http://demo.cs-cart.com/index.php',
            'addon_version' => $addon_scheme->getVersion()
        );
    }
    // Other code
  }

Функция ``getConnectionData`` ничего не принимает и должна вернуть нам массив, содержащий информацию о методе доступа к серверу, URL и информации, которую нужно отправить на него (можно дополнительно указать headers). В доп. информации в запросе к серверу можно указывать любые необходимые данные (версии, лицензии, хеши и тд)

::

  public function getConnectionData()
  {
      $request_data = array(
          'method' => 'get',
          'url' => $this->settings['upgrade_server'], // We specified this setting before in the __construct method
          'data' => array(
              'dispatch' => 'updates.check',
              'product_version' => PRODUCT_VERSION,
              'edition' => PRODUCT_EDITION,
              'product_build' => PRODUCT_BUILD,
              'lang' => CART_LANGUAGE,
              'addon_version' => $this->settings['addon_version'],
              'some_custom_field' => TIME,
              'hello' => 'world',
              'super_secure_hash' => sha1(time()),
          ),
          'headers' => array(
              'Content-type: text/xml'
          )
      );

      return $request_data;
  }

Каждый раз, когда "Центр обновлений" будет делать проверку на наличие новых обновлений, будет запускаться эта фукцния. "Центр обновлений" сделает запрос на наш сервер, согласно полученной информации и вернет нам ответ, который получил. Реализуем фукнцию обработки ответа ``processServerResponse``. На вход эта функция получает 2 параметра:

* ``$response`` — непосредственно ответ сервера.
* ``$show_upgrade_notice`` — дополнительный флаг, сообщающий, стоит ли нам показывать сообщение о новой версии.

Должна вернуть массив, содержащий необходимую информацию о пакете (будет описан ниже).

Предположим, что сервер возвращает нам ответ в формате XML:

::

  <?xml version="1.0"?>
  <upgrade>
      <available>Y</available>
      <package>
          <file>upgrade_from_1.1_to_1.2.tgz</file>
          <name>Upgrade for the "Upgrade add-on" (from 1.1 to 1.2)</name>
          <description>New version of the addon!

              Changelog:
              - PHP warning was displayed when calculating cart. Fixed.
              - Taxes no longer available</description>
          <from_version>1.1</from_version>
          <to_version>1.2</to_version>
          <timestamp>1412366886</timestamp>
          <size>18123</size>
          <custom_field>Hello CS-Cart</custom_field>
          <my_sha_key>123</my_sha_key>
      </package>
  </upgrade>

Тогда будем обрабатывать его следующим образом:

::

  $parsed_data = array();
  $data = simplexml_load_string($response);

  if ((string) $data->available == 'Y') {
      $parsed_data = array(
          'file' => (string) $data->package->file, // Required field
          'name' => (string) $data->package->name, // Required field
          'description' => (string) $data->package->description, // Required field
          'from_version' => (string) $data->package->from_version, // Required field
          'to_version' => (string) $data->package->to_version, // Required field
          'timestamp' => (int) $data->package->timestamp, // Required field
          'size' => (int) $data->package->size, // Required field, size in bytes
          'my_very_important_field' => (string) $data->package->my_sha_key,
          'custom_field' => (string) $data->package->custom_field,
      );

      if ($show_upgrade_notice) {
          fn_set_notification('W', __('notice'), __('text_upgrade_available', array(
              '[product]' => 'Upgade add-on',
              '[link]' => fn_url('upgrade_center.manage')
          )), 'S');
      }
  }

  return $parsed_data;

Есть набор обязательных полей и набор дополнительных (их можно использовать позже, например сделать проверку по хешу файла, чтобы убедиться, что он не "битый" или сделать доп. проверку лицензии аддона и т.д). Список обязательных полей небольшой:

* ``file`` — название архива с обновлением (позже файл будет создан именно с этим именем).
* ``name`` — имя пакета обновления. Будет показано на списке доступных обновлений в "Центре обновлений".
* ``description`` — описание пакета. Будет показано на списке доступных обновлений в "Центре обновлений".
* ``from_version`` — с какой версии обновление.
* ``to_version`` — до какой версии обновление.
* ``timestamp`` — время создания пакета обновления.
* ``size`` — размер пакета в байтах.

Необязательные поля могут быть любого типа и содержать любую информацию.

После этого Upgrade Center создаст схему для нашего пакета и поместит ее в *var/upgrades/packages/[ADDON_NAME]/schema.json*.

При помощи этой схемы Upgrade Center будет скачивать непосредственно сам пакет обновлений (по умолчанию он его не скачивает из-за того, что размер пакета может достигать больших значений).

Для скачивания пакета реализуем последнюю фукнцию интерфейса ``downloadPackage``. Фукнция принимает 2 значения:

* ``$schema`` — сохраненная ранее схема пакета.
* ``$package_path`` — путь, куда должен быть сохранен файл.

Вернуть нужно массив из двух значений. Первое булевое — результат. Второе — доп. сообщение, которое будет отображено в случае неудачи.

::

  return array(true, '');
  return array(false, __('sha_key_is_invalid'));
  public function downloadPackage($schema, $package_path)
  {
      // Make some custom validation
      if ($schema['my_very_important_field'] == '123' && !empty($schema['custom_field'])) {
          $url_data = fn_get_url_data($this->settings['upgrade_server'] . '?dispatch=download&from_version=' . $schema['from_version']);

          if (!empty($url_data)) {
              $result = fn_copy($url_data['path'], $package_path);
          } else {
              $result = false;
          }
          $message = $result ? '' : __('failed');

          return array($result, $message);
      } else {
          return array(false, __('sha_key_is_invalid'));
      }
  }

================
Пакет обновлений
================

Теперь мы сможем передать наши пакеты обновлений. Осталось их создать. Предположим, что в новой версии модуля мы поправили какие-то ошибки в файле **func.php** и добавили новый файл **config.php**. Плюс мы решили добавить еще одно поле в таблицу ``cscart_products``.

Значит нам нужно обновить 3 файла:

* **func.php** (обновление)
* **addon.xml** (обновление, нужно поправить структуру таблицы и версию аддона)
* **config.php** (создание)

Еще нужно изменить таблицу ``cscart_products`` (добавить новое поле). Для этого мы воспользуемся миграцией.

Также мы решили проверить, создал ли пользователь файл **robots.txt** (предположим, вы описывали это в инструкции к установке предыдущей версии аддона). Новая версия аддона будет автоматически дописывать туда данные, поэтому наличие файла вам просто необходимо (и файл должен быть доступным *для записи*).

И, конечно же, мы хотим добавить несколько языковых переменных.

.. note::

    "Центр обновлений" добавляет только новые языковые переменные. **Если нужно обновить старую переменную, используйте миграции**.

Создаем базовую структуру пакета обновлений:

::

  ┌── languages/
  ├── migrations/
  ├── package/
  ├── package.json
  └── validators/

Некоторые папки могут отсутствовать (допустим, у вас нет языков и миграций, или же в пакете только миграции). **package.json** пока пустой файл. Его описание мы сделаем позже.

Заполним папку *package*. Эта папка содержит в себе новые файлы и представляет собой корень магазина. Поэтому, чтобы добавить наши файлы мы создаем подпапки и кладем туда новые файлы:

::

  ├── package
  │   └── app
  │       └── addons
  │           └── upgrade
  │               ├── addon.xml
  │               ├── config.php
  │               └── func.php

Файлы готовы. Теперь обновляем языки. Структура папки повторяет структуру crowdin-пакета. В нашем случае мы обновим лишь английский язык, добавив несколько языковых переменных и обновим название и версию аддона:

::

  ├── languages
  │   └── en
  │       └── core.po

**core.po**

  msgid ""
  msgstr "Project-Id-Version: tygh"
  "Content-Type: text/plain; charset=UTF-8\n"
  "Language-Team: English\n"
  "Language: en_US"

  msgctxt "Languages::new_language_variable"
  msgid "Upgrade completed"
  msgstr "Upgrade completed"

  msgctxt "Addons::name::upgrade"
  msgid "Demo upgrade add-on v1.2"
  msgstr "Demo upgrade add-on v1.2"

  msgctxt "Addons::description::upgrade"
  msgid "This is description of the upgraded addon v1.2"
  msgstr "This is description of the upgraded addon v1.2"

Теперь создаем **валидатор**, который проверит наличие файла **robots.txt** в корне магазина. Создадим файл с произвольным именем, например **CheckFileValidator.php**:

::

  └── validators
      └── CheckFileValidator.php

Наш валидатор должен реализовывать интерфес **IValidator** и иметь 2 обязательные функции:

* ``getName()``
* ``check($schema, $request)``

**CheckFileValidator.php**

::

  namespace Tygh\UpgradeCenter\Validators;

  use Tygh\Registry;

  /**
   * Upgrade validators: Check collisions
   */
  class CheckFileValidator implements IValidator
  {
      /**
       * Global App config
       *
       * @var array $config
       */
      protected $config = array();

      /**
       * Validator identifier
       *
       * @var array $name ID
       */
      protected $name = 'Demo upgrade: File checker';

      /**
       * Validate specified data by schema
       *
       * @param  array $schema  Incoming validator schema
       * @param  array $request Request data
       * @return array Validation result and Data to be displayed
       */
      public function check($schema, $request)
      {
          $file_to_be_created = $this->config['dir']['root'] . '/robots.txt';

          if (!file_exists($file_to_be_created)) {
              return array(false, 'Create <strong>' . $file_to_be_created . '</strong> file first to continue upgrade');
          } else {
              return array(true, '');
          }
      }

      /**
       * Gets validator name (ID)
       *
       * @return string Name
       */
      public function getName()
      {
          return $this->name;
      }

      public function __construct()
      {
          $this->config = Registry::get('config');
      }
  }

Количество валидаторов в пакете не ограничено. Можно проверить что угодно. Желательно разделять валидаторы по типам их проверок, а не делать множество проверок в одном валидаторе.

=================
Создание миграций
=================

Миграции нужны, чтобы приводить данные в базе и в файлах содержащих пользовательские данные в актуальное состояние и создавать апгрейды автоматически. Миграцию нужно создавать при любых изменених, которые затрагивают базу или файлы содержащие пользовательские данные:

* новая таблица или удаление таблицы;

* новое поле, переименование поля или удаление поля;

* новые данные (например, настройки);

* новая/измененная языковая переменная;

* изменения в файлах **config.local.php**, **.htaccess**, **manifest.json**;

* изменения в сессионных данных. Пример — проверка валидации сессии: параметр ``user_agent`` хранил строку, а вы сделали так, что хранится md5() этой строки. Соответственно после апгрейда сессия проверку не пройдет и пользователь будет разлогинен. Лучше всего для таких целей использовать ``pre`` и ``post`` скрипты в апгрейде, а не миграции.

Для создания миграций используется `phinx <http://docs.phinx.org/en/latest/index.html>`_. О том, как создавать миграции, можно почитать `тут <http://docs.phinx.org/en/latest/migrations.html>`_.

В результате мы должны получить примерно такой файл: **20141022083711_addon_update_version.php**, в котором будет создан базовый класс миграции с методами *up*, *down*, *change*. Нас интересуют 2 из них:

* ``up`` - при обновлении.
* ``down`` - при downgrade (теоретически, этот метод не будет использоваться).

**20141022083711_addon_update_version.php.php**

::

  use Phinx\Migration\AbstractMigration;

  class AddonUpdateVersion extends AbstractMigration
  {
      /**
       * Change Method.
       *
       * More information on this method is available here:
       * http://docs.phinx.org/en/latest/migrations.html#the-change-method
       *
       * Uncomment this method if you would like to use it.
       *
      public function change()
      {
      }
      */

      /**
       * Migrate Up.
       */
      public function up()
      {
          $options = $this->adapter->getOptions();
          $pr = $options['prefix'];

          $this->execute("UPDATE {$pr}addons SET `version` = '1.2' WHERE `addon` = 'upgrade'");
          $this->execute("ALTER TABLE {$pr}products ADD `new_search_field` int(11) NOT NULL DEFAULT 0");
      }

      /**
       * Migrate Down.
       */
      public function down()
      {
          $options = $this->adapter->getOptions();
          $pr = $options['prefix'];

          $this->execute("UPDATE {$pr}addons SET `version` = '1.1' WHERE `addon` = 'upgrade'");
          $this->execute("ALTER TABLE {$pr}products DROP `new_search_field`");
      }
  }

В этой миграции мы обновили версию модуля и добавили новое поле. Миграции также нужно разделять по файлам (в примере 2 миграции объеденины в общую, но по логике, должно быть 2 разных миграции).

Осталось теперь заполнить файл **package.json**, и пакет готов. **package.json** представляет из себя JSON файл с описанием всех файлов, входящих в пакет обновления. Мы должны указать измененные файлы (с MD5 хешем старого файла. Он нужен для того, чтобы проверить, а не изменил ли пользователь этот файл, чтобы сообщить ему о коллизиях).

::

  {
      "files": {
          "app/addons/upgrade/addon.xml": {"status": "changed", "hash": "b0911a0d64453ab06b0872c9eb6fbc34"},
          "app/addons/upgrade/func.php": {"status": "changed", "hash": "4fefb0fed1496f179a14b7e872eb16d9"},
          "app/addons/upgrade/config.php": {"status": "new"},
          "app/addons/upgrade/somefile.txt": {"status": "deleted", "hash": "df32e836628b51af570dd2425cb3e97e"}
      },
      "migrations": [
          "20141022083711_addon_update_version.php"
      ],
      "languages": [
          "en"
      ],
      "validators": [
          "CheckFileValidator"
      ]
  }

Готово. Запаковываем файл с расширением TGZ и отдаем нашему коннектору.

::

  ├── languages
  │   └── en
  │       └── core.po
  ├── migrations
  │   └── 20141022083711_addon_update_version.php
  ├── package
  │   └── app
  │       └── addons
  │           └── upgrade
  │               ├── addon.xml
  │               ├── config.php
  │               └── func.php
  ├── package.json
  └── validators
      └── CheckFileValidator.php
