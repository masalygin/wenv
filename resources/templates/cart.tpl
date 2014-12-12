{assign var="hide_auth_form" value=$shop2.json.hide_auth_form}

{if !$cart.cart}
	<p>{#SHOP2_CART_IS_EMPTY#} <a class="shop2-btn" href="{$shop2.uri}">{#SHOP2_GO_MAIN#}</a></p>
{else}

	{if $cart.totals.total < $shop2.json.order_min_cost}
		<div class="shop2-warning">
			<h2>{#SHOP2_MINIMUM_ORDER_AMOUNT#} - {$shop2.json.order_min_cost|price_convert} {$shop2.currency_shortname}</h2>
		</div>
	{/if}

	<form action="{$shop2.uri}?mode=cart&action=up" id="shop2-cart">
		<p class="text-right">
			<a href="{$shop2.uri}?mode=cart&action=cleanup" class="shop2-btn">{#SHOP2_CLEAR_CART#}</a>
		</p>
		<table class="shop2-cart-table">
			<tr>
				<th>{#SHOP2_PRODUCT#}</th>
				<th>{#SHOP2_PRICE#}, {$currency.currency_shortname}</th>
				<th>{#SHOP2_QTY#}</th>
				<th>{#SHOP2_SUM#}, {$currency.currency_shortname}</th>
				<th>&nbsp;</th>
			</tr>
			{foreach from=$cart.cart item=e key=k}
				{include file="global:shop2.v2-cart-product.tpl"}
			{/foreach}
			{foreach from=$cart.gifts item=e key=k}
				{include file="global:shop2.v2-cart-product.tpl" gift=1}
			{/foreach}
		</table>
		<p class="text-right shop2-cart-update">
			<a href="#" class="shop2-btn shop2-cart-update">{#SHOP2_RECALCULATE#}</a>
		</p>
		<table class="shop2-cart-total">
			<tr>
				<td>&nbsp;</td>
				<th>{#SHOP2_SUM#}:</th>
				<td>{$cart.totals.discount_subtotal|price_convert} {$currency.currency_shortname}</td>
			</tr>

			{assign var="cpn" value=""}
			{capture assign="dsc"}{strip}
				{foreach from=$cart.details item=e name=foo}
					{assign var="discount" value=$discounts[$e.discount_id]}
					{if !$discount.is_coupon}
						{$discount.discount_descr}
					{else}
						{assign var="cpn" value=$cpn|cat:$discount.discount_descr}
					{/if}
				{/foreach}
			{/strip}{/capture}

			{if $cart.totals.sum_discount_order}
				<tr>
					<td>&nbsp;</td>
					<th>{strip}
						
						{if $dsc}
							<span class="question">
								<img src="/g/shop2v2/default/images/question-price.png" alt="" /> {#SHOP2_DISCOUNT2#}:    
							</span>
							<div class="shop2-product-discount-desc">
								{$dsc}
							</div>
						{else}
							{#SHOP2_DISCOUNT2#}:
						{/if}

					{/strip}</th>
					<td>{$cart.totals.sum_discount_order|price_convert} {$currency.currency_shortname}</td>
				</tr>
			{/if}

			{if ($has_coupons || $coupons) && $cart.totals.total > 0}
				<tr>
					<td>
						<div class="shop2-coupon">
							<div class="coupon-body">
								<label class="coupon-label" for="coupon">{#SHOP2_CUPON#}:</label>
								<button class="coupon-btn shop2-btn">{#SHOP2_APPLY#}</button>
								<label class="coupon-field">
									<input type="text" id="coupon" value="" />
								</label>
							</div>
							<div class="coupon-arrow"></div>

							{if $coupons}
							<div class="coupon-id">
								{if $coupons}
								<span>{#SHOP2_USED#}:</span>
									{foreach from=$coupons key=k item=e}
										<span class="coupon-code {if $e<=0} error{/if}">{$k|escape} {if $e<=0}({#SHOP2_WRONG#}){/if}</span>
										<a href="#" data-code="{$k|escape}" class="coupon-delete">&nbsp;</a>
									{/foreach}
								{/if}
							</div>
							{/if}

						</div>
					</td>
					<th>{strip}

						{if $cpn}
							<span class="question">
								<img src="/g/shop2v2/default/images/question-price.png" alt="" /> {#SHOP2_COUPON_DISCOUNT#}:    
							</span>
							<div class="shop2-product-discount-desc">
								{$cpn}
							</div>
						{else}
							{#SHOP2_COUPON_DISCOUNT#}:
						{/if}

					{/strip}</th>
					<td>{$cart.totals.sum_discount_coupon|price_convert} {$currency.currency_shortname}</td>
				</tr>
			{/if}


			{if $cart.tax.name}
				<tr>
					<td>&nbsp;</td>
					<th>{#SHOP2_INCLUDING_VAT#|sprintf:$cart.tax.name} {$cart.tax.percent}%:</th>
					<td>{$cart.tax.value|price_convert} {$currency.currency_shortname}</td>
				</tr>
			{/if}


			<tr>
				<td>&nbsp;</td>
				<th>{#SHOP2_TOTAL#}:</th>
				<td>{$cart.totals.total|price_convert} {$currency.currency_shortname}</td>
			</tr>
		</table>
		
	</form><!-- Cart -->

	{*if $cart.details|@count}
		<div class="shop2-discounts-desc">
			<div class="block-title">{#SHOP2_ORDER_APPLY_DISCOUNT#}:</div>
			{foreach from=$cart.details item=e name=foo}
				{assign var="discount" value=$discounts[$e.discount_id]}
				<div class="discount-name">{$discount.discount_name}</div>
				{if $discount.discount_descr}
					<div class="discount-desc">{$discount.discount_descr}</div>
				{/if}
			{/foreach}
		</div><!-- Discounts -->
	{/if*}

	<div class="shop2-clear-container"></div>

	{if !isset($user.user_id) && !$hide_auth_form}
	<div class="shop2-cart-registration">
		<h2>{#SHOP2_CHECKOUT#}</h2>
		<table class="table-registration">
			<tr>
				<td class="cell-l">
					<form method="post" action="{$user_settings.link}" class="form-registration">
						<input type="hidden" name="mode" value="login" />
						<div>
							<label for="reg-login">{#SHOP2_LOGIN#}:</label>
							<label class="registration-field">
								<input type="text" id="reg-login" value="" name="login" />
							</label>
						</div>
						<div>
							<label for="reg-password">{#SHOP2_PASSWORD#}:</label>
							<label class="registration-field">
								<input type="password" id="reg-password" value="" name="password" />
							</label>
						</div>
						<button class="shop2-btn" type="submit">{#SHOP2_LOG_IN_PLACE_ORDER#}</button>
					</form>
				</td>
				<td class="cell-r">
					<p>{#SHOP2_FOR_DISCOUNTS_REGISTER1#} <a href="{get_seo_url mode=register uri_prefix=$user_settings.link}">{#SHOP2_FOR_DISCOUNTS_REGISTER2#}</a></p>
					<p><a href="{$shop2.uri}?mode=order" class="shop2-btn">{#SHOP2_BUY_WITHOUT_REGISTRATION#}</a></p>
				</td>
			</tr>
		</table>
	</div><!-- Cart Registration -->
	{/if}

	{$shop2.json.order_note}

	{if $hide_auth_form || isset($user.user_id)}
		<p class="text-center"><a href="{$shop2.uri}?mode=order" class="shop2-btn">{#SHOP2_CHECKOUT#}</a></p>
	{/if}

{/if}