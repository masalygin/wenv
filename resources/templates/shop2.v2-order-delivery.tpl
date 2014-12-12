<form action="{if $page.main}/{else}{$SCRIPT_NAME}{/if}?mode=order&step=delivery" method="post" class="shop2-order-options shop2-delivery">
	<input type="hidden" name="action" value="save" />
	<div class="options-list">
		{foreach from=$deliveries item=e key=k name="deliveries"}
		{assign var="cur" value=0}
		{if $delivery.attach_id}
			{if $delivery.attach_id == $k}
				{assign var="cur" value=1}
			{/if}
		{elseif $smarty.foreach.deliveries.first}
			{assign var="cur" value=1}
		{/if}

		<div class="option-type {if $cur}active-type{/if}">
			<label class="option-label">
				<input name="delivery_id" type="radio" autocomplete="off" {if $cur}checked="checked"{/if} value="{$k}" /><span>
					{$e.name|htmlspecialchars}
					
					{if $e.code != 'ems' && $e.code != 'edost'}
						{if $e.cost==0}

							{if $e.delivery_info}
								- {$e.delivery_info}
							{else}
								{if !$shop2.my.hide_delivery_cost}- {#SHOP2_FREE#}{/if}
							{/if}

						{else}
							- {$e.cost|price_convert} {$currency.currency_shortname}
						{/if}
					
					{/if}

					{if $e.term}({$e.term}){/if}
				</span>
			</label>
			{if $e.fields|@count}
			<div class="option-details">
				{foreach from=$e.fields item=v_field key=k_field}
					{if $v_field.type == 'textarea'}
					<div class="option-item">
						<label>
							<span>{$v_field.name|htmlspecialchars} {if $v_field.required}<span class="required">*</span>{/if}</span>
							<textarea name="{$k}[{$k_field}]" {if !$cur}disabled="disabled"{/if} cols="50" rows="5">{strip}
								{if $delivery.attach_id == $k}
									{$delivery[$k_field]|htmlspecialchars}
								{else}
									{$v_field.value}
								{/if}
							{/strip}</textarea>
						</label>
					</div>
					{elseif $v_field.type == 'text'}
					<div class="option-item">
						<label>
							<span>{$v_field.name|htmlspecialchars} {if $v_field.required}<span class="required">*</span>{/if}</span>
							<input name="{$k}[{$k_field}]" {if !$cur}disabled="disabled"{/if} type="text" size="{$v_field.size|default:30}" maxlength="{$v_field.maxlength|default:100}" value="{strip}
								{if $delivery.attach_id == $k}
									{$delivery[$k_field]|htmlspecialchars}
								{else}
									{$v_field.value}
								{/if}
							{/strip}" />
						</label>
					</div>
					{elseif $v_field.type == 'select'}
					<div class="option-item">
						<label>
							<span>{$v_field.name|htmlspecialchars} {if $v_field.required}<span class="required">*</span>{/if}</span>
							<select id="delivery-{$k_field}" name="{$k}[{$k_field}]" {if !$cur}disabled="disabled"{/if}>
								<option value="">--{#SHOP2_SELECT_CITY#}--</option>
								{foreach from=$v_field.values item=v_value key=k_value}
									{if is_array($v_value)}
										<optgroup label="{$k_value}">
											{foreach from=$v_value item=vv_value key=kk_value}
												<option {if $delivery[$k_field] == $kk_value}selected="selected"{/if} value="{$kk_value}">{$vv_value|htmlspecialchars}</option>
											{/foreach}
										</optgroup>
									{else}
										<option {if $delivery[$k_field] == $k_value}selected="selected"{/if} value="{$k_value}">{$v_value|htmlspecialchars}</option>
									{/if}
								{/foreach}
							</select>
						</label>
					</div>
						{if ($e.code == 'ems' || $e.code == 'edost') && $v_field.type == 'select'}
							<label>
								<a class="shop2-btn" href="#" data-attach-id="{$e.attach_id}" id="shop2-{$e.code}-calc">{#SHOP2_CALCULATE#}</a> 
								{if $e.code == 'ems'}
									<span id="delivery-{$e.attach_id}-cost">0</span> {$shop2.currency_shortname}
								{/if}
							</label>
						{/if}
					{/if}
				{/foreach}

				{if $e.code == 'edost'}
					<div id="delivery-{$e.attach_id}-html">
						{include file="global:shop2.v2-order-delivery-edost.tpl" edost=$e.edost attach_id=$e.attach_id}
					</div>
				{/if}
			</div>
			{/if}
		</div>
		{/foreach}
	</div>
	<div class="text-center">
		<button class="shop2-btn" type="submit">{#SHOP2_CHECKOUT#}</button>
	</div>
</form><!-- Delivery -->