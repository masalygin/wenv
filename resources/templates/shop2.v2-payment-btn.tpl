{if !$order.paid && $order.data.payment.ps}

	{if $mode == 'orders'}
		{assign var="data" value=$payment_systems}
	{else}
		{assign var="data" value=$payment_system}
	{/if}

	{if $data}

		<form method="GET" action="" class="shop2-payments-order">

			<input type="hidden" name="mode" value="{$mode}"/>
			<input type="hidden" name="action" value="pay"/>
			<input type="hidden" name="amount" value="{$order.total}"/>
			<input type="hidden" name="order_id" value="{$order.order_id}"/>
			<input type="hidden" name="shop_id" value="{$order.shop_id}"/>

			{if $mode == 'order' && $step == 'payment'}

				<input type="hidden" name="ps" value="{$payment_system.system_type_id}" />
				<input type="hidden" name="step" value="payment" />

				<p>
					{#SHOP2_SELECTED_PAYMENT_SYSTEM#}:
					<strong>{$data.system_name}</strong>
					<button class="shop2-btn" type="submit">{#SHOP2_PAY#}</button>
				</p>

			{else}

				{if !$user}
					<input type="hidden" name="hash" value="{$smarty.get.hash}" />
				{/if}

				{foreach from=$data name=foo item=e key=k}
					<label>
						<input type="radio" name="ps" value="{$e.type_id}" {if $smarty.foreach.foo.first}checked="checked"{/if} />
						{$e.system_name}
					</label>
				{/foreach}

				<button class="shop2-btn" type="submit">{#SHOP2_PAY#}</button>

			{/if}

		</form>

	{/if}

{/if}