***************************
Configuring the Environment
***************************

=============
The Right Way
=============

Development environment should mimic the production environment as closely as possible. This helps to avoid *it-worked-fine-on-my-OS* and *it-used-to-look-different* situations when moving from development to production.

That’s why we recommend using a virtual machine configured to meet :doc:`CS-Cart system requirements <../../install/system_requirements>`.

We created a script to deploy the environment on a clean installation of Ubuntu or CentOS with 6 commands and a few tweaks in a configuration file. Install Ansible and run one of our scenarios (playbooks) to have the environment configured for you.

.. toctree::
    :maxdepth: 1
    :glob:

    server_ansible_playbooks

==========
Other Ways
==========

Setting up a separate server or a virtual machine isn’t always an option. If that’s the case, use one of the following ways, depending on your operating system:

* **Linux**—install and configure *LAMP* (it stands for Linux, Apache, MySQL/MariaDB, PHP); as an alternative, use `XAMPP <https://www.apachefriends.org/index.html>`_ (not recommended)

* **Mac OS**—install  Homebrew and use it to install LAMP; as an alternative, use `XAMPP <https://www.apachefriends.org/index.html>`_ (not recommended)

* **Windows** (not recommended)—use `XAMPP <https://www.apachefriends.org/index.html>`_
