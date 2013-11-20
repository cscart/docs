****************
CS-Cart Docs 2.0
****************

CS-Cart documentation, fully re-written in reST and built with Sphinx.

Latest build:

    http://docs2.cs-cart.com

Author's guide:

    http://docs2.cs-cart.com/4.0.x/author_guide.html

Build These Docs Locally
========================

To build these docs locally, you will need Python 2.6+ and virtualenv. All other dependencies will be installed automatically.

Get
---

In the terminal, run the following commands:

.. code-block:: bash

    $ hg clone https://bitbucket.org/cscart/docs-2.0    # Clone the repo
    $ cd docs-2.0                                       # Switch to the docs directory
    $ pip install -r requirements.txt                   # Install dependencies

Build
-----

.. code-block:: bash

    $ sphinx-build . _build/html                        # Build the docs into the directory _build/html
