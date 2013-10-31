***********************
Translation File Format
***********************

The translations are stored in the ``.po`` format. The ``.po`` file structure adopted by the CS-Cart & Multi-Vendor software is different from the generally accepted gettext-driven standard [#gettext_po] for the sake of simplicity.

.. important::

    Use :doc:`CS-Cart Translator <translator>` to contribute to translations.

Metadata
========

Each ``.po`` file contains some necessary metadata in in the header:

    .. code-block:: po

        # Base pack of "English" language variables
        msgid ""
        msgstr ""
        "Language: en\n"
        "Content-Type: text/plain; charset=UTF-8\n"
        "Pack-Name: English\n"
        "Lang-Code: en\n"
        "Country-Code: US\n"

1. Metadata must be placed at the header of the file.


"Language: en\n"

"Pack-Name: English\n"

"Lang-Code: en\n"

"Country-Code: US\n"


This data is required for http://demo.cs-cart.com/admin.php?dispatch=languages.manage&sl=en



"Lang-Code: en\n"—Language code

"Pack-Name: English\n"—Name

"Country-Code: US\n"—Country

"Language: en\n"—Language


2. An empty string must be inserted between the translations.


#. Enable support of fraud notification

msgctxt "Languages"

msgid "2co_enable_fraud_verification"

msgstr "Enable support of fraud notification"


#. Status for orders with failed fraud review

msgctxt "Languages"

msgid "2co_fraud_fail"

msgstr "Status for orders with failed fraud review"


3. An empty string must be placed at the end of a file.


4. # marks a comment, which stores an English text.

e.g. #. Enable support of fraud notification


msgctxt "Languages" is a context, i.e. where certain things are used, like Languages, Settings, Tooltips, SettingsVariants, SettingsOptions. Must not be changed.


msgid "2co_fraud_fail" is a name of a lang var. In other software it is an original translation.


msgstr "Absolute" is a translation.

.. rubric:: Footnotes

.. [#gettext_po] https://en.wikipedia.org/wiki/Gettext#Translating
