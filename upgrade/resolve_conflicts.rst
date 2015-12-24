**********************************************************
How To: Resolve Local Modification Conflicts after Upgrade
**********************************************************

If you changed any files of your CS-Cart installation, you'll see them on the list of local modifications :doc:`when you install an upgrade <upgrade_process>`. The Upgrade Center will back up those files, so that you can resolve the conflicts manually after the upgrade. To do it, follow these steps:

1. Open the administration panel of your store.

2. Go to **Administration → Upgrade center**.

3. Switch to the **Installed upgrades** tab.

4. All the performed upgrades are listed on the page, click the **Conflicts** button of the desired upgrade.

5. There is a list of the files which were backed up during the upgrade. 

.. image:: img/conflicts.png
    :align: center
    :alt: The Upgrade Center will show the files you changed manually and back them up so that you can resolve the conflicts later.

To look through these files, find them in the backup archive in the *var/backups* directory of your CS-Cart installation and compare with the original files. If there are some modifications in code which you would like to keep, apply them to the files once again.

6. Once you have checked a file and resolved the conflicts, switch the file's status to **Resolved**.
