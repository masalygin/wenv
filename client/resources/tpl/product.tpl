<h1>Примерный товар номер #1</h1>
<div class="shop2-product-article">
	<span>Артикул:</span> нет
</div>

<form method="post" action="{$shop2.uri}?mode=cart&amp;action=add" accept-charset="utf-8" class="shop2-product">
	<input type="hidden" name="kind_id" value="{$product.kind_id}"/>
	<input type="hidden" name="product_id" value="{$product.product_id}"/>
	<input type="hidden" name="meta" value='{$product.meta|@json_encode|escape}'/>

	<div class="product-side-l">
		<div class="product-spec">Спецпредложение</div>
		<div class="product-image">
			<a href="files/products/1_1_0.jpg">
				<img src="files/products/1_1_0.jpg" alt="" style="height: 190px; width: auto;" />
			</a>
			<div class="verticalMiddle"></div>
			<div class="product-new">Новинка</div>
		</div>
		<div class="product-thumbnails">
			<ul>
				<li>
					<a href="files/products/1_1_0.jpg">
						<img src="files/products/1_1_0.jpg" alt="" style="height: 100%; width: 100%;" />
					</a>
					<div class="verticalMiddle"></div>
				</li>
				<li>
					<a href="files/products/2_1_0.jpg">
						<img src="files/products/2_1_0.jpg" alt="" style="height: 100%; width: 100%;" />
					</a>
					<div class="verticalMiddle"></div>
				</li>
				<li>
					<a href="files/products/3_1_0.jpg">
						<img src="files/products/3_1_0.jpg" alt="" style="height: 100%; width: 100%;" />
					</a>
					<div class="verticalMiddle"></div>
				</li>
			</ul>
		</div>

		<div class="tpl-rating-block">Рейтинг:<div class="tpl-stars tpl-active"><div class="tpl-rating" style="width: 0%;"></div></div>(0 голосов)</div>
	</div>
	<div class="product-side-r">
		
		<div class="form-add">
			<div class="product-price">
				<div class="price-old question">
					<span><strong>800</strong> руб.</span>
				</div>
				<div class="shop2-product-discount-desc">
					Краткое описание скидки
				</div>            
				<div class="price-current">
					<strong>800</strong> руб. 
				</div>
			</div>

			<div class="product-amount">
				<div class="amount-title">Количество:</div>
				<div class="shop2-product-amount">
					<button type="button" class="amount-minus">−</button><input type="text" name="amount" maxlength="4" value="1"><button type="button" class="amount-plus">+</button>
				</div>
			</div>

			<button class="shop2-product-btn type-3 buy" type="submit">
				<span>Купить</span>
			</button>
		</div>

		<div class="shop2-product-actions">
			<dl>
				<dt>
					<span class="icon-action">&nbsp;</span>
					<span class="name-action">Десерт в подарок!</span>
				</dt>
				<dd>
					<div class="name-action">Купить дешевле!</div>
					<div class="desc-action">
						<p>Описание Товарная скидка</p>
					</div>
					<div class="close-desc-action"></div>
				</dd>
				<dt class="gift-action">
					<span class="icon-action">&nbsp;</span>
					<span class="name-action">Купить дешевле!</span>
				</dt>
				<dd>
					<div class="name-action">Подарок</div>
					<div class="desc-action">
						<p>Купить дешевле</p>
					</div>
					<div class="close-desc-action"></div>
				</dd>
			</dl>
		</div>


		<div class="product-details">

			<div class="product-compare">
				<label>
					<input type="checkbox" value="221746421" autocomplete="off">
					Добавить к сравнению
				</label>
			</div>


			<table class="shop2-product-options">
				<tr class="even">
					<th>Производитель:</th>
					<td>
						<a href="/shop/vendor/proizvoditel-2">Производитель №2</a>
					</td>
				</tr>

				<tr class="odd">
					<th>Text</th>
					<td>текст 1,1 шт</td>
				</tr>

				<tr class="even">
					<th>Int</th>
					<td>1 mm</td>
				</tr>

				<tr class="odd">
					<th>Float</th>
					<td>1.5 cm</td>
				</tr>

				<tr class="even">
					<th>Checkbox</th>
					<td>да</td>
				</tr>

				<tr class="odd type-color">
					<th>Color</th>
					<td>
						<ul class="shop2-color-pick">
							<li class="active-color shop2-cf" data-value="#ccff00" data-name="Color" data-kinds="405841621">
								<span style="background-color: #ccff00;">&nbsp;</span>
							</li>
							<li class=" shop2-cf" data-value="#009900" data-name="Color" data-kinds="405907821">
								<span style="background-color: #009900;">&nbsp;</span>
							</li>
							<li class=" shop2-cf" data-value="#03f" data-name="Color" data-kinds="405912421">
								<span style="background-color: #03f;">&nbsp;</span>
							</li>
						</ul>
					</td>
				</tr>

				<tr class="even">
					<th>Textarea</th>
					<td>текст 1,2</td>
				</tr>

				<tr class="odd type-select">
					<th>Select</th>
					<td>
						<select class="shop2-cf" name="cf_Select">
							<option selected="selected" data-kinds="405841621" data-value="325855621" data-name="Select" value="325855621">вариант 1</option>
							<option data-kinds="405907821" data-value="325855821" data-name="Select" value="325855821">вариант 2</option>
							<option data-kinds="405912421" data-value="325856021" data-name="Select" value="325856021">вариант 3</option>
						</select>
					</td>
				</tr>

				<tr class="even">
					<th>Multiselect</th>
					<td>вариант 1,1, вариант 1,3</td>
				</tr>

				<tr class="odd type-texture">
					<th>Image</th>
					<td>
						<ul class="shop2-texture-pick">
							<li class="active-texture shop2-cf" data-value="1600854621" data-name="Image" data-kinds="405841621">
								<img alt="Image" src="files/products/1_1_0.jpg" width="30" height="30">
							</li>
							<li class=" shop2-cf" data-value="1600855221" data-name="Image" data-kinds="405907821">
								<img alt="Image" src="files/products/1_1_0.jpg" width="30" height="30">
							</li>
						</ul>
					</td>
				</tr>

				<tr class="even">
					<th>File</th>
					<td>
						<a class="file" href="/d/442666/d/document_1.docx">
							<span class="icon"></span>Скачать
						</a>
					</td>
				</tr>

				<tr class="odd">
					<th>Выбор цвета</th>
					<td>
						<div class="shop2-color-ext-select">
							<i></i>
							<ul class="shop2-color-ext-options">
								<li class="shop2-color-ext-selected" data-value="697c1c6d8fcf5d065fa153f43504f500" data-name="vybor_cveta" data-kinds="405841621">
									<span style="background-image: url(files/products/2_1_0.jpg); background-size: 22px 22px;"><em></em></span>
									<div>Красный</div>
									<ins></ins>
								</li>
								<li data-value="2ea42ca977968a6620ea9887b135a74e" data-name="vybor_cveta" data-kinds="405907821">
									<span style="background-color:#009933"><em></em></span>
									<div>Зеленый</div>
									<ins></ins>
								</li>
								<li data-value="10a7cfcf915c4c9a839ab0834db8aed2" data-name="vybor_cveta" data-kinds="405912421">
									<span style="background-color:#0099ff"><em></em></span>
									<div>Синий</div>
									<ins></ins>
								</li>
							</ul>
						</div>
					</td>
				</tr>

				<tr class="even">
					<th>Справочник цветов </th>
					<td>
						<div class="shop2-color-ext-select">
							<i></i>
							<ul class="shop2-color-ext-options">
								<li class="shop2-color-ext-selected" data-value="694909821" data-name="spravochnik_cvetov" data-kinds="405841621">
									<span style="background-image: url(files/products/5_1_0.jpg); background-size: 22px 22px;"><em></em></span>
									<div>Серый</div>
									<ins></ins>
								</li>
								<li data-value="694910021" data-name="spravochnik_cvetov" data-kinds="405907821">
									<span style="background-image: url(files/products/6_1_0.jpg); background-size: 22px 22px;"><em></em></span>
									<div>Зеленый</div>
									<ins></ins>
								</li>
								<li data-value="694910221" data-name="spravochnik_cvetov" data-kinds="405912421">
									<span style="background-image: url(files/products/7_1_0.jpg); background-size: 22px 22px;"><em></em></span>
									<div>Синий</div>
									<ins></ins>
								</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>

			<div class="yashare">
				<script type="text/javascript" src="http://yandex.st/share/share.js" charset="utf-8"></script>
				
				<style type="text/css">
					div.yashare span.b-share a.b-share__handle img,
					div.yashare span.b-share a.b-share__handle span {
						background-image: url("http://yandex.st/share/static/b-share-icon.png");
					}
				</style>
				
				<span class="yashare-header">поделиться</span>
				<div class="yashare-auto-init" data-yasharel10n="ru" data-yasharetype="none" data-yasharequickservices="vkontakte,facebook,twitter,odnoklassniki,moimir,gplus" data-yashareimage="http://template-shop2v2.oml.ru/d/678006/d/sprey-60ml.jpg">
					<span class="b-share">
						<a rel="nofollow" target="_blank" title="ВКонтакте" class="b-share__handle b-share__link b-share-btn__vkontakte" href="#" data-service="vkontakte">
							<span class="b-share-icon b-share-icon_vkontakte"></span>
						</a>
						<a rel="nofollow" target="_blank" title="Facebook" class="b-share__handle b-share__link b-share-btn__facebook" href="#" data-service="facebook">
							<span class="b-share-icon b-share-icon_facebook"></span>
						</a>
						<a rel="nofollow" target="_blank" title="Twitter" class="b-share__handle b-share__link b-share-btn__twitter" href="#" data-service="twitter">
							<span class="b-share-icon b-share-icon_twitter"></span>
						</a>
						<a rel="nofollow" target="_blank" title="Одноклассники" class="b-share__handle b-share__link b-share-btn__odnoklassniki" href="#" data-service="odnoklassniki">
							<span class="b-share-icon b-share-icon_odnoklassniki"></span>
						</a>
						<a rel="nofollow" target="_blank" title="Мой Мир" class="b-share__handle b-share__link b-share-btn__moimir" href="#" data-service="moimir">
							<span class="b-share-icon b-share-icon_moimir"></span>
						</a>
						<a rel="nofollow" target="_blank" title="Google Plus" class="b-share__handle b-share__link b-share-btn__gplus" href="#" data-service="gplus">
							<span class="b-share-icon b-share-icon_gplus"></span>
						</a>
					</span>
				</div>
			</div>
			<div class="shop2-clear-container"></div>
		</div>
	</div>
	<div class="shop2-clear-container"></div>
