<?php

	require_once('Smarty.class.php');

	// error_reporting(E_ERROR | E_PARSE);

	$smarty = new Smarty();
	$smarty->error_reporting = E_ALL & ~E_NOTICE &~E_WARNING;
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

	function timestamp($tpl_name, &$tpl_timestamp, &$smarty) {
		$tpl_timestamp = time();
		return true;
	}

	function secure($tpl_name, &$smarty) {
		return true;
	}

	function trusted($tpl_name, &$smarty) {}


	function prefilter($tpl_source, &$smarty) {
		$replace = '{ldelim}tpl.body{rdelim}';
		switch ($_GET['mode']) {
			case 'cart':
			case 'folder':
			case 'product':
			case 'order':
			case 'main':
				$replace = "{include file='global:{$_GET['mode']}.tpl'}";
				break;
		}
		$tpl_source = str_replace('{tpl.body}', $replace, $tpl_source);
		return $tpl_source;
	}

	$smarty->register_resource('db', array('db_template', 'timestamp', 'secure', 'trusted'));
	$smarty->register_resource('global', array('global_template', 'timestamp', 'secure', 'trusted'));
	$smarty->register_prefilter('prefilter');
	$smarty->config_load(__DIR__.'/localization.conf');

	$data = array();

	if ($smarty->options['SMARTY_DATA_FILE']) {
		$data = require($smarty->options['SMARTY_DATA_FILE']);
	} else {

		switch ($_GET['mode']) {
			case 'cart':
			case 'folder':
			case 'product':
			case 'order':
			case 'main':
				$data = require(__DIR__."/data/page.{$_GET['mode']}.php");
				break;
			default:
				$data['common_js'] = require(__DIR__.'/data/common_js.php');
				$data['menu'] = require(__DIR__.'/data/menu.php');
				$data['menu2'] = require(__DIR__.'/data/menu2.php');
				$data['copyright'] = require(__DIR__.'/data/copyright.php');
				$data['shop2_cart'] = require(__DIR__.'/data/shop2_cart.php');
				$data['folders_shared'] = require(__DIR__.'/data/folders_shared.php');
				$data['text'] = require(__DIR__.'/data/text.php');
				$data['page'] = require(__DIR__.'/data/page.php');
				$data['site'] = require(__DIR__.'/data/site.php');
				$data['block1'] = require(__DIR__.'/data/block1.php');
				$data['lastnews'] = require(__DIR__.'/data/lastnews.php');
				$data['sidevote'] = require(__DIR__.'/data/sidevote.php');
				$data['tel'] = require(__DIR__.'/data/tel.php');
				$data['tel2'] = require(__DIR__.'/data/tel.php');
				$data['activity'] = require(__DIR__.'/data/activity.php');
				$data['address'] = require(__DIR__.'/data/address.php');
				$data['address2'] = require(__DIR__.'/data/address.php');
				$data['counters'] = require(__DIR__.'/data/counters.php');
				$data['social_networks'] = require(__DIR__.'/data/social_networks.php');
				break;
		}
	}

	if ($smarty->options['JSON_FILE']) {
		$json = json_decode(file_get_contents($smarty->options['JSON_FILE']), true);
		$data = array_replace_recursive($data, $json);
	}

	if ($_GET['view']) {
		$data['shop2']['view'] = $_GET['view'];
	}
	
	$smarty->assign($data);
	$smarty->display('db:' . $smarty->options['FILENAME']);

?>