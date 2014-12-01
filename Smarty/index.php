<?php

	require_once('Smarty.class.php');

	error_reporting(E_ERROR | E_PARSE);

	$smarty = new Smarty();
	$smarty->options = json_decode(urldecode($argv[1]), true);

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

	// function preprocess($tpl_source, &$smarty) {
	// 	$replace = require(__DIR__.'/replace.php');
		
	// 	if ($_GET[])

	// 	// preg_replace($tpl_source)

	// 	return $tpl_source;
	// }


	$smarty->register_resource('db', array('db_template', 'db_timestamp', 'db_secure', 'db_trusted'));
	$smarty->register_resource('global', array('global_template', 'global_timestamp', 'global_secure', 'global_trusted'));
	// $smarty->register_prefilter('preprocess');

	$smarty->assign('common_js', require(__DIR__.'/data/common_js.php'));
	$smarty->assign('menu', require(__DIR__.'/data/menu.php'));

	$smarty->display('db:' . $smarty->options['FILENAME']);

?>