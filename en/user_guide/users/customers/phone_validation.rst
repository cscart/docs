**********************************
How To: Change Phone Number Format
**********************************

.. note::

    This article describes a setting that first appeared in version 4.10.2.

By default, users enter any phone numbers in the international format, with country code, and so on. CS-Cart and Multi-Vendor do all the formatting for them: there's no way for a customer to enter an extra number or a wrong symbol. This is useful for integration with CRMs and third-party SMS services.

However, not everyone wants to trouble their users with entering the country code. That's why the requirement for international phone numbers can be disabled. You can disable the phone mask or make it less strict. Here's how to do it:

#. In the administration panel, go to **Settings → Appearance**.

#. Find the **Supported phone number** setting. It determines what users can enter as their phone number.

#. Select the desired value for the setting:

   * International phone number

   * Any digits and +-()

   * Any symbols

     .. important::

         If you go from a less strict to a more strict mask, customers may have to update they phone numbers when they edit their profiles or attempt to place an order.

#. Save your changes.

.. meta::
   :description: How to disable country code requirement in phone numbers in CS-Cart and Multi-Vendor e-commerce platforms?
