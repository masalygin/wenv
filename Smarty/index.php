<?php

	require_once('Smarty.class.php');

	error_reporting(E_ERROR | E_PARSE);

	$smarty = new Smarty();
	$smarty->options = json_decode(urldecode($argv[1]), true);

	$smarty->security_settings["MODIFIER_FUNCS"] = array("abs","base_phones","trim","round","floor","ceil","unserialize","strip_tags", "stripslashes", "json_encode","json_decode","htmlspecialchars","htmlspecialchars_decode","nl2br","regex_replace","urlencode","explode","implode","count","md5","sha1","base64_encode","spellcount","sprintf");
	$smarty->security_settings["IF_FUNCS"] = array("strpos","preg_match","isset","count","true","false","is_object","in_array","array_key_exists", "is_array", "is_numeric", "strtotime", "strval", "empty", "array");

	$_GET = $smarty->options['_GET'];
	$_POST = $smarty->options['_POST'];
	$_COOKIE = $smarty->options['_COOKIE'];

	$smarty->template_dir = $smarty->options['WORK_DIR'];
	$smarty->compile_dir = $smarty->options['CACHE_DIR'] .'templates_c/';

	function db_template($tpl_name, &$tpl_source, &$smarty) {
		
		$tpl_source = file_get_contents($smarty->options['WORK_DIR'] . $tpl_name);
		
		if ($tpl_source === false) {
			$tpl_source = "Шаблон $tpl_name не найден";
		}

		return true;
	}

	function db_timestamp($tpl_name, &$tpl_timestamp, &$smarty) {
		$tpl_timestamp = time();
		return true;
	}

	function db_secure($tpl_name, &$smarty) {
		return true;
	}

	function db_trusted($tpl_name, &$smarty) {}


	function global_template($tpl_name, &$tpl_source, &$smarty) {

		$tpl_source = file_get_contents($smarty->options['WORK_DIR'] . $tpl_name);
		
		if ($tpl_source === false) {
			$tpl_source = file_get_contents($smarty->options['TEMPLATES_DIR'] . $tpl_name);
		}

		if ($tpl_source === false) {
			$tpl_source = "Шаблон $tpl_name не найден";
		}

		return true;
	}

	function global_timestamp($tpl_name, &$tpl_timestamp, &$smarty) {
		$tpl_timestamp = time();
		return true;
	}

	function global_secure($tpl_name, &$smarty) {
		return true;
	}

	function global_trusted($tpl_name, &$smarty) {}

	function prefilter($tpl_source, &$smarty) {

		switch ($_GET['mode']) {
			case 'cart':
				$tpl_source = str_replace('{tpl.body}', '{include file="global:cart.tpl"}', $tpl_source);
				break;
			case 'folder':
				$tpl_source = str_replace('{tpl.body}', '{include file="global:folder.tpl"}', $tpl_source);
				break;
			case 'product':
				$tpl_source = str_replace('{tpl.body}', '{include file="global:product.tpl"}', $tpl_source);
				break;
			case 'order':
				$tpl_source = str_replace('{tpl.body}', '{include file="global:order.tpl"}', $tpl_source);
				break;
		}

		$tpl_source = str_replace('{tpl.body}', '{ldelim}tpl.body{rdelim}', $tpl_source);

		return $tpl_source;
	}


	$smarty->register_resource('db', array('db_template', 'db_timestamp', 'db_secure', 'db_trusted'));
	$smarty->register_resource('global', array('global_template', 'global_timestamp', 'global_secure', 'global_trusted'));
	$smarty->register_prefilter('prefilter');

	$smarty->assign('common_js', require(__DIR__.'/data/common_js.php'));
	$smarty->assign('menu', require(__DIR__.'/data/menu.php'));
	$smarty->assign('menu2', require(__DIR__.'/data/menu2.php'));
	$smarty->assign('copyright', require(__DIR__.'/data/copyright.php'));
	$smarty->assign('shop2_cart', require(__DIR__.'/data/shop2_cart.php'));
	$smarty->assign('folders_shared', require(__DIR__.'/data/folders_shared.php'));
	$smarty->assign('text', require(__DIR__.'/data/text.php'));
	$smarty->assign('page', require(__DIR__.'/data/page.php'));
	$smarty->assign('site', require(__DIR__.'/data/site.php'));
	$smarty->assign('block1', require(__DIR__.'/data/block1.php'));
	$smarty->assign('lastnews', require(__DIR__.'/data/lastnews.php'));
	$smarty->assign('sidevote', require(__DIR__.'/data/sidevote.php'));

	$smarty->display('db:' . $smarty->options['FILENAME']);

?>