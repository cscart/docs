******************
Platform Structure
******************

The schema of the platform folders and objects.

.. contents:: Contents
    :local: 
    :depth: 3

Main Directory
--------------

.. code-block:: none 

    root/
    ├── app/                
    │    ├── addons/               <- Add-ons and extensions
    │    ├── controllers/          <- Controllers, processing of requests
    │    ├── functions/            <- Platform funtions
    │    ├── lib/                  <- Third party PHP libraries
    │    ├── payments/             <- Payment methods
    │    ├── schemas/              <- Various PHP schemas
    │    └── Tygh/                 <- Platform classes
    ├── design/
    │    ├── backend/              <- Admin panel design
    │    └── themes/               <- Storefront design (site themes)
    ├── images/                    <- Images and thumbnails
    ├── install/                   <- Installation files
    ├── js/
    │    ├── addons/               <- JavaScript add-on scripts
    │    ├── lib/                  <- Third party JavaScript libraries
    │    └── tygh/                 <- JavaScript platform scripts
    ├── var/
    │    ├── cache/                <- Cache
    │    ├── files/                <- Export/import files
    │    ├── downloads/            <- Files of digital products and applications
    │    ├── langs/                <- Translations
    │    └── themes_repository/    <- Themes and templates for installation
    ├── admin.php                  <- Admin login script
    ├── index.php                  <- Buyer login script
    ├── api.php                    <- API login script
    ├── config.local.php           <- Web server settings
    ├── config.php                 <- Core settings
    └── init.php                   <- Core connection

App: Controllers, Classes, Functions, Libraries
===============================================

Language: PHP

.. code-block:: none 

    root/
    └── app/
        ├── addons/                     <- Add-ons and extensions
        │    ├── [add-on id]/           <- Folder name matches add-on id
        │    ├── banners/               <- Banners
        │    ├── seo/                   <- SEO
        │    └── ...                    <- etc.
        │    
        ├── controllers/                <- Controllers:
        │    ├── backend/               <- Admin panel
        │    ├── common/                <- Common
        │    └── frontend/              <- Storefront
        │    
        ├── functions/                  <- Platform functions:
        │    ├── smarty_plugins/        <- Smarty Plugins
        │    ├── fn.catalog.php         <- Work with products and catalog
        │    ├── fn.cart.php            <- Work with orders, checkout
        │    ├── fn.common.php          <- Common functions
        │    ├── fn.fs.php              <- Work with files
        │    ├── ...                    <- Other functions
        │    └── fn.users.php           <- Work with customers
        │    
        ├── lib/                        <- Third party libraries:
        │    ├── other/                 <- Smarty, lessphp, PHPMailer, CAPTCHA  etc.
        │    ├── pear/                  <- Crypt, GeoIp, PEAR, Text, Diff
        │    └── vendor/                <- Library connection
        │    
        ├── payments/                   <- Payment methods:
        │    ├── paypal.php             <- PayPal
        │    └── ...                    <- and others
        │    
        ├── schemas/                    <- PHP schemas:
        │    ├── block_manager/         <- Blocks and block manager
        │    ├── exim/                  <- Export/Import CSV
        │    ├── menu/                  <- Admin panel menu
        │    ├── permissions/           <- Privileges and access rights
        │    ├── promotions             <- Promotions
        │    └── ...                    <- and others
        │    
        └── Tygh/                       <- Platform classes:
             ├── Api/                   <- Classes and methods of the RestFULL API
             ├── BlockManager/          <- Classes and methods of blocks
             ├── Shippings/             <- Classes and methods of shipping methods
             ├── Database.php           <- Database methods
             ├── Http.php               <- Methods for POST and GET requests
             ├── Registry.php           <- Registry repository methods
             └── ...                    <- and others

Admin Panel Templates and Design
================================

Languages: Smarty, CSS, Less

