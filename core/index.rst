****
Core
****

CS-Cart follows a modular architecture philosophy: there is a core part, which is responsible for the basic functionality, and numerous add-ons that extend it. Here are the core components:

.. toctree::
    :maxdepth: 2
    :titlesonly:
    :glob:

    */index
    *

.. important::

    Core functions, controllers, templates, and schemes are strongly *not* recommended to be edited directly. Use :doc:`add-ons <../addons/index>` to extend the default software behavior.

CS-Cart follows the `MVC (Model-View-Controller) <http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller>`_ pattern.

MVC: Model
==========

Data model is stored directly in the database. The database engine used is MySQL, so the program components get data from the model using the MySQL SQL-query language with the help of :doc:`placeholders <db/db_placeholders>`.

**Example**::

    $data = array (
        'payment_id' => 5
    );
    
    $order_id = 3;
    
    db_query('UPDATE ?:orders SET ?u WHERE order_id = ?i', $data, $order_id);

MVC: View
=========

CS-Cart uses the `Smarty <http://www.smarty.net/>`_ template engine and JavaScript to represent data. An example of a Smarty template with embedded JavaScript code:

.. code-block:: smarty

    {** block-description:my_twitter_addon **}
 
    <script src="http://widgets.twimg.com/j/2/widget.js"></script>
    <script>
    new TWTR.Widget({ldelim}
        version: 2,
        type: 'profile',
        rpp: {$addons.my_twitter_addon.number_of_tweets},
        interval: 6000,
        width: 'auto',
        height: 300,
        theme: {ldelim}
            shell: {ldelim}
                background: '#FFFFFF',
                color: '#373737'
            {rdelim},
            tweets: {ldelim}
                background: '#D9EFF3',
                color: '#373737',
                links: '#005865'
            {rdelim}
        {rdelim},
        features: {ldelim}
            scrollbar: true,
            loop: true,
            live: true,
            hashtags: true,
            timestamp: true,
            avatars: true,
            behavior: 'default'
        {rdelim}
    {rdelim}).render().setUser('{$addons.my_twitter_addon.username}').start();
    </script>

:doc:`Learn more <front-end/index>` about data representation in CS-Cart.

MVC: Controller
===============

:doc:`Controllers <controllers/index>` are written in PHP. Core controllers are located in the *controllers* directory; add-ons can define their own controllers to be put in the respective add-on directories. 