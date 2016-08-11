*************
Защита от XSS
*************

В версии 4.3.1 появился функционал, позволяющий удалять все HTML-теги, заэкранировать их, либо выборочно вырезать "опасные" HTML-теги и JavaScript-код из данных, введённых пользователями. Для этого используется сторонняя библиотека ``HTMLPurifier``, и обёртка над ней — класс ``Tygh\Tools\SecurityHelper``.

*SecurityHelper* реализует метод ``sanitizeObjectData()``, позволяющий обработать данные объектов согласно правилам, расположенным в схеме *app/schemas/security/object_sanitization.php*. Данный метод вызывается в функциях ``fn_update_category()``, ``fn_update_product()``, ``fn_update_product_option()``, ``fn_update_page()``, ``fn_update_company()``, ``fn_form_builder_update_page_post()``, ``fn_buy_together_update_chain()``.

Описание правил обработки в схеме задаётся следующим образом:

::

  use Tygh\Tools\SecurityHelper;

  $schema = array(
      // product - тип объекта
      'product' => array(
          SecurityHelper::SCHEMA_SECTION_FIELD_RULES => array(
              // название поля => действие
              // SecurityHelper::ACTION_REMOVE_HTML - из поля все HTML-теги будут вырезаны
              // SecurityHelper::ACTION_SANITIZE_HTML - будут выборочно вырезаны "опасные" теги и JS-код
              // SecurityHelper::ACTION_ESCAPE_HTML - специальные HTML-символы будут заэкранировны
              'shortname' => SecurityHelper::ACTION_REMOVE_HTML,
              'meta_description' => SecurityHelper::ACTION_REMOVE_HTML,
              'meta_keywords' => SecurityHelper::ACTION_REMOVE_HTML,
              'search_words' => SecurityHelper::ACTION_REMOVE_HTML,
              'page_title' => SecurityHelper::ACTION_REMOVE_HTML,
              'age_warning_message' => SecurityHelper::ACTION_REMOVE_HTML,
              'product_code' => SecurityHelper::ACTION_REMOVE_HTML,
              'short_description' => SecurityHelper::ACTION_SANITIZE_HTML,
              'full_description' => SecurityHelper::ACTION_SANITIZE_HTML,
              'promo_text' => SecurityHelper::ACTION_SANITIZE_HTML,
              'product' => SecurityHelper::ACTION_SANITIZE_HTML,
          )
      ),
      ...
  );

Действия ``SecurityHelper::ACTION_SANITIZE_HTML`` будут выполнены только в том случае, если это разрешено в настройке **config.tweaks.sanitize_user_html**. Настройка может принимать три значения: ``auto``, ``true`` и ``false``. По умолчанию установлено значение ``auto``, что означает ``true`` для Multi-Vendor и ``false`` для CS-Cart.
