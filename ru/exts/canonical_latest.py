__licence__ = 'MIT'


def html_page_context(app, pagename, templatename, context, doctree):
    if templatename != 'page.html':
        return

    canonical_url = '/{canonical_url_prefix}/{canonical_url}.html'.format(
        canonical_url_prefix=app.config.canonical_url_prefix.strip('/'),
        canonical_url=pagename.strip('/')
    )

    context['canonical_url'] = canonical_url
    context['display_canonical_url'] = True


def setup(app):
    app.add_config_value('canonical_url_prefix', '/', True)
    app.connect('html-page-context', html_page_context)
