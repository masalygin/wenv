<?php 

function smarty_function_flash ($params, &$smarty) {
	// params w h img file
	// and additional

	$w = isset($params["w"]) ? intval($params["w"]) : 0;
	$h = isset($params["h"]) ? intval($params["h"]) : 0;

	$img = isset($params["img"]) ? trim($params["img"]) : "";
	$swf = isset($params["swf"]) ? trim($params["swf"]) : "";
	$dir = isset($params["dir"]) ? trim($params["dir"]) : "";

	$ver_id = $smarty->_tpl_vars['page']['ver_id'];

	$inline = array("w", "h", "img", "swf");

	if (!isset($params["wmode"])) $params["wmode"] = "opaque";

	$res = "";

	$id = "flash".rand(1,10000);

	$res = "<span id=\"$id\"></span>";
	$res .= "<script type=\"text/javascript\">//<![CDATA[
		if (typeof SWFObject == 'undefined') document.write ('<'+'script src=\"/shared/s3/js/swfobject.js\"'+'></'+'script>');\n</script>";
	$res .= "<script type=\"text/javascript\">\n";
	$res .= "var so = new SWFObject(\"".($dir ? $dir : "/d/$ver_id/t/images/") 
		."$swf\", \"$id\", \"$w\", \"$h\", \"7\", \"\");\n";

	foreach ($params as $param => $value) {
		if (!in_array($param, $inline)) {
			$res .= "so.addParam(\"$param\",\"$value\");\n";
		}
	}

	$res .= "if (!so.write(\"$id\")) {\n";
	$res .= "\tvar d = document.getElementById(\"$id\");\n";
	$res .= "\td.innerHTML = '<img src=\"/d/$ver_id/t/images/$img\" border=\"0\" width=\"$w\" height=\"$h\">';\n";
	$res .= "}\n//]]>";
	$res .= "</script>";

	return $res;

}