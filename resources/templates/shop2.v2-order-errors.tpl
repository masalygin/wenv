{if $errors}
	<div class="shop2-warning">
		<ul>
			{foreach from=$errors item=e}
				<li>{$e}</li>
			{/foreach}
		</ul>
	</div>
{/if}