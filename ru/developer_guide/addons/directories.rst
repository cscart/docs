********************
Файлы и папки модуля
********************

=================
Необходимые папки
=================

У каждого модуля должна быть папка *app/addons/<название_модуля>*. В этой папке хранятся все файлы модуля, кроме шаблонов:

* **addon.xml** — содержит основную информацию о модуле, необходимую для его установки и удаления.

* **func.php** — функции, используемые контроллерами модуля.
        
* **init.php** — служит для регистрации списка хуков, которые будут использоваться модулем.
        
* **config.php** — содержит константы.

Также существуют следующие папки:

* *controllers* — содержит контроллеры модуля, а также pre- и post- контроллеры для стандартных контроллеров.

* *schemas* — содержит файлы, расширяющие стандартные PHP-схемы.

================================
Дополнительные папки с шаблонами
================================

Помимо необходимых папок, у модуля также могут быть следующие папки:

* *var/themes_repository/responsive/templates/addons/<add-on name>* — содержит шаблоны витрины;

* *design/backend/templates/addons/<add-on name>* — содержит шаблоны панели администратора;

* *var/themes_repository/[название_темы]/mail/templates/addons/<add-on name>* — e-mail-шаблоны.

.. note::

    Разработчики могут создавать дополнительные папки и файлы. Их названия и структура должны совпадать с названиями и структурой в CS-Cart/Multi-Vendor.
