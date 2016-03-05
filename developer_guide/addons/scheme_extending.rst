******************
Extending a Scheme
******************


A :doc:`scheme <../core/schemes>` can be extended and overridden by an add-on.

In order to extend a scheme, you should first create the directory *schemas* within the add-on directory (if it does not exist yet). In this directory, you can reproduce the core *schemas* directory structure to address a particular scheme. The scheme can be extended both by prepending and appending it with additional content. Name your files according to this pattern to extend the according scheme: *<scheme_name>.[pre|post].php*.

For example, you can extend the scheme *block_manager/blocks* by creating the *schemas/block_manager* directory in your add-on directory and putting the extension data in the file *blocks.pre.php* or *blocks.post.php* (or both).

You can see this technique in action in the `Affiliate add-on <https://github.com/cscart/affiliate>`_ , which extends some schemes, e.g. *block_manager/blocks.php*.?
