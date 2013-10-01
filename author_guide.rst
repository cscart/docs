******************************
CS-Cart Docs Author Guidelines
******************************

Introduction
============

The docs are written using the `ReStructuredText (ReST) <http://docutils.sourceforge.net/rst.html>`_ markup and built with `Sphinx <http://sphinx-doc.org/>`_.

Please familiarize yourself with the ReST specs before starting wtiting the docs.

The ReST + Sphinx combo is a de-facto standard used in the `Python <http://python.org>`_ world.

Zen of Docs
-----------

*   If you don't understand it, nobody will.
*   Listen well to your doubts: if you sense something nasty about some line, cut it.
*   Cut without worry.
*   Improve without delay.
*   Overclarity is better underclarity.
*   Formatting *matters*.

Typography
==========

Below you will find some typography standards adopted by the CS-Cart documentation.

Headers
-------

The first header on a page is used as its title. It is marked with two lines or asterisks, one above and another below the line:

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

Links
-----

There are internal and externalt links.

To place an internal link, you first have to anchor the location you want to link to with the following syntax:

    .. code-block:: rst

        .. _important-place:

.. note::

    Note the underscore at the beginning of the anchor name.

    Use `-` (dash) to separate individual words.

Then, you can refer to this location:

    .. code-block:: rst

        Go to this :ref:`very important place <important-place>`.

.. note::

    The references are documentation-wide. You can refer to any place in any document without specifying the document name.

To refer to an entire document, use the `:doc:` syntax:

    .. code-block::

        Proceed to the :doc:`instructions <../man/instructions>`.
