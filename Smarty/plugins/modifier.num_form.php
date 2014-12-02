<?php
/**
* Возвращает численные формы слова в зависимости от числа
*
* @param int $int - чило
* @param string $n1 - первая форма числа (машина)
* @param string $n2 - вторая форма числа (машины)
* @param string $n5 - третья форма числа (машин)
*
* @return string
**/
function smarty_modifier_num_form($int, $n1, $n2, $n5) {
    $int = (int)$int;
    $ch  = $int%10;

    if ($ch == 1) {
        if ( $int > 10) {
            $result = $int < 20 ? $n5 : $n1;
        } else {
            $result = $n1;
        }
    } elseif($ch > 1 && $ch < 5) {
        if ( $int > 10) {
            $result = $int < 20 ? $n5 : $n2;
        } else {
            $result = $n2;
        }
    } else {
        $result = $n5;
    }
    return $result;
}