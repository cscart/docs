**************************************************
How To: Change the Home Breadcrumbs Link Direction
**************************************************

*   In the *app/functions* directory of your CS-Cart installation, open the **fn.common.php** file.
*   Find the following line of code there:

.. code-block:: none

    // Add home link
    if (AREA == 'C' && empty($bc)) {
    $bc[] = array(
    'title' => __('home'),
    'link' => fn_url('')
    );
    }

and replace it with this one:

.. code-block:: none

    // Add home link
    if (AREA == 'C' && empty($bc)) {
    $bc[] = array(
    'title' => __('home'),
    'link' => fn_url('http://www.domain.com')
    );
    }


where *http://www.domain.com* is your link.

*	Save the file.