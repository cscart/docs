*************************
Example of Product Import
*************************

This article describes how you can test the import functionality of your store by importing a CSV file that we already prepared for you.

#. Download :download:`an example of a CSV file <files/test.csv>` or create a file called **test.csv** with the following content:

   .. code-block :: none

       Product code;Language;Category;List price;Price;Weight;Quantity;Min quantity;Shipping freight;Date added;Downloadable;Files;Ship downloadable;Inventory tracking;Free shipping;Feature comparison;Zero price action;Thumbnail;Detailed image;Product name;Description;Meta keywords;Meta description;Search words;Page title;Taxes;Features;Options;Secondary categories;Usergroup IDs;Pay by points;Override points;Override exchange rate;Store;Short description;Status;Product URL;Image URL
       321294009;en;Books///Computers & Internet;45.00;45.0000;0.00;50;0;0.00;04 Feb 2006 10:50:02;N;;N;B;N;N;R;/var/www/html/stores/version210/images/backup/product/0321294009.01._SCMZZZZZZZ_.jpg#{[DA]:0321294009.01._SCMZZZZZZZ_.jpg,[DE]:0321294009.01._SCMZZZZZZZ_.jpg,[EL]:0321294009.01._SCMZZZZZZZ_.jpg,[EN]:0321294009.01._SCMZZZZZZZ_.jpg,[ES]:0321294009.01._SCMZZZZZZZ_.jpg,[FR]:0321294009.01._SCMZZZZZZZ_.jpg,[IT]:0321294009.01._SCMZZZZZZZ_.jpg,[NL]:0321294009.01._SCMZZZZZZZ_.jpg,[RO]:0321294009.01._SCMZZZZZZZ_.jpg,[RU]:0321294009.01._SCMZZZZZZZ_.jpg,[SI]:0321294009.01._SCMZZZZZZZ_.jpg,};/var/www/html/stores/version210/images/backup/detailed/0321294009.01._SCLZZZZZZZ_.jpg#{[DA]:0321294009.01._SCLZZZZZZZ_.jpg,[DE]:0321294009.01._SCLZZZZZZZ_.jpg,[EL]:0321294009.01._SCLZZZZZZZ_.jpg,[EN]:0321294009.01._SCLZZZZZZZ_.jpg,[ES]:0321294009.01._SCLZZZZZZZ_.jpg,[FR]:0321294009.01._SCLZZZZZZZ_.jpg,[IT]:0321294009.01._SCLZZZZZZZ_.jpg,[NL]:0321294009.01._SCLZZZZZZZ_.jpg,[RO]:0321294009.01._SCLZZZZZZZ_.jpg,[RU]:0321294009.01._SCLZZZZZZZ_.jpg,[SI]:0321294009.01._SCLZZZZZZZ_.jpg,};Adobe Acrobat 7.0 Classroom in a Book (Classroom in a Book);<p>If you&#39,re like most Acrobat users--creative, business, and engineering pros who work with complex electronic documents--you can ill afford to miss a beat in your production workflow. Then again, you can ill afford being left behind when it comes to mastering the newest version of the important tool on your desktop, Adobe Acrobat 7. Not to worry: Adobe has brought the classroom to you in this handy volume, completely revised to cover all that&#39,s new and different in Acrobat 7. Through a series of self-paced lessons (each of which builds on the last and includes hands-on projects that the you can create using the files on the accompanying CD-ROM), this guide acquaints you with all of Acrobat 7&#39,s features for creating, reviewing, editing, commenting on, restructuring, and preflighting PDF files, including the newest: a tool for creating 3D objects, improved security, new tools for repairing errors in print preflight, structured bookmarks, the ability to export comments to Word docs, and more. Professional tips and techniques are scattered throughout!</p>;;;;;VAT;{4}ISBN: T[34225634890];;;;Y;N;N;Simtech;;A;http://localhost/stores/version210/index.php?dispatch=products.view&product_id=1505;http://localhost/stores/version210/images/product/0/0321294009.01._SCMZZZZZZZ_.jpg
       B0009IPN4Q;en;Apparel///Shoes;64.95;64.9500;0.00;50;0;0.00;04 Feb 2006 10:50:02;N;;N;B;N;N;R;/var/www/html/stores/version210/images/backup/product/B0009IPN4Q.01._SCMZZZZZZZ_.jpg#{[DA]:B0009IPN4Q.01._SCMZZZZZZZ_.jpg,[DE]:B0009IPN4Q.01._SCMZZZZZZZ_.jpg,[EL]:B0009IPN4Q.01._SCMZZZZZZZ_.jpg,[EN]:B0009IPN4Q.01._SCMZZZZZZZ_.jpg,[ES]:B0009IPN4Q.01._SCMZZZZZZZ_.jpg,[FR]:B0009IPN4Q.01._SCMZZZZZZZ_.jpg,[IT]:B0009IPN4Q.01._SCMZZZZZZZ_.jpg,[NL]:B0009IPN4Q.01._SCMZZZZZZZ_.jpg,[RO]:B0009IPN4Q.01._SCMZZZZZZZ_.jpg,[RU]:B0009IPN4Q.01._SCMZZZZZZZ_.jpg,[SI]:B0009IPN4Q.01._SCMZZZZZZZ_.jpg,};;Adidas Women's Daroga Mesh Casual Shoe;<b>Features</b><br /><b>&middot,&nbsp,</b>Mesh nylon upper combines light weight and breathability<br /><b>&middot,&nbsp,</b>High-traction rubber outsole<br /><b>&middot,&nbsp,</b>Unroll this open, breathable, high-traction performer to wear as a comfortable shoe or step into it like a clog around camp -- the perfect shoe to pack when pack space is limited<br /><b>&middot,&nbsp,</b>Die-cut EVA midsole for lightweight comfort, airmesh lining for comfort and breathability, Ortholite antimicrobial moisture-wicking sock liner<br /><br />;;;;;VAT;{5}(New features) Manufacturer: E[Adidas];{698}Clothing Size: S[{2894}7.5 M,{2895}8 M,{2896}6.5 M,{2897}7 M,{2898}8.5 M];;1;Y;N;N;Simtech;;A;http://localhost/stores/version210/index.php?dispatch=products.view&product_id=1537;http://localhost/stores/version210/images/product/0/B0009IPN4Q.01._SCMZZZZZZZ_.jpg

   .. note::

        You'll be able to view or edit a CSV file in a spreadsheet application, for example, Microsoft Office Excel or Libre Office Calc.

