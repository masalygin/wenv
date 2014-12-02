<?php

function smarty_modifier_filesize($size) {

	$units = array(' b', ' Kb', ' Mb', ' Gb', ' Tb');
	for ($i = 0; $size > 1024; $i++) $size /= 1024;
	return round($size).$units[$i];
    
}