{assign var="show_price" value=0}
{if !(!$user && $shop2.my.hide_prices_non_reg)}
	{assign var="show_price" value=1}
{/if}

<div class="shop2-kind-item">
	{if $buy}
		<form method="post" action="{$shop2.uri}?mode=cart&amp;action=add" accept-charset="utf-8">
			<input type="hidden" name="kind_id" value="{$e.kind_id}" />
			<input type="hidden" name="product_id" value="{$e.product_id}" />
			<input type="hidden" name="meta" value="{$e.meta|@json_encode|escape}" />
			<input type="hidden" name="amount" value="{$shop2.my.amount_default|default:1}" />
	{/if}

			<div class="kind-image{if !$e.image_filename} no-image{/if}">
				{if $e.image_filename}
				<a href="{get_seo_url mode="product" alias=$e.alias}"><img src="{s3_img width=$shop2.my.collection_image_width|default:70 height=$shop2.my.collection_image_height|default:70 src=$e.image_filename method=$shop2.my.s3_img_method}" alt="" /></a>
				<div class="verticalMiddle"></div>
				{/if}
			</div>
			<div class="kind-details">
				<div class="kind-name"><a href="{get_seo_url mode="product" alias=$e.alias}">{$e.name}</a></div>
				{if $show_price}
					<div class="kind-price">
						{include file="global:shop2.v2-product-price-old.tpl"}
						
						{include file="global:shop2.v2-product-price.tpl" obj=$e}
						
						{if $buy}
							{include file="global:shop2.v2-buy-btn.tpl" type=2 collection_list_item=$e}
						{/if}
					</div>
				{/if}
			</div>
			<div class="shop2-clear-container"></div>
			{if $show_params}
				{include file="global:shop2.v2-product-params.tpl" unique_values=$shop2.my.unique_values}
			{/if}

	{if $buy}
		</form>
	{/if}
</div>