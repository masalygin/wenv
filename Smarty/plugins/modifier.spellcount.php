<?php
/*
 * Smarty plugin
 * ------------------------------------------------------------
 * Тип:        modifier
 * Имя:        spellсount
 * Назначение: Воспроизведение текстом сочетаний вроде:
 *             "1 посетитель"
 *             "2 посетителя"
 *                "и т.д."
 *
 * Пример:     {$date|spellсount:день:дня:дней}
 *
 * Версия:     1.5
 * Дата:       18.08.2009
 *
 * Установка:  Закинyть в папку с плагинами
 * Авторы:     Александр Макаров (http://rmcreative.ru),
 *             SerguisD (http://sergiusd.ru)
 *             Ruslan Osmanov <rrosmanov at gmail dot com>
 * ------------------------------------------------------------
 */

function smarty_modifier_spellcount($num, $one, $two, $many, $show_num = TRUE) {
	$result = ($show_num ? $num .' ': '');
    if ($num%10==1 && $num%100!=11){
        $result .= $one;
    }
    elseif($num%10>=2 && $num%10<=4 && ($num%100<10 || $num%100>=20)){
        $result .= $two;
    }
    else{
        $result .= $many;
    }
	return $result;
}