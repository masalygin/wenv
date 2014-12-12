{assign var="collections_to_tabs" value=$shop2.my.collections_to_tabs}
{if !$collections_to_tabs}
	{assign var="collections_to_tabs" value=","|explode:""}
{/if}

{foreach from=$collections item=collection key=k}
	{if $collections.$k|@count>0 && !in_array($k, $collections_to_tabs)}
		<h4 class="shop2-collection-header">
			{if $k == 'accessory'}
				{$shop2.my.accessory|default:#SHOP2_ACCESSORIES#}
			{elseif $k == 'recommend'}
				{$shop2.my.recommend|default:#SHOP2_RECOMMENDED#}
			{elseif $k == 'kit'}
				{$shop2.my.kit|default:#SHOP2_KIT#}
			{elseif $k == 'similar'}
				{$shop2.my.similar|default:#SHOP2_SIMILAR#}
			{/if}
		</h4>
		<div class="shop2-group-kinds">
			{foreach from=$collections.$k item=e}
				{include file="global:shop2.v2-product-item-collections.tpl" e=$collection_products.$e buy=$shop2.my.buy_mod}
			{/foreach}
		</div>
	{/if}
{/foreach}