**********
JavaScript
**********

Общий стиль
-----------

*   Объявление всех переменных должно начинаться с var.

    .. code:: js

        var myVariable;


*   Используйте NAMES_LIKE_THIS при объявлении констант.

    .. code:: js
    
        var CONSTANT_VARIABLE = 'mve';

*   В конце любого оператора используйте точку с запятой.

*   Не допускается объявление функций в условиях

    .. code:: js

        if (x) {
          var foo = function() {};
        }

*   Одинарные кавычки предпочтительней двойных.

    .. code:: js

        var text = 'Some text';


Отступы и пробелы
-----------------

*   Табуляция в 4 пробела.

*   Не используйте пробел в конце строки.

*   Используйте пустую строку для разделения 1 блока от другого.

*   Один отступ по обе стороны от бинарных операторов и операторов присваивания.

*   Не должно быть пробела между именем функции и левой скобкой списка аргументов.

Плохо
=====

.. code:: js

    a.foo=bar+baz;

    if( foo ){
        foo.bar = doBar () ;
    }

    function foo () {
        return bar;
    };

    foo = function() {
        return('bar');
    };

    foo = typeof( bar );

    function baz(foo, bar) {
        return 'gaz';
    }


Хорошо
======

.. code:: js

    a.foo = bar + baz;

    if ( foo ) {
        foo.bar = doBar();
    }

    function foo() {
        return bar;
    }

    foo = function () {
        return 'bar';
    };

    foo = typeof bar;

    function baz( foo, bar ) {
        return 'gaz';
    }


Глобальная область видимости
----------------------------

*   Для того что бы не мусорить в глобальном пространстве. JavaScript код должен быть обернут в анонимную функцию.

    .. code:: js

        (function(_, $) {

            // Your code will be here

        }(Tygh, Tygh.$));


*   Оформление инлайнового (встроенного в тело документа) JavaScript должно быть в следующем виде:

    .. code:: js

        <script type="text/javascript">
            (function(_, $) {
                // Your code will be here
            }(Tygh, Tygh.$));
        </script>


*   В глобальной области видимости доступен объект Tygh. Он является основной точкой входа в приложение. В объекте Tygh доступны закешированные jQuery селекторы например Tygh.doc или Tygh.body. Настройки валюты языка и окружения, загрузчик файлов и микроформаты.

    Пример использования закешированного body селектора

    .. code:: js

        <script type="text/javascript">
            (function(_, $) {
                $(_.doc).on('click', '.someclass', function(event) {
                    // Your event handler code.
                });
            }(Tygh, Tygh.$));
        </script>


    Пример получения языковой переменной

    .. code:: js

        <script type="text/javascript">
            (function(_, $) {
                _.tr('language_variable_name');
            }(Tygh, Tygh.$));
        </script>


    Пример определения где запущен скрипт в админке или кастомерке.

    .. code:: js

        <script type="text/javascript">
            (function(_, $) {
                if(_.area === 'C') {
                    // This code will run only in customer area
                } else if(_.area === 'A') {
                    // This code will run only in admin area
                }
            }(Tygh, Tygh.$));
        </script>


jQuery
------

*   Используется библиотека jQuery v1.9.1

*   Вся дополнительная функциональность, написанная нами, представляется в виде плагинов.

*   Для вызова всех методов jQuery используем сокращенную запись — ``$``. Использование для вызовов переменной ``jQuery`` **НЕ ДОПУСКАЕТСЯ**.

    .. code:: js

        $.browser.msie;
        $('#test').ourMethod();
 

*   Создавая плагины нужно придерживаться стиля кодирования, принятого для jQuery! Для функций же остаются правила оформления как в php.


    .. code:: js

        (function($){

            var methods = {

                init: function(mode) {
                    // Init plugin
                },

                plugin_method: function() {
                    // Your code.
                }
            };

            $.fn.myPlugin = function(method) {
                if (methods[method]) {
                    return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
                } else if ( typeof method === 'object' || ! method ) {
                    return methods.init.apply(this, arguments);
                } else {
                    $.error('ty.myPlugin: method ' +  method + ' does not exist');
                }
            };
        })($);


.. important:: 

    Вообще использование inline JavaScript нужно сократить до минимума. Если вам нужно писать логику в темплейте - значит с логикой что-то не то. Инлайн можно использовать только для передачи данных из php в javacript.

*   Внешние скрипты должны подключаться через смарти-функцию ``{script}``

    .. code:: js

        {script src="js/core.js"}


*   Если нужно загрузить внешний скрипт через яваскрипт — нужно использовать ТОЛЬКО функцию ``$.getScript`` — она подправлена под наши нужды (учет загруженных скриптов, правильная работа с неймспейсами и третье-сторонними библиотеками).

*   Третьесторонние яваскрипт библиотеки мы складываем в ``/js/lib/``. 

*   Если нам нужно расширить функционал, что пишем обертку по примеру ``ceDialog``.

*   Событие ready (вызываемое при загрузке документа) писать в виде полной записи, с привязкой к document. 

    Не допускается запись вида

    .. code:: js

        $(function()), $(window).ready(), etc…

    Правильно так:

    .. code:: js

        $(document).ready(function() {

            // do something

        });


Оптимизация
-----------

*   В CS-Cart применен хитрый метод оптимизации js. Для отложенной загрузки файлов все js файлы подключаются в самом низу страницы. А весь inline код вырезается и вставляется в самый конец html документа.

    Было:

    .. code:: html

        <script type="text/javascript">
            // Inline scripts
        </script>
        <script src="//your_javascript.min.js"></script>

    Стало:

    .. code:: html

        <script src="//your_javascript.min.js"></script>
        <script type="text/javascript">
            // Inline scripts
        </script>


*   Чтобы отменить вырезание скрипта из потока для тега скрипт необходимо добавить no-defer аттрибут

    .. code:: html

        <script src="//your_javascript.min.js" data-no-defer></script>


*   Если JS подключается через smarty то следует добавить параметр no-defer 

    .. code:: html

        {script src="js/lib/jquery/jquery.min.js" no-defer=true}

