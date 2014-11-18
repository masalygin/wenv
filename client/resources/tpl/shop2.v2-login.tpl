<div class="shop2-block login-form">
	<div class="block-title">
		<strong>Вход / Регистрация</strong>
		<span>&nbsp;</span>
	</div>
	<div class="block-body">
<!--                     <p>
			<strong class="user-name">Александр</strong>
			<a href="{$user_settings.link}?mode=user" class="settings"></a>
		</p>
		<p>
			<a href="{get_seo_url mode=orders uri_prefix=$shop2.uri}" class="my-orders">Мои заказы</a>
			<a href="{get_seo_url mode=logout uri_prefix=$user_settings.link}">Выход</a>
		</p> -->

		<form method="post">
			<input type="hidden" name="mode" value="login" />
			<div class="row">
				<label for="login">Логин или e-mail:</label>
				<label class="field text"><input type="text" name="login" id="login" tabindex="1" value="" /></label>
			</div>
			<div class="row">
				<label for="password">Пароль:</label>
				<button type="submit" class="signin-btn" tabindex="3">Войти</button>
				<label class="field password"><input type="password" name="password" id="password" tabindex="2" value="" /></label>
			</div>
		</form>
		<div class="clear-container"></div>
		<p>
			<a href="{get_seo_url mode=register uri_prefix=$user_settings.link}" class="register">Регистрация</a>
			<a href="{get_seo_url mode=forgot_password uri_prefix=$user_settings.link}">Забыли пароль?</a>
		</p>

	</div>
</div>