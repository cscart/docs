from os.path import join


def setup(app):
    app.connect('env-before-read-docs', envpurgedoc)


def envpurgedoc(app, env, docnames):
    f = open(join(app.outdir, 'sitemap.txt'), 'w')

    for docname in docnames:
        url = "https://www.cs-cart.ru/docs/4.6.x/" + docname + ".html"
        f.write(url + '\n')

    f.close()
