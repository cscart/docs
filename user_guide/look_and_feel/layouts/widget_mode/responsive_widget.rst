*********************************************************************
Responsive Theme in Widget Mode Displays Inorrectly on Mobile Devices
*********************************************************************

If you have set a responsive theme in a **Widget mode** and built your store to a 3rd party website, but on mobile devices your store is still displayed with the width of a desktop version, add the following meta tag to the page where you built in your store:

.. code-block:: none

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

Put it between the *<head>* and *</head>* tags, and your responsive theme will work properly on all mobile devices.
