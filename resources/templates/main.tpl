{if $smarty.get.products_only == 1}
	
	{include file="global:shop2.v2-product-list.tpl"}
	{include file="global:shop2.v2-pagelist.tpl"}

{else}

	{if isset($shop2_main_block) && !isset($smarty.get.p)}
	    {$shop2_main_block.body}
	{/if}

	{if $shop2_main_blocks}
	    {include file="global:shop2.v2-main-blocks.tpl"}
	{else}
	    {include file="global:shop2.v2-filter.tpl"}
	    {include file="global:shop2.v2-product-list.tpl"}
	    {include file="global:shop2.v2-pagelist.tpl"}
	{/if}

	{if isset($shop2_main_block2) && !isset($smarty.get.p)}
	    {$shop2_main_block2.body}
	{/if}

{/if}