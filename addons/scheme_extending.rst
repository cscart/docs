******************
Extending a Scheme
******************

A :doc:`scheme <../core/schemes>` can be extended and overridden by an add-on.

Для чего нужно расширять схемы?
==============================================

Предположим, что мы хотим изменить схему Импора/Экспорта, создать новые Permissions или добавить новый пункт меню в Админке. Меню создается автоматически используя схему app/schemas/menu/menu.php. Значит мы должны расширить эту схему, чтобы наш новый пункт меню стал доступен.

In order to extend a scheme, you should first create the directory *schemas* within the add-on directory (if it does not exist yet). In this directory, you can reproduce the core *schemas* directory structure to address a particular scheme. The scheme can be extended both by prepending and appending it with additional content. Name your files according to this pattern to extend the according scheme: *<scheme_name>.[pre|post].php*.

For example, you can extend the scheme *block_manager/blocks* by creating the *schemas/block_manager* directory in your add-on directory and putting the extension data in the file *blocks.pre.php* or *blocks.post.php* (or both).

You can see this technique in action in the `Affiliate add-on <https://github.com/cscart/affiliate>`_ , which extends some schemes, e.g. *block_manager/blocks.php*.?


Example: How to extend the menu
==============================================

For example we have a my_changes add-on. Make the following steps:

    #. Create a new folder (if does not exist): app/addons/my_changes/schemas/menu/
    #. Create a new empty file: app/addons/my_changes/schemas/menu/menu.post.php ("post" scheme will be included after the main one)
    #. Add this code::

        <?php
        $schema['central']['marketing']['items']['my_changes_menu'] = array(
            'attrs' => array(
                'class'=>'is-addon'
            ),
            'href' => 'my_changes.execute',
            'position' => 1000
        );

        return $schema;

    #. Create a new language variable "my_changes_menu" and check the changes by opening menu "Marketing" in the admin area.
