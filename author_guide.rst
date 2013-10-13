********************************
CS-Cart Docs Author's Guidelines
********************************

Introduction
============

The docs are written using the `reStructuredText (reST) <http://docutils.sourceforge.net/rst.html>`_ markup and built with `Sphinx <http://sphinx-doc.org/>`_.

Please familiarize yourself with the reST specs and `reStructuredText primer <http://sphinx-doc.org/rest.html>`_ before contributing to the docs.

The ReST + Sphinx combo is a de-facto standard used in the `Python <http://python.org>`_ world.

Refer to `this page source <https://bitbucket.org/cscart/docs-2.0/src/>`_ as a live example.

Zen of Docs
-----------

*   A cool documentation is one which changes [#w3c_uri]_.
*   If you don't understand it, nobody will.
*   Listen to your heart.
*   Cut out without worry.
*   Improve without delay.
*	Sparse is better than dense [#zen_of_python]_.
*   Overclarity is better than underclarity.
*   Formatting *matters*.

General
-------

Sparse is better than dense, so, if you have a choice, always prefer inserting an empty line and indenting.

Use **bold** with prudence; bold text draws reader's attention, and reader's attention is a limited resource.

*Italic* is a more gentle way to highlight a statement; it should be used to indicate a  different *type* of text (e.g. a path) rather than stress out the statement itself (this is the bold's job).

Typography
==========

Below you will find some typography standards adopted by the CS-Cart documentation.

Headers
-------

The first header on a page is used as its title. It is marked with two lines or ``*`` (asterisk), one above and another below the line:

    .. code-block:: rst

        *************
        War and Piece
        *************

.. important::

    All three lines must be equally long, otherwise the build will fail.

    The same applies to all other headers described below.

First-level header is marked with an underline of ``=`` (the equality sign):

    .. code-block:: rst

        Chapter 1
        =========

Second-level header is marked with an underline of ``-`` (dash):

    .. code-block:: rst

        At the Ball
        -----------

It is not often that you will need to use a lower level header. If you absolutely must, use an underline of ``"`` (doublequote) for a third-level header:

    .. code-block:: rst

        Later that Evening
        """"""""""""""""""

.. note::

    If you need to go deeper, please reconsider this decision. It is usually better to split a doc into two instead of creating a single overnested monster.

References and Hyperlinks
-------------------------

References
""""""""""

To place a reference to a particular place in some doc (in other words, an internal link), you first have to anchor the location you want to link to:

    .. code-block:: rst

        .. _important-place:

.. note::

    Note the underscore at the beginning of the anchor name. It *is* important.

    Use ``-`` (dash) to separate individual words, because dashes are used in HTML anchor links.

Then, you can refer to this location:

    .. code-block:: rst

        Go to this :ref:`very important place <important-place>`.

.. note::

    The references are documentation-wide. You can refer to any place in any document without specifying the document name.

    Note the quote characters used (`````, not ``'`` or ``"``). This applies to doc references and hyperinks as well.

To refer to an entire document, use the ``:doc:`` syntax:

    .. code-block:: rst

        Proceed to the :doc:`instructions <../man/instructions>`.

.. note::

    In the above example, the reference is to a *doc*, not a *file*; this is why the file extension is not provided. It just so happens that a doc is named after the corresponding file.

    Note that you can use `Unix-like <https://en.wikipedia.org/wiki/Unix_path#Unix_style>`_ paths.

Hyperlinks
""""""""""

Normally, a link is placed like this:

    .. code-block:: rst

        `Sloth <https://en.wikipedia.org/wiki/Sloth>`_

Read more about named links in the `reStructuredText primer <http://sphinx-doc.org/rest.html>`_.

Paths, URLs, and Code Samples
-----------------------------

Paths
"""""

Paths must be marked up in *italic*:

    */srv/http/cscart/*

    *<some path>/my_file.ext*

URLs
""""

Keep URLs clean and tidy. Do not forget to place ``http`` at the beginning. Avoid ``www`` in URLs. Trailing slash is OK.

URLs must be marked up in *italic*:

    *http://cs-cart.com/*

Code samples
""""""""""""

PHP code can be inserted simply by using ``::`` (double colon) and indenting the code above:

    .. code-block:: rst

        Here is some PHP code::

            $greeting = "Hello, World!";

            $twelve = 7 + 5;

To show a sample of code in another language, use the ``code-block`` directive with the language specified as its param:

    .. code-block:: rst
        
        Here is some Python code:

            .. code-block:: python

                def hello(name=None):
                    if name:
                        print('Hello, {name}!'.format(name=name))
                    else:
                        print('Hello, World!')

Read more about showing code examples in the `Sphinx documentation <http://sphinx-doc.org/markup/code.html#code-examples>`_.

Short code samples can be shown inline in ``fixed-width``:

    .. code-block:: rst

        Value binding in Python is as simple as ``name = value``.

Notes, Importants, Warnings, and Hints
-------------------------------------

Sphinx supports a variety of information block directives, but only four are used in the CS-Cart docs: ``.. note::``, ``.. important::``, ``.. warning::``, and ``.. hint::``.

Note
""""

Use this directive to show an additional piece of information, which can be safely skipped while reading, but will be useful as general knowledge:

    .. code-block:: rst

        And this is how you bake a cake.

        .. note::

            Cakes are extremely popular in Ireland.

Important
"""""""""

Use this directive to show a block of important information that is should not be skipped:

    .. code-block:: rst

        Set the permissions to **777**.

        .. important::

            The installation will fail if the persmissions are incorrect.

Warning
"""""""

This directive should be used with caution. It indicates a dangerous turn in the narrative:

    .. code-block:: rst

        Now your store is ready for the upgrade.

        .. warning::

            All existing data will be lost!

Hint
""""

This directive is not used too often. Use it to point to a useful tool or tip:

    .. code-block:: rst

        Copy the new files to your directory.

        .. hint::

            You can use `Ctrl + C` to copy files and `Ctrl + V` to paste them.

Images and Fancybox
-------------------

Images are inserted with the ``.. image::`` directive:

    .. code-block:: rst

        .. image:: img/cscart.png
            :align: center
            :alt: CS-Cart logo

**Always** set the ``:align:`` param to ``center`` and define the ``:alt:`` param.

If an image is wider than 650 px, use the ``fancybox`` directive instead:

    .. code-block:: rst

        .. fancybox:: img/cscart_storefront.png

.. important::

    The ``.. fancybox::`` directive accepts the image path as its param, not as its content, therefore it must sit on the same line as the directive itself, separated with a whitespace.

.. rubric:: Footnotes

.. [#w3c_uri] Based on `Cool URIs don't change <http://www.w3.org/Provider/Style/URI/>`_ by Tim Berners-Lee
.. [#zen_of_python] From `Zen of Python <http://www.python.org/dev/peps/pep-0020/>`_
