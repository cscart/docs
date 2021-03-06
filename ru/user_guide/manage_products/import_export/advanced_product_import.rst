************************************
Как импортировать товары и их данные
************************************

.. note::

    Эта функциональность добавляется модулем :doc:`/user_guide/addons/advanced_products_import/index`.

#. Откройте страницу **Администрирование → Импорт данных → Товары** в панели администратора CS-Cart.

#. Нажмите на кнопку **+**, чтобы добавить новый пресет импорта.

   .. fancybox:: img/advanced_import_add_preset.png
       :alt: Расширенный импорт товаров в CS-Cart. 

   *Пресет импорта* — это набор правил, по которым обрабатывается импортируемый файл. После того, как вы настроите пресет, вы сможете импортировать файлы с похожей структурой без необходимости отдельно редактировать каждый из них.

#. Настройте пресет импорта: выберите CSV- или XML-файл и введите название пресета (по нему вы потом сможете находить этот пресет среди других).

   Если вы загрузите XML-файл, вам также придётся указать **Целевой узел XML** в одноимённом поле. У XML-файлов сложная структура, и у разных файлов она отличается; не всю информацию нужно импортировать. Например, вот XML-файл:

   .. code-block:: xml

       <?xml version="1.0"?>
       <data>
           <address>Москва, ул. Ленина</address>
           <working_hours>9.00 - 17.00</working_hours>
           <products>
               <product>
                   <sku>D00014MK1P</sku>
                   <item>65" Class (64.5" Diag.) LED 8000 Series Smart TV</item>
                   <in_stock>Да</in_stock>
                   <price>500</price>
               </product>
               <product>
                   <sku>K01502P8VF</sku>
                   <item>Wildwood City Classic</item>
                   <in_stock>Да</in_stock>
                   <price>300</price>
               </product>
           </products>
       </data>

   CS-Cart нужно знать, как отличить в XML-файле отдельные товары. Для примера выше правильным целевым узлом будет ``data/products/product``. Это полный путь до узла XML, который содержит всю информацию об отдельном товаре.

#. Нажмите **Создать**. 

   .. hint::

       После того, как вы создадите пресет, на вкладке **Файл** вы увидите команду, которую можно добавить в `cron <https://ru.wikipedia.org/wiki/Cron>`_. Так вы сможете автоматически проводить импорт через определённые промежутки времени.

   .. fancybox:: img/advanced_import_file_settings.png
       :alt: Добавление пресета для импорта товаров в CS-Cart.

#. Теперь должна появиться вкладка **Таблица соответствия полей**. Перейдите на неё. Там вы сможете указать, как CS-Cart должен обрабатывать импортируемый файл:

   * Сопоставьте столбцы или XML-элементы импортируемого файла с соответствующими свойствами товаров в CS-Cart.

   * Проверьте примеры импортируемых значений, чтобы узнать, правильно ли заданы соответствия. Примеры импортируемых значений должны быть :doc:`в том формате </user_guide/manage_products/import_export/fields_format>`, который используется для соответствующего свойства товара.

   * Если нужно, добавьте несколько модификаторов. *Модификаторы* — это функции, которые меняют импортируемые данные. Кнопка **Список модификаторов** покажет вам все модификаторы, и как их применять.

     .. fancybox:: img/advanced_import_field_mapping.png
         :alt: Сопоставление свойств товаров с импортируемым файлом.

     Вот несколько примеров того, как использовать модификаторы:

     * Допустим, у вас есть товары от двух поставщиков. Оба поставщика используют уникальные артикулы (поле **КОД** в CS-Cart) для каждого своего товара, но несколько артикулов пересекаются: два поставщика используют один и тот же артикул для разных товаров. Вам же нужен уникальный артикул для каждого товара.

       В этом случае вы можете создать отдельные пресеты импорта для каждого поставщика. Если вы добавите модификатор ``concat(SPLR1-, $value)`` при импорте товаров от первого поставщика, то у артикулов всех товаров этого поставщика будет префикс *SPLR1-*. Так все артикулы будут уникальными.

       .. important::

           Этот способ поможет, только если товары ещё не созданы в вашем магазине. В противном случае старые товары останутся со старыми артикулами, а при импорте создадутся дубликаты.

     * Допустим, в файле поставщика не указано, сколько товаров есть в наличии а просто написано "Да" или "Нет". Но CS-Cart требует, чтобы было указано определённое количество.

       В этом случае вы можете добавить модификатор ``case($value=Да, 100, $value=Нет, 0)`` для столбца, где хранится информация о наличии товара. Если в столбце будет "Да", то CS-Сart будет считать, что в наличии 100 экземпляров товара, а если "Нет", то 0.

     * Допустим, вы продаёте товары на 10% дороже, чем закупаете у поставщика. Но в импортируемом файле даны цены поставщика.

       В этом случае вы можете добавить модификатор ``mul($value, 1.1)`` для столбца с ценой, чтобы автоматически увеличить все цены в импортируемом файле на 10%.

