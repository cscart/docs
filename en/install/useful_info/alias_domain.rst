******************************
How To: Set Up an Alias Domain
******************************

.. note::

    **Tutorial Difficulty: 2 / 3**


This instrution describes how to make your alias domain work properly with your store:

.. note::

    The following instructions are applicable only to Multi-Vendor and the administration area of CS-Cart.

1. Go to the root directory of your installation.

2. Open the **config.local.php** file.

3. Find this part of the code:

::

  // Host and directory where cs-cart is installed on non-secure server
  $config['http_host'] = 'www.your_domain.com';
  $config['http_path'] = '/your_cscart_directory';

  // Host and directory where cs-cart is installed on secure server
  $config['https_host']= 'www.your_domain.com';
  $config['https_path'] = '/your_cscart_directory';

4. Replace it with this code:

::

  // Host and directory where cs-cart is installed on usual server
  $config['http_host'] = $_SERVER['HTTP_HOST'];
  $config['http_path'] = '/your_cscart_directory';

  // Host and directory where cs-cart is installed on secure server
  $config['https_host'] = $_SERVER['HTTPS_HOST'];
  $config['https_path'] = '/your_cscart_directory';

5. Save the file.

.. note::

   The $_SERVER['HTTP_HOST'] and $_SERVER['HTTPS_HOST'] variables must exist on your server.

