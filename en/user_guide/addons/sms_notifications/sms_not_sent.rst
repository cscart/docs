*********************************
If SMS Notifications Are Not Sent
*********************************

If SMS notifications are not sent, check your error logs:

#. In the Administration panel, go to **Administration → Logs**.

#. Click the **Advanced search** link to access more search parameters.

#. Set **Type/Action** to *Requests*.

#. Click **Search**.

   .. note ::

       Requests related to SMS notifications should contain the *http://api.clickatell.com/http/sendmsg* link in the **URL** section.

If you see the following error in the found requests:

.. code-block :: none

    Response: ERR: 113, Max message parts exceeded

then the SMS notification text was too long to be sent.

To solve this problem:

#. Go to **Add-ons → Manage add-ons**.

#. Click on the name of the **SMS notifications** add-on to open its settings.

#. In the **SMS content** section, untick the **Add payment info** and **Add customers e-mail** checkboxes.

#. Click **Save**.

   .. image:: img/sms_01.png
       :align: center
       :alt: SMS notifications
