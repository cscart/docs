******
Blocks
******

Blocks and their behaviour are controlled by the schemas located in the *app/schemas/block_manager* directory:

* **blocks.php**—the main schema that describes the types of blocks

* **blocks.functions.php**—the functions used by the main schema

* **block_cache_properties.php**—the caching parameters, that apply globally to all blocks that support caching

* **dispatch_descriptions.php**—the list of dispatches and the corresponding language variables; this file is needed only to generate the list for the ``Dispatch`` field when adding/editing a location

* **templates.php**—description of the parameters available for the Smarty templates that can be used in blocks

* **fillings.php**—description of fillings

* **dynamic_objects.php**—description of dynamic objects

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    *
