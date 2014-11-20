<h1>Корзина</h1>

<p>Корзина пуста <a class="shop2-btn" href="{$shop2.uri}">Перейти на главную магазина</a></p>

<div class="shop2-warning">
	<h2>Нимиальная сумма заказа - OVER9000 юаней</h2>
</div>

<form action="{$shop2.uri}?mode=cart&action=up" id="shop2-cart">
	<p class="text-right">
		<a href="{$shop2.uri}?mode=cart&action=cleanup" class="shop2-btn">Очистить корзину</a>
	</p>
	<table class="shop2-cart-table">
		<tr>
			<th>Товар</th>
			<th>Цена, руб.</th>
			<th>Кол-во</th>
			<th>Сумма, руб.</th>
			<th>&nbsp;</th>
		</tr>
		<tr>
			<td class="cart-product">
				<div class="cart-product-image">
					<a href="files/products/1_1_0.jpg" class="highslide">
						<img src="files/products/1_1_0.jpg" height="90" width="90" alt="">
					</a>
					<div class="verticalMiddle"></div>
				</div>
				<div class="cart-product-details">
					<div class="cart-product-name"><a href="?mode=product">Примерный товар номер #1</a></div>
					<div class="cart-product-article"><span>Артикул:</span> 010</div>
					<div class="cart-product-action"><strong>Акция:</strong> Товарная скидка 5%</div>

					<ul class="cart-product-param">
						<li>
							<div class="param-title">Text:</div>
							<div class="param-value">текст 1,1 шт</div>
						</li>
						<li>
							<div class="param-title">Int:</div>
							<div class="param-value">1 mm</div>
						</li>
						<li>
							<div class="param-title">Float:</div>
							<div class="param-value">1.5 cm</div>
						</li>
						<li>
							<div class="param-title">Checkbox:</div>
							<div class="param-value">да</div>
						</li>
						<li>
							<div class="param-title">Color:</div>
							<div class="param-value">
								<ul class="shop2-color-pick">
									<li class="active-color"><span style="background-color: #ccff00;">&nbsp;</span></li>
								</ul>
							</div>
						</li>
						<li>
							<div class="param-title">Textarea:</div>
							<div class="param-value">текст 1,2 </div>
						</li>
						<li>
							<div class="param-title">Select:</div>
							<div class="param-value">вариант 1</div>
						</li>
						<li>
							<div class="param-title">Multiselect:</div>
							<div class="param-value">вариант 1,1, вариант 1,3</div>
						</li>
						<li>
							<div class="param-title">Image:</div>
							<div class="param-value">
								<a class="highslide" href="files/products/1_1_0.jpg">
									<img src="files/products/1_1_0.jpg" width="90" height="90">
								</a>
							</div>
						</li>
						<li>
							<div class="param-title">File:</div>
							<div class="param-value">
								<a href="/d/442666/d/document_1.docx"><span class="icon"></span> Скачать</a>
							</div>
						</li>
						<li>
							<div class="param-title">Выбор цвета:</div>
							<div class="param-value">
								<ul class="shop2-color-ext-list">
									<li style="background-image: url(files/products/2_1_0.jpg); background-size: 24px 24px;" class="shop2-color-ext-selected">
										<div><img src="files/products/2_1_0.jpg" width="96" height="96" alt="">Красный</div>
									</li>
								</ul>
							</div>
						</li>
						<li>
							<div class="param-title">Справочник цветов :</div>
							<div class="param-value">
								<ul class="shop2-color-ext-list">
									<li style="background-image: url(files/products/9_1_0.jpg); background-size: 24px 24px;" class="shop2-color-ext-selected">
										<div><img src="files/products/9_1_0.jpg" width="96" height="96" alt="">Серый</div>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</td>
			<td class="cart-price">
				500
			</td>
			<td class="cart-amount">
				<div class="shop2-product-amount">
					<button type="button" class="shop2-btn amount-minus">−</button>
						<input data-max="5426" data-kind="221746221" name="amounts[221746221]" type="text" maxlength="4" value="1">
					<button type="button" class="shop2-btn amount-plus">+</button>
				</div>
			</td>
			<td class="cart-price">
				500
			</td>
			<td class="cart-delete">
				<a title="Удалить" href="/magazin?mode=cart&amp;action=del&amp;kind_id=221746221" data-id="221746221"><img src="/g/shop2v2/default/images/delete-cart-product.png" height="15" width="15" alt=""></a>
			</td>
		</tr> 
		<tr>
			<td class="cart-product">
				<div class="cart-product-image">
					<a class="highslide" href="files/products/2_1_0.jpg">
						<img src="files/products/2_1_0.jpg" width="90" height="90" alt="">
					</a>
					<div class="verticalMiddle"></div>
				</div>
				<div class="cart-product-details">
					<div class="cart-product-action"><strong>Подарок</strong></div>
					<div class="cart-product-name"><a href="/shop/product/primernyy-tovar-nomer-2">Примерный товар номер #2</a></div>
					<div class="cart-product-article"><span>Артикул:</span> нет</div>

					<ul class="cart-product-param">

					</ul>
				</div>
			</td>
			<td class="cart-price">
				0.00
			</td>
			<td class="cart-amount">
				1
			</td>
			<td class="cart-price">0</td>
			<td>&nbsp;</td>
		</tr>          
	</table>
	<p class="text-right shop2-cart-update show">
		<a href="#" class="shop2-btn shop2-cart-update">Пересчитать</a>
	</p>

	<table class="shop2-cart-total">
		<tr>
			<td>&nbsp;</td>
			<th>Сумма:</th>
			<td>19104.50 руб.</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
			<th>
				<span class="question">
					<img src="/g/shop2v2/default/images/question-price.png" alt=""> Скидка:</span>
					<div style="display: none; top: 1087.87px; left: 931px;" class="shop2-product-discount-desc">
						<p>описание скидка на заказ</p>
					</div>
				</th>
			<td>1910.45 руб.</td>
		</tr>

		<tr>
			<td>
				<div class="shop2-coupon">
					<div class="coupon-body">
						<label class="coupon-label" for="coupon">Купон:</label>
						<button class="coupon-btn shop2-btn">Применить</button>
						<label class="coupon-field">
							<input id="coupon" value="" type="text">
						</label>
					</div>
					<div class="coupon-arrow"></div>

					<div class="coupon-id">
						<span>Использованные:</span>
						<span class="coupon-code ">123 </span>
						<a href="#" data-code="123" class="coupon-delete">&nbsp;</a>
					</div>
				</div>
			</td>
			<th>
				<span class="question">
				<img src="/g/shop2v2/default/images/question-price.png" alt=""> Скидка с купона:</span>
				<div style="display: none; top: 1128.87px; left: 871px;" class="shop2-product-discount-desc"><p>Описание купона</p></div>
			</th>
			<td>500.00 руб.</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
			<th>В том числе НДС 20%:</th>
			<td>2782.34 руб.</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
			<th>Итого:</th>
			<td>16694.05 руб.</td>
		</tr>
	</table>
</form><!-- Cart -->

<div class="shop2-clear-container"></div>

<div class="shop2-cart-registration">
	<h2>Оформить заказ</h2>
	<table class="table-registration">
		<tbody><tr>
			<td class="cell-l">
				<form method="post" action="/user" class="form-registration">
					<input type="hidden" name="mode" value="login">
					<div>
						<label for="reg-login">Логин:</label>
						<label class="registration-field">
							<input type="text" id="reg-login" value="" name="login">
						</label>
					</div>
					<div>
						<label for="reg-password">Пароль:</label>
						<label class="registration-field">
							<input type="password" id="reg-password" value="" name="password">
						</label>
					</div>
					<button class="shop2-btn" type="submit">Войти и оформить заказ</button>
				</form>
			</td>
			<td class="cell-r">
				<p>Для получения персональных и сезонных  скидок, а также уникальных предложений предлагаем Вам пройти несложную процедуру <a href="/user/register">регистрации в магазине</a></p>
				<p><a href="/shop?mode=order" class="shop2-btn">Купить без регистрации</a></p>
			</td>
		</tr>
	</tbody></table>
</div>
<p class="text-center"><a href="{$shop2.uri}?mode=order" class="shop2-btn">Оформить заказ</a></p>
