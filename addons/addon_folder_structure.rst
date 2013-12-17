***********************
Add-on Folder Structure
***********************

Add-on can include the following directories in any combination with the required directory:

    * *app/addons/[addon_name]* - required directory with the add-on PHP files.
    * */var/themes_repository/basic/templates/addons/[addon_name]* - directory with templates for the customer area.
    * */design/backend/templates/addons/[addon_name]* - directory with templates for the administration panel.
    * */var/themes_repository/basic/mail/templates/addons/[addon_name]* - directory with the e-mail templates.

The add-on PHP files directory (*app/addons/addon_name*) contains the following files:

    * *addon.xml* - file describes main add-on data, that is necessary to install and delete the add-on.
    * *func.php* - functions used by the add-on controllers.
    * *init.php* - primary function - registration of a list of hooks that will be used by the add-on.
    * *config.php* - configuration data of the add-on.
    * */controllers* - directory contains files of the add-on controllers and also files of pre- and postcontrollers of the program standard controllers.
    * */schemas* - directory with files extending standard schemas of the program.
    
    Also, additional subdirectories and files can be created in this directory at a developer's discretion. Encryption standards require the name and structure to be identical to the structure of the main application.
