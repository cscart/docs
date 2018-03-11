*******************************
Как установить CS-Cart на XAMPP
*******************************

Сначала установите XAMPP - среду для PHP-разработки (установка XAMPP на Windows описана :doc:`в этой статье </install/windows/xampp/index>`).

#. Скачайте последнюю версию CS-Cart с официального сайта `www.cs-cart.ru <https://www.cs-cart.ru/download.html>`_.

   .. fancybox:: img/cscart_ru.png
       :alt: Скачайте CS-Cart с официального сайта

#. Перейдите в папку *htdocs* с установленным XAMPP (в нашем случае это *C:\\xampp\\htdocs*) и создайте там папку *cscart*.

   .. fancybox:: img/cscart_folder_ru.png
       :alt: Создайте папку для CS-Cart

#. Распакуйте архив c CS-Cart. Если у вас установлен архиватор 7­Zip, то нажмите по файлу правой кнопкой мыши и выберите *7­Zip →  Распаковать в "cscart_rus_v4.x.x"*. В других архиваторах выполните аналогичные действия.

   .. fancybox:: img/extraction.png
       :alt: Распакуйте архив с CS-Cart

#. Перенесите файлы из архива в папку *cscart*, которую мы создали ранее (в нашем случае, это папка *C:\\xampp\\htdocs\\cscart*).

   .. fancybox:: img/copy_data_ru_2.png
       :alt: Перенос файлов CS-Cart в папку в XAMPP

#. Откройте XAMPP Control Panel.

   .. fancybox:: img/xampp_control_panel.png
       :alt: XAMPP Control Panel

#. Перед установкой CS-Cart нужно создать базу данных. Для этого откройте браузер и введите *localhost/phpmyadmin* в адресную строку. Нажмите **New** на открывшейся странице. Придумайте название для новой базы данных. По умолчанию пользователем для всех новых баз данных будет **root** (без пароля).

   .. fancybox:: img/create_db.png
       :alt: Создайте базу данных

#. Введите *localhost/cscart* в адресной строке браузера и нажмите **[install]**, чтобы начать установку.

   .. fancybox:: img/cscart_install.png
       :alt: Начало установки CS-Cart
