*******************
API Response Errors
*******************


.. list-table::
    :header-rows: 1
    :stub-columns: 1
    :widths: 20 30

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
        -   Initialized method is not supported for the request-URI.
    *   -   406 "Not Acceptable"
        -   The resource cannot generate a response in the format specified in the request (the ``accept`` header has an invalid type).
    *   -   409 "Conflict"
        -   The change is being rejected due to a condition imposed by the server. The reasons for that may vary and may be described in the response.
    *   -   413 "Request Entity Too Large"
        -   The client requests more objects than the allowed maximum is.
    *   -   415 "Unsupported Media Type"
        -   Invalid ``content-type`` header.
    *   -   500 "Internal Server Error"
        -   Server-side error. The request cannot be processed.
    *   -   501 "Not Implemented"
        -   The request method is not supported by the API.
    *   -   503 "Service Unavailable"
        -   The store is closed or is being upgraded to a new version.
    *   -   507 "Insufficient Storage"
        -   The server is unable to store the representation needed to successfully complete the request.
    *   -   509 "Bandwidth Limit Exceeded"
        -   The requests-per-hour limitations for the API have been reached.
