********************************************************
Set Add-on Dependencies and Conflicts with Other Add-ons
********************************************************

=============================
Dependencies on Other Add-ons
=============================

:ref:`During add-on installation <install-addon-process>` a check is performed to find out if the add-on requires other add-ons to work properly. This is how you specify these add-ons in :doc:`addon.xml <scheme3.0_structure>`:

.. code-block:: xml

    <compatibility>
        <dependencies>discussion,form_builder</dependencies>
    </compatibility>

If any of the required add-ons is not installed, the following message will appear:

.. important::

    **Warning:** The add-on cannot be installed because a dependence on the Comments and reviews,Form builder add-on is set for it. Please install the Comments and reviews,Form builder add-on first.

============================
Conflicts with Other Add-ons
============================

:ref:`During add-on activation <activate-addon-process>` a check is performed to find out if the add-on conflicts with any other add-ons. If some conflicting add-ons are already active, the add-on can still be installed, but it will remain disabled. This is how you specify conflicting add-ons in :doc:`addon.xml <scheme3.0_structure>`:

.. code-block:: xml

    <compatibility>
        <conflicts>catalog_mode,reward_points</conflicts>
    </compatibility>

If you try to enable the add-on while any of its conflicting add-ons is active, the following message will appear:

.. important::

    **Warning:** Add-on "Example" is incompatible with the following add-ons: Catalog mode, Reward points. It cannot be enabled.


