********************************************
How To: Configure the Environment in 3 Steps
********************************************

With our **Ansible Playbooks** it only takes a few commands and adjustments to the configuration file to set up the environment for CS-Cart or Multi-Vendor. The scenarios (playbooks) will configure the web server for you automatically.

.. note::

    If you don't want to use Ansible Playbooks, configure your server to meet :doc:`CS-Cart system requirements <../../install/system_requirements>`.
 
==================================
Step 1. Install Ansible (v. 1.9.x)
==================================

Depending on your server's operating system, run one of these sets of commands to install Ansible:

* **CentOS 6**::

    sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
    sudo yum install -y gcc python-pip python-devel git openssl-devel libffi-devel libselinux-python
    sudo pip install ansible

* **CentOS 7**::

    sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo yum install -y gcc python-pip python-devel git openssl-devel libffi-devel
    sudo pip install ansible

* **Ubuntu**::

    sudo apt-get -y update
    sudo apt-get -y install git python-pip python-dev libffi-dev python-markupsafe libssl-dev
    sudo pip install ansible

.. important::

    Our playbooks don't handle package conflicts—if a package can't be installed, you'll get an error. That's why we advise using the playbooks on clean OS installations only.

============================
Step 2. Configure a Playbook
============================

Once you have installed **Ansible**, you can download and run one of our playbooks to configure the server. Follow these steps:

1. Download the repository::

     mkdir ~/playbooks && git clone https://github.com/cscart/server-ansible-playbooks ~/playbooks

2. Create **main.json** with your configuration::

     cp ~/playbooks/config/advanced.json  ~/playbooks/config/main.json

3. Modify the settings in **~/scenarios/config/main.json**:

   * ``stores_dir``—your project directory

   * ``stores``—an array of projects

     * ``example.com``—the domain name of a project

     * ``storefronts``—an array with the domain names of the storefronts. If there are no storefronts, leave the array empty. For example: ``"storefronts": []``

     * ``database``— the credentials of the database that will be created by the playbook. 

     .. warning::

         **DON'T** set ``root`` as a user here, or else ``root`` won't be able to access or create any other databases.

======================
Step 3. Run a Playbook
======================

Depending on the PHP version and the web server you want to use, **run one of the playbooks** by using a command below. If the playbook runs without errors, you will be able to install CS-Cart or Multi-Vendor after that.

* **lamp.yml**: *nginx + apache + mysql + php5.6*

  ::

    cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory lamp.yml

* **lemp.yml**: *nginx + mysql + php5.6*

  ::

    cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory lemp.yml

* **lemp7.yml**: *nginx + mysql + php7.0*

  ::

    cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory_php7 lemp7.yml

* **lvemp7.yml**: *varnish + nginx + mysql + php7.0*

  ::

    cd ~/playbooks/ && ansible-playbook -e @config/main.json -c local -i inventory_varnish lvemp7.yml

.. important::

     Errors may occur when running a playbook on Ubuntu.
