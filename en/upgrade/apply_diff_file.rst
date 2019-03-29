*************************
How To: Apply a DIFF File
*************************

When we fix a bug, the fix is usually included in one of the future versions of CS-Cart. But it may take a while for a new version to be released, and a bug needs to be fixed now. That’s why we provide files in the unified DIFF format.

A unified DIFF file contains the information what lines must be added or removed from the original file to get the patched file. These changes can be made manually or automatically via the command line.

========================================
Applying a DIFF File in the Command Line
========================================

.. note::

    This instruction implies that your server uses a UNIX-like operating system, and you have a direct or SSH access to the server.

1. Create a full backup of the files and database of your CS-Cart/Multi-Vendor store.

2. Copy the DIFF files to the root directory of your store.

3. Open the terminal on the server or access the server remotely via SSH.

4. Go to the root directory of your store in the command line with a command like::

     cd /path/to/cscart/root/directory

   Replace */path/to/cscart/root/directory* with the actual path to the root directory of your store.

5. Run the following command for each DIFF file::

     patch -p1 < example.diff

   Replace **example.diff** with the name of the DIFF file.

=============================
Applying a DIFF File Manually
=============================

If the console command can’t be used for some reason, you can use the DIFF file to apply the changes manually. Let’s assume we have the following DIFF file:

.. code-block:: diff

    diff --git a/app/addons/my_changes/addon.xml b/app/addons/my_changes/addon.xml
    index efa480f..00981ea 100755
    --- a/app/addons/my_changes/addon.xml
    +++ b/app/addons/my_changes/addon.xml
    @@ -1,9 +1,9 @@
     <?xml version="1.0"?>
     <addon scheme="3.0">
         <id>my_changes</id>
    -    <version>1.0</version>
    -    <priority>4294967294</priority>
    +    <version>2.0</version>
    +    <priority>100500</priority>
         <position>0</position>
    -    <auto_install>MULTIVENDOR,ULTIMATE</auto_install>
         <default_language>en</default_language>
    +    <status>active</status>
     </addon>

First let’s determine which file we must edit. In our case it’s **addon.xml** located in *app/addons/my_changes* in the root directory of the CS-Cart store. You can find out the name and the location of the file by the following lines:

.. code-block:: diff

    --- a/app/addons/my_changes/addon.xml
    +++ b/app/addons/my_changes/addon.xml

Generally, minuses in a DIFF file mean that the line relates to the original file, and pluses mean that the line relates to the patched file.

A single unified DIFF file includes parts of the content from both the original and the patched file. Here is how a part of content that needs to be modified looks in the DIFF file:

.. code-block:: diff

     <?xml version="1.0"?>
     <addon scheme="3.0">
         <id>my_changes</id>
    -    <version>1.0</version>
    -    <priority>4294967294</priority>
    +    <version>2.0</version>
    +    <priority>100500</priority>
         <position>0</position>
    -    <auto_install>MULTIVENDOR,ULTIMATE</auto_install>
         <default_language>en</default_language>
    +    <status>active</status>
     </addon>

The main rules are simple:

* When a line begins with ``-``, remove it from the file that you are editing.

* When a line begins with ``+``, add it to the file that you are editing (naturally, without a ``+`` at the beginning of the line).

* When a line begins with whitespace, you don't have to do anything about it. That's because the line didn't change in the patched file.

So, the original file (before the changes are made) looks like this:

.. code-block:: xml

    <?xml version="1.0"?>
    <addon scheme="3.0">
        <id>my_changes</id>
        <version>1.0</version>
        <priority>4294967294</priority>
        <position>0</position>
        <auto_install>MULTIVENDOR,ULTIMATE</auto_install>
        <default_language>en</default_language>
    </addon>

After you make the changes described in the DIFF file, the patched file will look like this:

.. code-block:: xml

    <?xml version="1.0"?>
    <addon scheme="3.0">
        <id>my_changes</id>
        <version>2.0</version>
        <priority>100500</priority>
        <position>0</position>
        <default_language>en</default_language>
        <status>active</status>
    </addon>

The example above deals with a short file. That’s why the DIFF file could include the entire content of the original and patched files. But sometimes you need to edit a large file, and the changes are made to multiple distant parts of it. In those cases a unified DIFF file includes only separate parts of the file, and lines like ``@@ -l,s +l,s @@`` specify where you should look for the parts that you need to modify.

* ``l`` is the number of the line where the part that you should be looking for begins.

* ``s`` is the quantity of lines from that part of the file, that are included in the DIFF file. 

For example, our DIFF file has the following line: ``@@ -1,9 +1,9 @@``:

* ``-1,9`` means that below you’ll see 9 lines from the original file, starting with line 1. Lines that begin with ``+`` don’t count, because they don't exist in the original file.

* ``+1,9`` means that below you’ll see 9 lines from the patched file, starting with line 1. Lines that begin with ``-`` don’t count, because they don't exist in the patched file.

Number 9 didn’t change because we added and removed the same number of lines in one part of the file, so the total number of lines hasn’t changed.

Sometimes the line with ``@@ -l,s +l,s @@`` also includes some code that is somewhere above the ``l`` line. This code is the title of this part of the file, and the title can be ignored safely.

.. meta::
   :description: How to fix a bug in CS-Cart or Multi-Vendor before the release of a new version? Use a DIFF file, if provided by CS-Cart team. Apply it manually or via command line.
