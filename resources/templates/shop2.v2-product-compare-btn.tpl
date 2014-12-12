{if $shop2.json.compare}

	{if isset($compare[$product.kind_id])}
		<div class="product-compare product-compare-added">
			<input type="checkbox" value="{$product.kind_id}" checked="true" autocomplete="off" />
			<a href="{get_seo_url uri_prefix=$shop2.uri mode="compare"}" target="_blank">Сравнить <span>({$compare|@count})</span></a>
		</div>
	{else}
		<div class="product-compare">
			<label>
				<input type="checkbox" value="{$product.kind_id}" autocomplete="off" />
				Добавить к сравнению
			</label>
		</div>
	{/if}
	
{/if}