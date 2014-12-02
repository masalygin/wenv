<?php
function smarty_function_s3_img($params, &$smarty) {
	$width = isset($params['width']) ? (int) $params['width'] : 100;
	$height = isset($params['height']) ? (int) $params['height'] : 100;
	$method = $params['method'] == 'r' ? 'r' : 'c';
	return "http://dummyimage.com/{$width}x{$height}/ccc/fff&text={$width}{$method}{$height}";
}
