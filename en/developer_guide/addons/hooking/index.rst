*******
Hooking
*******


Hooking is a concept in programming that deals with control flow. A hook is just a special place in the source code that serves as an entry point for some external code.

Thanks to this technique, you can create an add-on and hook it to the necessary part of code. As a result, your add-on will work without affecting the core functionality. 

A great practical example of hook usage is provided in the :doc:`Advanced Add-on Tutorial <../tutorials/advanced>`.

CS-Cart uses two kinds of hooks—in the source code (PHP hooks) and in the templates (TPL hooks). In this section you can find both hook types explained.

`Here <http://en.wikipedia.org/wiki/Hooking>`_ you can read some general information on hooking.

.. important::

    If you want us to add a new hook, please request it `in this topic on our forum <http://forum.cs-cart.com/topic/40547-your-add-on-needs-a-new-hook-in-cs-cart-post-it-here/>`_ or `in the developer chat <http://forum.cs-cart.com/topic/46339-chat-for-cs-cart-developers-in-slack/>`_. We may adjust your requested hook according to :doc:`our standards. <../../core/coding_standards/hooks>`

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    *
