                    {assign var="result_ids" value="product_categories"}

<p>Test</p>

                    {hook name="companies:product_details_fields"}
                    {if "MULTIVENDOR"|fn_allowed_for && $mode != "add"}
                        {assign var="reload_form" value=true}
                    {/if}