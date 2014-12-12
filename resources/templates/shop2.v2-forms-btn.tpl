{if $payment.template}

		{$payment.rename|default:$payment.name}

		{strip}
			<a class="shop2-btn" target="_blank" href="/my/s3/api/shop2/?
				cmd=printOrder&amp;
				shop_id={$shop2.shop_id}&amp;
				ver_id={$shop2.ver_id}&amp;
				type={$payment.code}&amp;
				template={$payment.params.template}&amp;
				order_id={$order.order_id}&amp;
				hash={$api.printOrder}&amp;
				attach_id={$payment.attach_id}">{#SHOP2_PRINT#}</a>
		{/strip}

{/if}