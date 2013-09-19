**************************
Extending API with Add-ons
**************************

In order to extend the API with a new entity with an add-on:

*   In the add-on directory, create the subdirectories ``Tygh/Api/Entities``
*   In the ``Tygh/Api/Entities`` subdirectory, create a file to contain the new entity (e.g. Things.php)
*   In this file, define the class of the same name (e.g. ``Things``) inherited from the abstract ``Api\Entity`` class, in the ``Tygh\Api\Entities`` namespace.

    This class must implement all 4 mandatory methods (CRUD).

Basic Template
==============

::

    namespace Tygh\Api\Entities;

    use Tygh\Api\AEntity;
    use Tygh\Api\Response;

    class Things extends AEntity
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
    }
