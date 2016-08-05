**************************
Расширения для JavaScript
**************************

Если мы хотим расширить стандартный функционал сторонних библиотек или написать какой-то свой плагин, нужно придерживаться правил написания плагинов **jQuery**.

Прочитать про них можно тут: http://docs.jquery.com/Plugins/Authoring

Все наши плагины должны начинаться с префикса ``ce``, например ``ceDialog``, ``ceEditor``.

В большинстве случаев плагин выглядит вот так::

   (function($){

          function _privateMethod()
          {

          }

          var methods = {
              run: function() {
              },

              destroy: function() {
              }
          };

          $.fn.ceEditor = function(method) {
              if (methods[method]) {
                  return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
              } else if ( typeof method === 'object' || ! method ) {
                  return methods.run.apply(this, arguments);
              } else {
                  $.error('ty.editor: method ' +  method + ' does not exist');
              }
          };

          $.ceEditor = function(action, data) {
              if (action == 'push') {
                  ...
              } else if (action == 'state') {
                  ...
              } else if (action == 'handlers') {
              }
          }
      })($);
 
Использование плагина

* ``$('.class').ceEditor();`` - вызовет метод по-умолчанию - в нашем случае ``run``

* ``$('.class').ceEditor('destroy');`` - вызовет, соответственно, метод ``destroy``

* ``$.ceEditor('push', some_data);`` - вызовет статический метод ``ceEditor``, не привязанный ни к какому элементу. Он нужен для того, чтобы работать с коллекциями элементов, на которые навешан плагин. Например, хранить стек диалоговых окон и т.п. Вообще использование такого метода не рекомендуется без острой необходимости, т.к. это по факту работа с глобальными объектами.