</form><!-- Product -->

<div class="shop2-product-data">

	<ul class="shop2-product-tabs">
		<li class="active-tab">
			<a href="#shop2-tabs-1">Параметры</a>
		</li>
		<li>
			<a href="#shop2-tabs-2">Описание</a>
		</li>
		<li>
			<a href="#shop2-tabs-3">Модификации</a>
		</li>
		<li>
			<a href="#shop2-tabs-10">Html</a>
		</li>
		<li>
			<a href="#shop2-tabs-11">Html2</a>
		</li>
	</ul>

	<div class="shop2-product-desc">

		<div id="shop2-tabs-1" class="desc-area active-area">
			<table class="shop2-product-params">
				<tr class="odd">
					<th>Text</th>
					<td>текст 1,1 шт</td>
				</tr>

				<tr class="even">
					<th>Int</th>
					<td>1 mm</td>
				</tr>

				<tr class="odd">
					<th>Float</th>
					<td>1.5 cm</td>
				</tr>
				<tr class="even">
					<th>Checkbox</th>
					<td>да</td>
				</tr>

				<tr class="odd type-color">
				<th>Color</th>
					<td>
						<ul class="shop2-color-pick">
							<li class="active-color">
								<span style="background-color: #ccff00;">&nbsp;</span>
							</li>
						</ul>
					</td>
				</tr>

				<tr class="even">
					<th>Textarea</th>
					<td>текст 1,2</td>
				</tr>

				<tr class="odd">
					<th>Select</th>
					<td>вариант 1</td>
				</tr>

				<tr class="even">
					<th>Multiselect</th>
					<td>вариант 1,1, вариант 1,3</td>
				</tr>

				<tr class="odd type-texture">
					<th>Image</th>
					<td>
						<ul class="shop2-texture-pick">
							<li class="active-texture">
								<img alt="Image" src="files/products/1_1_0.jpg">
							</li>
						</ul>
					</td>
				</tr>

				<tr class="even">
					<th>File</th>
					<td>
						<a class="file" href="/d/442666/d/document_1.docx">
							<span class="icon"></span> Скачать
						</a>
					</td>
				</tr>

				<tr class="odd">
					<th>Выбор цвета</th>
					<td>	
						<ul class="shop2-color-ext-list">
							<li class="shop2-color-ext-selected" style="background-image: url(files/products/2_1_0.jpg); background-size: 22px 22px;">
								<div>
									<img alt="" src="files/products/2_1_0.jpg" width="96" height="96">
									Красный
								</div>
							</li>
						</ul>
					</td>
				</tr>

				<tr class="even">
					<th>Справочник цветов </th>
					<td>	
						<ul class="shop2-color-ext-list">
							<li class="shop2-color-ext-selected" style="background-image: url(files/products/9_1_0.jpg); background-size: 22px 22px;">
								<div>
									<img alt="" src="files/products/9_1_0.jpg" width="96" height="96">
									Серый
								</div>
							</li>
						</ul>
					</td>
				</tr>
			</table>
			<div class="shop2-clear-container"></div>
		</div>

		<div id="shop2-tabs-2" class="desc-area">
			<p>Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара</p>
			<p>Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара</p>
			<p>Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара</p>
			<p>Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара Подробное описание товара</p>
			<div class="shop2-clear-container"></div>
		</div>

		<div id="shop2-tabs-3" class="desc-area">
			<div class="shop2-group-kinds">

				<div class="shop2-kind-item">

					<div class="kind-image">
						<a href="#">
							<img alt="" src="files/products/10_1_0.jpg" width="70" height="70">
						</a>
						<div class="verticalMiddle"></div>
					</div>

					<div class="kind-details">
						<div class="kind-name">
							<a href="#">Примерный товар номер #10</a>
						</div>
						<div class="kind-price">
							<div class="price-old question">
								<span>
									<strong>11220.00</strong>
								</span>
							</div>
							<div class="shop2-product-discount-desc">
								<p>Товарная скидка 5%</p>
							</div>
							<div class="price-current">
								<strong>10659.00</strong> руб. 
							</div>
						</div>
					</div>
					<div class="shop2-clear-container"></div>

					<div class="product-compare">
						<label>
							<input type="checkbox" autocomplete="off" value="405907821"> Добавить к сравнению
						</label>
					</div>

					<table class="shop2-product-params">
						<tr class="odd">
							<th>Text</th>
							<td>2,1 шт</td>
						</tr>

						<tr class="even">
							<th>Int</th>
							<td>2 mm</td>
						</tr>

						<tr class="odd">
							<th>Float</th>
							<td>2.5 cm</td>
						</tr>

						<tr class="even type-color">
							<th>Color</th>
							<td>
								<ul class="shop2-color-pick">
									<li class="active-color">
										<span style="background-color: #009900;">&nbsp;</span>
									</li>
								</ul>
							</td>
						</tr>

						<tr class="odd">
							<th>Textarea</th>
							<td>текст 2,2</td>
						</tr>

						<tr class="even">
							<th>Select</th>
							<td>вариант 2</td>
						</tr>

						<tr class="odd">
							<th>Multiselect</th>
							<td>вариант 1,2</td>
						</tr>

						<tr class="even type-texture">
							<th>Image</th>
							<td>
								<ul class="shop2-texture-pick">
									<li class="active-texture">
										<img alt="Image" src="files/products/2_1_0.jpg" width="30" height="30">
									</li>
								</ul>
							</td>
						</tr>

						<tr class="odd">
							<th>Выбор цвета</th>
							<td>
								<ul class="shop2-color-ext-list">
									<li class="shop2-color-ext-selected" style="background-color:#009933">
										<div>
											<img width="96" height="96" alt="" style="background: #009933;" src="/g/spacer.gif"> Зеленый
										</div>
									</li>
								</ul>
							</td>
						</tr>

						<tr class="even">
							<th>Справочник цветов </th>
							<td>
								<ul class="shop2-color-ext-list">
									<li class="shop2-color-ext-selected" style="background-image: url(files/products/7_1_0.jpg); background-size: 22px 22px;">
										<div>
											<img alt="" src="files/products/7_1_0.jpg" width="96" height="96px"> Зеленый
										</div>
									</li>
								</ul>
							</td>
						</tr>
					</table>			
				</div>   

				<div class="shop2-kind-item">
					<div class="kind-image">
						<a href="#">
							<img alt="" src="files/products/10_1_0.jpg" width="70" height="70">
						</a>
						<div class="verticalMiddle"></div>
					</div>

					<div class="kind-details">
						<div class="kind-name">
							<a href="#">Примерный товар номер #10</a>
						</div>

						<div class="kind-price">
							<div class="price-old question">
								<span>
									<strong>11330.00</strong>
								</span>
							</div>

							<div class="shop2-product-discount-desc" style="display: none; top: 906.867px; left: 615px;">
								<p>Товарная скидка 5%</p>
							</div>

							<div class="price-current">
								<strong>10763.50</strong> руб. 
							</div>
						</div>
					</div>

					<div class="shop2-clear-container"></div>

					<div class="product-compare">
						<label>
							<input type="checkbox" autocomplete="off" value="405912421"> Добавить к сравнению
						</label>
					</div>

					<table class="shop2-product-params">
						<tr class="odd">
							<th>Text</th>
							<td>текст 3,1 шт</td>
						</tr>

						<tr class="even">
							<th>Int</th>
							<td>3 mm</td>
						</tr>

						<tr class="odd">
							<th>Float</th>
							<td>3.5 cm</td>
						</tr>

						<tr class="even">
							<th>Checkbox</th>
							<td>да</td>
						</tr>

						<tr class="odd type-color">
							<th>Color</th>
							<td>
								<ul class="shop2-color-pick">
									<li class="active-color">
										<span style="background-color: #03f;">&nbsp;</span>
									</li>
								</ul>
							</td>
						</tr>

						<tr class="even">
							<th>Textarea</th>
							<td>текст 3,2</td>
						</tr>

						<tr class="odd">
							<th>Select</th>
							<td>вариант 3</td>
						</tr>

						<tr class="even">
							<th>Multiselect</th>
							<td>вариант 1,2, вариант 1,3</td>
						</tr>

						<tr class="odd">
							<th>Выбор цвета</th>
							<td>
								<ul class="shop2-color-ext-list">
									<li class="shop2-color-ext-selected" style="background-color:#0099ff">
										<div>
											<img width="96" height="96" alt="" style="background: #0099ff;" src="/g/spacer.gif">
											Синий
										</div>
									</li>
								</ul>
							</td>
						</tr>

						<tr class="even">
							<th>Справочник цветов </th>
							<td>
								<ul class="shop2-color-ext-list">
									<li class="shop2-color-ext-selected" style="background-image: url(files/products/4_1_0.jpg); background-size: 22px 22px;">
										<div>
											<img alt="" src="files/products/4_1_0.jpg" width="96" height="96">
											Синий
										</div>
									</li>
								</ul>
							</td>
						</tr>
					</table>
				</div>

			</div><!-- Group Products -->
			<div class="shop2-clear-container"></div>
		</div>

		<div id="shop2-tabs-10" class="desc-area">
			<p>html text html text</p>
			<div class="shop2-clear-container"></div>
		</div>

		<div id="shop2-tabs-11" class="desc-area">
			<p>html text2 html text2</p>
			<div class="shop2-clear-container"></div>
		</div>
	</div><!-- Product Desc -->

	<div class="shop2-product-tags">
		<span>Теги:</span>
		<div>
			<a href="#">Тег 1</a>, <a href="#">Тег 2</a>, <a href="#">Тег 3</a>
		</div>
	</div>
	<div class="shop2-clear-container"></div>
