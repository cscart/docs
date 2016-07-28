*******************
Клонирование темы
*******************


.. contents::
    :local: 
    :depth: 3


Создание новой темы нужно начать с клонировании базовой темы Cs-Cart.


Клонирование темы можно сделать, скопировав нужную папку в ``design/themes/``. В нашем случае - *responsive*.

Информация о теме находится в файле ``manifest.json``. Назовем нашу новую тему *Tutorial theme*, а в поле description - *Tutorial Theme especially designed for this tutorial*.


В файле ``manifest.json`` нужно указать еще путь для логотипа и favicon нашей темы.

Для темы responsive данные файлы расположены в ``media/images/cart.png`` и ``media/images/icons/favicon.ico`` соответственно. Проще всего будет заменить данные файлы.


    .. literalinclude:: files/manifest.json
        :linenos:


После того как скопировали тему и добавили информацию о ней, нужно ее активировать.

Для этого переходим в раздел ``Design/Themes`` и нажимаем ``Активировать`` на Tutorial theme: Modern стиле.