.. code-block:: none 

    root/
    │
    └ design/                           <- Templates and styles
      │
      └ backend/                        <- Admin panel
        ├─ css/                         <- CSS and LESS styles
        │   ├── addons/                 <- Add-on styles
        │   │    ├─ [module_id]/        <- Folder name matches add-on id
        │   │    ├─ hybrid_auth/
        │   │    ├─ seo/
        │   │    └─...
        │   │
        │   ├── lib/                    <- Style libraries
        │   │    ├─ 960/
        │   │    ├─ bootstrap_switch/
        │   │    ├─ daterangepicker/
        │   │    ├─ twitterbootstrap/
        │   │    └─ui
        │   ├── glyphs.css              <- CSS styles
        │   ├── styles.less             <- LESS styles
        │   └── ...
        │
        ├─ mail/                        <- Templates for email notifications and mailing lists
        │   ├── media/                  <- Static data for emails:
        │   │ └─ images/                <- Images
        │   └── templates/              <- Email templates by sections
        │        ├─ addons/
        │        ├─common/
        │        ├─ companies/
        │        ├─ orders/
        │        ├─ payments/
        │        └─profiles/
        │
        ├─ media/                       <- Static data:
        │   ├── fonts/                  <- Fonts
        │   └── images/                 <- Images
        │        ├─ addons/  
        │        ├─ block_manager/ 
        │        ├─ lib/ 
        │        └─ ...
        │
        └─ templates/                   <- Admin panel templates
            ├── addons/                 <- Add-ons by folders
            │    ├─ hybrid_auth/  
            │    ├─ seo/ 
            │    ├─ banners/
            │    └─ ...
            ├── buttons/                <- Buttons
            │    ├─ button.tpl
            │    ├─ colorpicker.tpl 
            │    ├─ save.tpl
            │    └─ ...
            ├── common/                 <- Common templates
            │    ├─ scripts.tpl
            │    ├─ styles.tpl 
            │    ├─ price.tpl
            │    └─ ...
            ├── pickers/                <- Pop-ups
            │    ├─ categories/         
            │    ├─ products/
            │    ├─ users/
            │    └─ ...
            └── views/                  <- Controller (page) templates 
                 ├─ payments/
                 ├─ products/
                 ├─ categories/
                 └─ ...              

Storefront Templates and Design (Site Themes)
=============================================

Languages: Smarty, CSS, Less

