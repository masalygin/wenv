<?php
/***
 * @return strings concatenated into a string
 * @param object $string
 * @param string ... variable number of args
 */
    function smarty_modifier_concat($string /*varargs*/){
		for ($i = 1;$i < func_num_args();$i++) {
      		$string .= func_get_arg($i);
		}
		return $string;
    }
	
?>