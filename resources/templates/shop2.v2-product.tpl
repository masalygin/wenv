{assign var="show_price" value=0}
{if !(!$user && $shop2.my.hide_prices_non_reg)}
	{assign var="show_price" value=1}
{/if}

{include file="global:shop2.v2-product-article.tpl"}

<form 
	method="post" 
	action="{$shop2.uri}?mode=cart&amp;action=add" 
	accept-charset="utf-8"
	class="shop2-product">

	<input type="hidden" name="kind_id" value="{$product.kind_id}"/>
	<input type="hidden" name="product_id" value="{$product.product_id}"/>
	<input type="hidden" name="meta" value='{$product.meta|@json_encode|escape}'/>

	<div class="product-side-l">
		{if $product.special}<div class="product-spec">{$shop2.my.special_alias|default:#SHOP2_SPECIAL#}</div>{/if}
		<div class="product-image{if !$product.image_filename} no-image{/if}">
			{if $product.image_filename}
			<a href="{$IMAGES_DIR}{$product.image_filename}">
				<img src="{s3_img width=$shop2.card_image_width height=$shop2.card_image_height src=$product.image_filename method=$shop2.my.s3_img_method}" alt="{$product.name|htmlspecialchars}" title="{$product.name|htmlspecialchars}" />
			</a>
			<div class="verticalMiddle"></div>
			{/if}
			{if $product.new}<div class="product-new">{$shop2.my.new_alias|default:#SHOP2_NEW#}</div>{/if}
		</div>
		{if $product.params.images}
		<div class="product-thumbnails">
			<ul>
				{assign var="width" value=$shop2.my.small_images_width}
				{if !$width}
					{assign var="width" value=$shop2.card_image_width/3|string_format:"%d"}
					{assign var="width" value=$width-10}
				{/if}
				{foreach from=$product.params.images item=img key=k}
					<li>
						<a href="{$IMAGES_DIR}{$img.filename}">
							<img src="{s3_img width=$width height=$width src=$img.filename method=$shop2.my.s3_img_method}" alt="" />
						</a>
						<div class="verticalMiddle"></div>
					</li>
				{/foreach}
			</ul>
		</div>
		{/if}

		{include file="global:shop2.v2-rating.tpl"}
	</div>
	<div class="product-side-r">
		
		{if $show_price}
			<div class="form-add">
				<div class="product-price">
					{include file="global:shop2.v2-product-price-old.tpl"}
					{include file="global:shop2.v2-product-price.tpl" obj=$product}
				</div>
				
				{include file="global:shop2.v2-amount-btn.tpl" class="product-amount"}
				
				{include file="global:shop2.v2-buy-btn.tpl" type=3}
			</div>
			{include file="global:shop2.v2-product-actions.tpl"}
		{/if}


		<div class="product-details">

			{include file="global:shop2.v2-product-options.tpl"}

			{if !$shop2.my.hide_share}
				<div class="yashare">
					<script type="text/javascript" src="http://yandex.st/share/share.js" charset="utf-8"></script>
					{literal}
					<style type="text/css">
						div.yashare span.b-share a.b-share__handle img,
						div.yashare span.b-share a.b-share__handle span {
							background-image: url("http://yandex.st/share/static/b-share-icon.png");
						}
					</style>
					{/literal}
					<span class="yashare-header">{#SHOP2_SHARE#}</span>
					<div class="yashare-auto-init" data-yashareL10n="{$site.lang}" data-yashareType="none" data-yashareQuickServices="{$shop2.my.share_options|default:"vkontakte,facebook,twitter,odnoklassniki,moimir,gplus"}" {if $product.image_filename}data-yashareImage="http://{$site.site_domain}{$IMAGES_DIR}{$product.image_filename}"{/if}></div>
				</div>
			{/if}
			<div class="shop2-clear-container"></div>
		</div>
	</div>
	<div class="shop2-clear-container"></div>
</form><!-- Product -->

{include file="global:shop2.v2-product-item-desc.tpl"}

{include file="global:shop2.v2-product-item-collections-blocks.tpl"}

{include file="global:shop2.v2-comments.tpl" comments=$product.comments.items form=$product.comments.fields comments_success=$product.comments.comments_success}

{include file="global:shop2.v2-product-in-folders.tpl"}