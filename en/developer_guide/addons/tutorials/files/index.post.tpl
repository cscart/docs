<div class="statistics-box">
	<div class="statistics-body">
		<p class="strong">Viewed categories</p>
		<div class="clear">
			{if $viewed_categories}
				<ul>
					{foreach from=$viewed_categories item="category_data"}
						<li><strong><a href="{"profiles.update?user_id=`$category_data.user_id`"|fn_url}">{$category_data.user_name}</a></strong>:&nbsp;
							{foreach from=$category_data.categories key="category_id" item="category_name"}
								<a href="{"categories.update?category_id=`$category_id`"|fn_url}">{$category_name}</a>, 
							{/foreach}
						</li>
					{/foreach}
				</ul>
			{else}
				<ul>
					<li>No data found</li>
				</ul>
			{/if}
		</div>
	</div>
</div>