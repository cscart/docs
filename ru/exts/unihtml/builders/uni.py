# -*- coding: utf-8 -*-

from os import path

from sphinx.builders import Builder
from sphinx.builders.html import StandaloneHTMLBuilder
from sphinx.util.osutil import SEP, os_path


class UniHTMLBuilder(StandaloneHTMLBuilder):
    name = 'unihtml'

    def get_target_uri(self, docname, typ=None):
        # type: (unicode, unicode) -> unicode
        if docname == 'index':
            return ''

        if docname.endswith(SEP + 'index'):
            return docname[:-5]  # up to sep

        return docname + self.link_suffix
