<?php
require_once $smarty->_get_plugin_filepath('shared', 'make_timestamp');

function smarty_modifier_date_format_ex($timestamp=false, $format, $lang='ru'){	
	$result = false;
	
	// Timestamp 
	if(!$timestamp)	$timestamp = time();
	elseif (is_string($timestamp)) $timestamp = smarty_make_timestamp($timestamp);
	
    // Save current locale
    $old_locale = @setlocale(LC_ALL, 0);
    
	if($lang=='ru'){
		@setlocale(LC_ALL, 'ru_RU.UTF-8', 'ru_RU.UTF-8','ru_RU.utf8','RU','ru');
		
		// Special months 
		$months = array(
			1	=> 'Января',
			2	=> 'Февраля',
			3	=> 'Марта',
			4	=> 'Апреля',
			5	=> 'Мая',
			6	=> 'Июня',
			7	=> 'Июля',
			8	=> 'Августа',
			9	=> 'Сентября',
			10	=> 'Октября',
			11	=> 'Ноября',
			12	=> 'Декабря',
		);
		
		// Modify format string 
		$mi = date('m',$timestamp);
		if(substr($mi, 0, 1)==='0'){
			$mi = substr($mi,1);
		}
		$format = str_replace('%B', $months[$mi], $format);
		
		// Get the date 
		$result = strftime($format, $timestamp);
	}else{
		if($lang=='en'){
			// Set locale
			@setlocale(LC_ALL, 'en_US.UTF-8', 'en_EN.UTF-8','en_GB.UTF-8','en_US.UTF8','en_US.utf8','EN','en');
		}elseif($lang=='ch'){
			@setlocale(LC_ALL, 'zh_CN.UTF-8','zh_SG.UTF-8','zh_HK.UTF-8','ch_CH.UTF-8', 'ch_CH.UTF-8','ch_CH.utf8','CH','ch');
		}elseif($lang=='de'){
			@setlocale(LC_ALL, 'de_DE.UTF-8','de_AT.UTF-8','de_BE.UTF-8','de_CH.UTF-8', 'de_LI.UTF-8','de_LU.utf8','de','DE');
		}elseif($lang=='es'){
			@setlocale(LC_ALL, 'es_ES.UTF-8','es_AR.UTF-8','es_CL.UTF-8','es_LA.UTF-8', 'es_MX.UTF-8', 'es','ES');
		} else{ return false; }
				
		// To get string representation of month doesn't need special treating 
		$result = strftime($format, $timestamp);
	}
	
	setlocale(LC_NUMERIC, "POSIX");
    
	return $result;
}