</div>


<h4 class="shop2-collection-header">Акссессуары</h4>

<div class="shop2-group-kinds">
	<div class="shop2-kind-item">
		<div class="kind-image">
			<a href="#"><img alt="" src="files/products/2_1_0.jpg" width="70" height="70"></a>
			<div class="verticalMiddle"></div>
		</div>
		<div class="kind-details">
			<div class="kind-name"><a href="#">Примерный товар номер #2</a></div>
			<div class="kind-price">
				<div class="price-current">
					<strong>2000.00</strong> руб.
				</div>
			</div>
		</div>
		<div class="shop2-clear-container"></div>
	</div>

	<div class="shop2-kind-item">
		<div class="kind-image">
			<a href="#"><img alt="" src="files/products/3_1_0.jpg" width="70" height="70"></a>
			<div class="verticalMiddle"></div>
		</div>
		<div class="kind-details">
			<div class="kind-name"><a href="#">Примерный товар номер #3</a></div>
			<div class="kind-price">
				<div class="price-current">
					<strong>3000.00</strong> руб. 
				</div>
			</div>
		</div>
		<div class="shop2-clear-container"></div>
	</div>	

	<div class="shop2-kind-item">
		<div class="kind-image">
			<a href="#"><img alt="" src="files/products/1_1_0.jpg" width="70" height="70"></a>
			<div class="verticalMiddle"></div>
		</div>
		<div class="kind-details">
			<div class="kind-name"><a href="#">Примерный товар номер #1</a></div>
			<div class="kind-price">
				<div class="price-current">
					<strong>1000.00</strong> руб. 
				</div>
			</div>
		</div>
		<div class="shop2-clear-container"></div>
	</div>
