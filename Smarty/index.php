<?php

	require_once('Smarty.class.php');

	error_reporting(E_ERROR | E_PARSE);

	$smarty = new Smarty();

	$file = $argv[1];

	$smarty->folders = array(
		'work' => $argv[2] . '/',
		'global' => $argv[3] . '/',
		'cache' => $argv[4] . '/',
	);

	$smarty->template_dir = $smarty->folders['work'] . '/';
	$smarty->compile_dir = $smarty->folders['cache'] .'/templates_c/';

	function db_template($tpl_name, &$tpl_source, &$smarty) {
		
		$tpl_source = file_get_contents($smarty->folders['work'] . $tpl_name);
		
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

		$tpl_source = file_get_contents($smarty->folders['work'] . $tpl_name);
		
		if ($tpl_source === false) {
			$tpl_source = file_get_contents($smarty->folders['global'] . $tpl_name);
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


	$smarty->register_resource('db', array('db_template', 'db_timestamp', 'db_secure', 'db_trusted'));
	$smarty->register_resource('global', array('global_template', 'global_timestamp', 'global_secure', 'global_trusted'));

	$smarty->assign('common_js', require(__DIR__.'/data/common_js.php'));
	$smarty->assign('menu', require(__DIR__.'/data/menu.php'));

	$smarty->display($file);

	//C:/PHP/php w:\wenv\Smarty\index.php w:\www\tmp\index.tpl w:\www\tmp w:\wenv\resources\templates w:\wenv\cache
?>