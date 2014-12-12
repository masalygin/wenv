{if $step == 'delivery'}

	{assign var="h1" value="SHOP2_DELIVERY2"}
	{include file="global:shop2.v2-order-errors.tpl"}
	{include file="global:shop2.v2-order-delivery.tpl"}
	<p><a href="{$shop2.uri}?mode=cart" class="shop2-btn shop2-btn-back">{#SITE_BACK#}</a></p>

{elseif $step == 'order'}

	{assign var="h1" value="SHOP2_RESERVATION"}
	{include file="global:shop2.v2-order-errors.tpl"}
	{include file="global:shop2.v2-order-order.tpl"}
	<p><a href="{if !empty($pre_order.delivery)}{$shop2.uri}?mode=order&amp;step=delivery&amp;action=edit{else}{$shop2.uri}?mode=cart{/if}" class="shop2-btn shop2-btn-back">{#SITE_BACK#}</a></p>


{elseif $step == 'payment'}

	{assign var="h1" value="SHOP2_ORDER_THANK"}
	{include file="global:shop2.v2-order-payment.tpl"}

{elseif $step == 'payments'}

	{assign var="h1" value="SHOP2_PAYMENTS"}
	{include file="global:shop2.v2-order-errors.tpl"}
	{include file="global:shop2.v2-order-payments.tpl"}
	<p><a href="{$shop2.uri}?mode=order&amp;step=order&amp;action=edit" class="shop2-btn shop2-btn-back">{#SITE_BACK#}</a></p>

{/if}