</div>

<h4 class="shop2-collection-header">Похожие</h4>
<div class="shop2-group-kinds">
	<div class="shop2-kind-item">
		<div class="kind-image">
			<a href="#"><img alt="" src="files/products/7_1_0.jpg" width="70" height="70"></a>
			<div class="verticalMiddle"></div>
		</div>
		<div class="kind-details">
			<div class="kind-name"><a href="#">Примерный товар номер #7</a></div>
			<div class="kind-price">
				<div class="price-current">
					<strong>7000.00</strong> руб.
				</div>
			</div>
		</div>
		<div class="shop2-clear-container"></div>
	</div>							    
	<div class="shop2-kind-item">
		<div class="kind-image">
			<a href="#"><img alt="" src="files/products/8_1_0.jpg" width="70" height="70"></a>
			<div class="verticalMiddle"></div>
		</div>
		<div class="kind-details">
			<div class="kind-name"><a href="#">Примерный товар номер #8</a></div>
			<div class="kind-price">
				<div class="price-current">
					<strong>8000.00</strong> руб. 
				</div>
			</div>
		</div>
		<div class="shop2-clear-container"></div>
	</div>							    
	<div class="shop2-kind-item">
		<div class="kind-image no-image"></div>
		<div class="kind-details">
			<div class="kind-name"><a href="/shop/product/primernyy-tovar-nomer-9">Примерный товар номер #9</a></div>
			<div class="kind-price">
				<div class="price-current">
					<strong>9000.00</strong> руб. 
				</div>
			</div>
			</div>
		<div class="shop2-clear-container"></div>
	</div>
