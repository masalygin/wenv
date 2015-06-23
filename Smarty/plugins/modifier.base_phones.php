<?php

function smarty_modifier_base_phones($text, $limit = 3) {

	$a = preg_split("/\r?\n/",$text);

	$phones = array();

	$i = 0;

	foreach($a as $line) {
		$res = preg_match("/([\s\d\+\-]{5,})/",$line,$matches);
		if ($res && trim($matches[1]!="")) {
			$phones[] = trim($matches[1]);
			if (++$i>=$limit) break;
		}
	}

	if (!count($phones)) {
		$phones[] = "+7 495 123-34-56";
	}

	return $phones;

}


?>
