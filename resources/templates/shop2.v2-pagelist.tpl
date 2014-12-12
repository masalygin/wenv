{if $pages > 1}

	{assign var="limit" value=$limit|default:9}

	{assign var=p value=$smarty.get.p|default:""}

	{if $p === "" && $invert_pages}
		{assign var=p value=$pages-1}
	{/if}

	{assign var=url value=$smarty.server.REQUEST_URI|regex_replace:"/\/p\/\d+/":''}
	{assign var=url value=$url|regex_replace:"/\?p=\d+&/":"?"}
	{assign var=url value=$url|regex_replace:"/[?&]p=\d+/":""}

	{assign var=get value=$url|regex_replace:"/^(.+)\?/":""}

	{if $get == $url}
		{assign var=get value=""}
	{/if}

	{assign var=uri value=$url|regex_replace:"/\?(.+)$/":""}
	{assign var=uri value=$uri|regex_replace:"/\/$/":""}

	{if $not_seo}
		{assign var=dot value="?p="}

		{if $get && $get != "/"}
			{assign var=get value="&`$get`"}
		{/if}

	{elseif $uri == ''}

		{assign var=dot value=$page.url_page|cat:"/p/"}
		{if $get && $get != "/"}
			{assign var=get value="?`$get`"}
		{/if}

	{else}

		{assign var=dot value="/p/"}
		{if $get && $get != "/"}
			{assign var=get value="?`$get`"}
		{/if}

	{/if}

	{assign var=get value=$get|htmlspecialchars}

	{if $site.trailing_slash == 'add'}
		{assign var=get value="/"|cat:$get}
	{/if}

	{capture assign="prev"}{strip}
		{if $p > 1}
			{$uri}{$dot}{$p-1}{$get}
		{else}
			{$url}
		{/if}
	{/strip}{/capture}


	{capture assign="next"}{strip}
		{$uri}{$dot}{$p+1}{$get}
	{/strip}{/capture}

	{assign var="delta" value=$limit/2|floor}
	{assign var="start" value=$p-$delta}
	{assign var="end" value=$p+$delta}

	{if $start < 0}
		{assign var="start" value=0}
		{assign var="end" value=$limit-1}
	{/if}

	{if $end >= $pages}
		{assign var="end" value=$pages}
		{assign var="start" value=$pages-$limit}
	{/if}

	{if $start < 0}
		{assign var="start" value=0}
	{/if}

	{* start: {$start}, end: {$end}, pages: {$pages}, p: {$p} *}

	<ul class="shop2-pagelist">

		{if $p && $p != 0}
			<li class="page-first"><a href="{$url}">&nbsp;</a></li>
			<li class="page-prev"><a href="{$prev}">&nbsp;</a></li>
		{/if}

		{if $start > 0}
			<li class="page-num"><span>...</span></li>
		{/if}

		{section name=i loop=$pages start=$start max=$end-$start+1}
			{assign var="index" value=$smarty.section.i.index}
			{if $index==$p}
				<li class="page-num active-num"><span>{$index+1}</span></li>
			{else}
				<li class="page-num"><a href="{if $index > 0}{$uri}{$dot}{$index}{$get}{else}{$url}{/if}">{$index+1}</a></li>
			{/if}
		{/section}

		{if $end < $pages - 1}
			<li class="page-num"><span>...</span></li>
		{/if}

		{if $p != $pages - 1}
			<li class="page-next"><a href="{$next}">&nbsp;</a></li>
			<li class="page-last"><a href="{$uri}{$dot}{$pages-1}{$get}">&nbsp;</a></li>
		{/if}

	</ul>

{/if}