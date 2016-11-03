*********************************************************************
Как показывать иконки способов доставки на странице оформления заказа
*********************************************************************

.. warning::

    Изменения, предложенные в данной статье, могут конфликтовать с модулями, использующими тот же хук.

Выведение иконок на витрину осуществляется в два шага:

=========================
Шаг 1. Перезаписываем хук
=========================

1. В корневой директории с установленным CS-Cart создайте следующий путь: */design/themes/[название_темы]/templates/addons/my_changes/hooks/checkout*.

.. important ::

    Перед началом работы в панели администратора откройте страницу **Модули → Управление модулями** и убедитесь, что модуль **Мои изменения** установлен и включен.

2. В данной директории создайте файл **shipping_method.override.tpl** со следующим содержимым:

.. code-block:: html+smarty

    {if $display == "radio"}
        {assign var="shipping_image_pair" value=$shipping.shipping_id|fn_get_image_pairs:shipping:M}

        <p class="ty-shipping-options__method">
            <input type="radio" class="ty-valign" id="sh_{$group_key}_{$shipping.shipping_id}" name="shipping_ids[{$group_key}]" value="{$shipping.shipping_id}" onclick="fn_calculate_total_shipping_cost();" {$checked} />
            <label for="sh_{$group_key}_{$shipping.shipping_id}" class="ty-valign">
                {if $shipping_image_pair}
                    {include file="common/image.tpl" obj_id=$shipping_id images=$shipping_image_pair image_width=100 image_height=100}
                {/if}
                {$shipping.shipping} {$delivery_time} - {$rate nofilter}
            </label>
        </p>

    {elseif $display == "select"}
        <option value="{$shipping.shipping_id}" {$selected}>{$shipping.shipping} {$delivery_time} - {$rate nofilter}</option>

    {elseif $display == "show"}
        <p>
            {$strong_begin}{$rate.name} {$delivery_time} - {$rate nofilter}{$strong_begin}
        </p>
    {/if}
    {if $shipping.description}
        <div class="ty-checkout__shipping-tips">
            <p>{$shipping.description nofilter}</p>
        </div>
    {/if}


В данном примере ширина и высота иконки способа доставки равняются 100 пикселям. Чтобы задать другой размер иконок, в параметрах ``image_width`` и ``image_height`` введите собственные значения.

.. note ::

    Если после установки модуля изменения не отображаются, очистите кэш вашего магазина. В панели администратора вашего магазина откройте меню **Администрирование → Хранилище данных** и нажмите **Очистить кэш**.

--------------------------------
Совместимость с другими модулями
--------------------------------

В некоторых случаях из-за использования одинакового хука модули могут работать некорректно. В этом случае, вам потребуется найти файл **shipping_method.post.tpl**, расположенный по адресу */design/themes/responsive/templates/addons/[addon_name]/hooks/checkout*, где [addon_name] — название не работающего модуля. После того, как вы нашли этот файл, скопируйте его содержимое в конец файла, созданного в шаге 1.

=========================================
Шаг 2. Загружаем иконки способов доставки 
=========================================

1. В панели администратора вашего магазина откройте страницу **Администрирование → Доставка и налоги → Способы доставки**, нажмите кнопку с изображением **шестеренки** рядом с нужным способом и выберите **Редактирвоать**.

2. На вкладке **Общее** в разделе **Иконка** загрузите нужное изображение.

3. Нажмите **Сохранить и закрыть**.