</div>
<h4 class="shop2-collection-header">Набор</h4>
<div class="shop2-group-kinds">
	<div class="shop2-kind-item">
		<div class="kind-image">
			<a href="#"><img alt="" src="files/products/3_1_0.jpg" width="70" height="70"></a>
			<div class="verticalMiddle"></div>
		</div>
		<div class="kind-details">
			<div class="kind-name"><a href="#">Примерный товар номер #3</a></div>
			<div class="kind-price">
				<div class="price-current">
					<strong>3000.00</strong> руб. 
				</div>
			</div>
		</div>
		<div class="shop2-clear-container"></div>
	</div>							    
	<div class="shop2-kind-item">
		<div class="kind-image">
			<a href="#"><img alt="" src="files/products/4_1_0.jpg" width="70" height="70"></a>
			<div class="verticalMiddle"></div>
		</div>
		<div class="kind-details">
			<div class="kind-name"><a href="#">Примерный товар номер #4</a></div>
			<div class="kind-price">
				<div class="price-current">
					<strong>4000.00</strong> руб. 
				</div>
			</div>
		</div>
		<div class="shop2-clear-container"></div>
	</div>
</div>
<h4 class="shop2-collection-header">Рекомендуемые</h4>
<div class="shop2-group-kinds">
	<div class="shop2-kind-item">
		<div class="kind-image">
			<a href="#"><img alt="" src="files/products/5_1_0.jpg" width="70" height="70"></a>
			<div class="verticalMiddle"></div>
		</div>
		<div class="kind-details">
			<div class="kind-name"><a href="#">Примерный товар номер #5</a></div>
			<div class="kind-price">
				<div class="price-current">
					<strong>5000.00</strong> руб. 
				</div>
			</div>
		</div>
		<div class="shop2-clear-container"></div>
	</div>
	<div class="shop2-kind-item">
		<div class="kind-image">
			<a href="#"><img alt="" src="files/products/6_1_0.jpg" width="70" height="70"></a>
			<div class="verticalMiddle"></div>
		</div>
		<div class="kind-details">
			<div class="kind-name"><a href="#">Примерный товар номер #6</a></div>
			<div class="kind-price">
				<div class="price-current">
					<strong>6000.00</strong> руб. 
				</div>
			</div>
		</div>
		<div class="shop2-clear-container"></div>
	</div>