#. После того, как настроите соответствие полей и модификаторы, нажмите **Сохранить**. Если всё сделано правильно, то примеры импортируемых значений изменятся с учётом модификаторов.

#. (опционально) Перейдите на вкладку **Настройки**. Она содержит настройки, связанные с поведением импорта.

   * **Выполнить тестовый импорт** — включите эту настройку, если хотите импортировать только пять первых товаров из файла.

     Так вы сможете проверить, что всё настроено правильно. Если вдруг что-то пойдёт не так, удалить или исправить 5 товаров быстрее, чем разбираться с 500 товарами после импорта.

   * **Стратегия импорта** — выберите, импортировать ли все товары, или только некоторые из них:

     * *Импортировать все товары из файла* — новые товары будут созданы, а уже существующие (существование определяется по Product code, т.е. артикулу) будут обновлены.

       Импорт ведёт себя так по умолчанию.

     * *Обновить только существующие товары* — пропустить все товары, которые не существуют в вашем магазине; обновлены будут только те товары, которые уже существуют.

       Эта стратегия подходит тем, кто продаёт не все товары из файла, который даёт поставщик. Так после импорта у вас не будет лишних товаров.

     * *Создать только новые товары* — пропустить обновление товаров, которые уже существуют в вашем магазине; будут созданы только те товары, которых в вашем магазине пока нет.

       Эта стратегия подходит тем, кто меняет какие-то данные товаров (например, название, описание, и т.п.) после импорта. Так ваши изменения не потеряются, если вам нужно будет снова импортировать данные от этого поставщика.

       .. hint::

           Но что делать, если вам нужно будет обновить количество на складе у существующих товаров, не меняя их другие данные? Для этого создайте отдельный пресет и задайте соответствия только у нужных полей (**Product code** и **Quantity**). Поля, для которых вы не зададите соответствие, будут проигнорированы.

   * **Уменьшить количество товаров до нуля** — включите эту настройку, если вы хотите, чтобы во время импорта количество всех товаров в магазине было сброшено до 0.

     Только те товары, у которых в импортируемом файле будет указано количество, получат после импорта ненулевое количество.

   .. fancybox:: img/advanced_import_additional_settings.png
       :alt: Дополнительные настройки импорта товаров в CS-Cart.

   Также есть две **Дополнительные настройки**, скрытые по умолчанию:

   * **Удалить существующие файлы цифровых товаров** — если включить эту настройку, то при импорте цифровых товаров будут удалены их существующие файлы.

     Когда настройка выключена, то файлы цифровых товаров при импорте не заменяют существующие, а создаются как дополнительные. 

   * **Удалить существующие дополнительные изображения** — если включить эту настройку, то все дополнительные изображения товара будут заменены на изображения, указанные в импортируемом файле.

     Когда настройка выключена, то импорт дополнительных изображений для товаров не заменяет уже существующие изображения, а добавляет изображения как дополнительные.

#. Нажмите **Импортировать**. Если пресет настроен правильно, и данные в импортируемом файле корректны, то товары импортируются.

   .. hint::

       После импорта можете открыть страницу **Товары → Товары** и использовать сохранённый поиск *Недавно обновлённые* — так вы сможете найти все товары, обновлённые за последний час (этого же можно добиться **Расширенным поиском**). Так вы сможете проверить результаты импорта.
