<h1>Категории</h1>
<form class="shop2-filter" action="#">
	<a id="shop2-filter"></a>
	<table class="table-filter-param">
		<tr class="type-text">
			<th>Цена:</th>
			<td>
				<label>
					<strong>от</strong> <input class="shop2-input-float" type="text">
				</label>
				<label>
				<strong>до</strong> <input class="shop2-input-float"  type="text">
				</label>&nbsp;<strong>руб.</strong>
			</td>
		</tr>

		<tr class="shop2-filter-fields">
			<th>Int:</th>
			<td>
				<label>
					<strong>от</strong> <input class="shop2-input-int" value="" type="text">
				</label>
				<label>
					<strong>до</strong> <input class="shop2-input-int" value="" type="text">
				</label>&nbsp;<strong>mm</strong>
			</td>
		</tr>

		<tr class="shop2-filter-fields">
			<th>Float:</th>
			<td>
				<label>
					<strong>от</strong> <input class="shop2-input-float" type="text">
				</label>
				<label>
					<strong>до</strong> <input class="shop2-input-float" type="text">
				</label>&nbsp;<strong>cm</strong>
			</td>
		</tr>

		<tr class="shop2-filter-fields">
			<th>Checkbox:</th>
			<td>
				<a href="#" class="param-val">да<span>&nbsp;</span></a>
				<a href="#" class="param-val">нет<span>&nbsp;</span></a>
			</td>
		</tr>

		<tr class="shop2-filter-fields type-select">
			<th>Select:</th>
			<td>
				<a href="#" class="param-val">вариант 1<span>&nbsp;</span></a>
				<a href="#" class="param-val">вариант 2<span>&nbsp;</span></a>
				<a href="#" class="param-val">вариант 3<span>&nbsp;</span></a>
			</td>
		</tr>

		<tr class="shop2-filter-fields type-select">
			<th>Multiselect:</th>
			<td>
				<a href="#" class="param-val">вариант 1,1<span>&nbsp;</span></a>
				<a href="#" class="param-val">вариант 1,2<span>&nbsp;</span></a>
				<a href="#" class="param-val">вариант 1,3<span>&nbsp;</span></a>
			</td>
		</tr>

		<tr class="shop2-filter-fields">
			<th>Справочник&nbsp;цветов&nbsp;:</th>
			<td>
				<div class="shop2-color-ext-popup">
					<a class="shop2-color-ext-caption" href="#">Выбрать (из 3)</a>
					<ul class="shop2-color-ext-list">
						<li style="background-image: url(files/products/9_1_0.jpg); background-size: cover;">
							<span></span>
							<div>
								<img src="files/products/9_1_0.jpg" width="96" height="96" alt=""> Серый
							</div>
						</li>
						<li style="background-image: url(files/products/7_1_0.jpg); background-size: cover;" >
							<span></span>
							<div>
								<img src="files/products/7_1_0.jpg" width="96" height="96" alt=""> Зеленый
							</div>
						</li>
						<li style="background-image: url(files/products/4_1_0.jpg); background-size: cover;">
							<span></span>
							<div>
								<img src="files/products/4_1_0.jpg" width="96" height="96" alt=""> Синий
							</div>
						</li>
					</ul>
				</div>
			</td>
		</tr>
	</table>
	<div class="result">
		Найдено: <span id="filter-result">10</span>
		<span class="result-arrow">&nbsp;</span>
	</div>
	<a href="#" class="shop2-btn shop2-filter-go">Показать</a>
	<a href="{$SCRIPT_NAME}" class="shop2-btn">Сбросить фильтр</a>
	<div class="result no-result">
		Найдено: <span id="filter-result">10</span>
		<span class="result-arrow">&nbsp;</span>
	</div>
	<div class="shop2-clear-container"></div>
</form><!-- Filter -->

<div class="shop2-sorting-panel">
	<div class="sorting">
		<strong class="sort-title">Сортировать по:</strong>
		<a href="#" id="shop2-sorting-name" class="sort-param sort-param-desc" data-name="name">Названию<span>&nbsp;</span></a>
		<a href="#" id="shop2-sorting-price" class="sort-param sort-param-desc" data-name="price">Цене<span>&nbsp;</span></a>
		<a href="#" class="sort-param sort-param-asc" data-name="amount">Наличию<span>&nbsp;</span></a>
		<a href="#" class="sort-param sort-param-asc" data-name="rating">Рейтингу<span>&nbsp;</span></a>
		<a href="#" class="sort-reset"><ins>Сбросить</ins><span>&nbsp;</span></a>
	</div>
	<div class="view-shop">
		<strong>Вид:</strong>
		<a href="#" title="{#SHOP2_LIST#}" data-value="simple" class="shop2-btn simple active-view"><span>&nbsp;</span></a>
		<a href="#" title="{#SHOP2_THUMBS#}" data-value="thumbs" class="shop2-btn thumbs"><span>&nbsp;</span></a>
		<a href="#" title="{#SHOP2_PRICE_LIST#}" data-value="list" class="shop2-btn pricelist"><span>&nbsp;</span></a>
	</div>
