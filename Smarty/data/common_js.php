<?php
return '
<link rel=\'stylesheet\' type=\'text/css\' href=\'/shared/highslide-4.1.13/highslide.min.css\'/>
<!--[if IE 6]>
<link rel=\'stylesheet\' type=\'text/css\' href=\'/shared/highslide-4.1.13/highslide-ie6.css\'/>
<![endif]-->
<!--[if lte IE 7 ]>
<link rel=\'stylesheet\' type=\'text/css\' href=\'/shared/highslide-4.1.13/style1_ie.css\'/>
<![endif]-->

<script type=\'text/javascript\' src=\'/shared/highslide-4.1.13/highslide.packed.js\'></script>
<script type=\'text/javascript\'>
hs.graphicsDir = \'/shared/highslide-4.1.13/graphics/\';
hs.outlineType = null;
hs.showCredits = false;
hs.lang={cssDirection:\'ltr\',loadingText:\'Загрузка...\',loadingTitle:\'Кликните чтобы отменить\',focusTitle:\'Нажмите чтобы перенести вперёд\',fullExpandTitle:\'Увеличить\',fullExpandText:\'Полноэкранный\',previousText:\'Предыдущий\',previousTitle:\'Назад (стрелка влево)\',nextText:\'Далее\',nextTitle:\'Далее (стрелка вправо)\',moveTitle:\'Передвинуть\',moveText:\'Передвинуть\',closeText:\'Закрыть\',closeTitle:\'Закрыть (Esc)\',resizeTitle:\'Восстановить размер\',playText:\'Слайд-шоу\',playTitle:\'Слайд-шоу (пробел)\',pauseText:\'Пауза\',pauseTitle:\'Приостановить слайд-шоу (пробел)\',number:\'Изображение %1/%2\',restoreTitle:\'Нажмите чтобы посмотреть картинку, используйте мышь для перетаскивания. Используйте клавиши вперёд и назад\'};</script>
<script type=\'text/javascript\' src=\'/shared/flowplayer/flowplayer-3.2.9.min.js\'></script>
<!-- 46b9544ffa2e5e73c3c971fe2ede35a5 -->
<link rel=\'stylesheet\' type=\'text/css\' href=\'/shared/s3/css/calendar.css\' />
<script type=\'text/javascript\' src=\'/shared/s3/js/lang/ru.js\'></script>
<script type=\'text/javascript\' src=\'/shared/s3/js/cookie.js\'></script>
<script type=\'text/javascript\' src=\'/shared/s3/js/widgets.js?v=7\'></script>
<script type=\'text/javascript\' src=\'/shared/s3/js/calendar.packed.js\'></script>
<script type=\'text/javascript\' src=\'/shared/feedback/feedback.factory.min.js\'></script>
<script type=\'text/javascript\'>
	FeedbackFactory.setOption(\'sources\', \'/shared/feedback\');
	FeedbackFactory.setOption(\'url\', \'/my/s3/feedback/report.php\');
	FeedbackFactory.setData(\'instance_id\', 5035);
	FeedbackFactory.addScript(\'https://cabinet.megagroup.ru/client.jsonp?callback=FeedbackFactory.setUser\');
	FeedbackFactory.setUser = function (data) { if(data.id) FeedbackFactory.setData(\'user_id\', data.id);};
</script>

<script type=\'text/javascript\'>/*<![CDATA[*/
widgets.addOnloadEvent(function() {
	if (typeof jQuery == \'undefined\') {
		var s = document.createElement(\'script\');
		s.type = \'text/javascript\';
		s.src = \'/shared/s3/js/jquery-1.7.2.min.js\';
		document.body.appendChild(s);
	}
});
/*]]>*/
</script>
';