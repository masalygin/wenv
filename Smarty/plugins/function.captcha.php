<?php

function smarty_function_captcha ($params, &$smarty) {
	$name = empty($params["name"]) ? "captcha" : $params["name"];
	$size = 4;
	$t = time();
	return '<div id="s3_captcha_cn' .$t .'"></div>
<script type="text/javascript" charset="UTF-8" src="https://captcha.megagroup.ru/static/captcha.js?2"></script>
<script type="text/javascript">
if (/MSIE (\d+\.\d+);/.test(navigator.userAgent) && (new Number(RegExp.$1) <= 8.0 )) {
	widgets.addOnloadEvent(function() {
		try{ mgCaptcha.draw("http://demojs0.oml.ru/my/s3/captcha/get.php", "s3_captcha_cn'.$t.'") }catch(e){}
	});
} else {
	try{ mgCaptcha.draw("http://demojs0.oml.ru/my/s3/captcha/get.php") }catch(e){}
}
</script>
<input type="text" name="'.$name.'" maxlength="'.$size.'" size="'.$size.'" />';
}
