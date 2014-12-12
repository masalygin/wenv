{if $edost}
	{assign var="has_pickpointmap" value=0}
	{capture assign="content"}
		<div class="shop2-edost">
			{foreach from=$edost item=e key=k name=edost}
				<div class="shop2-edost-variant">
					{assign var="id" value=$e.id}
					<label>
						<span class="shop2-edost-control">
							<input type="radio" name="{$attach_id}[edost][tarif]" value="{$k}" {if $delivery.edost.tarif == $k}checked="checked"{/if} />
							<img src="/g/s3/s3_shop2/edost/medium/{$id}.png" />
						</span>
						{$e.company} {if $e.name}({$e.name}){/if} - <strong>{$e.price|price_convert}</strong> {$shop2.currency_shortname}

						{if $e.day}
							<div class="shop2-edost-day">
								Срок доставки: {$e.day}
							</div>
						{/if}
					</label>

					{if $e.pickpointmap}
						{assign var="has_pickpointmap" value=1}
						{if $delivery.edost.office}
							{assign var="postamat" value=$delivery.edost.office|@json_decode:true}
						{else}
							{assign var="postamat" value=''}
						{/if}
						<div class="shop2-edost-pickpointmap">
							<a data-city="{$e.pickpointmap}" href="#">Выбрать постамат или пункт выдачи<span>{if $postamat.name}: {$postamat.name}{/if}</span></a>
							<input {if $delivery.edost.tarif != $k}disabled="disabled"{/if} type="hidden" name="{$attach_id}[edost][office]" value="{if $postamat.name}{$delivery.edost.office|htmlspecialchars}{/if}" />
						</div>
					{/if}

					{foreach from=$e.offices key=office_id item=office}
						<div class="shop2-edost-office">
							<label>
								<span class="shop2-edost-control">
									{if $e.offices|@count > 1}
										<input type="radio" name="{$attach_id}[edost][office]" {if $delivery.edost.office == $office_id && $delivery.edost.tarif == $k}checked="checked"{/if} {if $delivery.edost.tarif != $k}disabled="disabled"{/if} value="{$office_id}" />
									{else}
										<input type="hidden" {if $delivery.edost.tarif != $k}disabled="disabled"{/if} name="{$attach_id}[edost][office]" value="{$office_id}" />
									{/if}
								</span>
								{$office.name}
							</label>

							{if $office.address}
								<div class="shop2-edost-office-address">
									<a target="_blank" href="http://www.edost.ru/office.php?c={$office_id}">{$office.address}</a>
								</div>
							{/if}

							{if $office.schedule}
								<div class="shop2-edost-office-schedule">Часы работы: {$office.schedule}</div>
							{/if}
							
							{if $office.tel}
								<div class="shop2-edost-office-tel">Телефон: {$office.tel}</div>
							{/if}
						</div>
					{/foreach}
				</div>
			{/foreach}
		</div>
	{/capture}

	{if $has_pickpointmap}
		<script type="text/javascript" src="http://www.pickpoint.ru/select/postamat.js"></script>
	{/if}

	<h2>Служба доставки</h2>
	{$content}

{/if}