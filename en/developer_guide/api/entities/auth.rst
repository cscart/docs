****
Auth
****

``Auth`` is a special entity that is used to acquire authenticated access to store areas without actually asking the user to enter the access credentials in a login form.

This entity supports only ``POST`` requests. In a response, it returns a generated session key and a ready-to-use link for the user to follow. This link can contain an optional ``redirect_url`` param, which defines where the user will be redirected immediately after they follow the generated link.


URL
===

*   http://example.com/api/**auth**—request authentication key and link. Only ``POST`` is supported.


``POST`` Params
===============

Supported params are given below (mandatory param is marked with **\***).

.. note:: Any param not listed below will be ignored if occurs in an API request JSON data.

*   ``email``\*—user login e-mail. Can be both an admin's or a customer's e-mail. If a non registered e-mail is provided, a 404 error is returned.

*   ``redirect_url``—URL for the user to be redirected to immediately after following the link.


Response
========

*   ``key``—session key for the authenticated user.

*   ``link``—authentication link for the user to follow. The link contains the session key (as the ``ekey`` param).

    If the ``redirect_url`` param was provided in the request, the link will contain the ``redirect_url`` param, and the user will be immediately redirected to the provided URL.