</div>

<div class="tpl-block-header">Отзывы</div>
<dl id="comment-1" class="tpl-comment">
	<dt class="tpl-header clearfix">
		<div class="tpl-name">Test</div>
		<time datetime="2013-12-03T10:50" class="tpl-date">03 Декабря 2013 в 10:50</time>
		<div class="tpl-stars">
			<div class="tpl-rating tpl-rating-5"></div>
		</div>
		<a href="#comment-1" class="tpl-link">#</a>
	</dt>
	<dd class="tpl-body">test_koment1</dd>
</dl>

<dl id="comment-2" class="tpl-comment">
	<dt class="tpl-header clearfix">
		<div class="tpl-name">Test</div>
		<time datetime="2013-12-03T10:56" class="tpl-date">03 Декабря 2013 в 10:56</time>
		<div class="tpl-stars">
			<div class="tpl-rating tpl-rating-4"></div>
		</div>
		<a href="#comment-2" class="tpl-link">#</a>
	</dt>
	<dd class="tpl-body">
		test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 test_koment2 
	</dd>
</dl>

<hr>

<div class="tpl-block-header">Оставьте отзыв</div>

<div class="tpl-info">
	Заполните обязательные поля <span class="tpl-required">*</span>.
</div>

<form action="" method="post" class="tpl-form">
	<div class="tpl-field">
		<label class="tpl-title" for="d[1]">
			Комментарий:
			<span class="tpl-required">*</span>
		</label>
		<div class="tpl-value">
			<textarea cols="55" rows="10" name="text"></textarea>
		</div>
	</div>
	<div class="tpl-field">
		<label class="tpl-title" for="d[1]">
			Оценка:
			<span class="tpl-required">*</span>
		</label>
		<div class="tpl-value">
			<div class="tpl-stars">
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				<input name="rating" value="0" type="hidden">
			</div>
		</div>
	</div>
	<div class="tpl-field">
		<div class="tpl-title">
			Введите код, изображенный на картинке
			<span class="tpl-required">*</span>
		</div>

		<div class="tpl-value">
			<div id="s3_captcha_cn1412836599"></div>
			<script type="text/javascript" charset="UTF-8" src="https://captcha.megagroup.ru/static/captcha.js?2"></script>
			<div class="mgCaptcha-block" id="mcp3356-block">
				<a href="javascript: void(0);" onclick="mgCaptcha.refresh('mcp3356');">
					<img id="mcp3356-img" src="http://captcha.oml.ru/captcha.php?hash=THSUIe3%2BIDB3yw%3D%3D&amp;key=cbfa2df5498027e4c2dff018b644432f&amp;id=cms&amp;inline=1" border="0">
					<img src="http://captcha.oml.ru/static/reload.gif" border="0">
				</a>
				<input id="mcp3356-sid" name="mgcaptcha-sid" value="cbfa2df5498027e4c2dff018b644432f" type="hidden">
			</div>
			<input name="_cn" maxlength="4" size="4" type="text">
		</div>
	</div>

	<div class="tpl-field">
		<input class="tpl-button tpl-button-big" value="Отправить" type="submit">
	</div>
