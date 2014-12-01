{literal}
	<div class="shop2-block search-form {if $smarty.cookies.search_opened && !$ignore_cookies} opened{/if}">
		<div class="block-title">
			<strong>Расширенный поиск</strong>
			<span>&nbsp;</span>
		</div>
		<div class="block-body">
			<form action="{get_seo_url uri_prefix=$shop2.uri mode="search"}" enctype="multipart/form-data">
				<input type="hidden" name="sort_by" value="{$sort_by|default:''}"/>
				
				<div class="row">
					<div class="row-title">Цена (руб.):</div>
					<label><span>от</span>&nbsp;<input name="s[price][min]" type="text" size="5" class="small" value="" /></label>
					&nbsp;
					<label><span>до</span>&nbsp;<input name="s[price][max]" type="text" size="5" class="small" value="" /></label>
				</div>

				<div class="row">
					<label class="row-title" for="shop2-name">Название:</label>
					<input type="text" name="s[name]" size="20" id="shop2-name" value="" />
				</div>

				<div class="row">
					<label class="row-title" for="shop2-article">Артикул:</label>
					<input type="text" name="s[article]" id="shop2-article" value="" />
				</div>

				<div class="row">
					<label class="row-title" for="shop2-text">Текст:</label>
					<input type="text" name="search_text" size="20" id="shop2-text"  value="" />
				</div>
			
				<div class="row">
					<div class="row-title">Выберите категорию:</div>
					<select name="s[folder_id]" id="s[folder_id]">
						<option value="">Все</option>
							<option value="{$e.folder_id}">
								&raquo; Тестовая категория
							</option>
					</select>
				</div>

				<div id="shop2_search_custom_fields">
					
				</div>
			
				<div class="row">
					<div class="row-title">Производитель:</div>
					<select name="s[vendor_id]">
						<option value="">Все</option>          
						<option value="{$e.vendor_id}">Adidas</option>
					</select>
				</div>

				<div class="row">
					<div class="row-title">Новинка:</div>
					<select name="s[new]">
						<option value=""{>Все</option>
						<option value="1">Да</option>
						<option value="0">Нет</option>
					</select>
				</div>

				<div class="row">
					<div class="row-title">Спецпредложение:</div>
					<select name="s[special]">
						<option value=""{if $search_params.special === ''} selected="selected"{/if}>Все</option>
						<option value="1"{if $search_params.special === '1'} selected="selected"{/if}>Да</option>
						<option value="0"{if $search_params.special === '0'} selected="selected"{/if}>Нет</option>
					</select>
				</div>

				<div class="row">
					<div class="row-title">Результатов на странице:</div>
					<select name="s[products_per_page]">
						<option value="20">20</option>
						<option value="35">35</option>
						<option value="50">50</option>
						<option value="65">65</option>
						<option value="80">80</option>
						<option value="95">95</option>
					</select>
				</div>

				<div class="clear-container"></div>
				<div class="row">
					<button type="submit" class="search-btn">Найти</button>
				</div>
			</form>
			<div class="clear-container"></div>
		</div>
	</div><!-- Search Form -->
{/literal}