{if $shop2.json.compare}

	{*if !$compare}
		{assign var="compare" value=$shop2.products}
	{/if*}

	{assign var="compared" value=$compare|@count}

	{if $compared}
		<div class="compare-block">
			<ul>
				{foreach from=$compare key="kind_id" item="kind"}
					<li>
						<div class="compare-block-image {if !$kind.image_filename}compare-block-noimage{/if}">
							{if $kind.image_filename}
								<img src="{s3_img width=70 height=70 src=$kind.image_filename}" alt="" />
							{/if}
						</div>
						<div class="compare-block-details">
							<a href="{get_seo_url mode="product" alias=$kind.alias prefix=$shop2.uri}" class="compare-block-name">{$kind.name}</a>
							<div class="compare-block-price">{$kind.price|price_convert} {$currency.currency_shortname}</div>
						</div>
					</li>
				{/foreach}
			</ul>
			<a href="{get_seo_url mode="compare" prefix=$shop2.uri}" class="shop2-btn" target="_blank">Сравнить</a>
			<a href="#" class="compare-block-clear">Очистить</a>
			<a href="#" class="compare-block-toggle">Список сравнения (<span>{$compared}</span>)</a>
		</div>
	{/if}

{/if}