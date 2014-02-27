******************
Add-on Directories
******************

Required Directory
==================

The directory *app/addons/<add-on name>* is mandatory for every add-on.

All the add-on files except for templates should reside in this directory:

    *   *addon.xml* - file describes main add-on data, that is necessary to install and delete the add-on.
    *   *func.php* - functions used by the add-on controllers.
    *   *init.php* - primary function - registration of a list of hooks that will be used by the add-on.
    *   *config.php* - configuration data of the add-on.

and the following directories:

    *   *controllers* - directory contains files of the add-on controllers and also files of pre- and postcontrollers of the program standard controllers.
    *   *schemas* - directory with files extending standard schemas of the program.

Additional Templates Directories
================================

An add-on can use the following directories in addition to the required one:

    *   *var/themes_repository/basic/templates/addons/<add-on name>*—customer area templates
    *   *design/backend/templates/addons/<add-on name>*—administration panel templates
    *   *var/themes_repository/basic/mail/templates/addons/<add-on name>*—e-mail templates


.. hint::

    More subdirectories and files can be created in this directory at a developer's discretion. Encryption standards require the name and structure to be identical to the structure of the main application.
