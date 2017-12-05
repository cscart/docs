***********************************
Как настроить окружение для CS-Cart
***********************************

С помощью наших плейбуков (*англ.* playbook, сценарий) для **Ansible** можно настроить окружение для CS-Cart всего за несколько команд и правок в файле с настройками. Сценарии сами автоматически настроят для вас веб-сервер.

.. note::

    Если вы не хотите использовать Ansible, настройте окружение в соответствии с :doc:`системными требованиями CS-Cart </install/system_requirements>`.

============================
Шаг 1. Устанавливаем Ansible
============================

.. important::

    Плейбуки никак не обрабатывают конфликты пакетов — если пакет установить не получается, то будет выдана ошибка. Поэтому мы рекомендуем использовать плейбуки только на чистых установках операционных систем.

В зависимости от операционной системы, выполните по очереди следующие команды, чтобы установить Ansible:

* На **CentOS 6:**

  .. code-block:: bash

      sudo yum -y install epel-release
      sudo yum install -y gcc git openssl-devel libffi-devel libselinux-python python-crypto python-jinja2 python-paramiko sshpass
      sudo rpm -ihv https://releases.ansible.com/ansible/rpm/release/epel-6-x86_64/ansible-2.4.1.0-1.el6.ans.noarch.rpm

* На **CentOS 7:**

  .. code-block:: bash

      sudo yum -y install epel-release
      sudo yum install -y gcc git openssl-devel libffi-devel libselinux-python python-crypto python-jinja2 python-paramiko sshpass
      sudo rpm -ihv https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.4.1.0-1.el7.ans.noarch.rpm

* На **Ubuntu 14.04:**

  .. code-block:: bash

      sudo add-apt-repository -y ppa:ansible/ansible
      sudo apt-get -y update
      sudo apt-get -y install git python-dev libffi-dev python-markupsafe libssl-dev
      sudo apt-get -y install ansible=2.4.*-1ppa~trusty

============================
Шаг 2. Настраиваем main.json
============================

После установки Ansible можно скачать и запустить один из наших плейбуков для настройки сервера. Для этого:

#. Клонируйте репозиторий с плейбуками к себе на сервер:

   .. code-block:: bash

       mkdir ~/playbooks && git clone https://github.com/cscart/server-ansible-playbooks ~/playbooks

   Эта команда создаёт копию `репозитория с плейбуками <https://github.com/cscart/server-ansible-playbooks>`_ в домашней папке на сервере. Так вы всегда сможете попасть в директорию с плейбуками одной командой ``cd ~/playbooks command``, если понадобится.

#. Создайте файл **main.json**; наши плейбуки используют данные оттуда для настройки окружения:

   .. code-block:: bash

       cp ~/playbooks/config/advanced.json  ~/playbooks/config/main.json

   Эта команда просто копирует существующий файл **advanced.json** и вставляет его как **main.json** в ту же директорию (*~/playbooks/config*). Пока что в файле находится только пример данных; нам нужно будет заменить их на свои собственные.

#. Отредактируйте файл **~/playbooks/config/main.json** так, как вам нужно. По умолчанию файл выглядит так:

   .. code-block:: json

       {
           "stores_dir": "/var/www/html",
           "stores":
           {
               "example.com":
               {
                   "cart":
                   {
                       "storefronts": ["example.org", "example.ru"]
                   },
                   "database":
                   {
                       "name": "cscart",
                       "user": "cscart",
                       "password": "cscart"
                   }
               }
           }
       }

   * ``stores_dir`` — директория, где будут находиться папки с одной или несколькими установками CS-Cart;

   * ``stores`` — массив проектов (т.е. будущих установок CS-Cart);

     * ``example.com`` — доменное имя проекта; также это имя папки, где будет находиться проект. В примере выше у нас описана одна установка CS-Cart, которая будет находиться в папке */var/www/html/example.com*;

     * ``storefronts`` — массив доменных имен :doc:`дополнительных витрин </user_guide/stores/index>`; если таких не имеется, оставьте поле пустым. Пример: ``"storefronts": []``;

     * ``database`` — параметры подключения к базе данных, которую создаст плейбук для этого проекта:

       * ``name`` — название базы данных;

       * ``user`` — имя пользователя MySQL, который будет работать с этой базой данных;

         .. warning::

             **НЕЛЬЗЯ** указывать пользователя ``root``; если укажете, то ``root`` сможет пользоваться только базой, созданной плейбуком, и не сможет создавать новые базы данных.

       * ``password`` — пароль пользователя MySQL, указанного выше.

   Если вы работаете с сервером по SSH (например, :doc:`устанавливаете CS-Cart на хостинг DigitalOcean </install/digitalocean>`), то вы можете воспользоваться текстовым редактором в командной строке, чтобы отредактировать **main.json** так, как вам нужно. Мы рекомендуем **nano** — его использовать проще всего:

    #. На CentOS сначала потребуется установить nano. Выполните команду:

       .. code-block:: bash

           yum install nano

    #. Откройте файл, который вы хотите отредактировать (на Ubuntu выполняйте сразу этот шаг, без установки nano):

       .. code-block:: bash

           nano ~/playbooks/config/main.json

    #. Теперь вы сможете редактировать файл. Перемещайтесь по файлу с помощью стрелок на клавиатуре и редактируйте его, как в обычном редакторе. Ниже представлен **main.json**, который у нас получился для настройки сервера под одну установку CS-Cart без дополнительных витрин.

       .. important::

           Замените имя домена из примера на имя вашего домена; также поменяйте реквизиты доступа к базе данных, которые будут созданы в процессе работы плейбука.

       .. code-block:: bash

           {
               "stores_dir": "/var/www/html",
               "stores":
               {
                   "doctorzoid.tk":
                   {
                       "cart":
                       {
                           "storefronts": []
                       },
                       "database":
                       {
                           "name": "doctorzoid_tk",
                           "user": "doctorzoid_tk",
                           "password": "0NkpV5t9VcUYpKtM"
                       }
                   }
               }
           }

    #. Нажмите **Ctrl + X**, чтобы выйти из редактора. Появится вопрос, хотите ли вы сохранить изменения. Нажмите кнопку **Y** на клавиатуре, а затем нажмите **Enter**, чтобы подтвердить имя изменяемого файла.

========================
Шаг 3. Запускаем плейбук
========================

В зависимости от нужного вам веб-сервера и нужной версии PHP **запустите один из плейбуков** командой ниже. Если процесс пройдёт успешно, то можно будет устанавливать CS-Cart.

* **lamp.yml**: *nginx + apache + mysql + php5.6*

  .. code-block:: bash

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory lamp.yml

* **lemp.yml**: *nginx + mysql + php5.6*

  .. code-block:: bash

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory lemp.yml

* **lemp7.yml**: *nginx + mysql + php7.0*

  .. code-block:: bash

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory_php7 lemp7.yml

* **lvemp7.yml**: *varnish + nginx + mysql + php7.0*

  .. code-block:: bash

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory_varnish lvemp7.yml

.. important::

     В Ubuntu возможны проблемы при запуске плейбуков.
