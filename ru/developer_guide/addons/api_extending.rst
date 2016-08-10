****************************
Расширение REST API модулями
****************************

Для расширения REST API модулем нужно: 

1. Создать в папке с модулем (например, *app/addons/<id_модуля>*) директорию ``Tygh/Api/Entities``. 

2. В созданной директории создать PHP-файл новой сущности, например, **Things.php**.

3. В этом файле определить класс новой сущности в пространстве имён ``Tygh\Api\Entities``,  унаследованный от абстрактного ``Api\AEntity`` и реализующий все 4 обязательных метода.

.. important::

    Класс должен называться так же, как и файл сущности.

==============
Базовый шаблон
==============

::

    namespace Tygh\Api\Entities;

    use Tygh\Api\AEntity;
    use Tygh\Api\Response;

    class Users extends AEntity
    {
        public function index($id = '', $params = array())
        {
            return array(
                'status' => Response::STATUS_OK,
                'data' => array()
            );
        }

        public function create($params)
        {
            return array(
                'status' => Response::STATUS_CREATED;
                'data' => array()
            );
        }

        public function update($id, $params)
        {
            return array(
                'status' => Response::STATUS_OK,
                'data' => array()
            );
        }

        public function delete($id)
        {
            return array(
                'status' => Response::STATUS_NO_CONTENT,
            );
        }

        public function privileges()
        {
            return array(
                'create' => 'create_things',
                'update' => 'edit_things',
                'delete' => 'delete_things',
                'index'  => 'view_things'
            );
        }
    }

.. important::

    Если у пользователя нет привилегий на выполнение определенных действие, то в ответ на запрос будет выдана **ошибка 403**.
