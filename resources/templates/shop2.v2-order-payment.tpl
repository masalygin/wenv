{if !$order}

	<p>
		{#SHOP2_SUCH_ORDER_NOT_EXIST#}.
		<a class="shop2-btn" href="{$shop2.uri}">{#SHOP2_GO_MAIN#}</a>
	</p>
{else}

	{$shop2.json.order_done|htmlspecialchars_decode}

	<div class="shop2-order-completed">
		<div>
			{#SHOP2_CHECK_ORDER_STATUS#} 
			<a href="{strip}
				http://{$smarty.server.HTTP_HOST}{get_seo_url uri_prefix=$shop2.uri mode="orders"}?order_id={$order.order_id}
				{if !$user.user_id}
					&hash={$order.hash}
				{/if}
			{/strip}">{#SHOP2_ORDER_LINK#}</a>
		</div>
		<div>{#SHOP2_NUMBER_YOUR_ORDER#}: <strong>№ {$order.number} ({$order.order_id})</strong></div>
		<div>{#SHOP2_ORDER_DATE#}: <strong>{$order.created|date_format:"%d.%m.%y %H:%M"}</strong></div>
		
		{if $order.delivery.delivery_id}
			{if !$shop2.my.hide_delivery_cost || $order.delivery.cost}
				<div>{#SHOP2_DELIVERY2#}: <strong>{$order.delivery.cost|price_convert} {$order.currency.shortname}</strong></div>
			{/if}
		{/if}
		
		<div>{#SHOP2_AMOUNT_TO_PAY#}: <strong>{$order.total|price_convert} {$order.currency.shortname}</strong></div>
		{*if $order.data.tax.name}
			<div>{#SHOP2_INCLUDING_VAT#|sprintf:$order.data.tax.name}{$order.data.tax.percent}%: <strong>{$order.data.tax.value|price_convert} {$order.currency.shortname}</strong></div>
		{/if*}

		<div><a class="shop2-btn" href="#" id="order-print">{#SHOP2_PRINT_ORDER_FORM#}</a></div>
	</div>

	{include file="global:shop2.v2-forms-btn.tpl"}

	<div id="shop2-order" class="shop2-order-print hide">
		{include file="global:shop2.v2-order-table-products.tpl"}
	</div>

	{include file="global:shop2.v2-payment-btn.tpl"}
	
{/if}