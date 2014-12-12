{assign var="currency_shortname" value=$order.currency.shortname}

{capture assign="shop_user_info"}{strip}
	{assign var="data" value=$fields|default:$order_fields}
	{foreach from=$data item=e key=k}
		{assign var="uv_field" value=$order.data.order.$k}
		{if $uv_field}
			<tr>
				<th>
					{if isset($e.name)}
						{$e.name|htmlspecialchars}
					{else}
						{$e|htmlspecialchars}
					{/if}
				</th>
				<td>
					{if is_array($uv_field)}
						{', '|implode:$uv_field|htmlspecialchars}
					{else}
						{$uv_field|htmlspecialchars}
					{/if}
				</td>
			</tr>
		{/if}
	{/foreach}
{/strip}{/capture}

{if $shop_user_info}
	<fieldset class="shop2-order-data">
		<legend>{#SHOP2_PERSONAL_DATA#}</legend>

		<table>
			{$shop_user_info}
		</table>
	</fieldset>
{/if}

<fieldset class="shop2-order-data">
	<legend>{#SHOP2_ORDERING_INFO#}</legend>

	<table>
		<tr>
			<th>{#SHOP2_ORDER_NUMBER#}</th>
			<td>{$order.number} ({$order.order_id})</td>
		</tr>
		{if $order_form_settings.status}
			<tr>
				<th>{#SHOP2_ORDER_STATUS#}</th>
				<td>{$order.order_status_name|default:"-"}</td>
			</tr>
		{/if}
		{if $order_form_settings.date_ordering}
		<tr>
			<th>{#SHOP2_CREATED#}</th>
			<td>{$order.created|date_format:"%d.%m.%Y %H:%M"}</td>
		</tr>
		{/if}
		{if $order.created!=$order.modified && $order_form_settings.date_last_change}
			<tr>
				<th>{#SHOP2_CHANGED#}</th>
				<td>{$order.modified|date_format:"%d.%m.%Y %H:%M"}</td>
			</tr>
		{/if}

		{if $order_form_settings.paid_sum}
			<tr>
				<th>{#SHOP2_PAID_SUM#}</th>
				<td>
					{$order.payment_total|price_convert} {#SHOP2_OUT_OF#} {$order.total|price_convert} {$currency_shortname}
				</td>
			</tr>
		{/if}
		{if $order.data.payment.name && $order_form_settings.payments}
			<tr>
				<th>{#SHOP2_PAYMENTS#}</th>
				<td>{$order.data.payment.name}</td>
			</tr>
		{/if}
	</table>
</fieldset>

{if $order.data.delivery.name && $order_form_settings.delivery_info}
	<fieldset class="shop2-order-data">
		<legend>{#SHOP2_DELIVERY_DETAILS#}</legend>
		<table>
			<tr>
				<th>{#SHOP2_DELIVERY2#}</th>
				<td>{$order.data.delivery.name|htmlspecialchars}</td>
			</tr>

			{if $payments}
				{assign var="pmnt" value=$payments[$order.data.payment.payment_id]}
			{else}
				{assign var="pmnt" value=$payment}
			{/if}

			{if $order.data.delivery.cost}
				<tr>
					<th>{#SHOP2_DELIVERY_COST#}</th>
					<td>
						{$order.data.delivery.cost|price_convert} {$currency_shortname}

						{if $order.data.delivery.edost && $order.data.delivery.pricecash && $order.data.delivery.overcash}
							(цена доставки: {$order.data.delivery.pricecash-$order.data.delivery.overcash|price_convert} {$currency_shortname}
							+ надбавка за доставку наложенным платежом {$order.data.delivery.overcash|price_convert} {$currency_shortname})
						{/if}
					</td>
				</tr>
			{/if}

			{if $order.data.delivery.edost && $pmnt.code == 'on_delivery' && $order.data.delivery.transfer > 0}
				<tr>
					<th>Доплата за денежный перевод</th>
					<td>{$order.data.delivery.transfer|price_convert} {$currency_shortname} (при получении взимается почтой отдельно от стоимости заказа и в стоимость заказа не включается)</td>
				</tr>
			{/if}

			{foreach from=$order.data.delivery.settings item=e key=k}
				{if $e}
					<tr>
						<th>{$k|htmlspecialchars}</th>
						<td>{$e|htmlspecialchars}</td>
					</tr>
				{/if}
			{/foreach}

		</table>
	</fieldset>
{/if}

{if $order.is_public_comment}
	<fieldset class="shop2-order-data">
		<legend>Комментарий к заказу</legend>
		<table>
			<tr>
				<td>{$order.comment|nl2br}</td>
			</tr>
		</table>
	</fieldset>
{/if}

<table class="shop2-table-order">
<tr>
	<th>{#SHOP2_PRODUCT_NAME#}</th>
	<th>{#SHOP2_PRICE#}, {$currency_shortname}</th>
	<th>{#SHOP2_AMOUNT#}</th>
	{if $order_form_settings.weight}
		<th class="wide-cell">{#SHOP2_WEIGHT#}</th>
	{/if}
	<th>{#SHOP2_SUM#}, {$currency_shortname}</th>
</tr>

{assign var="uv_order" value=''}
{assign var="uv_preorder" value=''}
{foreach from=$order.products item=e}
	{capture assign="uv_product"}

		{assign var="params" value=$e.data.custom_params|@count}
		{if !$params}
			{assign var="params" value=1}
		{/if}

		{section loop=$params name=foo}
			{assign var="n" value=$smarty.section.foo.index}
			{assign var="custom_prm" value=$e.data.custom_params[$n]}
			<tr>
				<td>
					<p>
						{if $order_form_settings.image && $e.image_filename}
							<img src="{s3_img src=$e.image_filename method="c" width=60 height=60}" alt="{$e.title|escape}">
						{/if}
						<span>
							{if $e.data.article && $order_form_settings.article}
								{$e.data.article}
							{/if}
							<strong>{$e.data.name|htmlspecialchars}</strong>
						</span>
					</p>
					{if $e.data.vendor_name && $order_form_settings.vendor}
						<p>{#SHOP2_VENDOR#}: {$e.data.vendor_name}</p>
					{/if}
					{if $e.data.discounts_applied}
						{assign var="discount_id" value=$e.data.discounts_applied.0}
						{assign var="discount" value=$order.discounts.$discount_id}
						<p><em>{#SHOP2_DISCOUNT2#}: {$discount.discount_name}</em></p>
					{/if}

					{if $e.gift}
						<p><em>{#SHOP2_GIFT#}</em></p>
					{/if}
					{if $order_form_settings.params}
						{foreach from=$e.data.custom_fields name="prop" item=p key=n}
							{if $p.value}
								{if $p.type == 'text' || $p.type == 'int' || $p.type == 'float' || $p.type == 'textarea' || $p.type == 'html' || $p.type == 'color' || $p.type == 'select'}
									<p>{$p.name}: {$p.value} {$p.unit}</p>
								{elseif $p.type == 'checkbox'}
									<p>{$p.name}: {if $p.value == 1}{#SHOP2_YES#}{else}{#SHOP2_NO#}{/if}</p>
								{elseif $p.type == 'file2'}
									<p>{$p.name}: http://{$site.domain_mask}{$FILES_DIR}{$p.value}</p>
								{elseif $p.type == 'image2'}
									<p>{$p.name}: http://{$site.domain_mask}{$IMAGES_DIR}{$p.value}</p>
								{elseif $p.type=='multiselect'}
									{if is_array($p.value)}
										<p>{$p.name}: {", "|implode:$p.value}</p>
									{else}
										<p>{$p.name}: {$p.value}</p>
									{/if}
								{elseif $p.type == 'color_ref' || $p.type == 'color2'}
									<p>
										{$p.name}:

										{if $p.value.text}
											{$p.value.text}
										{else}
											{foreach from=$p.value item=ee name=foo}
												{$ee.text}{if !$smarty.foreach.foo.last}, {/if}
											{/foreach}
										{/if}
									</p>

								{/if}
							{/if}
						{/foreach}

						{foreach from=$custom_prm.fields item=p key=n}
							{if $p.value}
								{if $p.type == 'color_ref'}

									{assign var="val" value=$p.value|@json_decode:true}
									{if $val.text}
										<p>{$p.name}: {$val.text}</p>
									{/if}

								{else}

									<p>{$p.name}: {$p.value}</p>

								{/if}
							{/if}
						{/foreach}
					{/if}
				</td>

				{if $e.gift}
					<td>0</td>
					<td>{$e.amount/1} {if $order_form_settings.measure}{$e.data.unit}{/if}</td>
					{if $order_form_settings.weight}
						<td>{if $e.data.weight != 0}{$e.amount*$e.data.weight} {$e.data.weight_unit} {else} - {/if}</td>
					{/if}
					<td>0</td>

				{else}
					<td>{$e.price|price_convert}</td>

					<td>
						{if $custom_prm.amount}
							{assign var="amount" value=$custom_prm.amount/1}
						{else}
							{assign var="amount" value=$e.amount/1}
						{/if}
						{$amount} {if $order_form_settings.measure}{$e.data.unit}{/if}
					</td>
					{if $order_form_settings.weight}
						<td>{if $e.data.weight != 0}{$amount*$e.data.weight} {$e.data.weight_unit} {else} - {/if}</td>
					{/if}
					<td>
						{if $custom_prm.amount}
							{$amount*$e.price|price_convert}
						{else}
							{$e.amount*$e.price|price_convert}
						{/if}
					</td>
				{/if}
			</tr>
		{/section}
	{/capture}

	{if $e.pre_order == 1}
		{assign var="uv_preorder" value=$uv_preorder|cat:$uv_product}
	{else}
		{assign var="uv_order" value=$uv_order|cat:$uv_product}
	{/if}
{/foreach}
{$uv_order}

{if $uv_preorder}
	<tr>
		<th colspan="{if $order_form_settings.weight}5{else}4{/if}">{$shop2.my.preorder_alias|default:#SHOP2_PREORDER2#}</th>
	</tr>
	{$uv_preorder}
{/if}


{if $order.delivery.cost || $order.discounts}
	<tr>
		<th colspan="{if $order_form_settings.weight}4{else}3{/if}">{#SHOP2_SUM#}:</th>
		<th>{$order.data.totals.subtotal|price_convert}</th>
	</tr>
{/if}

{if $order.discounts}
		{foreach from=$order.discounts item=discount key=k}
			<tr>
				<th colspan="{if $order_form_settings.weight}4{else}3{/if}">{$discount.discount_name}</th>
				<th>
					{if $discount.discount_type == 'sum'}
						{if $discount.discount_kind == 6 || $discount.is_common || !$discount.discount_kind}{*is_common or manual*}
							{$discount.value} {*$order.currency.currency.shortname|default:$shop.currency_shortname*}
						{else}{*is_product*}
							{$discount.discount_sum|price_convert} {*$order.currency.currency.shortname|default:$shop.currency_shortname*}
						{/if}
					{elseif $discount.discount_type == 'percent'}
						{$discount.value} %
					{elseif $discount.discount_type == 'amount'}
						{$discount.amount} по цене {$discount.amount-$discount.value}
					{else}
						{if isset($gifts[$discount.gift_id])}
							{$gifts[$discount.gift_id]}
						{else}
							{$discount.value}
						{/if}
						шт.
					{/if}

					{*if $discount.is_coupon}
						(купон)
					{elseif $discount.discount_type == 'gift'}
						(подарок)
					{elseif $discount.discount_kind == 6}
						(скидка на заказ)
					{elseif $discount.is_product}
						(товарная скидка)
					{elseif $order.data.discounts_modified.type == 'man'}
						(ручная)
					{/if*}
				</th>
			</tr>
		{/foreach}
	<tr>
		<th colspan="{if $order_form_settings.weight}4{else}3{/if}">{#SHOP2_SUM_OF_DISCOUNT#}:</th>
		<th>
			{$order.total-$order.data.delivery.cost|price_convert}
		</th>
	</tr>
{/if}

{if $order.data.tax.name}
	<tr>
		<th colspan="{if $order_form_settings.weight}4{else}3{/if}">{#SHOP2_INCLUDING_VAT#|sprintf:$order.data.tax.name} {$order.data.tax.percent}%</th>
		<th>{$order.data.tax.value|price_convert}</th>
	</tr>
{/if}

{if $order.delivery.cost > 0}
	<tr>
		<th colspan="{if $order_form_settings.weight}4{else}3{/if}">{#SHOP2_DELIVERY2#}</th>
		<th>{$order.delivery.cost|price_convert}</th>
	</tr>
{/if}

<tr>
	<th colspan="{if $order_form_settings.weight}4{else}3{/if}">{#SHOP2_AMOUNT_TO_PAY#}:</th>
	<th>{$order.total|price_convert}</th>
</tr>

</table>