</div>
<div class="shop2-warning">
	<h2>Товаров соответствующих вашему запросу нет</h2>
</div>

<div class="product-list">
	<form method="post" action="{$shop2.uri}?mode=cart&amp;action=add" accept-charset="utf-8" class="shop2-product-item product-item-simple">
		<input type="hidden" name="kind_id" value="{$product.kind_id}" />
		<input type="hidden" name="product_id" value="{$product.product_id}" />
		<input type="hidden" name="meta" value='{$product.meta}'/>

		<div class="shop2-clear-container"></div>
		<div class="product-side-l">
			<div class="product-image">
				<a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">
					<img src="files/products/1_1_0.jpg" alt="" style="width: 180px; height: 190px;">
				</a>
				<div class="verticalMiddle"></div>

			</div>

			<div class="product-label">
				<div class="product-spec">Спецпредложение</div>
				<div class="product-new">Новинка</div>
			</div>

			<div class="tpl-stars">
				<div class="tpl-rating" style="width: 92%"></div>
			</div>
		</div>
		

		<div class="product-side-r">
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
			<div class="product-amount">
				<div class="amount-title">Количество:</div>
					<div class="shop2-product-amount">
					<button type="button" class="amount-minus">−</button><input type="text" name="amount" maxlength="4" value="1"><button type="button" class="amount-plus">+</button>
				</div>
			</div>
			 <div class="product-price">
				<div class="price-old question">
					<span><strong>800</strong> руб.</span>
				</div>
				<div class="shop2-product-discount-desc">
					Краткое описание скидки
				</div>

				<div class="price-current">
					<strong>738</strong> руб.
				</div>

			</div>

			<button class="shop2-product-btn type-3 buy" type="submit">
				<span>Купить</span>
			</button>
		</div>


		<div class="product-side-c">
			<div class="product-name"><a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">Примерный товар номер #1</a></div>
			
		   <div class="product-article"><span>Артикул:</span> нет</div>
			<div class="product-anonce">
				Анонс товара
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
								<img alt="Image" src="files/products/1_1_0.jpg" width="452" height="452">
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
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
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
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
									<div>Серый</div>
									<ins></ins>
								</li>
								<li data-value="694910021" data-name="spravochnik_cvetov" data-kinds="405907821">
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
									<div>Зеленый</div>
									<ins></ins>
								</li>
								<li data-value="694910221" data-name="spravochnik_cvetov" data-kinds="405912421">
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
									<div>Синий</div>
									<ins></ins>
								</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="shop2-clear-container"></div>
	</form>

	<form method="post" action="{$shop2.uri}?mode=cart&amp;action=add" accept-charset="utf-8" class="shop2-product-item product-item-simple">
		<input type="hidden" name="kind_id" value="{$product.kind_id}" />
		<input type="hidden" name="product_id" value="{$product.product_id}" />
		<input type="hidden" name="meta" value='{$product.meta}'/>

		<div class="shop2-clear-container"></div>
		<div class="product-side-l">
			<div class="product-image">
				<a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">
					<img src="files/products/2_1_0.jpg" alt="" style="width: 180px; height: 190px;">
				</a>
				<div class="verticalMiddle"></div>

			</div>

			<div class="tpl-stars">
				<div class="tpl-rating" style="width: 92%"></div>
			</div>
		</div>

		<div class="product-side-r">
			<div class="product-amount">
				<div class="amount-title">Количество:</div>
					<div class="shop2-product-amount">
					<button type="button" class="amount-minus">−</button><input type="text" name="amount" maxlength="4" value="1"><button type="button" class="amount-plus">+</button>
				</div>
			</div>
			 <div class="product-price">
				<div class="price-old question">
					<span><strong>800</strong> руб.</span>
				</div>
				<div class="shop2-product-discount-desc">
					Краткое описание скидки
				</div>

				<div class="price-current">
					<strong>738</strong> руб.
				</div>

			</div>

			<button class="shop2-product-btn type-3 onrequest" type="submit">
				<span>Предзаказ</span>
			</button>
		</div>


		<div class="product-side-c">
			<div class="product-name"><a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">Примерный товар номер #2</a></div>
			
		   <div class="product-article"><span>Артикул:</span> нет</div>

		</div>
		<div class="shop2-clear-container"></div>
	</form>


	<form method="post" action="{$shop2.uri}?mode=cart&amp;action=add" accept-charset="utf-8" class="shop2-product-item product-item-simple">
		<input type="hidden" name="kind_id" value="{$product.kind_id}" />
		<input type="hidden" name="product_id" value="{$product.product_id}" />
		<input type="hidden" name="meta" value='{$product.meta}'/>

		<div class="shop2-clear-container"></div>
		<div class="product-side-l">
			<div class="product-image no-image"></div>

			<div class="tpl-stars">
				<div class="tpl-rating" style="width: 92%"></div>
			</div>
		</div>

		<div class="product-side-r">
			<div class="product-amount disabled">
				<div class="amount-title">Количество:</div>
				<div class="shop2-product-amount disabled">
					<button type="button" class="amount-minus" disabled="disabled">−</button><input type="text" name="amount" maxlength="4" value="1" disabled="disabled"><button type="button" class="amount-plus" disabled="disabled">+</button>
				</div>
			</div>
			 <div class="product-price">
				<div class="price-old question">
					<span><strong>800</strong> руб.</span>
				</div>
				<div class="shop2-product-discount-desc">
					Краткое описание скидки
				</div>

				<div class="price-current">
					<strong>738</strong> руб.
				</div>

			</div>

			<button class="shop2-product-btn type-3 notavailable" type="submit">
				<span>Нет в наличии</span>
			</button>
		</div>


		<div class="product-side-c">
			<div class="product-name"><a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">Примерный товар номер #3</a></div>
			
		   <div class="product-article"><span>Артикул:</span> нет</div>

		</div>
		<div class="shop2-clear-container"></div>
	</form>
