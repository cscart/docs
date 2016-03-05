*************
Extending API
*************


If you want your add-on to extend the API with a new entity, follow these steps:

1. Create the ``Tygh/Api/Entities`` subdirectory in the directory of your add-on (*app/addons/<add-on name>*).

2. In the ``Tygh/Api/Entities`` subdirectory, create a file for the new entity (for example, **Things.php**)

   .. hint::

       For example, if you work the **My Changes** add-on, the path to the new entity should be *app/addons/my_changes/Tygh/Api/Entities/Things.php*.

3. In this file, define the class **of the same name** (``Things`` in our case) inherited from the abstract ``Api\Entity`` class, in the ``Tygh\Api\Entities`` namespace.

   This class must implement all 4 mandatory methods (CRUD).

==============
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
                'status' => Response::STATUS_CREATED,
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

    If users attempt to do something beyond their privileges, they will get **error 403 (Forbidden)**.

==================
Additional Methods
==================

--------------------
privilegesCustomer()
--------------------

This method allows you to set the privileges of unauthorized users who access this API entity.

.. important::

    By default, unauthorized users can't access the API at all. 

    To allow API access for unauthorized users, edit the **config.local.php** file in the root directory of your store: change ``'api_allow_customer' => false,`` to ``'api_allow_customer' => true,``.

::

    public function privilegesCustomer()
    {
        return array(
            'index' => true
        );
    }

.. note::

    Both **privileges()** and **privilegesCustomer()** allow you to use ``true`` or ``false`` as shown in the example above.
