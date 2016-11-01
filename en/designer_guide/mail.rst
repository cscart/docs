****
Mail
****

The **mail** directory located in *design/themes/your_theme_name* contains the templates and media files of emails.

Email templates are based on Smarty. Working with them is similar to working with the templates of the theme itself.

CS-Cart uses the ``send`` method of the ``Mailer`` class to send emails. One of the parameters passed to the method is the email template::

  'tpl' => 'addons/call_requests/call_request.tpl',

.. note::

    Learn more about how emails are sent :doc:`in this article <../developer_guide/core/documents/email_notifications>`.

===================
Directory Structure
===================

* *media*:

  * *images*—contains the images used in email templates. Use the ``{$images_dir}`` variable to insert images from this folder. For example::

      <img src="{$images_dir}/[file_name]" />

* *templates*:

  * *addons*—contains the email templates of add-ons. Each add-on has its own folder, so the full path looks like this: *templates/addons/[add-on_name]/*.

  * *buttons*—contains the templates of buttons.

  * *common*—contains the templates of elements common for multiple email templates. For example, *letter_header.tpl*, *letter_footer.tpl*.

  * *orders*—contains the templates of emails related to orders: notification, invoice, printable invoice, download link for a downloadable product, tracking information.

  * *product*—contains the templates of emails related to products: the back in stock notification.

  * *promotions*—contains the templates of emails related to promotions.

  * *shipments*—contains the templates of emails related to shipments.

===============
Email Structure
===============

Every email consists of at least 2 *.tpl* files: email subject and email body. The template file of email subject has the same name as the email body template, but with the added ``_subj`` suffix.

For example:

* *templates/promotions/give_coupon.tpl*—email body.

* *templates/promotions/give_coupon_subj.tpl*—email subject.
