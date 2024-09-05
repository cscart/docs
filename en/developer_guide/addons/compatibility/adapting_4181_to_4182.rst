***********************************************
Adapt Your Add-ons and Themes to CS-Cart 4.18.2
***********************************************

.. contents::
   :backlinks: none
   :local:


============
Core changes
============

* Added ``google/auth``, ``firebase/php-jwt``, ``psr/cache`` packages.

.. important::


   Do not use them, they will be removed in the near future.

============
Hook changes
============


=========
New hooks
=========


#. Changes request params before store location cities selecting::

       `fn_set_hook('get_store_location_cities', $params, $condition);`

#. Executes before the request data is returned::

       `fn_set_hook('rus_online_cache_register_receipt_request_json_post', $this, $result, $receipt);`

==============
Style Changes
==============

------------------------------------------
Usage of color variables instead of colors
------------------------------------------

The use of hardcoded colors has been deprecated. `Use CSS color variables instead<https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties>`_. Examples:

- ``#fff``: use ``var(--cs-content-background)`` instead for background color.
- ``#2d2d2d``: use ``var(--cs-text-color)`` instead for text color.
- ``#fff``: use ``var(--cs-text-inverse-color)`` instead for text inverse color.
- ``#1d9ff8``: use ``var(--cs-btn-primary-background)`` instead for button primary background.
- ``#d80954``: use ``var(--cs-error-text)`` instead for error text color.
- ``rgba(0, 0, 0, 0.1)``: use ``var(--cs-shadow10-color)`` instead for shadow.

View full CS-Cart variables list `design/backend/css/less_to_css_vars.less`. Color variables are required for the dark theme. Check your add-ons in the light and dark administration panel.

----------------------
Deprecated Less styles
----------------------

`Less styles <https://lesscss.org/>`_ have been deprecated and will no longer be supported in the future. Use native CSS styles instead. Examples:

- Don't use ``Less variables``. Use native CSS variables. Examples:

#. ``@mainColor``: use ``var(--cs-main-color)`` instead.

#. ``@media (min-width: @TabletBreakpoint + 1px) { ... }``: use ``@media (min-width: 768px) { ... }`` instead.

#. ``-@iconSize;``: use ``~"calc(var(--cs-icon-size) * -1)"`` instead.

- Don't use Less mixins. Describe properties explicitly. Examples:

#. ``.transition(all 200ms);``: use ``transition: all 200ms;`` instead.

#. ``.display-flex();``: use ``display: flex;`` instead.

- Don't use Less nested rules. Describe selectors explicitly. Examples:

#. ``a { opacity: 0.8; &:hover { opacity: 1; } }``: use ``a { opacity: 0.8; } a:hover { opacity: 1; }`` instead.

#. ``.block { padding: 10px; @media (min-width: 768px) { padding: 20px; } }``: use ``.block { padding: 10px; } @media (min-width: 768px) { .block { padding: 20px; } }`` instead.

- Don't use ``Less`` functions. Use similar colors and property values. Examples:

#. ``spin(desaturate(lighten(@textColor, 30%), 25%), -15%);``: use ``var(--cs-text-muted-color);`` instead.

#. ``darken(@btnBorder, 3%)``: use ``var(--cs-shadow15-color)`` instead.

#. ``lighten(@textColor, 38%);``: use ``var(--cs-text-muted-color);`` instead.

#. ``round(@baseLineHeight / 1.5385)``: use ``13px;`` instead.

- BUT use escaping for ``Less`` functions that are similar to CSS functions. Example:

#. ``calc(100% - 5px)``: use ``~"calc(100% - 5px)"`` instead.

---------------
New CSS classes
---------------

- ``cs-dark-theme-invert`` - invert colors for the dark theme.

-----------------------
Deleted style variables
-----------------------

- UI:

#. ``@isControlGroupHidden``.

#. ``@spinnerSize``: use ``24px`` instead.

#. ``@spinnerBorderWidth``: use ``3px`` instead.

#. ``@spinnerBlockSize``: use ``52px`` instead.

#. ``@uiDialogTitlebarCloseWidth``: use ``var(--cs-ui-dialog-titlebar-close-width)`` instead.