#. In the Administration panel, go to **Administration → Import data → Products (Deprecated)**. Alternatively, you can use the advanced import; it is described :doc:`in another article </user_guide/manage_products/import_export/advanced_product_import>`.

#. In the **Import options** section, specify the following settings:

   * **Update existing products only**—don't enable this setting; the product doesn't exist in your store yet. If you enable this setting, the product won't be imported.

   * **Images directory**—do not change the value of this field.

   * **Price decimal separator**—leave ``.`` in this field (it is the default value).

   * **Category delimiter**—leave ``///`` in this field (it is the default value).

   * **Feature variants delimiter**—leave ``///`` in this field (it is the default value).

   * **Directory for the files of downloadable products**—do not change the value of this field.

   * **Set quantity of all products to zero**—do not tick this checkbox.

   * **Delete existing files of downloadable products**—do not tick this checkbox.

   * **CSV delimiter**—select *Semicolon*.

   * **Select file**—click the **Local** button and select the downloaded (or created) CSV file.

#. Click the **Import** button. You will see the following notification:

   .. image:: img/import_03.png
       :align: center
       :alt: The notification that is displayed in CS-Cart after product import.

#. Go to **Products → Products**. You now should have 2 more products:

   * **Adobe Acrobat 7.0 Classroom in a Book (Classroom in a Book)** in the *Books/Computer & Internet* category.

   * **Adidas Women's Daroga Mesh Casual Shoe** in the *Shoes* category. 
