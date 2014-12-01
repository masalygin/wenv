<?php

function smarty_function_get_seo_url ($params, &$smarty) {
	return $params['uri_prefix'] . $params['mode'] . $params['alias'];
}