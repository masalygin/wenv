<?php

function smarty_modifier_xmlspecialchars($string) {
   return str_replace('&#039;', '&apos;', htmlspecialchars($string, ENT_QUOTES));
}