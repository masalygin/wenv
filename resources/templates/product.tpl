{if $site.settings.seo_fields}

	{if $page.seo_title}
		{assign_hash var=page.title value="`$page.seo_title`"}
	{else}
		{assign_hash var=page.title value="`$product.name`"}
	{/if}

	{if $page.seo_keywords}
		{assign_hash var=page.keywords value="`$page.seo_keywords`"}
	{else}
		{assign_hash var=page.keywords value="`$product.name`"}
	{/if}

	{if $page.seo_description}
		{assign_hash var=page.description value="`$page.seo_description`"}
	{else}
		{assign_hash var=page.description value="`$product.name`"}
	{/if}

{else}

	{assign_hash var=page.title value="`$product.name`"}
	{assign_hash var=page.keywords value="`$product.name`"}
	{assign_hash var=page.description value="`$product.name`"}

{/if}

{assign var="h1" value=$page.seo_h1|default:$product.name}
{include file="global:shop2.v2-product.tpl"}
<p><a href="javascript:shop2.back()" class="shop2-btn shop2-btn-back">{#SITE_BACK#}</a></p>