</form>

<div class="tpl-block-header">Авторизуйтесь, чтобы оставить комментарий</div>

<form action="/user/login" class="tpl-form tpl-auth" method="post">

	<div class="tpl-left">
		<div class="tpl-field">
			<div class="tpl-title">Введите Ваш e-mail:</div>
			<div class="tpl-value">
				<input type="text" value="" name="login">
			</div>
		</div>
		<div class="tpl-field">
			<div class="tpl-title">Введите Ваш пароль:</div>
			<div class="tpl-value clearfix">
				<input type="password" name="password" class="pull-left">
				<button type="submit" class="tpl-button pull-right">Войти</button>
			</div>
		</div>
		<div class="tpl-field">
			<label class="tpl-title">
			<input type="checkbox" value="0" onclick="this.value=(this.value=='0'?'1':'0');" name="password">Запомнить меня</label>
		</div>
		<div class="tpl-field">
			<a href="/user/register">Регистрация</a>
		</div>
	</div>
	<div class="tpl-right">
		<div class="tpl-field">
			Если Вы уже зарегистрированы на нашем сайте, но забыли пароль или Вам не пришло письмо подтверждения, воспользуйтесь формой восстановления пароля.
		</div>

		<div class="tpl-field">
			<a href="/user/forgot_password" class="tpl-button">Восстановить пароль</a>
		</div>
	</div>
</form>

<h4 class="shop2-product-folders-header">Находится в разделах</h4>

<div class="shop2-product-folders"><a href="/magazin/folder/chistyaschie-sredstva">Чистящие средства<span></span></a></div>

<p><a href="javascript:shop2.back()" class="shop2-btn shop2-btn-back">Назад</a></p>