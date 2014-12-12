{if $shop2.json.panel && $mode != 'order' && $mode != 'cart'}

	{assign var="compared" value=$compare|@count}

	<div class="shop2-panel" id="shop2-panel">
		<div class="shop2-panel-content">
			
			<a {if $shop2_cart.total_amount || $shop2_cart.total_sum || $shop2_cart.total_pre_order}href="{get_seo_url mode='cart' uri_prefix=$shop2.uri}" class="shop2-panel-btn"{else}class="shop2-panel-btn disabled"{/if}>Оформить заказ</a>
			
			<div class="shop2-panel-cart">
				<a {if $shop2_cart.total_amount || $shop2_cart.total_sum || $shop2_cart.total_pre_order}href="{get_seo_url mode='cart' uri_prefix=$shop2.uri}"{else}class="shop2-panel-link-disabled"{/if}>Корзина</a>
				<div class="shop2-panel-count{if $shop2_cart.total_amount || $shop2_cart.total_pre_order} not-null{/if}">{$shop2_cart.total_amount+$shop2_cart.total_pre_order|default:0}</div>
					
				<div class="shop2-panel-total">
					{if $shop2_cart.total_sum || $shop2_cart.total_pre_order}
						на {$shop2_cart.total_sum|price_convert} {$shop2.currency_shortname}
					{else}
						пусто
					{/if}
				</div>
			</div>
			
			{if $shop2.json.compare}
				<div class="shop2-panel-compare">
					<a target="_blank" {if $compared}href="{get_seo_url mode="compare" uri_prefix=$shop2.uri}"{else}class="shop2-panel-link-disabled"{/if}>Сравнение</a>
					<div class="shop2-panel-count{if $compared} not-null{/if}">{$compared}</div>
				</div>
			{/if}
		</div>
	</div>

{/if}