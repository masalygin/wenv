<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="robots" content="{if $page.noindex}none{else}all{/if}">
	<title>{$h1}</title>
	{$common_js}
	{strip}
		<script type="text/javascript">
			hs.transitions = ['expand', 'crossfade'];
			hs.outlineType = 'rounded-white';
			hs.fadeInOut = true;
			hs.dimmingOpacity = 0.75;
			hs.align = 'center';
		</script>
	{/strip}
	{include file="global:shop2.v2-init.tpl" jquery=true cookie=true reset=true}
</head>
<body class="shop2-compare-page">

	<!-- <div class="shop2-compare-logo">
		<img src="#" alt="" />
	</div> -->
	
	{assign var="count" value=$shop2.products|@count}

	<table class="shop2-compare-table">
		<tr class="shop2-compare-header">
			<td>
				<h1>Сравнение товаров:</h1>
			</td>
			{foreach from=$shop2.products key=k item=product name=foo}
				<td>
					<div class="shop2-compare-product-image {if !$product.image_filename}shop2-compare-product-not-image{/if}">
						{if $product.image_filename}
							<a href="{$IMAGES_DIR}{$product.image_filename}">
								<img src="{s3_img width=128 height=128 src=$product.image_filename}" alt="">
							</a>
							<div class="verticalMiddle"></div>
						{/if}
					</div>
					{include file="global:shop2.v2-rating.tpl"}
					<div class="shop2-compare-product-name">
						<a href="{get_seo_url mode="product" alias=$product.alias}">{$product.name}</a>
					</div>
					<div class="shop2-compare-product-price">{$product.price|price_convert} {$currency.currency_shortname}</div>
				</td>
			{/foreach}
		</tr>
		<tr class="shop2-compare-header2">
			<td class="shop2-compare-switch">
				
				<a href="#" class="shop2-compare-switch-active{*if $count == 1} invisible{/if*}"><span>Все параметры</span></a>
				<a href="#" {*if $count == 1}class="invisible"{/if*}><span>Различающиеся</span></a>
			</td>
			{foreach from=$shop2.products key=k item=product}
				<td>
					{*
					<a href="{get_seo_url mode="product" alias=$product.alias}" class="shop2-btn" target="_blank">Подробнее</a>
					*}
					{*
					<form method="post" action="{$shop2.uri}?mode=cart&amp;action=add">
						<input type="hidden" name="kind_id" value="{$product.kind_id}" />
						<input type="hidden" name="product_id" value="{$product.product_id}" />
						<input type="hidden" name="meta" value="{$product.meta|@json_encode|escape}" />
						{include file="global:shop2.v2-buy-btn.tpl" type=2}
					</form>
					*}
					<a href="#" class="shop2-compare-delete" data-id="{$product.kind_id}">
						<ins></ins>
						Удалить
					</a>
				</td>
			{/foreach}
		</tr>

		{*if $count > 1*}
			
			{assign var="show" value=0}
			{capture assign="vendors"}
				<tr class="shop2-compare-data">
					<td>{$shop2.my.vendor_alias|default:#SHOP2_VENDOR#}</td>
					{foreach from=$shop2.products key=k item=product}
						<td>
							{if $product.vendor_name}
								{assign var="show" value=1}
								<a href="{get_seo_url uri_prefix=$shop2.uri mode="vendor" alias=$product.vendor_alias}">{$product.vendor_name}</a>
							{else}
								-
							{/if}
						</td>
					{/foreach}
				</tr>
			{/capture}

			{if $show}
				{$vendors}
			{/if}

			{assign var="show" value=0}
			{capture assign="weight"}
				<tr class="shop2-compare-data">
					<td>{#SHOP2_WEIGHT#}</td>
					{foreach from=$shop2.products key=k item=product}
						<td>
							{if $product.weight}
								{assign var="show" value=1}
								{$product.weight} {$product.weight_unit}
							{else}
								-
							{/if}
						</td>
					{/foreach}
				</tr>
			{/capture}

			{if $show}
				{$weight}
			{/if}

			{foreach from=$custom_fields key=code item=option}
				{if $option.in_list || $option.in_detail || $option.in_params}
					{assign var="show" value=0}
					{capture assign="options"}
						{foreach from=$shop2.products key=kk item=e}
							{assign var="meta" value=$e.meta}

							{if isset($meta.$code)}
								{assign var="show" value=1}
								{assign var="value" value=$meta.$code}

								{if $option.type == 'select'}
									<td>{$option.options.$value}</td>
								{elseif $option.type == 'multiselect' && $value|@count}
									<td>
										{assign var="delimiter" value=', '}
										{if $option.not_mod}
											{assign var="delimiter" value=' / '}
										{/if}

										{foreach from=$value item=val name=foo}
											{$option.options.$val}{if !$smarty.foreach.foo.last}{$delimiter}{/if}
										{/foreach}
									</td>
								{elseif $option.type == 'image2'}
									<td>
										<a href="{$IMAGES_DIR}{$value.filename}"><img src="{s3_img src=$value.filename width=90 height=90 method="r"}" alt=""></a>
									</td>
								{elseif $option.type == 'file2'}
									<td><a href="{$value.filename}">Загрузить</a></td>
								{elseif $option.type == 'color'}
									<td><div class="shop2-compare-color" style="background:{$value}"></div></td>
								{elseif $option.type == 'checkbox'}
									<td>
										{if $value}
											{#YES#}
										{else}
											{#NO#}
										{/if}
									</td>
								{elseif $option.type == 'color2' || $option.type == 'color_ref'}
									<td>
										{include file="global:shop2.v2-color-ext.tpl" location="compare" o_value=$meta.$code}
									</td>
								{else}
									<td>{$value}</td>
								{/if}
							{else}
								<td>-</td>
							{/if}
						{/foreach}
					{/capture}

					{if $option.type != 'html' && $show}
						<tr class="shop2-compare-data">
							<td>{$option.name}{if $option.unit}, {$option.unit}{/if}</td>
							{$options}
						</tr>
					{/if}
				{/if}
			{/foreach}
		{*/if*}
	</table>

</body>
</html>