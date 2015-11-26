************************************************
Анализ нагруженности приложения с помощью XHprof
************************************************

Данный инструмент позволяет мониторить и анализировать нагрузку на ресурсы сервера, выявлять элементы кода, которые тратят много ресурсов, влияют на быстродействие приложения в целом. 

Более подробно об этом раcсказанно `здесь <http://ruhighload.com/index.php/2009/08/21/xhprof-%D0%BF%D1%80%D0%BE%D1%84%D0%B8%D0%BB%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5-php-%D0%BE%D1%82-facebook/>`_. Так же в этой статье описана установка xhprof. 
(Будьте осторожны с репо  ``deb http://ftp.us.debian.org/debian sid main`` так как это репозиторий дебиан и работая на ubuntu, после сброки xhprof его надо удалить, дабы не повредить систему при апгрейде). 
Использование этого инструмента позволяет определить функции, блоки, потребялющие большую часть ресурсов сервера. 

Как настроить xhprof для cs-cart
================================

Устанавливаем xhprof любым удобным методом.
Копируем в корень папки с картой 2 папки из загруженного дистрибутива xhprof, это будут xhprof_html и xhprof_lib. 
Аналогично алгоритму статьи из вышеопубликованной ссылки, нам необходимо интегрировать xhprof с выполняемыми функциями карты. Для этого мы будем использовать fn_dispatch из admin.php и выглядеть это будет так:

``xhprof_enable(XHPROF_FLAGS_CPU + XHPROF_FLAGS_MEMORY);``

``require(dirname(__FILE__) . '/init.php');``

``fn_dispatch();``

``$xhprof_data = xhprof_disable();``

``include_once __DIR__ . "/xhprof_lib/utils/xhprof_lib.php";``

``include_once __DIR__ . "/xhprof_lib/utils/xhprof_runs.php";``

``$xhprof_runs = new XHProfRuns_Default('/tmp');``

``$run_id = $xhprof_runs->save_run($xhprof_data, "admin");``

как видно из кода: мы вызываем xhprof для fn_dispatch, затем сохраняем результаты в $xhprof_data, остальные параметы позволят нам представлять отчет в грифическом виде. 

Так же для корректной работы нам необходимо открыть app/functions/fn.control найти и закомментировать строку  exit; // stop execution 

Если все сделано правильно, то любое действие на admin.php будет обрабатываться с помощю xhprof, а результаты будут сохраняться в отчеты, которые будут доступны нам по ссылке  типа  http://localhost/cscart/xhprof_html/

Для того чтобы приостановить действие xhprof, можно просто закомментировать его инициализацию в admin.php
Пример:

``//xhprof_enable(XHPROF_FLAGS_CPU + XHPROF_FLAGS_MEMORY);``

``require(dirname(__FILE__) . '/init.php');``

``fn_dispatch();``

``//$xhprof_data = xhprof_disable();``

``//include_once __DIR__ . "/xhprof_lib/utils/xhprof_lib.php";``

``//include_once __DIR__ . "/xhprof_lib/utils/xhprof_runs.php";``

``//$xhprof_runs = new XHProfRuns_Default('/tmp');``

``//$run_id = $xhprof_runs->save_run($xhprof_data, "admin");``
