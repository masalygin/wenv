{if isset($smarty.get.p)}
	{assign var="pn" value="PAGE_TITLE_PAGES"|cat:$p+1}
{/if}

{if $site.settings.seo_fields}

	{if $page.seo_title}
		{assign_hash var=page.title value="`$page.seo_title` `$pn`"}
	{else}
		{assign_hash var=page.title value="`$folder.folder_name` `$pn`"}
	{/if}

	{if $page.seo_keywords}
		{assign_hash var=page.keywords value="`$page.seo_keywords` `$pn`"}
	{else}
		{assign_hash var=page.keywords value="`$folder.folder_name` `$pn`"}
	{/if}

	{if $page.seo_description}
		{assign_hash var=page.description value="`$page.seo_description` `$pn`"}
	{else}
		{assign_hash var=page.description value="`$folder.folder_name` `$pn`"}
	{/if}

{else}

	{assign_hash var=page.title value="`$folder.folder_name` `$pn`"}
	{assign_hash var=page.keywords value="`$folder.folder_name` `$pn`"}
	{assign_hash var=page.description value="`$folder.folder_name` `$pn`"}

{/if}

{assign var="h1" value=$page.seo_h1|default:$folder.folder_name}

{if $smarty.get.products_only == 1}

	{include file="global:shop2.v2-product-list.tpl"}
	{include file="global:shop2.v2-pagelist.tpl"}

{else}

	{if !isset($smarty.get.p) && $folder.folder_desc}
		{$folder.folder_desc}
	{/if}

	{include file="global:shop2.v2-filter.tpl"}
	{include file="global:shop2.v2-product-list.tpl"}
	{include file="global:shop2.v2-pagelist.tpl"}

	{if !isset($smarty.get.p) && $folder.folder_desc2}
		{$folder.folder_desc2}
	{/if}

{/if}