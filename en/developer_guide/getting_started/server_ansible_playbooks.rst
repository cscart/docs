**********************************************************
How To: Configure the Environment for CS-Cart/Multi-Vendor
**********************************************************

With our **Ansible playbooks** it only takes a few commands and adjustments to the configuration file to set up the environment for CS-Cart or Multi-Vendor. The playbooks will configure the web server for you automatically.

.. note::

    If you don’t want to use Ansible playbooks, configure your server manually to meet :doc:`CS-Cart system requirements </install/system_requirements>`.

=======================
Step 1. Install Ansible
=======================

.. important::

    Our playbooks don’t handle package conflicts—if a package can’t be installed, you’ll get an error. That’s why we advise using the playbooks on clean OS installations only.

Depending on your server’s operating system, run the following commands one by one to install Ansible:

* On **CentOS 6:**

  .. code-block:: bash

      sudo yum -y install epel-release

  .. code-block:: bash

      sudo yum install -y gcc git openssl-devel libffi-devel libselinux-python python-crypto python-jinja2 python-paramiko sshpass python-six PyYAML

  .. code-block:: bash

      sudo rpm -ihv https://releases.ansible.com/ansible/rpm/release/epel-6-x86_64/ansible-2.4.6.0-1.el6.ans.noarch.rpm

* On **CentOS 7:**

  .. code-block:: bash

      sudo yum -y install epel-release

  .. code-block:: bash

      sudo yum install -y gcc git openssl-devel libffi-devel libselinux-python python-crypto python-jinja2 python-paramiko sshpass PyYAML python-setuptools

  .. code-block:: bash

      sudo rpm -ihv  https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.4.6.0-1.el7.ans.noarch.rpm

* On **Ubuntu 14.04:**

  .. code-block:: bash

      sudo add-apt-repository -y ppa:ansible/ansible

  .. code-block:: bash

      sudo apt-get -y update

  .. code-block:: bash

      sudo apt-get -y install git python-dev libffi-dev python-markupsafe libssl-dev

  .. code-block:: bash

      sudo apt-get -y install ansible

* On **Ubuntu 16.04:**

  .. code-block:: bash

      sudo add-apt-repository -y ppa:ansible/ansible

  .. code-block:: bash

      sudo apt-get -y update

  .. code-block:: bash

      sudo apt-get -y install git python-dev libffi-dev python-markupsafe libssl-dev

  .. code-block:: bash

      sudo apt-get -y install ansible


===========================
Step 2. Configure main.json
===========================

Once you have installed Ansible, you can download and run one of our playbooks to configure the server. Follow these steps:

#. Clone the repository with our playbooks, so that you can run them:

   .. code-block:: bash

       mkdir ~/playbooks && git clone https://github.com/cscart/server-ansible-playbooks ~/playbooks

   The command above creates a copy of `this repository <https://github.com/cscart/server-ansible-playbooks>`_ in the home directory on your server. That way you'll always be able to find the directory with the playbooks by simply using the ``cd ~/playbooks`` command.

#. Create **main.json**, a file that will be used by our playbooks to configure the environment.

   .. code-block:: bash

       cp ~/playbooks/config/advanced.json ~/playbooks/config/main.json

   The command above simply copies an existing file called **advanced.json** and pastes it as **main.json** in the same directory (*~/playbooks/config*). At this point, the file contains only the example configuration that you'll need to change.

#. Edit the **main.json** file in the *~/playbooks/config/* directory on your server according to your needs. By default, the file looks like this:

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

   * ``stores_dir``—the directory that will contain the folders with your CS-Cart installations.

   * ``stores``—an array with the data of your CS-Cart installations.

     * ``example.com``—the domain name of your CS-Cart installation. It is also the name of the folder where that installation will be located. In this example we'll have one CS-Cart installation located in */var/www/html/example.com*.

     * ``storefronts``—an array with the domain names of :doc:`additional CS-Cart storefronts </user_guide/stores/index>`. If there are no additional storefronts, leave the array empty. For example: ``"storefronts": []``.

     * ``database``—the credentials of the MySQL database that will be created by the playbook for that particular CS-Cart installation:

       * ``name``—the name of the database.

       * ``user``—the name of the MySQL user account that will work with the database.

         .. warning::

             **DON'T** set ``root`` as a user, or else ``root`` won't be able to access or create any other databases.

       * ``password``—the password of the MySQL user specified above.

   If you work with your server via SSH (for example, if you are following :doc:`our guide to install CS-Cart on DigitalOcean </install/digitalocean>`), then you can use a command-line text editor to modify **main.json** according to your needs. We recommend **nano**, because it's the easiest to use:

   #. On CentOS you'll need to install **nano** first. Run the following command:

      .. code-block:: bash

          yum install nano

   #. Open the file you want to edit (if you use Ubuntu, you just start with this command, without installing **nano**):

      .. code-block:: bash

          nano ~/playbooks/config/main.json

   #. Now you'll be able to edit the file. Navigate around it with arrow keys and work with the file like you usually do in a text editor. The example below is what we got after editing **main.json** for installing CS-Cart on DigitalOcean. That configuration is intended for a single CS-Cart or Multi-Vendor installation with no additional storefronts.

      .. important::
 
          Replace the domain name with your own and change the database credentials that will be created.

      .. code-block:: json

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

   #. Press **Ctrl + X** to exit the editor. You'll be asked if you want to save the changes. Press the **Y** button to do so, then press **Enter** to confirm the name of the file that you want to modify.

======================
Step 3. Run a Playbook
======================

Depending on the PHP version and the web server you want to use, **run one of the playbooks** by using a command below. If the playbook runs without errors, you will be able to install CS-Cart or Multi-Vendor after that.

* **lamp.yml**: *nginx + apache + mysql + php5.6*

  .. code-block:: bash

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory lamp.yml

* **lemp.yml**: *nginx + mysql + php5.6*

  .. code-block:: bash

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory lemp.yml

* **lemp7.yml**: *nginx + mysql + php7.1*

  .. code-block:: bash

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory_php7 lemp7.yml

* **lvemp7.yml**: *varnish + nginx + mysql + php7.1*

  .. code-block:: bash

      cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory_varnish lvemp7.yml
