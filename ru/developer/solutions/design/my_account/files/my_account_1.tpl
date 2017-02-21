{** block-description:my_account **}

{capture name="title"}
    <a class="ty-account-info__title" href="{"profiles.update"|fn_url}">{$title}</a><i class="ty-icon-down-micro ty-account-info__user-arrow"></i>
{/capture}

<div id="account_info_{$block.snapping_id}">
    {assign var="return_current_url" value=$config.current_url|escape:url}
    <ul class="ty-account-info">