</div>

<div class="product-list product-list-thumbs">
	<form method="post" action="{$shop2.uri}?mode=cart&amp;action=add" accept-charset="utf-8" class="shop2-product-item product-item-thumb">

		<input type="hidden" name="kind_id" value="{$product.kind_id}" />
		<input type="hidden" name="product_id" value="{$product.product_id}" />
		<input type="hidden" name="meta" value="{$product.meta|@json_encode|escape}" />

		<div class="product-top">
			<div class="product-image">
				<a href="#">
					<img src="files/products/1_1_0.jpg" alt="" style="width: 180px; height: 190px;">
				</a>
				<div class="product-label">
					<div class="product-spec">Спецпредложение</div>
					<div class="product-new">Новинка</div>
				</div>
			</div>

			<div class="tpl-stars">
				<div class="tpl-rating" style="width: 92%"></div>
			</div>
		
			<div class="product-name"><a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">Примерный товар номер #1</a></div>

			<div class="product-article"><span>Артикул:</span> нет</div>
			<div class="product-anonce">Анонс товара</div>
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
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
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
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
									<div>Серый</div>
									<ins></ins>
								</li>
								<li data-value="694910021" data-name="spravochnik_cvetov" data-kinds="405907821">
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
									<div>Зеленый</div>
									<ins></ins>
								</li>
								<li data-value="694910221" data-name="spravochnik_cvetov" data-kinds="405912421">
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
									<div>Синий</div>
									<ins></ins>
								</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
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
			<div class="product-amount">
				<div class="amount-title">Количество:</div>
				<div class="shop2-product-amount">
					<button type="button" class="amount-minus">−</button><input type="text" name="amount" maxlength="4" value="1"><button type="button" class="amount-plus">+</button>
				</div>
			</div>
		</div>
		<div class="product-bot">
			 <div class="product-price">
				<div class="price-old question">
					<span><strong>800</strong> руб.</span>
				</div>
				<div class="shop2-product-discount-desc">
					Краткое описание скидки
				</div>

				<div class="price-current">
					<strong>738</strong> руб.
				</div>

			</div>

			<button class="shop2-product-btn type-2 buy" type="submit">
				<span>Купить</span>
			</button>
		</div>
	</form>

	<form method="post" action="{$shop2.uri}?mode=cart&amp;action=add" accept-charset="utf-8" class="shop2-product-item product-item-thumb">

		<input type="hidden" name="kind_id" value="{$product.kind_id}" />
		<input type="hidden" name="product_id" value="{$product.product_id}" />
		<input type="hidden" name="meta" value="{$product.meta|@json_encode|escape}" />

		<div class="product-top">
			<div class="product-image">
				<a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">
					<img src="files/products/2_1_0.jpg" alt="" style="width: 180px; height: 190px;">
				</a>
				<div class="verticalMiddle"></div>
			</div>

			<div class="tpl-stars">
				<div class="tpl-rating" style="width: 92%"></div>
			</div>
		
			<div class="product-name"><a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">Примерный товар номер #2</a></div>

			<div class="product-article"><span>Артикул:</span> нет</div>
			<div class="product-compare">
				<label>
					<input type="checkbox" value="221746421" autocomplete="off">
					Добавить к сравнению
				</label>
			</div>

			<div class="product-amount">
				<div class="amount-title">Количество:</div>
				<div class="shop2-product-amount">
					<button type="button" class="amount-minus">−</button><input type="text" name="amount" maxlength="4" value="1"><button type="button" class="amount-plus">+</button>
				</div>
			</div>
		</div>
		<div class="product-bot">
			 <div class="product-price">

				<div class="price-current">
					<strong>738</strong> руб.
				</div>

			</div>

			<button class="shop2-product-btn type-2 onrequest" type="submit">
				<span>Предзазаз</span>
			</button>
		</div>
	</form>

	<form method="post" action="{$shop2.uri}?mode=cart&amp;action=add" accept-charset="utf-8" class="shop2-product-item product-item-thumb">

		<input type="hidden" name="kind_id" value="{$product.kind_id}" />
		<input type="hidden" name="product_id" value="{$product.product_id}" />
		<input type="hidden" name="meta" value="{$product.meta|@json_encode|escape}" />

		<div class="product-top">
			<div class="product-image no-image"></div>

			<div class="tpl-stars">
				<div class="tpl-rating" style="width: 92%"></div>
			</div>
		
			<div class="product-name"><a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">Примерный товар номер #3</a></div>

			<div class="product-article"><span>Артикул:</span> нет</div>
			<div class="product-compare">
				<label>
					<input type="checkbox" value="221746421" autocomplete="off">
					Добавить к сравнению
				</label>
			</div>

			<div class="product-amount">
				<div class="amount-title">Количество:</div>
				<div class="shop2-product-amount disabled">
					<button type="button" class="amount-minus" disabled="disabled">−</button><input type="text" name="amount" maxlength="4" value="1" disabled="disabled"><button type="button" class="amount-plus" disabled="disabled">+</button>
				</div>
			</div>
		</div>
		<div class="product-bot">
			 <div class="product-price">

				<div class="price-current">
					<strong>738</strong> руб.
				</div>

			</div>

			<button class="shop2-product-btn type-2 notavailable" type="submit" disabled="disabled">
				<span>Нет в наличии</span>
			</button>
		</div>
	</form>
