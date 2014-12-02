<?php 
function smarty_function_shuffle($params, &$smarty) {
    if (!empty($params['var'])) {
    	shuffle($smarty->_tpl_vars[$params['var']]);
    }
}