from os.path import join


def setup(app):
    app.connect('env-before-read-docs', envpurgedoc)


def envpurgedoc(app, env, docnames):
    f = open(join(app.outdir, 'sitemap.txt'), 'w')

    split_index = app.outdir.rfind('/')
    version = app.outdir[split_index + 1:]

    for docname in docnames:
        url = join('https://www.cs-cart.ru/docs', version, docname + '.html')
        f.write(url + '\n')

    f.close()
