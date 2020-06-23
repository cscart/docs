**********************************************************
What's new in dealing with debtors in Multi-Vendor 4.12.1?
**********************************************************

.. important::
    
    In Multi-Vendor 4.12.1, the Vendor Debt Payout add-on has been replaced by a new add-on called :doc:`/user_guide/addons/vendor_debt_payout/index`.
    

What has improved?
==================

* **Previously**: The maximum debt was set globally in the settings of the Vendor Debt Payout add-on.
 
  **Now**: The maximum debt is set individually in the settings of each vendor plan.

  **What's better about it**: Now you can set different debt rules for a $5 plan and a $100 plan.
  
------  
 
* **Previously**: The maximum debt and the grace period in the Vendor Debt Payout add-on used to work independently. Restrictions were immediately applied in any of these cases:

  * A vendor exceeded the maximum debt.

  * When the time came to pay the fee, a vendor’s balance went negative, and then his grace period expired.
  
  When seeing the add-on for the first time, many people found this lack of relations between settings not too obvious.

  **Now**: First, the vendor's balance drops below the allowed minimum. Then the grace period starts. When this period ends, the restrictions are applied.

  **What's better about it**: It's easier to understand how settings interact with each other.
  
------

* **Previously**: When the vendor went negative or exceeded the maximum debt, his admin panel got blocked automatically. The vendor's products remained on the storefront even if he had left the marketplace. Customers would buy his products, and the marketplace owner would have to give refunds.

  **Now**: In the add-on settings, marketplace owner can decide what restrictions he wants to apply to debtors: to block their admin panels, to hide their products from storefronts, or both.
  
  **What's better about it**: You decide how to motivate your debtors to pay off their debts.
  
------

* **Previously**: When a vendor got blocked, his status did not change, so it was impossible to identify a debtor in the vendor's list.

  **Now**: The Suspended status was added. When a vendor becomes a debtor, his status in the list of vendors changes automatically. The marketplace owner can also set the status manually to apply restrictions to any vendor.

  **What's better about it**: It's easier for the marketplace owner to identify a debtor in the list of vendors.
  
------

* **Previously**: When a vendor's admin panel got blocked, nothing else happened. The debtor was like any other vendors in the list. The marketplace owner had a hard time tracking down the debtors who hadn’t paid their debts for too long.

  **Now**: Debtors are disabled after a while. Such vendors lose the ability to even log in to his account to pay off the debt. The marketplace owner can use the add-on settings to decide whether to disable debtors, and when to do it.

  **What's better about it**: It's easier for the marketplace owner to identify vendors who are unlikely to pay off their debts, and get rid of "dead" accounts.

What should I do after the update?
==================================

It's easy enough to move to the new add-on from the old one: upgrade your Multi-Vendor to version 4.12.1. Instead of the old Vendor Debt Payout add-on, the new Vendor-to-Admin Payments add-on will appear.

* Old add-on settings (maximum debt and grace period) will be moved to :doc:`vendor_plans </user_guide/addons/vendor_plans>`. This allows you to set different conditions for some plans (and vendors). 

* After the upgrade, the new add-on will have the same settings as the old one. Admin panels of debtors will remain blocked, but their products will not be hidden from the storefront. If you want to hide them, just change the add-on settings. 
* After the upgrade, a debtor's admin panel will:

  * remain blocked, if the debtor exceeded his maximum debt;

  * get unblocked, if the vendor's balance went negative, but did not go below the minimum allowed balance allowed by his plan.

  Therefore, you have to decide if you allow negative balance for your vendors. If you don’t, and you want your new add-on to work like the old one, just set the minimum allowed balance to zero. Otherwise the restrictions will apply only when vendors reach the maximum debt.

* The new Vendor-to-Admin Payments add-on requires the Vendor Plans add-on to work with. If you turned it off or did not install it, the Vendor Plans add-on will install automatically after the Multi-Vendor upgrade. After that, the add-on will create a single fee-free plan for all the vendors. You can set the minimum allowed balance and grace period in the plan settings. These values will be the same for all your vendors. This way the new Vendor-to-Admin Payments add-on will repeat the old add-on behavior.