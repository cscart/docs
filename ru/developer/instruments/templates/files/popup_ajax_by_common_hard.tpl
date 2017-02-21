{capture name="content_for_popup"}
<form name="my_form" action="{""|fn_url}" method="post" class="cm-ajax">
    <div class="ty-control-group">
        <label class="ty-control-group__title" for="name">{__("your_name")}</label>
        <input id="name" size="50" class="ty-input-text-full" type="text" name="form_data[name]" value="" />
    </div>
    <div class="buttons-container">
        <div class="ty-float-left">
            {include file="buttons/button.tpl" but_name="dispatch[my_controller.request]" but_text=__("submit") but_role="submit" but_meta="ty-btn__primary ty-btn__big cm-form-dialog-closer ty-btn"}
        </div>
        <div class="ty-float-right">
            <a class="cm-dialog-closer ty-btn ty-btn__secondary" >Закрыть</a>
        </div>
    </div>
</form>
{/capture}

{include file="common/popupbox.tpl" text="Заголовок" content=$smarty.capture.content_for_popup link_text="Название ссылки"}