<?php
function smarty_function_json(array $params, Smarty &$smarty) {
	$data   = null;
	$decode_name = false;
	switch (true) {
		case 2 === count($params): //break is omitted
			list($data, $decode_name) = array_values($params);
			if (!is_string($decode_name)) {
				break;
			}
		case 1 === count($params):
			if (!$data) {
				list($data, ) = array_values($params);
			}
			if ($decode_name) {
				$smarty->assign($decode_name, json_decode($data, true));
				return '';
			} else {
				return json_encode($data, true);
			}
			break;
		default:
	}

	$smarty->trigger_error("Wrong 'json' params: to encode use {json data=array()}; to decode  use {json data=\$json var=var}!");
	return '';
}