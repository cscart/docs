# -*- coding: utf-8 -*-

from __future__ import (print_function, unicode_literals, absolute_import)

from sphinx.builders.html import StandaloneHTMLBuilder
from .builders.uni import UniHTMLBuilder



def setup(app):
    app.require_sphinx('1.0')
    app.add_builder(UniHTMLBuilder)

