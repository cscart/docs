************************************************
How To: Set a Shipping Method Only for Your City
************************************************

Let’s say, you have an online store in Boston. In Boston, you have your own delivery service, but you deliver to other states using third-party services, for example, :doc:`DHL </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/dhl>` or :doc:`FedEx </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/fedex>`. Meanwhile, you don’t want your customers from Boston to choose DHL or FedEx shipping methods. To do this, you have to follow several steps.

.. contents::
    :backlinks: none
    :local:


Create Rate Areas
=================

#. Go to **Administration → Shipping & taxes → Rate areas**.

#. :doc:`Create separate rate areas </user_guide/shipping_and_taxes/locations/set_location>` for the USA and Boston. This way you will “exclude” Boston from the rate area for the USA , and link those areas to different shipping methods.

   .. image:: img/rate_areas.png
       :align: center
       :alt: List of rate areas
       

Create a Shipping Method for Your City
======================================

#. Go to **Administration → Shipping & taxes → Shipping methods**.

#. :doc:`Create a shipping method </user_guide/shipping_and_taxes/shipping_methods/add_shipping_method>` for your city, for example, hand delivery.

#. Go to the **Shipping time and rates** tab in the shipping method settings.

#. Add the *Boston* rate area to the shipping method.

#. Click the **Save** button.

   .. image:: img/hand_delivery.png
       :align: center
       :alt: Hand delivery settings


Create a Shipping Method for Other States
=========================================

#. Go back to **Administration → Shipping & taxes → Shipping methods**.

#. Create a new shipping method for the USA.

#. Go to the **Shipping time and rates** tab in the shipping method settings.

#. Set the rate areas:

   * For :doc:`a manual shipping method </user_guide/shipping_and_taxes/shipping_methods/manual_shipping_methods/index>`: add just the *USA* rate area.
   
   * For :doc:`a real-time shipping method </user_guide/shipping_and_taxes/shipping_methods/realtime_shipping_methods/index>`: remove all the areas except the *USA* rate area.
   
   .. important::
   
       Don't forget to untick the **Add in all realtime shipping methods** checkbox when creating a new rate area. Otherwise, the new rate area will be added to all of your real-time shipping methods automatically. You will have to remove the new rate area manually, if you don’t want to offer those shipping methods in this rate area.
       
#. Click the **Save** button.

   .. image:: img/regional_shipping.png
       :align: center
       :alt: FedEx shipping settings


