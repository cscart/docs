**********************************************
Adapt Your Add-Ons from CS-Cart 4.2.1 to 4.2.2
**********************************************


This is the next set of changes in cart functionality that can affect add-ons operation. CS-Cart 4.2.2 is mostly the bug fixing version, so, there are no functionality changes that can totally break the add-on working.

**Here is the list of major changes:**

In the *app/Tygh/BlockManager/SchemesManager.php* class the optional parameter ``$area`` was added for the ``generateTemplateName`` method.

Old:

.. code-block:: none

	public static function generateTemplateName($path, $theme_path)

New:

.. code-block:: none

	public static function generateTemplateName($path, $theme_path, $area = AREA)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

In the **Mailer.php** class the ability to use the ``cc`` (Carbon copy) parameter when sending messages was added. It is also possible to use **SMTPSecure** now (sending messages through servers using SSL).

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Some methods in the *app/Tygh/Themes/Styles.php* class were changed:

Old:

.. code-block:: none

	public function getStyleFile($style_id, $css = false)

New:

.. code-block:: none

	public function getStyleFile($style_id, $type = 'less')

Old:

.. code-block:: none

	private function getStylesPath($get_relative = false)

New:

.. code-block:: none

	private function getStylesPath()

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The new parameter was added to the **fn_create_seo_name** function:

Old:

.. code-block:: none

	function fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = , $company_id = , $lang_code = CART_LANGUAGE, $create_redirect = false)

New:

.. code-block:: none

	function fn_create_seo_name($object_id, $object_type, $object_name, $index = 0, $dispatch = , $company_id = , $lang_code = CART_LANGUAGE, $create_redirect = false, $area = AREA)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The tweak **lazy_thumbnails** setting was added. This means that earlier the path for generating a thumbnail was something like that:

	*dispatch=images.generate&image=asdfsdf.gif....*

And now:

	*/images/thumbnails/50/50/asdfasdf.gif*
