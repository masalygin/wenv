<h1>Заказ</h1>

<script type="text/javascript">
	shop2.on('afterCartAddItem', function(d, status) { // срабатывает когда сервер ответил на попытку добавления товара в корзину

		if (!d.errstr) { // если ошибок нет
			
			var html = '<div class="shop2-alert-header">Товар добавлен в корзину</div>' +
				'<div class="shop2-alert-buttons">' +
				'<a class="shop2-btn" href="' + shop2.uri + '/cart">Оформить заказ</a>' +
				'<a class="shop2-alert-close" onclick="shop2.alert.hide(); return false;" href="#">Продолжить покупки</a>' +
				'</div>';

			shop2.alert(html, '', 'shop2-alert-cart')
		}
	});
</script>
		
<form action="/?mode=order&amp;step=delivery" method="post" class="shop2-order-options shop2-delivery">
	<input name="action" value="save" type="hidden">
	<div class="options-list">
											
		<div class="option-type active-type">
			<label class="option-label">
				<input name="delivery_id" autocomplete="off" checked="checked" value="641421" type="radio"><span>
					Курьер - бесплатно (срок доставки)</span>
			</label>
						<div class="option-details">
														<div class="option-item">
						<label>
							<span>Адрес доставки:</span>
							<textarea name="641421[address]" cols="50" rows="5"></textarea>
						</label>
					</div>
																			<div class="option-item">
						<label>
							<span>Дата и время доставки:</span>
							<input name="641421[datetime]" size="30" value="" type="text">
						</label>
					</div>
																			<div class="option-item">
						<label>
							<span>Телефон:</span>
							<input name="641421[phone]" size="30" value="" type="text">
						</label>
					</div>
									
							</div>
					</div>
						
		<div class="option-type ">
			<label class="option-label">
				<input name="delivery_id" autocomplete="off" value="641021" type="radio"><span>
					Самовывоз
					
											
															- бесплатно							
											
					
									</span>
			</label>
					</div>
			</div>
	<div class="text-center">
		<button class="shop2-btn" type="submit">Оформить заказ</button>
	</div>
</form><!-- Delivery -->			<p><a href="/magazin?mode=cart" class="shop2-btn shop2-btn-back">Назад</a></p>