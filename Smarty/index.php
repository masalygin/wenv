<?php

$options = file_get_contents($argv[1] . '/.wenv.tmp');
if ($options) {
  $options = json_decode($options, true);
} else {
  die('Нет конфига');
}


$_GET = $options['_GET'];
$_POST = $options['_POST'];
$_COOKIE = $options['_COOKIE'];


require_once('Smarty.class.php');
$smarty = new Smarty();
$smarty->error_reporting = E_ALL & ~E_NOTICE & ~E_WARNING;

$smarty->security_settings["MODIFIER_FUNCS"] = array("abs", "base_phones", "trim", "round", "floor", "ceil", "unserialize", "strip_tags", "stripslashes", "json_encode", "json_decode", "htmlspecialchars", "htmlspecialchars_decode", "nl2br", "regex_replace", "urlencode", "explode", "implode", "count", "md5", "sha1", "base64_encode", "spellcount", "sprintf");
$smarty->security_settings["IF_FUNCS"] = array("strpos", "preg_match", "isset", "count", "true", "false", "is_object", "in_array", "array_key_exists", "is_array", "is_numeric", "strtotime", "strval", "empty", "array");

$smarty->template_dir = $options['dir'];
$smarty->compile_dir = $options['template_c'];

function db_template($tpl_name, &$tpl_source, &$smarty) {
  $tpl_source = file_get_contents($smarty->options['dir'] . $tpl_name);
  if ($tpl_source === false) {
    $tpl_source = "Шаблон $tpl_name не найден";
  }
  return true;
}

function global_template($tpl_name, &$tpl_source, &$smarty)
{
  $tpl_source = file_get_contents($smarty->options['dir'] . $tpl_name);
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

function trusted($tpl_name, &$smarty) {
}

function prefilter($tpl_source, &$smarty) {
  $tpl_source = str_replace('{tpl.body}', '{ldelim}tpl.body{rdelim}', $tpl_source);
  return $tpl_source;
}

$smarty->register_resource('db', array('db_template', 'timestamp', 'secure', 'trusted'));
$smarty->register_resource('global', array('global_template', 'timestamp', 'secure', 'trusted'));
$smarty->register_prefilter('prefilter');
$smarty->config_load(__DIR__ . '/localization.conf');


$smarty->display('db:' . $options['file']);
