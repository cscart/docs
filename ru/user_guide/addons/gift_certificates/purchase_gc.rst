************************************************************************
Как позволить покупателям создавать и приобретать подарочные сертификаты
************************************************************************

.. important::

    Прежде всего, откройте страницу **Модули → Управление модулями** и убедитесь, что модуль **Подарочные сертификаты** установлен и включен.

Модуль **Подарочные сертификаты** добавляет специальную страницу, на которой пользователи могут создавать подарочные сертификаты, добавлять их в корзину и покупать их как обычные товары.

.. fancybox:: img/buy_gift_certificate.png
    :alt: Подарочный сертификат может содержать бесплатные товары, или определённую сумму на покупки, или и то, и другое.

Ссылки на страницу подарочных сертификатов может не быть в вашем магазине — в этом случае можно добавить её вручную.

.. note::

    Введите ``example.com/index.php?dispatch=gift_certificates.add`` (заменив example.com на домен вашего магазина) в адресную строку браузера, чтобы попасть на страницу создания подарочных сертификатов. Покупатели также могут воспользоваться этой ссылкой.

===================
Шаг 1. Создаём меню
===================

1.1. Перейдете на страницу **Дизайн → Меню** в панели администратора вашего магазина.

1.2. Нажмите кнопку **+**, чтобы добавить новое меню.

1.3. Откроется всплывающее окно. Задайте название меню (например, *Подарочный сертификат*) и установите статус *Вкл.*, а затем нажмите **Создать**. Вы увидите в списке новое меню.

.. fancybox:: img/create_menu.png
    :alt: Добавляем меню, где будет ссылка на страницу подарочных сертификатов.

1.4. Добавьте в меню новый элемент. Для этого нажмите на название меню, а потом на кнопку **+** на открывшейся странице.

1.5. Настройте элемент меню во всплывающем окне:

* Введите название элемента в том виде, в котором оно появится на витрине.

* Добавьте в поле **URL** значение ``gift_certificates.add``.

* Укажите любые другие нужные настройки, а затем нажмите кнопку **Создать**.

.. fancybox:: img/menu_item.png
    :alt: Добавляем пункт меню со ссылкой на страницу подарочных сертификатов.

============================
Шаг 2. Добавляем меню в блок
============================

Чтобы меню появилось на витрине, нужно добавить его в какой-нибудь блок.

2.1. Перейдете на страницу **Дизайн → Макеты** в панели администратора вашего магазина.

2.2. Найдите место, куда вы хотите добавить меню. Например, добавим меню на страницу макета **По умолчанию** в **Верхнюю панель**.

2.3. Нажмите кнопку **+** у нужной секции и выберите **Добавить блок**, чтобы разместить блок меню в этой секции.

.. fancybox:: img/add_block.png
    :alt: Размещаем блок там, куда хотим добавить меню.

.. hint::

    Также можно добавить и секцию, если нажать кнопку **+** у одного из четырёх контейнеров: *Вернхяя панель*, *Заголовок*, *Контент* или *Подвал*.

2.4. Откроется всплывающее окно. Перейдите на вкладку **Создать новый блок** и выберите **Меню**.

.. fancybox:: img/block_type.png
    :alt: Выберите тип "Меню" для вашего нового блока.

2.5. В открывшемся всплывающем окне настройте блок, заполнив данные на следующих вкладках:

* **Общее** — введите название блока (например, *Сертификаты*) и тип меню (*Текстовые ссылки*).

* **Контент** — выберите меню, которое должно отображаться в блоке (в нашем случае это меню *Подарочный сертификат*)

2.6. Нажмите **Создать**. Новый блок появится в секции, а меню будет доступно покупателям.

2.7. Вы также можете изменить внешний вид меню. Нажмите на кнопку с изображением шестерёнки (**Параметры блока**) у только что созданного блока. Вы сможете выбрать оболочку и задать для блока собственный класс.

.. note::

    В этом примере мы использовали класс ``top-quick-links`` из темы Responsive.

.. fancybox:: img/custom_css.png
    :alt: Используйте оболочку и классы CSS, чтобы изменить внешний вид блока.

2.8. Готово! Теперь покупатели смогут попасть на страницу подарочных сертификатов через новое меню.

.. fancybox:: img/gifts_block_on_the_storefront.png
    :alt: Новое меню на витрине.
