{assign var="collections_to_tabs" value=$shop2.my.collections_to_tabs}
{if !$collections_to_tabs}
	{assign var="collections_to_tabs" value=","|explode:""}
{/if}

{capture assign="kinds"}{strip}
	{foreach from=$product.kinds item=e}
		{if $e.kind_id != $product.kind_id}
			{include file="global:shop2.v2-product-item-collections.tpl" show_params=1 buy=$shop2.my.buy_kind}
		{/if}
	{/foreach}
{/strip}{/capture}

{capture assign="params"}{strip}
	{include file="global:shop2.v2-product-params.tpl" e=$product}
{/strip}{/capture}

{capture assign="shop2_tabs"}{strip}

	{assign var="active_found" value=0}

	{if $params && !$shop2.my.hide_params}
		<li {if !$active_found}class="active-tab"{assign var="active_found" value=1}{/if}><a href="#shop2-tabs-1">{$shop2.my.params|default:#SHOP2_OPTIONS#}</a></li>
	{/if}
	
	{if $product.body}
		<li {if !$active_found}class="active-tab"{assign var="active_found" value=1}{/if}><a href="#shop2-tabs-2">{$shop2.my.description|default:#SHOP2_DESCRIPTION#}</a></li>
	{/if}

	{if $kinds && !$shop2.my.hide_kinds}
		<li {if !$active_found}class="active-tab"{assign var="active_found" value=1}{/if}><a href="#shop2-tabs-3">{$shop2.my.modification|default:#SHOP2_MODIFICATIONS#}</a></li>
	{/if}

	{foreach from=$collections item=collection key=k}
		{if $collections.$k|@count>0 && in_array($k, $collections_to_tabs)}
			<li {if !$active_found}class="active-tab"{assign var="active_found" value=1}{/if}><a href="#shop2-tabs-{$k}">
				{if $k == 'accessory'}
					{$shop2.my.accessory|default:#SHOP2_ACCESSORIES#}
				{elseif $k == 'recommend'}
					{$shop2.my.recommend|default:#SHOP2_RECOMMENDED#}
				{elseif $k == 'kit'}
					{$shop2.my.kit|default:#SHOP2_KIT#}
				{elseif $k == 'similar'}
					{$shop2.my.similar|default:#SHOP2_SIMILAR#}
				{/if}
			</a></li>
		{/if}
	{/foreach}
	
	{assign var="shop2_descs" value=''}
	{foreach from=$meta name=foo item=option key=k}
		{assign var="index" value=$smarty.foreach.foo.index+10}
		{assign var="e" value=$product.large_meta.$k}
		{if $e && $option.type == 'html' && $option.in_params}
			<li {if !$active_found}class="active-tab"{/if}>
				<a href="#shop2-tabs-{$index}">{$option.name}</a>
			</li>
			{capture assign="shop2_desc"}
				<div class="desc-area {if !$active_found}active-area{/if}" id="shop2-tabs-{$index}">
					{$e}
					<div class="shop2-clear-container"></div>
				</div>
			{/capture}
			{assign var="shop2_descs" value=$shop2_descs|cat:$shop2_desc}

			{if !$active_found}
				{assign var="active_found" value=1}
			{/if}
		{/if}
	{/foreach}

{/strip}{/capture}

{if (!$shop2.my.hide_tabs && $shop2_tabs) || $tags}
	<div class="shop2-product-data">
		{if !$shop2.my.hide_tabs && $shop2_tabs}
			<ul class="shop2-product-tabs">
				{$shop2_tabs}
			</ul>

			{assign var="active_found" value=0}
			<div class="shop2-product-desc">
				
				{if $params && !$shop2.my.hide_params}
				<div class="desc-area {if !$active_found}active-area{assign var="active_found" value=1}{/if}" id="shop2-tabs-1">
					{$params}
					<div class="shop2-clear-container"></div>
				</div>
				{/if}

				{if $product.body}
				<div class="desc-area {if !$active_found}active-area{assign var="active_found" value=1}{/if}" id="shop2-tabs-2">
					{$product.body}
					<div class="shop2-clear-container"></div>
				</div>
				{/if}
				
				{if $kinds && !$shop2.my.hide_kinds}
				<div class="desc-area {if !$active_found}active-area{assign var="active_found" value=1}{/if}" id="shop2-tabs-3">
					<div class="shop2-group-kinds">
						{$kinds}
					</div><!-- Group Products -->
					<div class="shop2-clear-container"></div>
				</div>
				{/if}
				
				
				{foreach from=$collections item=collection key=k}
					{if $collections.$k|@count>0 && in_array($k, $collections_to_tabs)}
						<div class="desc-area {if !$active_found}active-area{assign var="active_found" value=1}{/if}" id="shop2-tabs-{$k}">
							<div class="shop2-group-kinds">
								{foreach from=$collections.$k item=e}
									{include file="global:shop2.v2-product-item-collections.tpl" e=$collection_products.$e buy=$shop2.my.buy_mod}
								{/foreach}
							</div>
							<div class="shop2-clear-container"></div>
						</div>
					{/if}
				{/foreach}

				{$shop2_descs}
			</div><!-- Product Desc -->
		{/if}

		{if $tags}
			<div class="shop2-product-tags">
				<span>{#SHOP2_TAGS#}:</span>
				<div>
					{foreach from=$tags item=e key=k name=foo}
						<a href="{get_seo_url mode=tag alias=$e|htmlspecialchars|urlencode}">{$e|htmlspecialchars}</a>{if !$smarty.foreach.foo.last}, {/if}
					{/foreach}
				</div>
			</div>
		{/if}
		<div class="shop2-clear-container"></div>
	</div>
{/if}