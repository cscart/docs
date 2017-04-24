***********************************************************************
Что делать, если изображения не грузятся или не импортируются по ссылке
***********************************************************************

Такая проблема может возникнуть, если в настройках сервера отключен URL file-access. Проверить это можно следующим образом:

#. Создайте файл **test.php** со следующим содержимым:

   .. code-block :: none

       <?php
       error_reporting(-1); // report all the errors
       ini_set("display_errors", "on");
       $page_contents = file_get_contents("http://www.your_domain.com/your_cscart_directory/store_closed.html");
       echo '<pre>';
       echo htmlspecialchars($page_contents); // output the page source code instead of the page itself
       echo '</pre>';
       ?>

   .. note::

        Замените ``www.your_domain.com`` на имя вашего домена, а ``your_cscart_directory`` with на директорию, где на вашем сервере установлен CS-Cart. 

   Например, если магазин находится по адресу **www.example.com/store**, замените ``your_cscart_directory`` на ``store``. А если магазин доступен по адресу **www.example.com**, просто уберите ``your_cscart_directory`` из кода выше и из ссылки ниже.

#. Загрузите файл **test.php** в корневую директорию установленного CS-Cart.
    
#. Откройте этот файл по следующей ссылке: *http://www.your_domain.com/your_cscart_directory/test.php*.

   * Если вы видите содержимое файла **store_closed.html**, значит URL file-access включен.

     Если проблема с импотом картинок по URL всё еще осталась, `обратитесь в службу технической поддержки <https://www.cs-cart.com/helpdesk>`_.

   * Если вы видите ошибку, значит URL file-access для вашего сайта отключен.

     Это означает, что стандартная функция PHP ``file_get_contents`` не работает. Свяжитесь с администратором хостинга по поводу этой проблемы и попросите включить эту функцию для вашей учётной записи.
