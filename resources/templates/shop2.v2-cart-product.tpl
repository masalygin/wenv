{assign var=params_count value=1}
{if $e.params|@count}
	{assign var=params_count value=$e.params|@count}
{/if}
{assign var="product" value=$products.$k}

{section loop=$params_count name=co}
	<tr>
		<td class="cart-product">
			<div class="cart-product-image{if !$product.image_filename} no-image{/if}">
				{if $product.image_filename}
				<a href="{$IMAGES_DIR}{$product.image_filename}">
					{assign var="cart_image_width" value=$shop2.my.cart_image_width|default:90}
					{assign var="cart_image_height" value=$shop2.my.cart_image_height|default:90}
					<img src="{s3_img width=$cart_image_width height=$cart_image_height src=$product.image_filename method=$shop2.my.s3_img_method}" alt="" />
				</a>
				<div class="verticalMiddle"></div>
				{/if}
			</div>
			<div class="cart-product-details">
				{if $gift}
					<div class="cart-product-action"><strong>{#SHOP2_GIFT#}</strong></div>
				{/if}

				<div class="cart-product-name"><a href="{get_seo_url mode="product" alias=$product.alias}">{$product.name}</a></div>
				
				{include file="global:shop2.v2-product-article.tpl"}

				{if $e.discounts_applied|@count}
					<div class="cart-product-action"><strong>{#SHOP2_ACTIONS#}:</strong>
						{foreach from=$e.discounts_applied item=discount name=product_discounts}
							{$discounts.$discount.discount_name}{if !$smarty.foreach.product_discounts.last}, {/if}
						{/foreach}
					</div>
				{/if}

				<ul class="cart-product-param">
					{foreach from=$product.meta item=op key=kop}
						{if $op}
							{assign var="option" value=$custom_fields.$kop}

							{if $option.type == 'text' || $option.type == 'int' || $option.type == 'float' || $option.type == 'textarea' || $option.type == 'html'}
								<li>
									<div class="param-title">{$option.name}:</div>
									<div class="param-value">{$op} {$option.unit|default:""}</div>
								</li>
							{elseif $option.type == 'checkbox'}
								<li>
									<div class="param-title">{$option.name}:</div>
									<div class="param-value">{if $op == 1}{#SHOP2_YES#}{else}{#SHOP2_NO#}{/if}</div>
								</li>
							{elseif $option.type == 'color'}
								<li>
									<div class="param-title">{$option.name}:</div>
									<div class="param-value">
										<ul class="shop2-color-pick">
											<li class="active-color"><span style="background-color: {$op};">&nbsp;</span></li>
										</ul>
									</div>
								</li>
							{elseif $option.type == 'select'}
								<li>
									<div class="param-title">{$option.name}:</div>
									<div class="param-value">{$option.options.$op}</div>
								</li>
							{elseif $option.type == 'multiselect' && !$option.not_mod}
								<li>
									<div class="param-title">{$option.name}:</div>
									<div class="param-value">
										{foreach from=$op item=o_v  key=o_k name=foo}
											{$option.options.$o_v}{if !$smarty.foreach.foo.last}, {/if}
										{/foreach}
									</div>
								</li>
							{elseif $option.type == 'image2'}
								<li>
									<div class="param-title">{$option.name}:</div>
									<div class="param-value">
										<a href="{$IMAGES_DIR}{$op.filename}">
											{assign var="cart_other_image_width" value=$shop2.my.cart_other_image_width|default:90}
											{assign var="cart_other_image_height" value=$shop2.my.cart_other_image_height|default:90}
											<img src="{s3_img width=$cart_other_image_width height=$cart_other_image_height src=$op.filename method=$shop2.my.s3_img_method}" />
										</a>
									</div>
								</li>
							{elseif $option.type == 'file2'}
								<li>
									<div class="param-title">{$option.name}:</div>
									<div class="param-value">
										<a href="{$FILES_DIR}{$op.filename}"><span class="icon"></span> {#SHOP2_DOWNLOAD#}</a>
									</div>
								</li>
							{elseif ($option.type == 'color_ref' || $option.type == 'color2') && !$option.not_mod}
								<li>
									<div class="param-title">{$option.name}:</div>
									<div class="param-value">
										{include file="global:shop2.v2-color-ext.tpl" location="cart"}
									</div>
								</li>
							{/if}
						{/if}
					{/foreach}

					{foreach from=$e.params[co] item=o_v key=o_k}
						{if $o_k!='amount' && $o_v}
							<li>
								{assign var="option" value=$custom_fields.$o_k}
								{assign var="parts" value=": "|explode:$o_v}

								{if $parts|@count == 2 && $option.type == 'color_ref' && $option.not_mod}
									<div class="param-title">{$parts[0]}: </div>
									<div class="param-value">
										{include file="global:shop2.v2-color-ext.tpl" location="cart" op=$parts[1]}
									</div>
								{else}
									<div class="param-title">{$o_v}</div>
								{/if}
								
								<input name="amounts[{$k}][{$smarty.section.co.index}][{$o_k}]" type="hidden" value="{$o_v|htmlspecialchars}" />
							</li>
						{/if}
					{/foreach}
				</ul>
				
			</div>
		</td>
		<td class="cart-price">
			{if $e.is_pre_order}
				{$shop2.my.preorder_alias|default:#SHOP2_PREORDER2#}
			{else}
				{$e.price|price_convert}
			{/if}
		</td>
		<td class="cart-amount">
			{if $gift}
				{$e.amount}
			{else}
				<div class="shop2-product-amount">
					<button type="button" class="shop2-btn amount-minus">&#8722;</button>
						{assign var="max" value=$product.amount}
						{if ($shop2.product_amount_required == 0 && $product.pre_order == 0) || $product.pre_order == 4}
							{assign var="max" value=0}
						{/if}
						<input data-max="{$max}" data-kind="{$product.kind_id}" name="{if $e.params}amounts[{$k}][{$smarty.section.co.index}][amount]{else}amounts[{$k}]{/if}" type="text" maxlength="4" value="{if $e.params[co].amount}{$e.params[co].amount}{else}{$e.amount}{/if}" />
					<button type="button" class="shop2-btn amount-plus">&#43;</button>
				</div>
			{/if}
		</td>
		{if $gift}
			<td class="cart-price">0</td>
			<td>&nbsp;</td>
		{else}
			<td class="cart-price">
				{if $e.is_pre_order}
					-
				{else}
					{if $e.params[co].amount}
						{$e.params[co].amount*$e.price|price_convert}
					{else}
						{if count($discounts) > 0}
							{$e.discount_sum|price_convert}
						{else}
							{$e.sum|price_convert}
						{/if}
					{/if}
				{/if}
			</td>
			<td class="cart-delete">
				{strip}
				<a title="{#SHOP2_REMOVE#}" href="{$shop2.uri}?mode=cart&action=del&kind_id={$k}" data-id="
					{if $e.params}
						{ldelim}'{$k}':{ldelim}
							{foreach from=$e.params[co] item=o_v key=o_k name=foo}
								{if $o_k == 'amount'}
									'amount': '0'
								{else}
									'{$o_k|htmlspecialchars}':'{$o_v|htmlspecialchars}'
								{/if}
								{if !$smarty.foreach.foo.last}, {/if}
							{/foreach}
						{rdelim}{rdelim}
					{else}
						{$k}
					{/if}">
					<img src="/g/shop2v2/default/images/delete-cart-product.png" height="15" width="15" alt="" />
				</a>
				{/strip}
			</td>
		{/if}
	</tr>
{/section}