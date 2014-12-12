{foreach from=$shop2_main_blocks item=e key=k}
	{if $e.type == 0 || $e.products}
		{if $e.name}
			<div class="shop2-main-header {if 8 & $e.flags}shop2-main-new{elseif 16 & $e.flags}shop2-main-spec{/if}">
				{$e.name|htmlspecialchars}
			</div>
		{/if}

		{if $e.text_before}
			<div class="shop2-main-before">
				{$e.text_before}
			</div>
		{/if}
		
		{include file="global:shop2.v2-product-list.tpl" data=$e.products meta=$custom_fields}
		
		{if $e.text_after}
			<div class="shop2-main-after">
				{$e.text_after}
			</div>
		{/if}
	{/if}
{/foreach}