****************************
How to: Configure SEO Add-on
****************************

Install the Add-on
==================

.. note::

    The :doc:`/user_guide/addons/seo/index` add-on is installed by default.
    
#. Go to **Add-ons → Manage add-ons**.

#. Find the **SEO** add-on in the list and make sure it's status is **Active**.


Configure the Add-on
====================

#. Go to **Add-ons → Manage add-ons**.

#. Find the **SEO** add-on in the list and click it's name to open the settings:

   * **Product SEO URL format:**
  
     * ``/product_name``
        
     * ``/product_name.html``
        
     * ``/category-name/[subcategory-name/]product-name``—displays URLs as a path from the parent category to the subcategory.
        
     * ``/category-name/[subcategory-name/]product-name.html``


   * **Category SEO URL format:**

     * ``/parent-category/category[-page2].html``—displays URLs with the page number stated as a part of the page name.
     
     * ``/parent-category/category/[page2/]``—displays URLs with the page number stated as a separate element of the path.

     * ``/category-[page2].html``

     * ``/category/[page2/]``—displays URLs with only category name stated and the page number being a subcategory.

   * **Page SEO URL format:**

     * The same settings as for the categories.

   * **Other SEO URL format:**

     * ``/item``
     
     * ``/item.html``

   * **Show additional language in the URL**—shows a language as a separate directory in the URL, for example: ``/ru/product.html``.
   
     .. note::
     
         **For example:**
         
         If the **Show additional language in the URL** option is enabled and the Spanish language is used, the **SEO name** will be: 
         
         *http://demo.cs-cart.com/es/adidas-mens-climacool-mesh-polos.html* 
         
         If the **Show additional language in the URL** option is disabled, the **SEO name** will be: 
         
         *http://demo.cs-cart.com/adidas-mens-climacool-mesh-polos.html*

   * **Use single URL for all languages**—URL is generated only for a default language of the storefront.

   * **Allow non-Latin characters in URL**—allows to generate URLs with non-Latin characters, for example: ``/ru/продукт.html``.
