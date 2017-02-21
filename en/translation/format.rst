****************************
Translation File Format (PO)
****************************

The translations are stored in the ``.po`` format. The ``.po`` file structure adopted by the CS-Cart & Multi-Vendor software is different from the generally accepted gettext-driven standard [#gettext_po] for the sake of simplicity.

Metadata
========

Each ``.po`` file contains some necessary metadata in the header:

    .. code-block:: po

        # Base pack of "English" language variables
        msgid ""
        msgstr ""
        "Language: en\n"
        "Content-Type: text/plain; charset=UTF-8\n"
        "Pack-Name: English\n"
        "Lang-Code: en\n"
        "Country-Code: US\n"

.. warning::

    Do not change the existing metadata.

    Though, some editors may add extra metadata, and that is OK (extra data is ignored).

Language variables
==================

Here is an example of a valid language variable definition:

    .. code-block:: po

            #. Enable support of fraud notification
            msgctxt "Languages"
            msgid "2co_enable_fraud_verification"
            msgstr "Enable support of fraud notification"

*   Comment holding the original English text

*   ``msgctxt``—context

*   ``msgid``—unique title to identify the language variable

*   ``msgstr``—value in the selected language

Blank Lines
===========

Language variable definitions *must* be separated from each other with an empty line.

Here is how a ``.po`` file could end:

    .. code-block:: po

        # Base pack of "English" language variables
        msgid ""
        msgstr ""
        "Language: en\n"
        "Content-Type: text/plain; charset=UTF-8\n"
        "Pack-Name: English\n"
        "Lang-Code: en\n"
        "Country-Code: US\n"

        #. Enable support of fraud notification
        msgctxt "Languages"
        msgid "2co_enable_fraud_verification"
        msgstr "Enable support of fraud notification"

        #. Status for orders with failed fraud review
        msgctxt "Languages"
        msgid "2co_fraud_fail"
        msgstr "Status for orders with failed fraud review"


.. important::

    The file *must* end with an empty line.

.. rubric:: Footnotes

.. [#gettext_po] `Gettext on Wikipedia <https://en.wikipedia.org/wiki/Gettext#Translating>`_