#. ``@uiDialogTitlebarCloseHeight``: use ``var(--cs-ui-dialog-titlebar-close-height)`` instead.

#. ``@global_individual_secondary``: use ``var(--cs-global-individual-secondary)`` instead.

#. ``@global_individual_active_background``: use ``var(--cs-global-individual-active-background)`` instead.

#. ``@global_individual_active_border``: use ``var(--cs-global-individual-active-border)`` instead.

#. ``@global_individual_disabled``: use ``var(--cs-global-individual-disabled)`` instead.

#. ``@global_individual_secondary_disabled``: use ``var(--cs-global-individual-secondary-disabled)`` instead.

#. ``@global_individual_active_background_disabled``: use ``var(--cs-global-individual-active-background-disabled)`` instead.

#. ``@global_individual_active_border_disabled``: use ``var(--cs-global-individual-active-border-disabled)`` instead.

#. ``@button-color``: use ``#fff`` instead.

#. ``@button-opacity-on-hover``: use ``0.75`` instead.

#. ``@header-height``: use ``40px`` instead.

#. ``@button-width``: use ``45px`` instead.

#. ``@button-indent``: use ``10px`` instead.

#. ``@img-indent``: use ``10px`` instead.

#. ``@arrow-size``: use ``60px`` instead.

- Dashboard:

#. ``@dashboardBorderColor``: use ``var(--cs-dashboard-border-color)`` instead.

#. ``@dashboardBorderColor``: use ``var(--cs-dashboard-border-color)`` instead.

#. ``@dashboardPrimaryColor``: use ``var(--cs-dashboard-primary-color)`` instead.

#. ``@dashboardSecondaryColor``: use ``var(--cs-dashboard-secondary-color)`` instead.

-  Add-ons and upgrade center pages:

#. ``@darkTransparentMainColor``: use ``var(--cs-shadow10-color)`` instead.

#. ``@lightTextIconColor``: use ``var(--cs-text-inverse-color)`` instead.

#. ``@darkTextIconColor``: use ``var(--cs-form-actions-background)`` instead.

#. ``@middleTextIconColor``.

- Notification settings:

#. ``@editor-spacing``: use ``16px`` instead.

#. ``@editor-width``: use ``500px`` instead.

#. ``@editor-footer-border-color``: use ``#eee`` instead.

#. ``@editor-padding``: use ``17px`` instead.

- Block manager:

#. ``@BlockManagerGrid``: use ``var(--cs-block-manager-grid)`` instead.

#. ``@BlockManagerGrid12Col``: use ``var(--cs-block-manager-grid12-col)`` instead.

#. ``@BlockManagerGrid16Col``: use ``var(--cs-block-manager-grid16-col)`` instead.

#. ``@BlockManagerIconsSprite``: use ``var(--cs-block-manager-icons-sprite)`` instead.

#. ``@BlockManagerOpenHand``: use ``var(--cs-block-manager-open-hand)`` instead.

#. ``@BlockManagerClosedHand``: use ``var(--cs-block-manager-closed-hand)`` instead.

#. ``@bm-block-border``: use ``var(--bm-block-border)`` instead.

#. ``@bm-block-hover-color``.

#. ``@bm-block-hover-border``: use ``var(--bm-block-hover-border)`` instead.

#. ``@bm-block-hover-shadow``.

#. ``@bm-block-hover-bg``: use ``var(--bm-block-hover-bg)`` instead.

#. ``@bm-block-grabbing-shadow``: use ``var(--bm-block-grabbing-shadow)`` instead.

#. ``@bm-block-menu``: use ``var(--bm-block-menu)`` instead.

#. ``@bm-block-menu-arrow``: use ``var(--bm-block-menu-arrow)`` instead.

#. ``@bm-border``.

#. ``@bm-border-radius``: use ``var(--bm-border-radius)`` instead.

#. ``@bm-icon-size``: use ``var(--bm-icon-size)`` instead.

#. ``@bm-icon``: use ``var(--bm-icon)`` instead.

- Vendor data premoderation add-on:

#. ``@editColor``: use ``var(--cs-vendor-data-premoderation-edit-color)`` instead.

#. ``@editBackground``.

- Mobile application add-on:

#. ``@backgoundColor``: use ``var(--cs-mobile-app-backgound-color)`` instead.