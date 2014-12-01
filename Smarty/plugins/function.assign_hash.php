<?php 

function smarty_function_assign_hash ($params, &$smarty) {

	if (!isset($params['var'])) return;
	if (!isset($params['value'])) return;

	$keys = explode('.',$params['var']);
	if (count($keys)<2) return;
	
	$hash = $keys[0];
	$k = $keys[1];

	if (isset($smarty->_tpl_vars[$hash]) && is_array($smarty->_tpl_vars[$hash])) {
		$smarty->_tpl_vars[$hash][$k] = $params['value'];
	}

}