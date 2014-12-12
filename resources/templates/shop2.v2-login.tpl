<div class="shop2-block login-form {if $smarty.cookies.login_opened}opened{/if}">
	<div class="block-title">
		<strong>{#SHOP2_LOGIN_OR_REGISTER#}</strong>
		<span>&nbsp;</span>
	</div>
	<div class="block-body">
		{if isset($user.user_id)}
		<p>
			<strong class="user-name">{$user.name}</strong>
			<a href="{$user_settings.link}?mode=user" class="settings"></a>
		</p>
		<p>
			<a href="{get_seo_url mode=orders uri_prefix=$shop2.uri}" class="my-orders">{#SHOP2_MY_ORDERS#}</a>
			<a href="{get_seo_url mode=logout uri_prefix=$user_settings.link}">{#SHOP2_LOG_OUT#}</a>
		</p>

		{else}
		<form method="post"{if $user_settings.link} action="{$user_settings.link}"{/if}>
			<input type="hidden" name="mode" value="login" />
			<div class="row">
				<label for="login">Логин или e-mail:</label>
				<label class="field text"><input type="text" name="login" id="login" tabindex="1" value="" /></label>
			</div>
			<div class="row">
				<label for="password">{#SHOP2_PASSWORD#}:</label>
				<button type="submit" class="signin-btn" tabindex="3">{#SHOP2_LOG_IN#}</button>
				<label class="field password"><input type="password" name="password" id="password" tabindex="2" value="" /></label>
			</div>
		</form>
		<div class="clear-container"></div>
		<p>
			<a href="{get_seo_url mode=register uri_prefix=$user_settings.link}" class="register">{#SHOP2_REGISTRATION#}</a>
			<a href="{get_seo_url mode=forgot_password uri_prefix=$user_settings.link}">{#SHOP2_FORGOT_PASSWORD#}</a>
		</p>
		{/if}

	</div>
</div>