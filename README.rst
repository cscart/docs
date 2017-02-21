************
CS-Cart Docs
************

CS-Cart documentation, fully written in reST and built with Sphinx.

Latest build:

    http://docs.cs-cart.com

Author's guide:

    http://docs.cs-cart.com/4.3.x/author_guide.html

========================
Build These Docs Locally
========================

To build these docs locally, you will need Python 2.6+. All other dependencies will be installed automatically.

---
Get
---

In the terminal, run the following commands:

.. code-block:: bash

    $ git clone https://github.com/cscart/docs.git      # Clone the repo
    $ cd docs                                           # Switch to the docs directory
    $ pip install -r requirements.txt                   # Install dependencies

-----
Build
-----

.. code-block:: bash

    $ cd en                                             # Switch to English docs; use "$ cd ru" for Russian 
    $ sphinx-build . _build/html                        # Build all docs as HTML files in the following directory: _build/html
