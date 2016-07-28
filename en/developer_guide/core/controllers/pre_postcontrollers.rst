*************************
Pre- and Post-Controllers
*************************

Pre-controllers and post-controllers are special PHP files of the add-on, which (depending on their names and location in the add-on file structure) are called before or after executing a standard controller.

Example:

	*	In the */controllers/backend* or */controllers/frontend* directory of the Attachments add-on you can find the following file: *products.post.php*

		The files in these directories are either controllers of the add-on or pre-/post-controllers for standard controllers.
      
	*	The pre- or post-controller file name has the following structure:
	
		*[controller name].[pre/post].php*. 

		As a controller with the name "products" is a standard one, the add-on can only declare pre- or post-controller for it. 

		*.post* in the file name indicates that the file will be connected and executed after the standard controller *products* is performed. To set it in motion prior to the standard controller execution, *.post* should be replaced with *.pre*.
