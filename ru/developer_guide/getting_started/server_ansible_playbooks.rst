***********************************
Как настроить окружение для CS-Cart
***********************************

С помощью наших плейбуков (*англ.* playbook, сценарий) для **Ansible** можно настроить окружение для CS-Cart всего за несколько команд и правок в файле с настройками. Сценарии сами автоматически настроят для вас веб-сервер.

.. note::

    Если вы не хотите использовать Ansible, настройте окружение в соответствии с :doc:`системными требованиями CS-Cart </install/system_requirements>`.

=======================================
Шаг 1. Устанавливаем Ansible (v. 1.9.x)
=======================================

.. important::

    Плейбуки никак не обрабатывают конфликты пакетов — если пакет установить не получается, то будет выдана ошибка. Поэтому мы рекомендуем использовать плейбуки только на чистых установках операционных систем.

В зависимости от операционной системы, воспользуйтесь одной из следующих команд, чтобы установить Ansible:

* **CentOS 6:**

  .. code-block:: none

      sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
      sudo yum install -y gcc python-pip python-devel git openssl-devel libffi-devel libselinux-python
      sudo pip install ansible

* **CentOS 7:**

  .. code-block:: none

      sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
      sudo yum install -y gcc python-pip python-devel git openssl-devel libffi-devel libselinux-python
      sudo pip install ansible

* **Ubuntu 14.04:**

  .. code-block:: none

      sudo apt-get -y update
      sudo apt-get -y install git python-pip python-dev libffi-dev python-markupsafe libssl-dev
      sudo pip install ansible

============================
Шаг 2. Настраиваем main.json
============================

После установки Ansible можно скачать и запустить один из наших плейбуков для настройки сервера. Для этого:

#. Клонируйте репозиторий:

   .. code-block:: none

       mkdir ~/playbooks && git clone https://github.com/cscart/server-ansible-playbooks ~/playbooks

#. Создайте файл **main.json**:

   .. code-block:: none

       cp ~/playbooks/config/advanced.json  ~/playbooks/config/main.json

#. Отредактируйте файл **~/playbooks/config/main.json**:

   * ``stores_dir`` — директория ваших проектов;

   * ``stores`` — массив проектов;

     * ``example.com`` — доменное имя проекта;

     * ``storefronts`` — массив доменных имен витрин; если таких не имеется, оставьте поле пустым. Пример: ``"storefronts": []``;

     * ``database`` — параметры подключения к базе данных, которую создаст плейбук.

     .. warning::

         **НЕЛЬЗЯ** указывать пользователя ``root``; если укажете, то ``root`` сможет пользоваться только базой, созданной плейбуком, и не сможет создавать новые базы данных.

========================
Шаг 3. Запускаем плейбук
========================

В зависимости от нужного вам веб-сервера и нужной версии PHP **запустите один из плейбуков** командой ниже. Если процесс пройдёт успешно, то можно будет устанавливать CS-Cart.

* **lamp.yml**: *nginx + apache + mysql + php5.6*

  .. code-block:: none

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory lamp.yml

* **lemp.yml**: *nginx + mysql + php5.6*

  .. code-block:: none

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory lemp.yml

* **lemp7.yml**: *nginx + mysql + php7.0*

  .. code-block:: none

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory_php7 lemp7.yml

* **lvemp7.yml**: *varnish + nginx + mysql + php7.0*

  .. code-block:: none

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory_varnish lvemp7.yml

.. important::

     В Ubuntu возможны проблемы при запуске плейбуков.
