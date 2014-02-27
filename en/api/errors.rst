*******************
API Response Errors
*******************


.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 10 30

    *   -   Code
        -   Description
    *   -   400 "Bad Request"
        -   The request is invalid. For example, something is missing in it or there is a syntax error.
    *   -   401 "Unauthorized"
        -   Authorisation data are not valid or missing.
    *   -   403 "Forbidden"
        -   Access is not allowed. For example, there are no permissions for the request.
    *   -   404 "Not Found"
        -   The requested object does not exist.
    *   -   405 "Method Not Allowed"
        -   Initialized method is not suppoted for the request-URI.
    *   -   406 "Not Acceptible"
        -   The resource cannot generate a response in the format specified in the request (the ``accept`` header has an invalid type).
    *   -   415 "Unsupported Media Type"
        -   Invalid ``content-type`` header.
    *   -   500 "Internal Server Error"
        -   Server-side error. The request cannot be processed.