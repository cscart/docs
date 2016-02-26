********************************************************
How To: Configure the Environment with Ansible Playbooks
********************************************************

With **Ansible Playbooks** it takes 6 commands and a few adjustments to the configuration file to set up the environment for CS-Cart. The scenarios (playbooks) will configure the web server for you automatically.

.. important::

    Our playbooks don't handle package conflicts—if a package can't be installed, you'll get an error. That's why we advise using these scenarios on clean OS installations only.
 
==================================
Step 1. Install Ansible (v. 1.9.x)
==================================

Depending on your server's operating system, run one of these sets of commands to install Ansible:

* **Ubuntu**:

::

  sudo apt-get -y update
  sudo apt-get -y install git python-pip python-dev
  sudo pip install ansible

* **CentOS 6**:

::

  sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
  sudo yum install -y gcc python-pip python-devel git
  sudo pip install ansible

* **CentOS 7**:

::

  sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  sudo yum install -y gcc python-pip python-devel git
  sudo pip install ansible

======================
Step 2. Run a Playbook
======================

Once you have installed **Ansible**, you can download and run one of our playbooks to configure the server. Follow these steps:

1. Download the repository:

::

  mkdir ~/scenarios && git clone https://github.com/cscart/server-ansible-playbooks.git ~/scenarios

2. Create a file with your configuration:

::

  cp ~/scenarios/config/advanced.json  ~/scenarios/config/main.json

3. Modify the settings in **~/scenarios/config/main.json**:

   * **stores_dir**—your project directory
   * **stores**—an array of projects
   * **example.com**—the domain name of a project
   * **storefronts**—an array with the domain names of the storefronts
   * **database**—the credentials of the database that will be created by the playbook

4. Run the desired Playbook. For example, let's configure our server to use **Varnish**, **nginx**, **MySQL**, and **PHP 7.0**:

::

  cd ~/scenarios/ && ansible-playbook -e @config/main.json -c local -i inventory_varnish lvemp7.yml

.. note::

    You can use any other playbook from the **Web Server Configurations** section.

5. If the scenario works without errors, you can install CS-Cart.


=========================
Web Server Configurations
=========================

We have prepared several playbooks, depending on the PHP version and the web server you want to use. Run one of these commands instead of the command provided in **Step 2.4.**

.. hint::

    If you don't want to use the scenarios, configure your server to meet :doc:`CS-Cart system requirements <../../install/system_requirements>`.

* **lamp.yml**: *nginx + apache + mysql + php5.6*

  ::

    cd ~/scenarios/ && ansible-playbook -e @config/main.json -c local -i inventory lamp.yml

* **lemp.yml**: *nginx + mysql + php5.6*

  ::

    cd ~/scenarios/ && ansible-playbook -e @config/main.json -c local -i inventory lemp.yml

* **lemp7.yml**: *nginx + mysql + php7.0*

  ::

    cd ~/scenarios/ && ansible-playbook -e @config/main.json -c local -i inventory_php7 lemp7.yml

* **lvemp7.yml**: *varnish + nginx + mysql + php7.0*

  ::

    cd ~/scenarios/ && ansible-playbook -e @config/main.json -c local -i inventory_varnish lvemp7.yml

-----------------
Operating Systems
-----------------

Note that PHP 7 supports the following operating systems:

* Ubuntu 14.04 x86_64
* Ubuntu 15.04 x86_64
* CentOS 6 x86_64
* CentOS 7 x86_64

.. important::

    Among other software, our playbooks automatically install and configure `fail2ban <http://www.fail2ban.org/wiki/index.php/Main_Page>`_. However, if you run one of our playbooks **on Ubuntu 15.04**, you'll need to **configure fail2ban manually**. You will see a warning when you run the playbook, but everything except for **fail2ban** will work properly. 
