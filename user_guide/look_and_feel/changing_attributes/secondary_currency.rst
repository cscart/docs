******************************************************************************
How To: Set the Secondary Currency to Be Selected by Default in the Storefront
******************************************************************************

1.	Open the **fn.init.php** file located in the *app/functions* directory of your CS-Cart installation.
2.	Find and replace the following part of code:


.. code-block :: none

	foreach ($currencies as $v) {
	            if ($v['is_primary'] == 'Y') {
	                $secondary_currency = $v['currency_code'];
	                break;
	            }
	        }

with this one:

.. code-block :: none

	$secondary_currency = 'DESIRED_CURRENCY_CODE';

where replace DESIRED_CURRENCY_CODE with the 3-symbol code of the currency that you want to be selected by default in the storefront (USD, EUR, etc.).

3.	Save the file.

.. important ::

	This modification will keep your other currencies selectable but only set the specified one as selected by default. If you want to hide all other currencies except the desired one, please use the instructions in :doc:`here <../changing_attributes/prices_in_secondary>`.
