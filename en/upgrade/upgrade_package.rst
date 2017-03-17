****************************************
Upgrade Center: Build an Upgrade Package
****************************************

.. warning::

    This article describes how to work with the tool for building core upgrade packages. That tool was intended for internal use by CS-Cart team.

To create an upgrade package automatically, we wrote the **build.php** script (*_tools/upgrade/*). Run it with the following command:

.. code-block:: none

	cd _tools/upgrade
	php build.php

**Name**

.. code-block:: none

	build.php -- make upgrade package

**Synopsis**

.. code-block:: none

	php build.php old new

**Description**

Make upgrade package from old version to the new one.

Example of the **build.php** tool use:

.. code-block:: none

	php build.php ~/arch/cscart_4.3.1.tgz ~/Download/cscart_4.3.2.tgz

As a result, the *packs* directory will be created in *_tools/upgrade/*. There will be an archive with the following name in it: *upgrade_[old_version]_[old_edition]-[new_version]_[new_edition].tgz*, and a directory. That directory has the same contents as an archive. It was made for manual deleting/adding/editing files and structure.

Languages and Language Packages
*******************************

All the available at the moment (for the current version) language packages will be included to the upgrade pack.

Migrations
**********

Migrations are taken from the following directory of the current branch: *_tools/migration/migrations/[NEW_VERSION]/*, where *[NEW_VERSION]* - is the new CS-Cart version.

If you want to upgrade your CS-Cart store to version 4.3.2, all the migrations from the *_tools/migration/migrations/4.3.2/* directory will be taken.

PRE/POST Scripts
****************

They work in the same way as the migrations. All the PRE/POST scripts are searched for in the *_tools/migration/scripts/[NEW_VERSION]/* directory.
Script names must contain the ``pre_`` and ``post_`` prefixes.

Example:

.. code-block:: none

  pre_create_folder.php
  post_clear_garbage.php

Scripts can contain any PHP code.

.. important:: Pre script is included in the upgrade in any case (either the **pre_checking.php** file is created, or the additional code is written to the beggining of the existing one). This code is an additional checking for the installed cart license.

Extra
*****

Sometimes it is necessary to change the **package.json** file automatically (for example, remove files that were not included to a list). To do it, create the **extra.php** file in the *_tools/migration/extra/[NEW_VERSION]* directory.

Return an array with the new data:

.. code-block:: none

	<?php

	return array(
	    'files' => array(
	        "app/addons/tags/controllers/backend/pages.pre.php" => array(
	            "status" => "deleted",
	            "hash" => "3d9d910be344a8450f81a4618863595d"
	        ),
	        "app/lib/vendor/robmorgan/phinx/README.mdown" => array(
	            "status" => "deleted",
	            "hash" => "2bd280684e096088e4ce7dbb89e77376"
	        ),
	    )
	);

Example of the *Upgrade* add-on you can find `here <https://github.com/cscart/sample-upgrade-addon>`_.
