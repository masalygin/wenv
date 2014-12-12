{if $payments || $payment_systems}
	<form method="post" action="#" class="shop2-order-options">
		<div class="options-list">
			{assign var="checked" value=0}
			{foreach from=$payments item=e key=k name=foo}
			<div class="option-type {if $smarty.foreach.foo.first}active-type {assign var="checked" value=1}{/if}">
				<label class="option-label">
					<input name="payment_id" value="{$k}" autocomplete="off" {if $smarty.foreach.foo.first}checked="checked"{/if} type="radio" />
					<span class="label-name">
						{strip}
							{$e.rename}
							{assign var="cost" value=$pre_order.delivery.cost|default:0}
							{if $e.params.pricecash}<br /> Стоимость доставки увеличится на {$e.params.pricecash-$cost|price_convert} {$shop2.currency_shortname}{/if}
							{if $e.params.transfer}<br /> +Доплата за денежный перевод при получении: {$e.params.transfer|price_convert} {$shop2.currency_shortname}{/if}
						{/strip}
					</span>
				</label>
				{if $e.user_fields}
				<div class="option-details">
					{foreach from=$e.user_fields key=k_field item=v_field}
					<div class="option-item">
						<label>
							<span>{$v_field.name}:</span>
							{if $v_field.type == 'text'}
								<input name="{$k}[{$k_field}]" type="text" size="30" value="{$v_field.value}" />
							{elseif $v_field.type == 'textarea'}
								<textarea name="{$k}[{$k_field}]" class="{$k_field}" cols="50" rows="3">{$v_field.value}</textarea>
							{/if}
						</label>
					</div>
					{/foreach}
				</div>
				{/if}
			</div>
			{/foreach}
			{if $payment_systems}
				{foreach from=$payment_systems item=e name=foo}
					<div class="option-type {if !$checked && $smarty.foreach.foo.first}active-type{/if}">
						<label class="option-label">
							<input name="payment_id" value="-{$e.type_id}" {if !$checked && $smarty.foreach.foo.first}checked="checked"{/if} type="radio" />
							<span class="label-name">{$e.system_name}</span>

							<span class="label-icons">
								{foreach from=$e.payment_methods item=ee}
									<img src="/g/s3/s3_shop2/payments/medium/ic_{$ee}.png" alt="" />
								{/foreach}
							</span>
							
						</label>
					</div>
				{/foreach}
			{/if}
		</div>
		
		<input type="hidden" name="step" value="payments" />
		<input type="hidden" name="mode" value="order" />
		<input type="hidden" name="action" value="save" />
		<input type="hidden" name="amount" value="{$order.total}" />
		<input type="hidden" name="shop_id" value="{$order.shop_id}" />

		<div class="text-center">
			<button class="shop2-btn" type="submit">{#SHOP2_TO_CONTINUE#}</button>
		</div>
	</form><!-- Payment -->
{/if}