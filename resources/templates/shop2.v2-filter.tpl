{assign var="after" value=0}
{if isset($smarty.get.s) || isset($smarty.get.search_text)}
	{assign var="after" value=1}
{/if}

{if $shop2.products || $after}

	{assign var="hide_in_filter" value=$shop2.my.hide_in_filter}
	{if !$hide_in_filter}
		{assign var="hide_in_filter" value=","|explode:""}
	{/if}

	{assign var="min_count_in_select" value=$shop2.my.min_count_in_select|default:7}
	{if $shop2.my.list_in_select}
		{assign var="min_count_in_select" value=99999}
	{/if}

	{assign var="show_price" value=0}
	{if !(!$user && $shop2.my.hide_prices_non_reg)}
		{assign var="show_price" value=1}
	{/if}

	{assign var="has_params" value=false}

	{if !$shop2.fallback_mode}

		{capture assign="filter"}
			<table class="table-filter-param">
				{if !in_array("price", $hide_in_filter) && $show_price}
				{assign var="has_params" value=true}
				<tr class="type-text">
					<th>{#SHOP2_PRICE#}:</th>
					<td>
						<label>
							<strong>{#SHOP2_FROM#}</strong> <input class="shop2-input-float" type="text" value="{$smarty.get.s.price.min|htmlspecialchars}" name="s[price][min]" />
						</label>
						<label>
							<strong>{#SHOP2_TO#}</strong> <input class="shop2-input-float" type="text" value="{$smarty.get.s.price.max|htmlspecialchars}" name="s[price][max]" />
						</label>
						&nbsp;<strong>{$currency.currency_shortname}</strong>
					</td>
				</tr>
				{/if}

				{if $folder.vendors && !in_array("vendors", $hide_in_filter)}
					{assign var="has_params" value=true}
					<tr>
						<th>{$shop2.my.vendor_alias|default:#SHOP2_VENDOR#}:</th>
						<td>
							{if $folder.vendors|@count > $min_count_in_select}
								<select name="s[vendor_id]">
									<option value="">{#SHOP2_ALL#}</option>
									{foreach from=$folder.vendors item=e key=k}
										<option {if in_array($e.vendor_id, $smarty.get.s.vendor_id)}selected="selected"{/if} value="{$e.vendor_id}">{$e.name}</option>
									{/foreach}
								</select>
							{else}
								{foreach from=$folder.vendors item=e key=k}
									<a href="#" data-name="s[vendor_id][]" data-value="{$e.vendor_id}" class="param-val{if in_array($e.vendor_id, $smarty.get.s.vendor_id)} active-val{/if}">
										{$e.name}<span>&nbsp;</span>
									</a>
								{/foreach}
							{/if}
						</td>
					</tr>
				{/if}

				{if $mode == 'main'}
					{include file="global:shop2.v2-filter-fields.tpl" fields=$shop2.global_params}
				{/if}
				{include file="global:shop2.v2-filter-fields.tpl" fields=$filter_fields}

				{if $shop2.my.show_amount_filter}
					{assign var="has_params" value=true}
					<tr>
						<th>В наличии:</th>
						<td>
							{assign var="active" value=0}
							{if $smarty.get.s.amount.min == 1 || ( $smarty.get.s.amount.min == 0 && isset($smarty.get.s.amount.min) )}
								{assign var="active" value=1}
							{/if}
							<a href="#" data-name="s[amount][min]" data-value="1" class="param-val{if $active} active-val{/if}">{#SHOP2_YES#}<span>&nbsp;</span></a>
							
							{assign var="active" value=0}
							{if ( $smarty.get.s.amount.max == 0 && isset($smarty.get.s.amount.max) ) || ( $smarty.get.s.amount.min == 0 && isset($smarty.get.s.amount.min) ) }
								{assign var="active" value=1}
							{/if}
							<a href="#" data-name="s[amount][max]" data-value="0" class="param-val{if $active} active-val{/if}">{#SHOP2_NO#}<span>&nbsp;</span></a>
						</td>
					</tr>
				{/if}

				{if $shop2.my.toggle_params}{strip}
					<tr>
						<th colspan="2">
							<a class="shop2-toggle-fields" href="#" data-alt="{$shop2.my.show_filter_fields_alias|htmlspecialchars}">
								{$shop2.my.hide_filter_fields_alias}
							</a>
						</th>
					</tr>
				{/strip}{/if}

			</table>
		{/capture}
		
		{if $has_params || $page.has_filter_params}
			<form action="#" class="shop2-filter">
				<a id="shop2-filter"></a>

				{$filter}

				<div class="result {if $after && !$found}no-result{/if} {if !$after}hide{/if}">
					{#SHOP2_FOUND#}: <span id="filter-result">{if !$after}0{else}{$found|default:0}{/if}</span>
					<span class="result-arrow">&nbsp;</span>
				</div>
				<a href="#" class="shop2-btn shop2-filter-go">{#SHOP2_SHOW#}</a>
				<a href="{$SCRIPT_NAME}" class="shop2-btn">{#SHOP2_RESET_FILTER#}</a>
				<div class="shop2-clear-container"></div>
			

			</form><!-- Filter -->
		{/if}



		{if $shop2.products}

			{assign var="sort_by" value=$smarty.get.s.sort_by}

			{if $sort_by != $sort_by|regex_replace:"/name desc/":""}
				{assign var="sort_name_desc" value=1}
			{/if}

			{if $sort_by != $sort_by|regex_replace:"/name asc/":""}
				{assign var="sort_name_asc" value=1}
			{/if}

			{if $sort_by != $sort_by|regex_replace:"/price desc/":""}
				{assign var="sort_price_desc" value=1}
			{/if}

			{if $sort_by != $sort_by|regex_replace:"/price asc/":""}
				{assign var="sort_price_asc" value=1}
			{/if}

			{if $sort_by != $sort_by|regex_replace:"/amount desc/":""}
				{assign var="sort_amount_desc" value=1}
			{/if}

			{if $sort_by != $sort_by|regex_replace:"/amount asc/":""}
				{assign var="sort_amount_asc" value=1}
			{/if}

			{if $sort_by != $sort_by|regex_replace:"/rating desc/":""}
				{assign var="sort_rating_desc" value=1}
			{/if}

			{if $sort_by != $sort_by|regex_replace:"/rating asc/":""}
				{assign var="sort_rating_asc" value=1}
			{/if}


			<div class="shop2-sorting-panel">
				<div class="sorting">
					<strong class="sort-title">{#SHOP2_SORT_BY#}:</strong>
					<a href="#" id="shop2-sorting-name" class="sort-param {if $sort_name_asc}sort-param-asc{elseif $sort_name_desc}sort-param-desc{/if}" data-name="name">{#SHOP2_SORT_BY_NAME#}<span>&nbsp;</span></a>
					
					{if $show_price}
						<a href="#" id="shop2-sorting-price" class="sort-param {if $sort_price_asc}sort-param-asc{elseif $sort_price_desc}sort-param-desc{/if}" data-name="price">{#SHOP2_SORT_BY_PRICE#}<span>&nbsp;</span></a>
					{/if}

					{if $shop2.my.show_amount_sort}
						<a href="#" class="sort-param {if $sort_amount_asc}sort-param-asc{elseif $sort_amount_desc}sort-param-desc{/if}" data-name="amount">Наличию<span>&nbsp;</span></a>
					{/if}

					{if $shop2.my.show_rating_sort}
						<a href="#" class="sort-param {if $sort_rating_asc}sort-param-asc{elseif $sort_rating_desc}sort-param-desc{/if}" data-name="rating">Рейтингу<span>&nbsp;</span></a>
					{/if}

					<a href="#" class="sort-reset"><ins>{#SHOP2_RESET#}</ins><span>&nbsp;</span></a>
				</div>

				<div class="view-shop">
					<strong>{#SHOP2_VIEW#|default:"Вид"}:</strong>
					<a href="#" title="{#SHOP2_LIST#}" data-value="simple" class="shop2-btn simple {if $shop2.view=='simple'} active-view{/if}"><span>&nbsp;</span></a>
					<a href="#" title="{#SHOP2_THUMBS#}" data-value="thumbs" class="shop2-btn thumbs {if $shop2.view=='thumbs'} active-view{/if}"><span>&nbsp;</span></a>
					<a href="#" title="{#SHOP2_PRICE_LIST#}" data-value="list" class="shop2-btn pricelist {if $shop2.view=='list'} active-view{/if}"><span>&nbsp;</span></a>
				</div>
			</div>
		{elseif $smarty.get.s || $smarty.get.search_text}    
			<div class="shop2-warning">
				<h2>{#SHOP2_NO_MATCHING_REQUEST#}</h2>
			</div>
		{/if}

	{/if}
{/if}