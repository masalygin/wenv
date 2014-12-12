{if $delivery_fields}
	{if $site.s3_version < '3.43'}
		{foreach from=$delivery_fields item=e key=k}
			<p>{$e.name}: <strong>{$pre_order.delivery.$k|htmlspecialchars}</strong></p>
		{/foreach}
	{else}
		{foreach from=$delivery_fields item=e key=k}
			<p>{$e.name}: <strong>{$pre_order.delivery.settings[$e.name]|htmlspecialchars}</strong></p>
		{/foreach}
	{/if}
{/if}

<form action="{if $page.main}/{else}{$SCRIPT_NAME}{/if}?mode=order&step={$step}" method="post" class="shop2-order-form">
	<input type="hidden" name="action" value="save" />
	{foreach from=$form key=name item=item}

		{capture assign="caption"}
			<strong>
				{$item.name|htmlspecialchars}
				{if $item.required}<span class="required">*</span>{/if}
			</strong>
		{/capture}

		<div class="form-item">
			{if $item.type == 'text' || $item.type == 'email' || $item.type == 'phone'}
				<label>
					{$caption}
					<input type="text" maxlength="{$item.maxlength|default:100}" size="{$item.size|default:60}" name="{$name}" id="user_{$name}" value="{$item.value|htmlspecialchars}" />
				</label>
			{elseif $item.type == 'textarea'}

				<label>
					{$caption}
					<textarea rows="{$item.rows|default:7}" cols="{$item.cols|default:50}" name="{$name}" id="user_{$name}">{$item.value}</textarea>
				</label>

			{elseif $item.type == 'radio'}

				{$caption}
				{foreach from=$item.values key=key item=val}
					<label class="order-form-options">
						<input type="radio" name="{$name}" value="{$key}"{if $key==$item.value} checked="checked"{/if} /> {$val}
					</label>
				{/foreach}

			{elseif $item.type == 'checkbox'}

				{$caption}
				{foreach from=$item.values key=key item=val name=foo}
					<div class="order-form-options">
						<label>
							<input type="checkbox" name="{$name}[{$key|htmlspecialchars}]" value="{$key|htmlspecialchars}" {if $key == $item.value}checked="checked"{/if} /> {$val|htmlspecialchars}
						</label>
					</div>
				{/foreach}

			{elseif $item.type == 'multi_checkbox'}

				{$caption}
				{foreach from=$item.values key=key item=val name=foo}
					<div class="order-form-options">
						<label>
							<input type="checkbox" name="{$name}[{$key|htmlspecialchars}]" value="{$key|htmlspecialchars}" {if isset($item.value[$key])} checked="checked"{/if} /> {$val|htmlspecialchars}
						</label>
					</div>
				{/foreach}

			{elseif $item.type == 'select'}

				<label>
					{$caption}
					<select name="{$name}">
						{foreach from=$item.values key=key item=val}
							<option value="{$key}" {if $key == $item.value} selected="selected"{/if}>{$val}</option>
						{/foreach}
					</select>
				</label>

			{elseif $item.type == 'multiselect'}

				<label>
					{$caption}
					<select name="{$name}[]" multiple="multiple" size="{$item.size|default:5}">
						{foreach from=$item.values key=key item=val}
							<option value="{$key}"{if in_array($key, $item.value)} selected="selected"{/if}>{$val}</option>
						{/foreach}
					</select>
				</label>
			{/if}

			{if $item.note}
				<small>{$item.note}</small>
			{/if}
		</div>

	{/foreach}

	<div class="form-item form-item-submit">
		<button type="submit" class="shop2-btn">{#SHOP2_CHECKOUT#}</button>
	</div>
</form>