.. code-block:: none 

    root/
    │
    └ design/                                  <- Templates and styles
      │
      └ themes/                                <- Themes
        │                    
        └ [theme_name]/                        <- Folder with theme files
          │                                       For example: basic or responsive
          ├── css/                             <- Basic CSS or LESS styles
          │   ├── addons/                      <- Add-on styles
          │   │   ├ [addon_id]/               
          │   │   ├ banners/                   <- «Banners management» add-on
          │   │   ├ hybrid_auth/               <- «Social Login» add-on
          │   │   └ ...                        <- other add-ons
          │   │        
          │   ├── lib/                         <- Style libraries
          │   │   ├ bootstrap/            
          │   │   └ ui/            
          │   │
          │   ├── base.css                     <- CSS files and LESS themes
          │   ├── grid.less
          │   ├── print.css
          │   ├── styles.css
          │   └── ...
          │
          ├── layouts/                         <- Layout schemas for theme installation
          │   ├── layouts_multivendor.xml  
          │   ├── layouts_ultimate.xml 
          │   └── layouts_widget_mode.xml
          │
          ├── mail/                            <- Email and invoice templates
          │   ├── media/                       <- Static data
          │       └ images/                    <- Images
          │   └── templates/                   <- Templates
          │       ├ addons/                    <- Add-ons by folders
          │       │  ├ [addon_id]/           
          │       │  ├ news_and_emails/
          │       │  └ ...                    
          │       ├ orders/                    <- When ordering
          │       ├ promotions/                
          │       └ ...
          │
          ├── media/                           <- Static data
          │   ├── fonts/                       <- Fonts
          │   └── images/                      <- Images
          │       ├ addons/ 
          │       │  ├ [addon_id]/           
          │       │  ├ image_zoom/
          │       │  └ ...   
          │       ├ icons/                     <- Icons
          │       ├ lib/ 
          │       ├ patterns/ 
          │       └ ...
          │
          ├── styles/                          <- Styles from the wysiwyg editor
          │   ├── data/                       
          │   │   ├ [style_name].css           <- Style CSS
          │   │   ├ [style_name].less          <- Style LESS
          │   │   ├ [style_name].png           <- Style icon
          │   │   └ ...
          │   ├── manifest.json                <- List of styles
          │   └── schema.json                  <- Wysiwyg editor settings
          │
          └── templates/                       <- Smarty templates
              ├── addons/                      <- Hooks and add-on templates
              │   ├ [addon_id]/
              │   ├ banners/
              │   └ ...
              ├── blocks/                      <- Blocks
              │   ├ categories/                <- Blocks of the category list (menu) 
              │   ├ checkout/                  <- For the checkout page
              │   ├ list_templates/            <- Product list templates
              │   ├ menu/                      <- Menu
              │   ├ pages/                     <- Blocks of the page list (menu) 
              │   ├ product_filters/           <- Product filters
              │   ├ product_list_templates/    <- Category page templates
              │   ├ product_tabs/              <- Product tabs
              │   ├ product_templates/         <- Product detail page
              │   ├ products/                  <- Product blocks
              │   ├ static_templates/          <- Static templates
              │   ├ wrappers/                  <- Block wrappers
              │   └ [template_name].tpl        <- Various templates
              ├── buttons/                     <- Buttons
              │   └ [button_name].tpl
              ├── common/                      <- Common templates (samples)
              │   ├ [template_name].tpl
              │   ├ scripts.tpl                <- All scripts connection
              │   ├ styles.tpl                 <- All styles connection
              │   ├ price.tpl                  <- Price showing
              │   ├ product_data.tpl           <- Product data processing
              │   └ ....                       <- and others
              ├── pickers/                     <- Pop-up windows for object selection
              │   ├ categories/                <- "Select category" window
              │   └ products/                  <- "Select product" window
              ├── views/                       <- Main platform templates
              │   ├ block_manager/             <- Render blocks
              │   │   └ render/                
              │   │     ├ location.tpl         <- Header, content, footer
              │   │     ├ container.tpl        <- Connection of the container with sections
              │   │     ├ grid.tpl             <- Connection of the block section
              │   │     └ block.tpl            <- Block connection
              │   │ 
              │   ├ [controller_name]/         <- Controller templates
              │   │   └ [mode].tpl             <- Controller mode template
              │   ├ categories/
              │   ├ checkout/
              │   ├ products/
              │   └ ...
              ├ 404.tpl                        <- 404
              ├ index.tpl                      <- Page building
              └ meta.tpl                       <- Meta data

In Detail
---------

Storefront Styles
=================

All platform and add-on styles are collected into one file and cached.

