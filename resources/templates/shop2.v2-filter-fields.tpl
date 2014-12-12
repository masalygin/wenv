{capture assign="params"}{strip}
	{foreach from=$fields item=param}
		{if $param._sph_filter}
			{assign var="name" value=$param.name|regex_replace:"/\s/":"&nbsp;"}

			{if $param.type == 'int' || $param.type == 'float'}
				<tr class="shop2-filter-fields">
					<th>{$name}:</th>
					<td>
						{assign var="class" value='shop2-input-float'}
						{if $param.type == 'int'}
							{assign var="class" value='shop2-input-int'}
						{/if}

						{if $param.range}
							<label>
								<strong>{#SHOP2_FROM#}</strong> <input class="{$class}" type="text" value="{$smarty.get.s[$param._sph_name].min|htmlspecialchars}" name="s[{$param._sph_name}][min]" />
							</label>
							<label>
								<strong>{#SHOP2_TO#}</strong> <input class="{$class}" type="text" value="{$smarty.get.s[$param._sph_name].max|htmlspecialchars}" name="s[{$param._sph_name}][max]" />
							</label>
						{else}
							<label>
								<input class="{$class}" type="text" value="{$smarty.get.s[$param._sph_name]|htmlspecialchars}" name="s[{$param._sph_name}]" />
							</label>
						{/if}

						{if $param.unit}
							&nbsp;<strong>{$param.unit}</strong>
						{/if}
					</td>
				</tr>
			
			{elseif $param.type == 'checkbox'}
				<tr class="shop2-filter-fields">
					<th>{$name}:</th>
					<td>
						<a href="#" data-name="s[{$param._sph_name}][1]" data-value="1" class="param-val{if $smarty.get.s[$param._sph_name].1==1} active-val{/if}">{#SHOP2_YES#}<span>&nbsp;</span></a>
						<a href="#" data-name="s[{$param._sph_name}][0]" data-value="0" class="param-val{if $smarty.get.s[$param._sph_name].0==0 && isset($smarty.get.s[$param._sph_name].0)} active-val{/if}">{#SHOP2_NO#}<span>&nbsp;</span></a>
					</td>
				</tr>
			
			{elseif $param.type == 'multiselect' || $param.type == 'select'}

				{assign var="count" value=$param.options|@count}

				{if $count}
					{if $count > $min_count_in_select}
						<tr class="shop2-filter-fields type-select">
							<th>{$name}:</th>
							<td>
								<select name="s[{$param._sph_name}]">
									<option value="">{#SHOP2_ALL#}</option>
									{foreach from=$param.options item=option key=k}
										<option {if $smarty.get.s[$param._sph_name]==$k}selected="selected"{/if} value="{$k}">{$option}</option>
									{/foreach}
								</select>
							</td>
						</tr>
					{else}
						<tr class="shop2-filter-fields type-select">
							<th>{$name}:</th>
							<td>
								{foreach from=$param.options name=foo item=option key=k}
									{assign var="index" value=$smarty.foreach.foo.index}
									<a href="#" data-name="s[{$param._sph_name}][]" data-value="{$k}" class="param-val{if in_array($k, $smarty.get.s[$param._sph_name])} active-val{/if}">
										{$option}
										<span>&nbsp;</span>
									</a>
								{/foreach}
							</td>
						</tr>
					{/if}
				{/if}

			{elseif $param.type == 'color_ref'}

				<tr class="shop2-filter-fields">
					<th>{$name}:</th>
					<td>
						{include file="global:shop2.v2-color-ext.tpl" location="filter"}
					</td>
				</tr>

			{/if}
		{/if}
	{/foreach}
{/strip}{/capture}

{if $params && !in_array("params", $hide_in_filter)}
	{assign var="has_params" value=true}
	{assign_hash var='page.has_filter_params' value=1}
	{$params}
{/if}