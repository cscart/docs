**********************************************
How To: Increase the Performance of Your Store
**********************************************

.. note::

    **Tutorial Difficulty: Varies**

There are several ways to increase the performance of your store. Some ways require technical knowledge, whereas other ways are available to everyone.

===================================
Delete the Languages You Do Not Use
===================================

1. In the administration panel, go to **Administration → Languages → Manage languages**.

2. Delete the languages that you do not use:

* To delete one language, hover over it, click the **gear button** next to the status of the language and choose **Delete**.

* To delete multiple languages at once, tick the checkboxes next to their language codes, then press the **gear button** in the top right corner of the page and choose **Delete selected**.

.. important::

    For the performance to increase, you must delete the languages, not just disable them. If you need a deleted language later, you can switch to the **Available** tab and install it again.

=====================
Optimize the Database
===================== 

Optimize the database to increase performance: that way you reclaim unused space and defragment the datafile.

1. In the administration panel, go to **Administration → Backup/Restore**.

2. Click the **gear button** on right and choose **Optimize Database**. 

3. Wait for the progress bar to fill. The database size will be decreased, if possible.

=======================
Change the Caching Type
=======================

.. warning::

    This part of the article requires technical knowledge.

To change the caching type, complete the following steps:

1. Open the **config.local.php** file in the root directory of your CS-Cart installation.

2. Find this part of the code:

::

  // Cache backend
  // Available backends: file, sqlite, database, redis, xcache, apc
  // To use sqlite cache the "sqlite3" PHP module should be installed
  // To use xcache cache the "xcache" PHP module should be installed
  // To use apc cache the "apc" PHP module should be installed
  $config['cache_backend'] = 'file';

3. Replace ``file`` in this line of the code:

::

  $config['cache_backend'] = 'file';

with the necessary variant, for example, ``database``:

::

  $config['cache_backend'] = 'database';

4. Save the file.

.. note::

    The ``file`` cache backend is used by default, other available variants are: ``sqlite``, ``database``, ``redis``, ``xcache``, ``apc``.

    To use ``sqlite``, the **sqlite3** PHP module must be installed on your server. To use ``xcache``, the **xcache** PHP module must be installed. To use ``apc`` cache, the **apc** PHP module must be installed. 