</div>

<div class="shop2-pricelist">
	<div class="tr">
		<div class="th column-name">Товар</div>
		<div class="th column-options">Параметры<br>
			<a class="shop2-options-btn" href="#">
				<span class="shop2-options-text" data-alt="Показать все параметры">Показать все параметры</span>
				<span class="shop2-options-arrow"></span>
			</a>
		</div>
		<div class="th column-price">Цена, руб.</div>
		<div class="th column-amount">Кол-во</div>
		<div class="th column-add">&nbsp;</div>
	</div>

	<form class="shop2-product-item tr" method="post" action="{$shop2.uri}?mode=cart&amp;action=add" accept-charset="utf-8">
		<div class="td column-name">
			<input type="hidden" name="kind_id" value="{$product.kind_id}" />
			<input type="hidden" name="product_id" value="{$product.product_id}" />
			<input type="hidden" name="meta" value="{$product.meta|@json_encode|escape}" />
			
			<div class="product-label">
				<div class="product-spec">Спецпредложение</div>
				<div class="product-new">Новинка</div>
			</div>
		
			<div class="product-wrapping">
				<div class="product-name">
					<a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">Примерный товар номер #1</a>
				</div>
				<div class="product-article"><span>Артикул:</span> нет</div>                         
				<div class="tpl-stars">
					<div class="tpl-rating" style="width: 92%"></div>
				</div>
			
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
		</div>
		

		<div class="td column-options">

			<div class="product-compare">
				<label>
					<input type="checkbox" value="221746421" autocomplete="off">
					Добавить к сравнению
				</label>
			</div>

			<a class="shop2-options-btn" href="#" data-alt="{$shop2.my.pricelist_options_hide_alias|default:#SHOP2_HIDE_PARAMETERS#}">
				Показать параметры
			</a> 

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
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
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
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
									<div>Серый</div>
									<ins></ins>
								</li>
								<li data-value="694910021" data-name="spravochnik_cvetov" data-kinds="405907821">
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
									<div>Зеленый</div>
									<ins></ins>
								</li>
								<li data-value="694910221" data-name="spravochnik_cvetov" data-kinds="405912421">
									<span style="background-image: url(files/products/1_1_0.jpg); background-size: 24px 24px;"><em></em></span>
									<div>Синий</div>
									<ins></ins>
								</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>

		</div>
		
		<div class="td column-price">
			<div class="price-current">800</div>
		</div>
		
		<div class="td column-amount">
			<div class="shop2-product-amount">
				<button type="button" class="amount-minus">−</button><input type="text" name="amount" maxlength="4" value="1"><button type="button" class="amount-plus">+</button>
			</div>
		</div>
		<div class="td column-add">
			<button class="shop2-product-btn type-1 buy" type="submit">
				<span>Купить</span>
			</button>
		</div>
	</form>
	<form class="shop2-product-item tr" method="post" action="{$shop2.uri}?mode=cart&amp;action=add" accept-charset="utf-8">
		<div class="td column-name">
		
			<div class="product-wrapping">
				<div class="product-name">
					<a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">Примерный товар номер #2</a>
				</div>
				<div class="product-article"><span>Артикул:</span> нет</div>                         
				<div class="tpl-stars">
					<div class="tpl-rating" style="width: 92%"></div>
				</div>
			
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
		</div>
		
		<div class="td column-options">

			<div class="product-compare">
				<label>
					<input type="checkbox" value="221746421" autocomplete="off">
					Добавить к сравнению
				</label>
			</div>

		</div>
		
		<div class="td column-price">
			<div class="price-current">800</div>
		</div>
		
		<div class="td column-amount">
			<div class="shop2-product-amount">
				<button type="button" class="amount-minus">−</button><input type="text" name="amount" maxlength="4" value="1"><button type="button" class="amount-plus">+</button>
			</div>
		</div>
		<div class="td column-add">
			<button class="shop2-product-btn type-1 onrequest" type="submit">
				<span>Предзаказ</span>
			</button>
		</div>
	</form>
	<form class="shop2-product-item tr" method="post" action="{$shop2.uri}?mode=cart&amp;action=add" accept-charset="utf-8">
		<div class="td column-name">
		
			<div class="product-wrapping">
				<div class="product-name">
					<a href="{get_seo_url uri_prefix=$shop2.uri mode="product" alias=$product.alias}">Примерный товар номер #3</a>
				</div>
				<div class="product-article"><span>Артикул:</span> нет</div>                         
				<div class="tpl-stars">
					<div class="tpl-rating" style="width: 92%"></div>
				</div>
			
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
		</div>
		

		<div class="td column-options">

			<div class="product-compare">
				<label>
					<input type="checkbox" value="221746421" autocomplete="off">
					Добавить к сравнению
				</label>
			</div>

		</div>
		
		<div class="td column-price">
			<div class="price-current">800</div>
		</div>
		
		<div class="td column-amount">
			<div class="shop2-product-amount disabled">
				<button type="button" class="amount-minus" disabled="disabled">−</button><input type="text" name="amount" maxlength="4" value="1" disabled="disabled"><button type="button" class="amount-plus" disabled="disabled">+</button>
			</div>
		</div>
		<div class="td column-add">
			<button class="shop2-product-btn type-1 notavailable" type="submit">
				<span>Нет в наличии</span>
			</button>
		</div>
	</form>
</div>

<ul class="shop2-pagelist">
	<li class="page-first"><a href="#">&nbsp;</a></li>
	<li class="page-prev"><a href="#">&nbsp;</a></li>
	<li class="page-num"><a href="#">...</a></li>
	<li class="page-num"><a href="#">6</a></li>
	<li class="page-num"><a href="#">7</a></li>
	<li class="page-num"><a href="#">8</a></li>
	<li class="page-num"><a href="#">9</a></li>
	<li class="page-num active-num"><a href="#">10</a></li>
	<li class="page-num"><a href="#">11</a></li>
	<li class="page-num"><a href="#">12</a></li>
	<li class="page-num"><a href="#">13</a></li>
	<li class="page-num"><a href="#">14</a></li>
	<li class="page-num"><a href="#">...</a></li>
	<li class="page-next"><a href="#">&nbsp;</a></li>
	<li class="page-last"><a href="#">&nbsp;</a></li>
</ul>