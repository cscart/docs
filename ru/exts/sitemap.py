from os.path import join


def setup(app):
    app.add_config_value('html_baseurl', '/', True)
    app.connect('env-before-read-docs', generate_sitemap)


def generate_sitemap(app, env, docnames):
    f = open(join(app.outdir, 'sitemap.txt'), 'w')

    for docname in docnames:
        url = join(app.config.html_baseurl, docname + '.html')
        f.write(url + '\n')

    f.close()
