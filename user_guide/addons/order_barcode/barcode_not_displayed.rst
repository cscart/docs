************************
Barcode is Not Displayed
************************

*	Go to the **Add-ons → Manage add-ons** section and make sure that the **Order barcode** addon has an *Active* status.
*	If it is enabled, then most probably **GD library** is not installed on your server.
*	Contact your server administrator about this problem and ask to recompile **PHP** with **GD** support.

.. note ::

	PHP must be configured with the following keys: **--with-gd --enable-gd-native-ttf**