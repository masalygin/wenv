<?php

return array(
	get => array(
		mode => array(
			cart => array(
				'{tpl.body}' => '{include file="global:cart.tpl"}'
			),
			folder => array(
				'{tpl.body}' => '{include file="global:folder.tpl"}'
			),
			product => array(
				'{tpl.body}' => '{include file="global:product.tpl"}'
			),
			order => array(
				'{tpl.body}' => '{include file="global:order.tpl"}'
			)
		)
	)
);