.. code-block:: none 

    root/
    └ design/                                  
      └ themes/       
        └ [theme_name]/                     
          │                                   
          ├── css/                             
          │   ├── addons/                      <- Add-on styles
          │   │   └ [addon_id]/     
          │   │     ├ styles.css     
          │   │     └ styles.less    
          │   │        
          │   ├── lib/                         <- Style libraries
          │   │   ├ bootstrap/            
          │   │   └ ui/            
          │   │
          │   ├── base.css                     <- CSS files and LESS themes
          │   ├── grid.less
          │   ├── print.css
          │   ├── styles.css
          │   └── ...                          <- other main styles
          │
          ├── styles/                          <- Styles from the wysiwyg editor
          │   └── data/                       
          │       ├ [style_name].css           <- Style CSS
          │       └ [style_name.less           <- Style LESS
          │
          └── templates/                       
              └── common/                      
                  └ styles.tpl                 <- All styles connection

Page in the Admin Panel
=======================

.. code-block:: none 

    root/
    ├─ app/
    │  ├─ functions/                            <- Functions
    │  │  └─ [functions].php                    <- Functions called by controller
    │  └─ controllers/                          <- Controllers
    │     ├─ backend/                           <- Admin panel
    │     │  └─ [controller].php                <- Page controller
    │     └─ schemas/                           <- Schemas
    │        └─ menu/                           <- Menu schema
    │           └─ menu.php                     
    │
    └─ design/
       └ backend/                               <- Admin panel templates
         └ templates/                           <- Templates
           └ views/                             <- Entry page
             └ [controller]/                    <- Controller
               └ [controller_mode].tpl          <- Controller mode

Storefront Page
===============

.. code-block:: none 

    root/
    ├─ app/      
    │  ├─ functions/                            <- Functions
    │  │  └─ [functions].php                    <- Functions called by controller
    │  └ controllers/     
    │    └─ frontend/                           <- Storefront controller
    │       └─ [controller].php                 <- Page controller
    └─ design/        
       └ themes/                                <- Storefront design—themes
         └ [theme_name]/         
           └ templates/                         <- Templates
             └ views/                           <- Entry page
               └ [controller]/                  <- Controller
                 └ [controller_mode].tpl        <- Controller mode

Block on the Storefront
=======================

.. code-block:: none 

    root/
    ├─ app/                
    │  ├ functions/                          <- Functions for getting content
    │  │ └─ [functions].php                    
    │  └─ schemas/                           <- Schemas
    │     └─ block_manager/                  <- Schemas related to blocks
    │        └─ blocks.php                   <- Main block schema
    └─ design/        
       └ themes/                             <- Storefront design—themes
         └ [theme_name]/         
           └ templates/                      <- Templates                      
             └ blocks/                       <- Block templates
               ├ [folder_with_blocks]/       <- Folder with blocks by type
               │ └ [block].tpl               <- Block template
               └ [block].tpl                 <- Or a simple block template

Payment method
==============

.. code-block:: none 

    root/
    ├─ app/                
    │  └ payments/                           <- Payment methods
    │    └─ [payment_method].php             <- Payment method script
    │
    └─ design/                
       ├ backend/                            <- Admin panel templates
       │ └ templates/                                            
       │   └ views/                            
       │     ├ payments/                   
       │     │ └ components/            
       │     │   └ cc_processors/         
       │     │     └ [payment_method].tpl     
       │     └ orders/
       │       └ components/
       │         └ payments/
       │           └ [payment_method].tpl         
       └ themes/                             <- Storeront templates
         └ [theme_name]/         
           └ templates/                                       
             └ views/                            
               ├ checkout/                   
               │ └ processors/                  
               │   └ [payment_method].tpl   
               └ orders/
                 ├ components/
                 │ └ payments/
                 │   └ [payment_method].tpl   
                 └ processors/
                   └ [payment_method].tpl   

Extending with the help of add-on
---------------------------------

Add-on schema
=============

.. code-block:: none

    root/
    ├─ app/                
    │  └ addons/                                     
    │    └ [addon_id]/                              <- Add-on folder
    │       ├─ controllers/                          <- Controller extending
    │       ├─ database/                             <- MySQL files 
    │       ├─ schemas/                              <- PHP schema extending
    │       ├─ Tygh/                                 <- Classes and class extendings
    │       ├─ addon.xml                             <- Add-on main file
    │       ├─ config.php                            <- Constants
    │       ├─ func.php                              <- Functions and hook extendings
    │       └─ init.php                              <- Hook connection
    ├─ design/                
    │  ├ backend/                                    <- Admin panel templates
    │  │ ├ css/                                      <- Admin panel styles
    │  │ │ └ addons/       
    │  │ │   └ [addon_id]/                          
    │  │ ├ mail/                                     <- Email and invoice templates
    │  │ │ └ templates/       
    │  │ │   └ addons/              
    │  │ │     └ [addon_id]/                                              
    │  │ ├ media/                                    <- Static data
    │  │ │ └ images/                                 <- Images
    │  │ │   └ addons/     
    │  │ │     └ [addon_id]/                                       
    │  │ └ templates/                                <- Templates, hooks and pages
    │  │   └ addons/    
    │  │     └ [addon_id]/                          
    │  └ themes/                                     <- Storefront design—themes
    │    └ [theme_name]/                             <- Theme name
    │      ├ css/                                    <- Styles
    │      │ └ addons/       
    │      │   └ [addon_id]/                           
    │      ├ mail/                                   <- Email and invoice templates
    │      │ └ templates/       
    │      │   └ addons/   
    │      │     └ [addon_id]/                               
    │      ├ media/                                  <- Static data
    │      │ └ images/       
    │      │   └ addons/                             <- Add-on images   
    │      │     └ [addon_id]/        
    │      └ templates/                              <- Templates
    │        └ addons/                               <- Hooks, blocks and pages
    │          └ [addon_id]/     
    ├ js/                                            <- Add-on scripts
    │ └ addons/       
    │   └ [addon_id]/                       
    └ var/                                           <- Add-on template repository
      └ themes_repository/                           <- Used during installation
        └ [theme_name]/
          └ ...

Full add-on schema
==================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                                     <- Add-ons and extensions
    │    └ [addon_id]/                              <- Add-on folder
    │       ├─ controllers/                          <- Controller extending
    │       │  ├─ backend/                           <- Admin panel
    │       │  │  ├─ [your_controller].php           <- New controller
    │       │  │  ├─ [controller].pre.php            <- Extending before controller
    │       │  │  └─ [controller].post.php           <- Extending after controller
    │       │  ├─ common/                            <- Common controllers
    │       │  │  ├─ [your_controller].php            
    │       │  │  ├─ [controller].pre.php            
    │       │  │  └─ [controller].post.php           
    │       │  └─ frontend/                          <- Controllers and storefronts
    │       │     ├─ [your_controller].php          
    │       │     ├─ [controller].pre.php         
    │       │     └─ [controller].post.php          
    │       ├─ database/                             <- MySQL files 
    │       ├─ schemas/                              <- PHP schema extending
    │       │  └─ [schema_folder]/                   <- Schema folder (schema type)
    │       │     └─ [schema_name].post.php          <- Extending after schema
    │       ├─ Tygh/                                 <- Classes
    │       │  ├─ Shippings/                         <- Shipping methods
    │       │  │  └─ Services/                       <- Shipping services
    │       │  │     └─ [ShippingService].php        <- Your shipping service
    │       │  └─ [YourClass].php                    <- Any new class
    │       ├─ addon.xml                             <- Add-on main file
    │       ├─ config.php                            <- Constants
    │       ├─ func.php                              <- Functions and hook extendings
    │       └─ init.php                              <- Hook connection
    ├─ design/                
    │  ├ backend/                                    <- Admin panel templates
    │  │ ├ css/                                      <- Admin panel styles
    │  │ │ └ addons/       
    │  │ │   └ [addon_id]/                          <- Your add-on
    │  │ │     ├ styles.css                          <- Your styles
    │  │ │     └ styles.less                        
    │  │ ├ mail/                                     <- Email and invoice templates
    │  │ │ └ templates/       
    │  │ │   └ addons/                               <- Add-ons
    │  │ │     └ [addon_id]/                        <- Add-on folder
    │  │ │       ├ hooks/                            <- Connecting to hooks
    │  │ │       │ └ [hook_type]/                    <- Hook folder
    │  │ │       │   ├ [hook_name].pre.tpl           <- Code before hook
    │  │ │       │   ├ [hook_name].post.tpl          <- Code after hook
    │  │ │       │   └ [hook_name].override.tpl      <- Override hook
    │  │ │       ├ [email_template]_subj.tpl/            
    │  │ │       └ [email_template].tpl/                     
    │  │ ├ media/                                    <- Static data
    │  │ │ └ images/                                 
    │  │ │   └ addons/                           
    │  │ │     └ [addon_id]/                        <- Images of your add-on
    │  │ │       ├ image_1.jpg/           
    │  │ │       └ image_2.png/         
    │  │ └ templates/                                <- Templates
    │  │   └ addons/       
    │  │     └ [addon_id]/                          
    │  │       ├ hooks/                              <- Connecting to hooks
    │  │       │ ├ index/                            <- Hook folder
    │  │       │ │ ├ scripts.post.tpl                <- Hook for connecting your script
    │  │       │ │ └ styles.post.tpl                 <- Hook for connecting your style
    │  │       │ └ [hook_type]/                             
    │  │       │   ├ [hook_name].pre.tpl             <- Your code before the hook            
    │  │       │   ├ [hook_name].post.tpl            <- Your code after the hook             
    │  │       │   └ [hook_name].override.tpl        <- Your code will override the hook
    │  │       ├ views/                              <- Entry page  
    │  │       │ └ [your_controller]/                <- Controller
    │  │       │   └ [controller_mode].tpl           <- Controller mode
    │  │       └ overrides/                          <- Override any template
    │  │         └ ...                               <- Create the desired structure
    │  │   
    │  └ themes/                                     <- Storefront design—themes
    │    └ [theme_name]/                             <- Theme name
    │      ├ css/                                    <- Styles
    │      │ └ addons/       
    │      │   └ [addon_id]/                        
    │      │     ├ styles.css                        <- Your CSS style
    │      │     └ styles.less                       <- Your LESS style
    │      ├ mail/                                   <- Email and invoice templates
    │      │ └ templates/       
    │      │   └ addons/                             
    │      │     └ [addon_id]/                            
    │      │       ├ hooks/                          <- Extending with the help of hooks
    │      │       │ └ [hook_type]/                             
    │      │       │   ├ [hook_name].pre.tpl                             
    │      │       │   ├ [hook_name].post.tpl                 
    │      │       │   └ [hook_name].override.tpl    
    │      │       ├ [email_template]_subj.tpl/      <- Email subject template
    │      │       └ [email_template].tpl/           <- Email template
    │      ├ media/                                  <- Static data
    │      │ └ images/       
    │      │   └ addons/                             <- Add-on images
    │      │     └ [addon_id]/                     
    │      │       ├ image_1.jpg/          
    │      │       └ image_2.png/           
    │      └ templates/                              <- Templates
    │        └ addons/       
    │          └ [addon_id]/                        <- Your add-on
    │            ├ hooks/                            <- Hook extending
    │            │ ├ index/                          <- Hook folder
    │            │ │ ├ scripts.post.tpl              <- Hook for connecting your script
    │    │       │ │ └ styles.post.tpl               <- Hook for connecting your style
    │            │ └ [hook_type]/                    <- Hook folder
    │            │   ├ [hook_name].pre.tpl           <- Your code before hook
    │            │   ├ [hook_name].post.tpl          <- Your code after hook
    │            │   └ [hook_name].override.tpl      <- Override entire hook
    │            ├ views/                            <- New page
    │            │ └ [your_controller]/              <- Your controller folder
    │            │   └ [controller_mode].tpl         <- Template for controller mode
    │            └ overrides/                        <- Override any theme template
    │              └ ...                             <- File to be overridden
    │
    ├ js/                                            <- Add-on scripts
    │ └ addons/       
    │   └ [addon_id]/                         
    │     └ func.js/                          
    └ var/                                           <- Add-on template repository
      └ themes_repository/                           <- Used during installation
        └ [theme_name]/
          └ ...

Connect CSS or LESS style
=========================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                                     <- Add-ons and extensions
    │    └ [addon_id]/                              <- Add-on folder
    │       └─ addon.xml                             <- Add-on main file
    │
    └─ design/                
       └ themes/                                     <- Storefront design—themes
         └ [theme_name]/                             <- Theme name
           ├ css/                                    <- Styles
           │ └ addons/       
           │   └ [addon_id]/                        
           │     ├ styles.css                        <- Your CSS style
           │     └ styles.less                       <- Your LESS style
           │
           ├ media/                                  <- Static data
           │ └ images/       
           │   └ addons/                             <- Add-on images
           │     └ [addon_id]/                     
           │       └ background_image.png/           <- For example, background image
           │
           └ templates/                              <- Connect style in template
             └ addons/       
               └ [addon_id]/                        
                 └ hooks/                            
                   └ index/                           
                     └ styles.post.tpl               <- Your style connection hook

New page in admin panel
=======================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                                     <- Add-ons and extensions
    │    └ [addon_id]/                              <- Add-on folder
    │       ├─ controllers/                          <- Controllers
    │       │  └─ backend/                           <- Admin panel
    │       │     └─ [your_controller].php           <- New controller
    │       ├─ schemas/                              <- PHP schema extending
    │       │  └─ menu/                              <- Menu schema
    │       │     └─ menu.post.php                   <- Add a new menu item
    │       ├─ addon.xml                             <- Add-on main file
    │       └─ func.php                              <- Functions
    └─ design/                
       └ backend/                                    <- Admin panel templates
         └ templates/                                <- Templates
           └ addons/       
             └ [addon_id]/                          
               └ views/                              <- Entry page
                 └ [your_controller]/                <- Controller
                   └ [controller_mode].tpl           <- Controller mode

New storefront page
===================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                                       <- Add-ons and extensions
    │    └ [addon_id]/                                <- Add-on folder
    │       ├─ controllers/                            <- Controller extending
    │       │  └─ frontend/                            <- Admin panel
    │       │     └─ [your_controller].php             <- New controller
    │       ├─ addon.xml                               <- Add-on main file
    │       └─ func.php                                <- Functions
    └─ design/        
       └ themes/                                       <- Storefront design—themes
         └ [theme_name]/         
           └ templates/                                <- Templates
             └ addons/       
               └ [addon_id]/                          
                 └ views/                              <- Entry page
                   └ [your_controller]/                <- Controller
                     └ [controller_mode].tpl           <- Controller mode

New block on the storefront
===========================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                             <- Add-ons and extensions
    │    └ [addon_id]/                      <- Add-on folder
    │       ├─ schemas/                      <- PHP schema extending
    │       │  └─ block_manager/             <- Schemas related to blocks
    │       │     └─ blocks.post.php         <- Extend schema of blocks
    │       ├─ addon.xml                     <- Add-on main file
    │       └─ func.php                      <- Functions for getting content
    └─ design/        
       └ themes/                             <- Storefront design—themes
         └ [theme_name]/         
           └ templates/                      <- Templates                      
             └ addons/       
               └ [addon_id]/                          
                 └ blocks/                   
                   └ [your_block].tpl        <- New block template

New shipping method
====================

.. code-block:: none 

    root/
    ├─ app/                
    │  └ addons/                             
    │    └ [addon_id]/                      
    │       ├─ Tygh/                              <- Class extending
    │       │  └─ Shippings/                      <- Shipping methods
    │       │     └─ Services/             
    │       │        └─ [ShippingMethod].php      <- API connection script
    │       ├─ addon.xml                          <- Add-on main file
    │       └─ func.php                           <- Functions
    └─ design/        
       └ themes/                             
         └ [theme_name]/                          <- Show
           └ templates/                           <- additional information 
             └ addons/                            <- during the selection
               └ [addon_id]/                     <- of a shipping method
                 └ hooks/                         <- using
                   └ checkout/                    <- a hook in a template of
                     └ shipping_method.post.tpl/  <- the shipping methods.