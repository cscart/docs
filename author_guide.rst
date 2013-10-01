******************************
CS-Cart Docs Author Guidelines
******************************

Introduction
============

The docs are written using the `reStructuredText (reST) <http://docutils.sourceforge.net/rst.html>`_ markup and built with `Sphinx <http://sphinx-doc.org/>`_.

Please familiarize yourself with the reST specs and `reStructuredText primer <http://sphinx-doc.org/rest.html>`_ before contributing to the docs.

The ReST + Sphinx combo is a de-facto standard used in the `Python <http://python.org>`_ world.

Zen of Docs
-----------

*   If you don't understand it, nobody will.
*   Listen well to your doubts: if you sense something nasty about some line, cut it.
*   Cut without worry.
*   Improve without delay.
*	Sparse is better than dense [#zen_of_python]_.
*   Overclarity is better underclarity.
*   Formatting *matters*.

General
-------

Sparse is better than dense, so do not hesitate to 

Typography
==========

Below you will find some typography standards adopted by the CS-Cart documentation.

Headers
-------

The first header on a page is used as its title. It is marked with two lines or `\*` (asterisk), one above and another below the line:

    .. code-block:: rst

        *************
        War and Piece
        *************

.. important::

    All three lines must be equally long, otherwise the build will fail.

    The same applies to all other headers described below.

First-level header is marked with an underline of `=` (the equality sign):

    .. code-block:: rst

        Chapter 1
        =========

Second-level header is marked with an underline of `-` (dash):

    .. code-block:: rst

        At the Ball
        -----------

It is not often that you will need to use a lower level header. If you absolutely must, use an underline of `"` (doublequote) for a third-level header is:

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

    Use `-` (dash) to separate individual words, because dashes are used in HTML anchor links.

Then, you can refer to this location:

    .. code-block:: rst

        Go to this :ref:`very important place <important-place>`.

.. note::

    The references are documentation-wide. You can refer to any place in any document without specifying the document name.

	Note the quote characters used (`\``, not `'` or `"`). This applies to doc references and hyperinks as well.

To refer to an entire document, use the `:doc:` syntax:

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

Paths, URls, and Code Samples
-----------------------------

Paths
"""""

Paths must be marked up in *italic*:

	*/srv/http/cscart/*

	*<some path>/my_file.ext*

URls
""""

Keep URLs clean and tidy. Do not forget to place `http` at the beginning. Avoid `www` in URLs. Trailing slash is OK.

URLs must be marked up in *italic*:

	*http://cs-cart.com/*

Code samples
""""""""""""

PHP code can be inserted simply by using `::` (double colon) and indenting the code above:

	.. code-block:: rst

		Here is some PHP code::

			$greeting = "Hello, World!";

			$twelve = 7 + 5;

To show a sample of code in any other language, use the `code-block` directive with the language specified as its param:

	.. code-block:: rst

		.. code-block:: python

			def hello(name=None):
				if name:
					print('Hello, {name}!'.format(name=name))
				else:
					print('Hello, World!')

Read more about showing code examples in the `Sphinx documentation <http://sphinx-doc.org/markup/code.html#code-examples>`_.

Short code samples can be shown inline in `fixed-width`:

	.. code-block:: rst

		Value binding in Python is as simple as `name = value`.

Note, Importants, Warnings, and Hints
-------------------------------------

Sphinx supports a variety of information block directives, though only four are used in the CS-Cart docs: `.. note::`, `.. important::`, `.. warning::`, and `.. hint::`.

Note
""""

Use this directive to show an additional piece of information, which can be safely skipped while reading, but will be useful as general knowledge:

	.. code-block:: rst

		And this is how you bake a cake.

		.. note:: 

			Cakes are extremely popular in Ireland.
			
.. rubric:: Footnotes

.. [#zen_of_python] `Zen of Python <http://www.python.org/dev/peps/pep-0020/>`_