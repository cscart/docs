***********************************************************************************************************
403 Forbidden/Not Acceptable Errors after Submitting Forms that Contain "curl", "perl", "set", "file", etc.
***********************************************************************************************************

The most likely reason is that your web server has **mod_security** enabled. The **mod_security** feature scans all POST requests to the web site for forbidden words or word combinations that might indicate that someone is trying to hack the system. 

If any of those words and word combinations exist in the request, Apache returns the **403 Forbidden error**. Common phrases that tend to trigger **mod_security** include **curl**, **wget**, **set**, **file(**, and **system(**, although there are many others.

To disable **mod_security** for your website, follow these steps:

1. Go to the root directory of your CS-Cart installation.

2. Open the **.htaccess** file.

3. Add the following part of code to the file:

::

  <IfModule mod_security.c>
  SecFilterEngine Off
  SecFilterScanPOST Off
  </IfModule>

4. Save the file.

If this doesn't help, contact your server administrator.
